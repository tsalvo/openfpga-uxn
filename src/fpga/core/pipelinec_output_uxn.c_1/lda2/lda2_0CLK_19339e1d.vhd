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
-- BIN_OP_EQ[uxn_opcodes_h_l1777_c6_bad9]
signal BIN_OP_EQ_uxn_opcodes_h_l1777_c6_bad9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1777_c6_bad9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1777_c6_bad9_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1777_c2_9ae6]
signal tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1777_c2_9ae6]
signal tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1777_c2_9ae6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1777_c2_9ae6]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1777_c2_9ae6]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1777_c2_9ae6]
signal result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1777_c2_9ae6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1777_c2_9ae6]
signal result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1777_c2_9ae6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1777_c2_9ae6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1777_c2_9ae6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1777_c2_9ae6]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1777_c2_9ae6]
signal t16_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1790_c11_56c6]
signal BIN_OP_EQ_uxn_opcodes_h_l1790_c11_56c6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1790_c11_56c6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1790_c11_56c6_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1790_c7_ceab]
signal tmp8_low_MUX_uxn_opcodes_h_l1790_c7_ceab_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1790_c7_ceab]
signal tmp8_high_MUX_uxn_opcodes_h_l1790_c7_ceab_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1790_c7_ceab]
signal result_u16_value_MUX_uxn_opcodes_h_l1790_c7_ceab_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1790_c7_ceab]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_ceab_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1790_c7_ceab]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_ceab_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1790_c7_ceab]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_ceab_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1790_c7_ceab]
signal result_u8_value_MUX_uxn_opcodes_h_l1790_c7_ceab_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1790_c7_ceab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_ceab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1790_c7_ceab]
signal t16_MUX_uxn_opcodes_h_l1790_c7_ceab_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1793_c11_c89f]
signal BIN_OP_EQ_uxn_opcodes_h_l1793_c11_c89f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1793_c11_c89f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1793_c11_c89f_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1793_c7_7a59]
signal tmp8_low_MUX_uxn_opcodes_h_l1793_c7_7a59_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1793_c7_7a59]
signal tmp8_high_MUX_uxn_opcodes_h_l1793_c7_7a59_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1793_c7_7a59]
signal result_u16_value_MUX_uxn_opcodes_h_l1793_c7_7a59_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1793_c7_7a59]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_7a59_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1793_c7_7a59]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_7a59_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1793_c7_7a59]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_7a59_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1793_c7_7a59]
signal result_u8_value_MUX_uxn_opcodes_h_l1793_c7_7a59_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1793_c7_7a59]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_7a59_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1793_c7_7a59]
signal t16_MUX_uxn_opcodes_h_l1793_c7_7a59_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1795_c3_06b3]
signal CONST_SL_8_uxn_opcodes_h_l1795_c3_06b3_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1795_c3_06b3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1797_c11_2b8b]
signal BIN_OP_EQ_uxn_opcodes_h_l1797_c11_2b8b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1797_c11_2b8b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1797_c11_2b8b_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1797_c7_6d2b]
signal tmp8_low_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1797_c7_6d2b]
signal tmp8_high_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1797_c7_6d2b]
signal result_u16_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1797_c7_6d2b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1797_c7_6d2b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1797_c7_6d2b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1797_c7_6d2b]
signal result_u8_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1797_c7_6d2b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1797_c7_6d2b]
signal t16_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1798_c3_57a6]
signal BIN_OP_OR_uxn_opcodes_h_l1798_c3_57a6_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1798_c3_57a6_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1798_c3_57a6_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1799_c30_9caf]
signal sp_relative_shift_uxn_opcodes_h_l1799_c30_9caf_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1799_c30_9caf_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1799_c30_9caf_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1799_c30_9caf_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1802_c11_d565]
signal BIN_OP_EQ_uxn_opcodes_h_l1802_c11_d565_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1802_c11_d565_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1802_c11_d565_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1802_c7_2454]
signal tmp8_low_MUX_uxn_opcodes_h_l1802_c7_2454_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1802_c7_2454_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1802_c7_2454_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1802_c7_2454_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1802_c7_2454]
signal tmp8_high_MUX_uxn_opcodes_h_l1802_c7_2454_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1802_c7_2454_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1802_c7_2454_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1802_c7_2454_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1802_c7_2454]
signal result_u16_value_MUX_uxn_opcodes_h_l1802_c7_2454_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1802_c7_2454_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1802_c7_2454_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1802_c7_2454_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1802_c7_2454]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_2454_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_2454_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_2454_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_2454_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1802_c7_2454]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_2454_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_2454_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_2454_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_2454_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1802_c7_2454]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_2454_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_2454_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_2454_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_2454_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1802_c7_2454]
signal result_u8_value_MUX_uxn_opcodes_h_l1802_c7_2454_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1802_c7_2454_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1802_c7_2454_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1802_c7_2454_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1802_c7_2454]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_2454_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_2454_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_2454_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_2454_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1804_c22_50b9]
signal BIN_OP_PLUS_uxn_opcodes_h_l1804_c22_50b9_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1804_c22_50b9_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1804_c22_50b9_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1806_c11_e646]
signal BIN_OP_EQ_uxn_opcodes_h_l1806_c11_e646_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1806_c11_e646_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1806_c11_e646_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1806_c7_9659]
signal tmp8_low_MUX_uxn_opcodes_h_l1806_c7_9659_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1806_c7_9659_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1806_c7_9659_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1806_c7_9659_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1806_c7_9659]
signal tmp8_high_MUX_uxn_opcodes_h_l1806_c7_9659_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1806_c7_9659_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1806_c7_9659_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1806_c7_9659_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1806_c7_9659]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_9659_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_9659_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_9659_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_9659_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1806_c7_9659]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_9659_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_9659_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_9659_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_9659_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1806_c7_9659]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_9659_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_9659_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_9659_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_9659_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1806_c7_9659]
signal result_u8_value_MUX_uxn_opcodes_h_l1806_c7_9659_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1806_c7_9659_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1806_c7_9659_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1806_c7_9659_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1812_c11_18e4]
signal BIN_OP_EQ_uxn_opcodes_h_l1812_c11_18e4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1812_c11_18e4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1812_c11_18e4_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1812_c7_825f]
signal tmp8_low_MUX_uxn_opcodes_h_l1812_c7_825f_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1812_c7_825f_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1812_c7_825f_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1812_c7_825f_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1812_c7_825f]
signal result_u8_value_MUX_uxn_opcodes_h_l1812_c7_825f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1812_c7_825f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1812_c7_825f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1812_c7_825f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1812_c7_825f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_825f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_825f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_825f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_825f_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1812_c7_825f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_825f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_825f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_825f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_825f_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_775a( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.u16_value := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;
      base.is_ram_write := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1777_c6_bad9
BIN_OP_EQ_uxn_opcodes_h_l1777_c6_bad9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1777_c6_bad9_left,
BIN_OP_EQ_uxn_opcodes_h_l1777_c6_bad9_right,
BIN_OP_EQ_uxn_opcodes_h_l1777_c6_bad9_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9ae6
tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9ae6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond,
tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9ae6
tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9ae6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond,
tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9ae6
result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9ae6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6
result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9ae6
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9ae6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9ae6
result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9ae6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9ae6
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9ae6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9ae6
result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9ae6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond,
result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9ae6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9ae6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9ae6
result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9ae6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9ae6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9ae6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6
result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output);

-- t16_MUX_uxn_opcodes_h_l1777_c2_9ae6
t16_MUX_uxn_opcodes_h_l1777_c2_9ae6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond,
t16_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue,
t16_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse,
t16_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1790_c11_56c6
BIN_OP_EQ_uxn_opcodes_h_l1790_c11_56c6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1790_c11_56c6_left,
BIN_OP_EQ_uxn_opcodes_h_l1790_c11_56c6_right,
BIN_OP_EQ_uxn_opcodes_h_l1790_c11_56c6_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1790_c7_ceab
tmp8_low_MUX_uxn_opcodes_h_l1790_c7_ceab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1790_c7_ceab_cond,
tmp8_low_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1790_c7_ceab
tmp8_high_MUX_uxn_opcodes_h_l1790_c7_ceab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1790_c7_ceab_cond,
tmp8_high_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1790_c7_ceab
result_u16_value_MUX_uxn_opcodes_h_l1790_c7_ceab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1790_c7_ceab_cond,
result_u16_value_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_ceab
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_ceab : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_ceab_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_ceab
result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_ceab : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_ceab_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_ceab
result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_ceab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_ceab_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1790_c7_ceab
result_u8_value_MUX_uxn_opcodes_h_l1790_c7_ceab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1790_c7_ceab_cond,
result_u8_value_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_ceab
result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_ceab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_ceab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output);

-- t16_MUX_uxn_opcodes_h_l1790_c7_ceab
t16_MUX_uxn_opcodes_h_l1790_c7_ceab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1790_c7_ceab_cond,
t16_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue,
t16_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse,
t16_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1793_c11_c89f
BIN_OP_EQ_uxn_opcodes_h_l1793_c11_c89f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1793_c11_c89f_left,
BIN_OP_EQ_uxn_opcodes_h_l1793_c11_c89f_right,
BIN_OP_EQ_uxn_opcodes_h_l1793_c11_c89f_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1793_c7_7a59
tmp8_low_MUX_uxn_opcodes_h_l1793_c7_7a59 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1793_c7_7a59_cond,
tmp8_low_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1793_c7_7a59
tmp8_high_MUX_uxn_opcodes_h_l1793_c7_7a59 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1793_c7_7a59_cond,
tmp8_high_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1793_c7_7a59
result_u16_value_MUX_uxn_opcodes_h_l1793_c7_7a59 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1793_c7_7a59_cond,
result_u16_value_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_7a59
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_7a59 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_7a59_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_7a59
result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_7a59 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_7a59_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_7a59
result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_7a59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_7a59_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1793_c7_7a59
result_u8_value_MUX_uxn_opcodes_h_l1793_c7_7a59 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1793_c7_7a59_cond,
result_u8_value_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_7a59
result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_7a59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_7a59_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output);

-- t16_MUX_uxn_opcodes_h_l1793_c7_7a59
t16_MUX_uxn_opcodes_h_l1793_c7_7a59 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1793_c7_7a59_cond,
t16_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue,
t16_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse,
t16_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1795_c3_06b3
CONST_SL_8_uxn_opcodes_h_l1795_c3_06b3 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1795_c3_06b3_x,
CONST_SL_8_uxn_opcodes_h_l1795_c3_06b3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1797_c11_2b8b
BIN_OP_EQ_uxn_opcodes_h_l1797_c11_2b8b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1797_c11_2b8b_left,
BIN_OP_EQ_uxn_opcodes_h_l1797_c11_2b8b_right,
BIN_OP_EQ_uxn_opcodes_h_l1797_c11_2b8b_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1797_c7_6d2b
tmp8_low_MUX_uxn_opcodes_h_l1797_c7_6d2b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond,
tmp8_low_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1797_c7_6d2b
tmp8_high_MUX_uxn_opcodes_h_l1797_c7_6d2b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond,
tmp8_high_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1797_c7_6d2b
result_u16_value_MUX_uxn_opcodes_h_l1797_c7_6d2b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond,
result_u16_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_6d2b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_6d2b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_6d2b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_6d2b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_6d2b
result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_6d2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1797_c7_6d2b
result_u8_value_MUX_uxn_opcodes_h_l1797_c7_6d2b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_6d2b
result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_6d2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output);

-- t16_MUX_uxn_opcodes_h_l1797_c7_6d2b
t16_MUX_uxn_opcodes_h_l1797_c7_6d2b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond,
t16_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue,
t16_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse,
t16_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1798_c3_57a6
BIN_OP_OR_uxn_opcodes_h_l1798_c3_57a6 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1798_c3_57a6_left,
BIN_OP_OR_uxn_opcodes_h_l1798_c3_57a6_right,
BIN_OP_OR_uxn_opcodes_h_l1798_c3_57a6_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1799_c30_9caf
sp_relative_shift_uxn_opcodes_h_l1799_c30_9caf : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1799_c30_9caf_ins,
sp_relative_shift_uxn_opcodes_h_l1799_c30_9caf_x,
sp_relative_shift_uxn_opcodes_h_l1799_c30_9caf_y,
sp_relative_shift_uxn_opcodes_h_l1799_c30_9caf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1802_c11_d565
BIN_OP_EQ_uxn_opcodes_h_l1802_c11_d565 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1802_c11_d565_left,
BIN_OP_EQ_uxn_opcodes_h_l1802_c11_d565_right,
BIN_OP_EQ_uxn_opcodes_h_l1802_c11_d565_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1802_c7_2454
tmp8_low_MUX_uxn_opcodes_h_l1802_c7_2454 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1802_c7_2454_cond,
tmp8_low_MUX_uxn_opcodes_h_l1802_c7_2454_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1802_c7_2454_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1802_c7_2454_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1802_c7_2454
tmp8_high_MUX_uxn_opcodes_h_l1802_c7_2454 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1802_c7_2454_cond,
tmp8_high_MUX_uxn_opcodes_h_l1802_c7_2454_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1802_c7_2454_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1802_c7_2454_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1802_c7_2454
result_u16_value_MUX_uxn_opcodes_h_l1802_c7_2454 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1802_c7_2454_cond,
result_u16_value_MUX_uxn_opcodes_h_l1802_c7_2454_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1802_c7_2454_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1802_c7_2454_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_2454
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_2454 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_2454_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_2454_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_2454_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_2454_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_2454
result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_2454 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_2454_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_2454_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_2454_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_2454_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_2454
result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_2454 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_2454_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_2454_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_2454_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_2454_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1802_c7_2454
result_u8_value_MUX_uxn_opcodes_h_l1802_c7_2454 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1802_c7_2454_cond,
result_u8_value_MUX_uxn_opcodes_h_l1802_c7_2454_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1802_c7_2454_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1802_c7_2454_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_2454
result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_2454 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_2454_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_2454_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_2454_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_2454_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1804_c22_50b9
BIN_OP_PLUS_uxn_opcodes_h_l1804_c22_50b9 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1804_c22_50b9_left,
BIN_OP_PLUS_uxn_opcodes_h_l1804_c22_50b9_right,
BIN_OP_PLUS_uxn_opcodes_h_l1804_c22_50b9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1806_c11_e646
BIN_OP_EQ_uxn_opcodes_h_l1806_c11_e646 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1806_c11_e646_left,
BIN_OP_EQ_uxn_opcodes_h_l1806_c11_e646_right,
BIN_OP_EQ_uxn_opcodes_h_l1806_c11_e646_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1806_c7_9659
tmp8_low_MUX_uxn_opcodes_h_l1806_c7_9659 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1806_c7_9659_cond,
tmp8_low_MUX_uxn_opcodes_h_l1806_c7_9659_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1806_c7_9659_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1806_c7_9659_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1806_c7_9659
tmp8_high_MUX_uxn_opcodes_h_l1806_c7_9659 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1806_c7_9659_cond,
tmp8_high_MUX_uxn_opcodes_h_l1806_c7_9659_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1806_c7_9659_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1806_c7_9659_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_9659
result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_9659 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_9659_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_9659_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_9659_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_9659_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_9659
result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_9659 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_9659_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_9659_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_9659_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_9659_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_9659
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_9659 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_9659_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_9659_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_9659_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_9659_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1806_c7_9659
result_u8_value_MUX_uxn_opcodes_h_l1806_c7_9659 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1806_c7_9659_cond,
result_u8_value_MUX_uxn_opcodes_h_l1806_c7_9659_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1806_c7_9659_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1806_c7_9659_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1812_c11_18e4
BIN_OP_EQ_uxn_opcodes_h_l1812_c11_18e4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1812_c11_18e4_left,
BIN_OP_EQ_uxn_opcodes_h_l1812_c11_18e4_right,
BIN_OP_EQ_uxn_opcodes_h_l1812_c11_18e4_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1812_c7_825f
tmp8_low_MUX_uxn_opcodes_h_l1812_c7_825f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1812_c7_825f_cond,
tmp8_low_MUX_uxn_opcodes_h_l1812_c7_825f_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1812_c7_825f_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1812_c7_825f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1812_c7_825f
result_u8_value_MUX_uxn_opcodes_h_l1812_c7_825f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1812_c7_825f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1812_c7_825f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1812_c7_825f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1812_c7_825f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_825f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_825f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_825f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_825f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_825f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_825f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_825f
result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_825f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_825f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_825f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_825f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_825f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1777_c6_bad9_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output,
 t16_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1790_c11_56c6_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output,
 t16_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1793_c11_c89f_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output,
 t16_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output,
 CONST_SL_8_uxn_opcodes_h_l1795_c3_06b3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1797_c11_2b8b_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output,
 t16_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1798_c3_57a6_return_output,
 sp_relative_shift_uxn_opcodes_h_l1799_c30_9caf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1802_c11_d565_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1802_c7_2454_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1802_c7_2454_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1802_c7_2454_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_2454_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_2454_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_2454_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1802_c7_2454_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_2454_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1804_c22_50b9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1806_c11_e646_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1806_c7_9659_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1806_c7_9659_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_9659_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_9659_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_9659_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1806_c7_9659_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1812_c11_18e4_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1812_c7_825f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1812_c7_825f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_825f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_825f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_bad9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_bad9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_bad9_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1777_c2_9ae6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1777_c2_9ae6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1782_c3_ed77 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1777_c2_9ae6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1787_c3_13d7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1777_c2_9ae6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_56c6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_56c6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_56c6_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_ceab_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_ceab_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1790_c7_ceab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1791_c3_8200 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_ceab_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_ceab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_ceab_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_ceab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_ceab_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1790_c7_ceab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c11_c89f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c11_c89f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c11_c89f_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1793_c7_7a59_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1793_c7_7a59_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1793_c7_7a59_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_7a59_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_7a59_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_7a59_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1793_c7_7a59_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_7a59_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1793_c7_7a59_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1795_c3_06b3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1795_c3_06b3_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_2b8b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_2b8b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_2b8b_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1802_c7_2454_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1802_c7_2454_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1802_c7_2454_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_2454_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_2454_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_2454_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1802_c7_2454_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_2454_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1798_c3_57a6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1798_c3_57a6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1798_c3_57a6_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1799_c30_9caf_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1799_c30_9caf_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1799_c30_9caf_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1799_c30_9caf_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_d565_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_d565_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_d565_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1802_c7_2454_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1802_c7_2454_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1806_c7_9659_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1802_c7_2454_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1802_c7_2454_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1802_c7_2454_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1806_c7_9659_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1802_c7_2454_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1802_c7_2454_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1804_c3_c642 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1802_c7_2454_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1802_c7_2454_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_2454_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_2454_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_9659_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_2454_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_2454_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1803_c3_5548 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_2454_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_2454_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_2454_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_2454_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_9659_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_2454_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1802_c7_2454_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1802_c7_2454_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1806_c7_9659_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1802_c7_2454_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_2454_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_2454_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_9659_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_2454_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1804_c22_50b9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1804_c22_50b9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1804_c22_50b9_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1806_c11_e646_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1806_c11_e646_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1806_c11_e646_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1806_c7_9659_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1806_c7_9659_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1812_c7_825f_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1806_c7_9659_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1806_c7_9659_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1806_c7_9659_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1806_c7_9659_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_9659_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_9659_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_825f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_9659_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_9659_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_9659_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_9659_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_9659_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1809_c3_53f1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_9659_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_825f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_9659_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1806_c7_9659_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1806_c7_9659_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c7_825f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1806_c7_9659_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_18e4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_18e4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_18e4_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1812_c7_825f_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1812_c7_825f_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1812_c7_825f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c7_825f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c7_825f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c7_825f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_825f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1814_c3_2c9b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_825f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_825f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_825f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_825f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_825f_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1793_l1790_l1777_l1812_l1802_l1797_DUPLICATE_e147_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1790_l1802_l1793_l1777_DUPLICATE_6bf6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1790_l1802_l1793_DUPLICATE_3f7f_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1793_l1790_l1806_l1802_l1797_DUPLICATE_aebc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1793_l1790_l1812_l1806_l1802_l1797_DUPLICATE_2056_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1798_l1794_DUPLICATE_c707_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1802_l1793_l1797_l1812_DUPLICATE_3de1_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l1819_l1772_DUPLICATE_7e22_return_output : opcode_result_t;
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
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_d565_right := to_unsigned(4, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1782_c3_ed77 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1782_c3_ed77;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1787_c3_13d7 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1787_c3_13d7;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1806_c11_e646_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_2b8b_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1814_c3_2c9b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_825f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1814_c3_2c9b;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1803_c3_5548 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_2454_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1803_c3_5548;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1791_c3_8200 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1791_c3_8200;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_18e4_right := to_unsigned(6, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1804_c22_50b9_right := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_9659_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1809_c3_53f1 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_9659_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1809_c3_53f1;
     VAR_sp_relative_shift_uxn_opcodes_h_l1799_c30_9caf_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_56c6_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_825f_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_bad9_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c11_c89f_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1799_c30_9caf_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1799_c30_9caf_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_bad9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_56c6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c11_c89f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_2b8b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_d565_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1806_c11_e646_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_18e4_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1806_c7_9659_iftrue := VAR_previous_ram_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c7_825f_iftrue := VAR_previous_ram_read;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1806_c7_9659_iftrue := VAR_previous_ram_read;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1812_c7_825f_iftrue := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1798_c3_57a6_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1804_c22_50b9_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse := t16;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1802_c7_2454_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1806_c7_9659_iffalse := tmp8_high;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1802_c7_2454_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1806_c7_9659_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1812_c7_825f_iffalse := tmp8_low;
     -- BIN_OP_EQ[uxn_opcodes_h_l1812_c11_18e4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1812_c11_18e4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_18e4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1812_c11_18e4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_18e4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_18e4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1812_c11_18e4_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1777_c2_9ae6] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1777_c2_9ae6_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1790_c11_56c6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1790_c11_56c6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_56c6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1790_c11_56c6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_56c6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_56c6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1790_c11_56c6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1793_c11_c89f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1793_c11_c89f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c11_c89f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1793_c11_c89f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c11_c89f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c11_c89f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1793_c11_c89f_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1777_c2_9ae6] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1777_c2_9ae6_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1790_l1802_l1793_l1777_DUPLICATE_6bf6 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1790_l1802_l1793_l1777_DUPLICATE_6bf6_return_output := result.u16_value;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1777_c2_9ae6] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1777_c2_9ae6_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1802_l1793_l1797_l1812_DUPLICATE_3de1 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1802_l1793_l1797_l1812_DUPLICATE_3de1_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l1799_c30_9caf] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1799_c30_9caf_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1799_c30_9caf_ins;
     sp_relative_shift_uxn_opcodes_h_l1799_c30_9caf_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1799_c30_9caf_x;
     sp_relative_shift_uxn_opcodes_h_l1799_c30_9caf_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1799_c30_9caf_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1799_c30_9caf_return_output := sp_relative_shift_uxn_opcodes_h_l1799_c30_9caf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1802_c11_d565] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1802_c11_d565_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_d565_left;
     BIN_OP_EQ_uxn_opcodes_h_l1802_c11_d565_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_d565_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_d565_return_output := BIN_OP_EQ_uxn_opcodes_h_l1802_c11_d565_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1798_l1794_DUPLICATE_c707 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1798_l1794_DUPLICATE_c707_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1806_c11_e646] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1806_c11_e646_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1806_c11_e646_left;
     BIN_OP_EQ_uxn_opcodes_h_l1806_c11_e646_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1806_c11_e646_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1806_c11_e646_return_output := BIN_OP_EQ_uxn_opcodes_h_l1806_c11_e646_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1797_c11_2b8b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1797_c11_2b8b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_2b8b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1797_c11_2b8b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_2b8b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_2b8b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1797_c11_2b8b_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1777_c2_9ae6] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1777_c2_9ae6_return_output := result.is_vram_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1804_c22_50b9] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1804_c22_50b9_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1804_c22_50b9_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1804_c22_50b9_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1804_c22_50b9_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1804_c22_50b9_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1804_c22_50b9_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1793_l1790_l1777_l1812_l1802_l1797_DUPLICATE_e147 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1793_l1790_l1777_l1812_l1802_l1797_DUPLICATE_e147_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1793_l1790_l1806_l1802_l1797_DUPLICATE_aebc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1793_l1790_l1806_l1802_l1797_DUPLICATE_aebc_return_output := result.is_stack_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1790_l1802_l1793_DUPLICATE_3f7f LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1790_l1802_l1793_DUPLICATE_3f7f_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1793_l1790_l1812_l1806_l1802_l1797_DUPLICATE_2056 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1793_l1790_l1812_l1806_l1802_l1797_DUPLICATE_2056_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1777_c6_bad9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1777_c6_bad9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_bad9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1777_c6_bad9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_bad9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_bad9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1777_c6_bad9_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_bad9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_bad9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_bad9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_bad9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_bad9_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_bad9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_bad9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_bad9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_bad9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_bad9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_bad9_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_bad9_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_bad9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_ceab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_56c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_ceab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_56c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_ceab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_56c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_ceab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_56c6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1790_c7_ceab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_56c6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_ceab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_56c6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1790_c7_ceab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_56c6_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_ceab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_56c6_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_ceab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_56c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_7a59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c11_c89f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_7a59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c11_c89f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_7a59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c11_c89f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_7a59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c11_c89f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1793_c7_7a59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c11_c89f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1793_c7_7a59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c11_c89f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1793_c7_7a59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c11_c89f_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1793_c7_7a59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c11_c89f_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1793_c7_7a59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c11_c89f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_2b8b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_2b8b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_2b8b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_2b8b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_2b8b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_2b8b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_2b8b_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_2b8b_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_2b8b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_2454_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_d565_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_2454_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_d565_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_2454_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_d565_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_2454_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_d565_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1802_c7_2454_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_d565_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1802_c7_2454_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_d565_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1802_c7_2454_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_d565_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1802_c7_2454_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_d565_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_9659_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1806_c11_e646_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_9659_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1806_c11_e646_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_9659_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1806_c11_e646_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1806_c7_9659_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1806_c11_e646_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1806_c7_9659_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1806_c11_e646_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1806_c7_9659_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1806_c11_e646_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_825f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_18e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_825f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_18e4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c7_825f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_18e4_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1812_c7_825f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_18e4_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1804_c3_c642 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1804_c22_50b9_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l1798_c3_57a6_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1798_l1794_DUPLICATE_c707_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1795_c3_06b3_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1798_l1794_DUPLICATE_c707_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1790_l1802_l1793_DUPLICATE_3f7f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1790_l1802_l1793_DUPLICATE_3f7f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_2454_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1790_l1802_l1793_DUPLICATE_3f7f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1790_l1802_l1793_l1777_DUPLICATE_6bf6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1790_l1802_l1793_l1777_DUPLICATE_6bf6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1790_l1802_l1793_l1777_DUPLICATE_6bf6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1802_c7_2454_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1790_l1802_l1793_l1777_DUPLICATE_6bf6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1793_l1790_l1812_l1806_l1802_l1797_DUPLICATE_2056_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1793_l1790_l1812_l1806_l1802_l1797_DUPLICATE_2056_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1793_l1790_l1812_l1806_l1802_l1797_DUPLICATE_2056_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_2454_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1793_l1790_l1812_l1806_l1802_l1797_DUPLICATE_2056_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_9659_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1793_l1790_l1812_l1806_l1802_l1797_DUPLICATE_2056_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_825f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1793_l1790_l1812_l1806_l1802_l1797_DUPLICATE_2056_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1793_l1790_l1806_l1802_l1797_DUPLICATE_aebc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1793_l1790_l1806_l1802_l1797_DUPLICATE_aebc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1793_l1790_l1806_l1802_l1797_DUPLICATE_aebc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_2454_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1793_l1790_l1806_l1802_l1797_DUPLICATE_aebc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_9659_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1793_l1790_l1806_l1802_l1797_DUPLICATE_aebc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1802_l1793_l1797_l1812_DUPLICATE_3de1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1802_l1793_l1797_l1812_DUPLICATE_3de1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_2454_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1802_l1793_l1797_l1812_DUPLICATE_3de1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_825f_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1802_l1793_l1797_l1812_DUPLICATE_3de1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1793_l1790_l1777_l1812_l1802_l1797_DUPLICATE_e147_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1793_l1790_l1777_l1812_l1802_l1797_DUPLICATE_e147_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1793_l1790_l1777_l1812_l1802_l1797_DUPLICATE_e147_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1793_l1790_l1777_l1812_l1802_l1797_DUPLICATE_e147_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1802_c7_2454_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1793_l1790_l1777_l1812_l1802_l1797_DUPLICATE_e147_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c7_825f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1793_l1790_l1777_l1812_l1802_l1797_DUPLICATE_e147_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1777_c2_9ae6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1777_c2_9ae6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1777_c2_9ae6_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1777_c2_9ae6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1799_c30_9caf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1802_c7_2454_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1804_c3_c642;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1812_c7_825f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_825f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_825f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_825f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_825f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_825f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_825f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_825f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_825f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1812_c7_825f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_825f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_825f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_825f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_825f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_825f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_825f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_825f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_825f_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1795_c3_06b3] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1795_c3_06b3_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1795_c3_06b3_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1795_c3_06b3_return_output := CONST_SL_8_uxn_opcodes_h_l1795_c3_06b3_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1777_c2_9ae6] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1812_c7_825f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1812_c7_825f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c7_825f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1812_c7_825f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c7_825f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1812_c7_825f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c7_825f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c7_825f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1812_c7_825f_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1798_c3_57a6] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1798_c3_57a6_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1798_c3_57a6_left;
     BIN_OP_OR_uxn_opcodes_h_l1798_c3_57a6_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1798_c3_57a6_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1798_c3_57a6_return_output := BIN_OP_OR_uxn_opcodes_h_l1798_c3_57a6_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1812_c7_825f] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1812_c7_825f_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1812_c7_825f_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1812_c7_825f_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1812_c7_825f_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1812_c7_825f_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1812_c7_825f_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1812_c7_825f_return_output := tmp8_low_MUX_uxn_opcodes_h_l1812_c7_825f_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1777_c2_9ae6] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1777_c2_9ae6] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1802_c7_2454] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1802_c7_2454_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1802_c7_2454_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1802_c7_2454_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1802_c7_2454_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1802_c7_2454_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1802_c7_2454_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1802_c7_2454_return_output := result_u16_value_MUX_uxn_opcodes_h_l1802_c7_2454_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1806_c7_9659] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_9659_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_9659_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_9659_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_9659_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_9659_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_9659_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_9659_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_9659_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1802_c7_2454] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_2454_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_2454_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_2454_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_2454_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_2454_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_2454_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_2454_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_2454_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1777_c2_9ae6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1806_c7_9659] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1806_c7_9659_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1806_c7_9659_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1806_c7_9659_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1806_c7_9659_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1806_c7_9659_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1806_c7_9659_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1806_c7_9659_return_output := tmp8_high_MUX_uxn_opcodes_h_l1806_c7_9659_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1798_c3_57a6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1798_c3_57a6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1795_c3_06b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_9659_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_825f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_2454_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_9659_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_2454_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_9659_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_825f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1802_c7_2454_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1806_c7_9659_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c7_825f_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1802_c7_2454_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1806_c7_9659_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1806_c7_9659_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1812_c7_825f_return_output;
     -- tmp8_high_MUX[uxn_opcodes_h_l1802_c7_2454] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1802_c7_2454_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1802_c7_2454_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1802_c7_2454_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1802_c7_2454_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1802_c7_2454_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1802_c7_2454_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1802_c7_2454_return_output := tmp8_high_MUX_uxn_opcodes_h_l1802_c7_2454_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1797_c7_6d2b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1802_c7_2454] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_2454_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_2454_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_2454_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_2454_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_2454_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_2454_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_2454_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_2454_return_output;

     -- t16_MUX[uxn_opcodes_h_l1797_c7_6d2b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond;
     t16_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue;
     t16_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output := t16_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1806_c7_9659] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1806_c7_9659_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1806_c7_9659_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1806_c7_9659_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1806_c7_9659_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1806_c7_9659_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1806_c7_9659_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1806_c7_9659_return_output := result_u8_value_MUX_uxn_opcodes_h_l1806_c7_9659_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1806_c7_9659] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1806_c7_9659_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1806_c7_9659_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1806_c7_9659_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1806_c7_9659_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1806_c7_9659_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1806_c7_9659_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1806_c7_9659_return_output := tmp8_low_MUX_uxn_opcodes_h_l1806_c7_9659_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1797_c7_6d2b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output := result_u16_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1806_c7_9659] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_9659_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_9659_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_9659_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_9659_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_9659_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_9659_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_9659_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_9659_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1806_c7_9659] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_9659_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_9659_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_9659_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_9659_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_9659_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_9659_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_9659_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_9659_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_2454_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_9659_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_2454_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_2454_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_9659_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1802_c7_2454_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1806_c7_9659_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1802_c7_2454_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1802_c7_2454_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1806_c7_9659_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1802_c7_2454] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1802_c7_2454_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1802_c7_2454_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1802_c7_2454_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1802_c7_2454_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1802_c7_2454_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1802_c7_2454_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1802_c7_2454_return_output := result_u8_value_MUX_uxn_opcodes_h_l1802_c7_2454_return_output;

     -- t16_MUX[uxn_opcodes_h_l1793_c7_7a59] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1793_c7_7a59_cond <= VAR_t16_MUX_uxn_opcodes_h_l1793_c7_7a59_cond;
     t16_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue;
     t16_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output := t16_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1797_c7_6d2b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1802_c7_2454] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_2454_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_2454_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_2454_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_2454_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_2454_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_2454_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_2454_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_2454_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1793_c7_7a59] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_7a59_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_7a59_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1793_c7_7a59] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1793_c7_7a59_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1793_c7_7a59_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output := result_u16_value_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1797_c7_6d2b] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output := tmp8_high_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1802_c7_2454] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_2454_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_2454_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_2454_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_2454_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_2454_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_2454_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_2454_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_2454_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1802_c7_2454] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1802_c7_2454_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1802_c7_2454_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1802_c7_2454_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1802_c7_2454_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1802_c7_2454_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1802_c7_2454_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1802_c7_2454_return_output := tmp8_low_MUX_uxn_opcodes_h_l1802_c7_2454_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_2454_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_2454_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1802_c7_2454_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1802_c7_2454_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1797_c7_6d2b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1797_c7_6d2b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1790_c7_ceab] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_ceab_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_ceab_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1797_c7_6d2b] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output := tmp8_low_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1797_c7_6d2b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_6d2b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_6d2b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_6d2b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1793_c7_7a59] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_7a59_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_7a59_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1793_c7_7a59] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1793_c7_7a59_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1793_c7_7a59_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output := tmp8_high_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1790_c7_ceab] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1790_c7_ceab_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1790_c7_ceab_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output := result_u16_value_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output;

     -- t16_MUX[uxn_opcodes_h_l1790_c7_ceab] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1790_c7_ceab_cond <= VAR_t16_MUX_uxn_opcodes_h_l1790_c7_ceab_cond;
     t16_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue;
     t16_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output := t16_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1797_c7_6d2b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1793_c7_7a59] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_7a59_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_7a59_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1793_c7_7a59] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1793_c7_7a59_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1793_c7_7a59_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output := tmp8_low_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output;

     -- t16_MUX[uxn_opcodes_h_l1777_c2_9ae6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond <= VAR_t16_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond;
     t16_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue;
     t16_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output := t16_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1793_c7_7a59] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1793_c7_7a59_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1793_c7_7a59_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output := result_u8_value_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1790_c7_ceab] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1790_c7_ceab_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_ceab_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output := tmp8_high_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1777_c2_9ae6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output := result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1777_c2_9ae6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1793_c7_7a59] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_7a59_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_7a59_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_7a59_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_7a59_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1790_c7_ceab] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_ceab_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_ceab_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1793_c7_7a59_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1790_c7_ceab] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_ceab_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_ceab_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1777_c2_9ae6] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output := tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1790_c7_ceab] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1790_c7_ceab_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_ceab_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output := result_u8_value_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1790_c7_ceab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_ceab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_ceab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1790_c7_ceab] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1790_c7_ceab_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_ceab_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_ceab_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_ceab_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output := tmp8_low_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1777_c2_9ae6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output;
     REG_VAR_tmp8_high := VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_ceab_return_output;
     -- tmp8_low_MUX[uxn_opcodes_h_l1777_c2_9ae6] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output := tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1777_c2_9ae6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1777_c2_9ae6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1777_c2_9ae6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output;

     -- Submodule level 8
     REG_VAR_tmp8_low := VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l1819_l1772_DUPLICATE_7e22 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l1819_l1772_DUPLICATE_7e22_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_775a(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9ae6_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l1819_l1772_DUPLICATE_7e22_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l1819_l1772_DUPLICATE_7e22_return_output;
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
