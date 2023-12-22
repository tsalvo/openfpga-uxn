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
-- BIN_OP_EQ[uxn_opcodes_h_l1778_c6_23ee]
signal BIN_OP_EQ_uxn_opcodes_h_l1778_c6_23ee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1778_c6_23ee_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1778_c6_23ee_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1778_c2_832a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1778_c2_832a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1778_c2_832a_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1778_c2_832a]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1778_c2_832a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1778_c2_832a_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1778_c2_832a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1778_c2_832a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1778_c2_832a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1778_c2_832a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1778_c2_832a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1778_c2_832a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1778_c2_832a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c2_832a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c2_832a_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1778_c2_832a]
signal result_u8_value_MUX_uxn_opcodes_h_l1778_c2_832a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1778_c2_832a_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1778_c2_832a]
signal result_u16_value_MUX_uxn_opcodes_h_l1778_c2_832a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1778_c2_832a_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1778_c2_832a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c2_832a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c2_832a_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1778_c2_832a]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1778_c2_832a_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1778_c2_832a_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1778_c2_832a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1778_c2_832a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1778_c2_832a_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1778_c2_832a]
signal tmp8_low_MUX_uxn_opcodes_h_l1778_c2_832a_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1778_c2_832a_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1778_c2_832a]
signal t16_MUX_uxn_opcodes_h_l1778_c2_832a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1778_c2_832a_return_output : unsigned(15 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1778_c2_832a]
signal tmp8_high_MUX_uxn_opcodes_h_l1778_c2_832a_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1778_c2_832a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1791_c11_59ed]
signal BIN_OP_EQ_uxn_opcodes_h_l1791_c11_59ed_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1791_c11_59ed_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1791_c11_59ed_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1791_c7_1e3b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1791_c7_1e3b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1791_c7_1e3b]
signal result_u8_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1791_c7_1e3b]
signal result_u16_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1791_c7_1e3b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1791_c7_1e3b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output : signed(3 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1791_c7_1e3b]
signal tmp8_low_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1791_c7_1e3b]
signal t16_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output : unsigned(15 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1791_c7_1e3b]
signal tmp8_high_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1794_c11_2cb4]
signal BIN_OP_EQ_uxn_opcodes_h_l1794_c11_2cb4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1794_c11_2cb4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1794_c11_2cb4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1794_c7_c303]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c303_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c303_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1794_c7_c303]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_c303_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_c303_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1794_c7_c303]
signal result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c303_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c303_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1794_c7_c303]
signal result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c303_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c303_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1794_c7_c303]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_c303_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_c303_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1794_c7_c303]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c303_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c303_return_output : signed(3 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1794_c7_c303]
signal tmp8_low_MUX_uxn_opcodes_h_l1794_c7_c303_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1794_c7_c303_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1794_c7_c303]
signal t16_MUX_uxn_opcodes_h_l1794_c7_c303_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1794_c7_c303_return_output : unsigned(15 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1794_c7_c303]
signal tmp8_high_MUX_uxn_opcodes_h_l1794_c7_c303_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1794_c7_c303_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1796_c3_4335]
signal CONST_SL_8_uxn_opcodes_h_l1796_c3_4335_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1796_c3_4335_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1798_c11_8798]
signal BIN_OP_EQ_uxn_opcodes_h_l1798_c11_8798_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1798_c11_8798_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1798_c11_8798_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1798_c7_9147]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1798_c7_9147_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1798_c7_9147_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1798_c7_9147]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c7_9147_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c7_9147_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1798_c7_9147]
signal result_u8_value_MUX_uxn_opcodes_h_l1798_c7_9147_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1798_c7_9147_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1798_c7_9147]
signal result_u16_value_MUX_uxn_opcodes_h_l1798_c7_9147_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1798_c7_9147_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1798_c7_9147]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1798_c7_9147_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1798_c7_9147_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1798_c7_9147]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c7_9147_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c7_9147_return_output : signed(3 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1798_c7_9147]
signal tmp8_low_MUX_uxn_opcodes_h_l1798_c7_9147_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1798_c7_9147_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1798_c7_9147]
signal t16_MUX_uxn_opcodes_h_l1798_c7_9147_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1798_c7_9147_return_output : unsigned(15 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1798_c7_9147]
signal tmp8_high_MUX_uxn_opcodes_h_l1798_c7_9147_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1798_c7_9147_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1799_c3_9e93]
signal BIN_OP_OR_uxn_opcodes_h_l1799_c3_9e93_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1799_c3_9e93_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1799_c3_9e93_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1800_c30_366b]
signal sp_relative_shift_uxn_opcodes_h_l1800_c30_366b_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1800_c30_366b_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1800_c30_366b_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1800_c30_366b_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1803_c11_d08e]
signal BIN_OP_EQ_uxn_opcodes_h_l1803_c11_d08e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1803_c11_d08e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1803_c11_d08e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1803_c7_fb57]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_fb57_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_fb57_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_fb57_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1803_c7_fb57]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_fb57_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_fb57_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_fb57_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1803_c7_fb57]
signal result_u8_value_MUX_uxn_opcodes_h_l1803_c7_fb57_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1803_c7_fb57_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1803_c7_fb57_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1803_c7_fb57]
signal result_u16_value_MUX_uxn_opcodes_h_l1803_c7_fb57_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1803_c7_fb57_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1803_c7_fb57_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1803_c7_fb57]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_fb57_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_fb57_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_fb57_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1803_c7_fb57]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_fb57_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_fb57_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_fb57_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output : signed(3 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1803_c7_fb57]
signal tmp8_low_MUX_uxn_opcodes_h_l1803_c7_fb57_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1803_c7_fb57_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1803_c7_fb57_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1803_c7_fb57]
signal tmp8_high_MUX_uxn_opcodes_h_l1803_c7_fb57_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1803_c7_fb57_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1803_c7_fb57_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1805_c22_7835]
signal BIN_OP_PLUS_uxn_opcodes_h_l1805_c22_7835_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1805_c22_7835_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1805_c22_7835_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1807_c11_6222]
signal BIN_OP_EQ_uxn_opcodes_h_l1807_c11_6222_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1807_c11_6222_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1807_c11_6222_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1807_c7_0210]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_0210_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_0210_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_0210_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_0210_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1807_c7_0210]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_0210_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_0210_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_0210_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_0210_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1807_c7_0210]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_0210_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_0210_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_0210_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_0210_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1807_c7_0210]
signal result_u8_value_MUX_uxn_opcodes_h_l1807_c7_0210_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1807_c7_0210_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1807_c7_0210_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1807_c7_0210_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1807_c7_0210]
signal tmp8_low_MUX_uxn_opcodes_h_l1807_c7_0210_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1807_c7_0210_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1807_c7_0210_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1807_c7_0210_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1807_c7_0210]
signal tmp8_high_MUX_uxn_opcodes_h_l1807_c7_0210_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1807_c7_0210_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1807_c7_0210_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1807_c7_0210_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1813_c11_99a7]
signal BIN_OP_EQ_uxn_opcodes_h_l1813_c11_99a7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1813_c11_99a7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1813_c11_99a7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1813_c7_3872]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1813_c7_3872_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1813_c7_3872_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1813_c7_3872_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1813_c7_3872_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1813_c7_3872]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c7_3872_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c7_3872_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c7_3872_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c7_3872_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1813_c7_3872]
signal result_u8_value_MUX_uxn_opcodes_h_l1813_c7_3872_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1813_c7_3872_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1813_c7_3872_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1813_c7_3872_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1813_c7_3872]
signal tmp8_low_MUX_uxn_opcodes_h_l1813_c7_3872_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1813_c7_3872_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1813_c7_3872_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1813_c7_3872_return_output : unsigned(7 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_9f32( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.u8_value := ref_toks_6;
      base.u16_value := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.is_stack_index_flipped := ref_toks_9;
      base.is_pc_updated := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1778_c6_23ee
BIN_OP_EQ_uxn_opcodes_h_l1778_c6_23ee : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1778_c6_23ee_left,
BIN_OP_EQ_uxn_opcodes_h_l1778_c6_23ee_right,
BIN_OP_EQ_uxn_opcodes_h_l1778_c6_23ee_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1778_c2_832a
result_is_opc_done_MUX_uxn_opcodes_h_l1778_c2_832a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1778_c2_832a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1778_c2_832a_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1778_c2_832a
result_is_vram_write_MUX_uxn_opcodes_h_l1778_c2_832a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1778_c2_832a_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1778_c2_832a_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1778_c2_832a
result_is_ram_write_MUX_uxn_opcodes_h_l1778_c2_832a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1778_c2_832a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1778_c2_832a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1778_c2_832a
result_is_stack_write_MUX_uxn_opcodes_h_l1778_c2_832a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1778_c2_832a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1778_c2_832a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c2_832a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c2_832a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c2_832a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c2_832a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1778_c2_832a
result_u8_value_MUX_uxn_opcodes_h_l1778_c2_832a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1778_c2_832a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1778_c2_832a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1778_c2_832a
result_u16_value_MUX_uxn_opcodes_h_l1778_c2_832a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1778_c2_832a_cond,
result_u16_value_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1778_c2_832a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c2_832a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c2_832a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c2_832a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c2_832a_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1778_c2_832a
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1778_c2_832a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1778_c2_832a_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1778_c2_832a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1778_c2_832a
result_is_pc_updated_MUX_uxn_opcodes_h_l1778_c2_832a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1778_c2_832a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1778_c2_832a_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1778_c2_832a
tmp8_low_MUX_uxn_opcodes_h_l1778_c2_832a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1778_c2_832a_cond,
tmp8_low_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1778_c2_832a_return_output);

-- t16_MUX_uxn_opcodes_h_l1778_c2_832a
t16_MUX_uxn_opcodes_h_l1778_c2_832a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1778_c2_832a_cond,
t16_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue,
t16_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse,
t16_MUX_uxn_opcodes_h_l1778_c2_832a_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1778_c2_832a
tmp8_high_MUX_uxn_opcodes_h_l1778_c2_832a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1778_c2_832a_cond,
tmp8_high_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1778_c2_832a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1791_c11_59ed
BIN_OP_EQ_uxn_opcodes_h_l1791_c11_59ed : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1791_c11_59ed_left,
BIN_OP_EQ_uxn_opcodes_h_l1791_c11_59ed_right,
BIN_OP_EQ_uxn_opcodes_h_l1791_c11_59ed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_1e3b
result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_1e3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_1e3b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_1e3b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1791_c7_1e3b
result_u8_value_MUX_uxn_opcodes_h_l1791_c7_1e3b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1791_c7_1e3b
result_u16_value_MUX_uxn_opcodes_h_l1791_c7_1e3b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond,
result_u16_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_1e3b
result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_1e3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_1e3b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_1e3b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1791_c7_1e3b
tmp8_low_MUX_uxn_opcodes_h_l1791_c7_1e3b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond,
tmp8_low_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output);

-- t16_MUX_uxn_opcodes_h_l1791_c7_1e3b
t16_MUX_uxn_opcodes_h_l1791_c7_1e3b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond,
t16_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue,
t16_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse,
t16_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1791_c7_1e3b
tmp8_high_MUX_uxn_opcodes_h_l1791_c7_1e3b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond,
tmp8_high_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1794_c11_2cb4
BIN_OP_EQ_uxn_opcodes_h_l1794_c11_2cb4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1794_c11_2cb4_left,
BIN_OP_EQ_uxn_opcodes_h_l1794_c11_2cb4_right,
BIN_OP_EQ_uxn_opcodes_h_l1794_c11_2cb4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c303
result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c303 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c303_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c303_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_c303
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_c303 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_c303_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_c303_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c303
result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c303 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c303_cond,
result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c303_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c303
result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c303 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c303_cond,
result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c303_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_c303
result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_c303 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_c303_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_c303_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c303
result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c303 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c303_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c303_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1794_c7_c303
tmp8_low_MUX_uxn_opcodes_h_l1794_c7_c303 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1794_c7_c303_cond,
tmp8_low_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1794_c7_c303_return_output);

-- t16_MUX_uxn_opcodes_h_l1794_c7_c303
t16_MUX_uxn_opcodes_h_l1794_c7_c303 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1794_c7_c303_cond,
t16_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue,
t16_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse,
t16_MUX_uxn_opcodes_h_l1794_c7_c303_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1794_c7_c303
tmp8_high_MUX_uxn_opcodes_h_l1794_c7_c303 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1794_c7_c303_cond,
tmp8_high_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1794_c7_c303_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1796_c3_4335
CONST_SL_8_uxn_opcodes_h_l1796_c3_4335 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1796_c3_4335_x,
CONST_SL_8_uxn_opcodes_h_l1796_c3_4335_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1798_c11_8798
BIN_OP_EQ_uxn_opcodes_h_l1798_c11_8798 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1798_c11_8798_left,
BIN_OP_EQ_uxn_opcodes_h_l1798_c11_8798_right,
BIN_OP_EQ_uxn_opcodes_h_l1798_c11_8798_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1798_c7_9147
result_is_opc_done_MUX_uxn_opcodes_h_l1798_c7_9147 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1798_c7_9147_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1798_c7_9147_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c7_9147
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c7_9147 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c7_9147_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c7_9147_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1798_c7_9147
result_u8_value_MUX_uxn_opcodes_h_l1798_c7_9147 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1798_c7_9147_cond,
result_u8_value_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1798_c7_9147_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1798_c7_9147
result_u16_value_MUX_uxn_opcodes_h_l1798_c7_9147 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1798_c7_9147_cond,
result_u16_value_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1798_c7_9147_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1798_c7_9147
result_is_stack_write_MUX_uxn_opcodes_h_l1798_c7_9147 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1798_c7_9147_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1798_c7_9147_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c7_9147
result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c7_9147 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c7_9147_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c7_9147_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1798_c7_9147
tmp8_low_MUX_uxn_opcodes_h_l1798_c7_9147 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1798_c7_9147_cond,
tmp8_low_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1798_c7_9147_return_output);

-- t16_MUX_uxn_opcodes_h_l1798_c7_9147
t16_MUX_uxn_opcodes_h_l1798_c7_9147 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1798_c7_9147_cond,
t16_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue,
t16_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse,
t16_MUX_uxn_opcodes_h_l1798_c7_9147_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1798_c7_9147
tmp8_high_MUX_uxn_opcodes_h_l1798_c7_9147 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1798_c7_9147_cond,
tmp8_high_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1798_c7_9147_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1799_c3_9e93
BIN_OP_OR_uxn_opcodes_h_l1799_c3_9e93 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1799_c3_9e93_left,
BIN_OP_OR_uxn_opcodes_h_l1799_c3_9e93_right,
BIN_OP_OR_uxn_opcodes_h_l1799_c3_9e93_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1800_c30_366b
sp_relative_shift_uxn_opcodes_h_l1800_c30_366b : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1800_c30_366b_ins,
sp_relative_shift_uxn_opcodes_h_l1800_c30_366b_x,
sp_relative_shift_uxn_opcodes_h_l1800_c30_366b_y,
sp_relative_shift_uxn_opcodes_h_l1800_c30_366b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1803_c11_d08e
BIN_OP_EQ_uxn_opcodes_h_l1803_c11_d08e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1803_c11_d08e_left,
BIN_OP_EQ_uxn_opcodes_h_l1803_c11_d08e_right,
BIN_OP_EQ_uxn_opcodes_h_l1803_c11_d08e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_fb57
result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_fb57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_fb57_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_fb57_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_fb57_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_fb57
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_fb57 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_fb57_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_fb57_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_fb57_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1803_c7_fb57
result_u8_value_MUX_uxn_opcodes_h_l1803_c7_fb57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1803_c7_fb57_cond,
result_u8_value_MUX_uxn_opcodes_h_l1803_c7_fb57_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1803_c7_fb57_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1803_c7_fb57
result_u16_value_MUX_uxn_opcodes_h_l1803_c7_fb57 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1803_c7_fb57_cond,
result_u16_value_MUX_uxn_opcodes_h_l1803_c7_fb57_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1803_c7_fb57_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_fb57
result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_fb57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_fb57_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_fb57_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_fb57_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_fb57
result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_fb57 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_fb57_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_fb57_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_fb57_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1803_c7_fb57
tmp8_low_MUX_uxn_opcodes_h_l1803_c7_fb57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1803_c7_fb57_cond,
tmp8_low_MUX_uxn_opcodes_h_l1803_c7_fb57_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1803_c7_fb57_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1803_c7_fb57
tmp8_high_MUX_uxn_opcodes_h_l1803_c7_fb57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1803_c7_fb57_cond,
tmp8_high_MUX_uxn_opcodes_h_l1803_c7_fb57_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1803_c7_fb57_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1805_c22_7835
BIN_OP_PLUS_uxn_opcodes_h_l1805_c22_7835 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1805_c22_7835_left,
BIN_OP_PLUS_uxn_opcodes_h_l1805_c22_7835_right,
BIN_OP_PLUS_uxn_opcodes_h_l1805_c22_7835_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1807_c11_6222
BIN_OP_EQ_uxn_opcodes_h_l1807_c11_6222 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1807_c11_6222_left,
BIN_OP_EQ_uxn_opcodes_h_l1807_c11_6222_right,
BIN_OP_EQ_uxn_opcodes_h_l1807_c11_6222_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_0210
result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_0210 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_0210_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_0210_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_0210_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_0210_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_0210
result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_0210 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_0210_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_0210_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_0210_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_0210_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_0210
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_0210 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_0210_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_0210_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_0210_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_0210_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1807_c7_0210
result_u8_value_MUX_uxn_opcodes_h_l1807_c7_0210 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1807_c7_0210_cond,
result_u8_value_MUX_uxn_opcodes_h_l1807_c7_0210_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1807_c7_0210_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1807_c7_0210_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1807_c7_0210
tmp8_low_MUX_uxn_opcodes_h_l1807_c7_0210 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1807_c7_0210_cond,
tmp8_low_MUX_uxn_opcodes_h_l1807_c7_0210_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1807_c7_0210_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1807_c7_0210_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1807_c7_0210
tmp8_high_MUX_uxn_opcodes_h_l1807_c7_0210 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1807_c7_0210_cond,
tmp8_high_MUX_uxn_opcodes_h_l1807_c7_0210_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1807_c7_0210_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1807_c7_0210_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1813_c11_99a7
BIN_OP_EQ_uxn_opcodes_h_l1813_c11_99a7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1813_c11_99a7_left,
BIN_OP_EQ_uxn_opcodes_h_l1813_c11_99a7_right,
BIN_OP_EQ_uxn_opcodes_h_l1813_c11_99a7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1813_c7_3872
result_is_opc_done_MUX_uxn_opcodes_h_l1813_c7_3872 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1813_c7_3872_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1813_c7_3872_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1813_c7_3872_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1813_c7_3872_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c7_3872
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c7_3872 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c7_3872_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c7_3872_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c7_3872_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c7_3872_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1813_c7_3872
result_u8_value_MUX_uxn_opcodes_h_l1813_c7_3872 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1813_c7_3872_cond,
result_u8_value_MUX_uxn_opcodes_h_l1813_c7_3872_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1813_c7_3872_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1813_c7_3872_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1813_c7_3872
tmp8_low_MUX_uxn_opcodes_h_l1813_c7_3872 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1813_c7_3872_cond,
tmp8_low_MUX_uxn_opcodes_h_l1813_c7_3872_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1813_c7_3872_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1813_c7_3872_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1778_c6_23ee_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1778_c2_832a_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1778_c2_832a_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1778_c2_832a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1778_c2_832a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c2_832a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1778_c2_832a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1778_c2_832a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c2_832a_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1778_c2_832a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1778_c2_832a_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1778_c2_832a_return_output,
 t16_MUX_uxn_opcodes_h_l1778_c2_832a_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1778_c2_832a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1791_c11_59ed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output,
 t16_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1794_c11_2cb4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c303_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_c303_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c303_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c303_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_c303_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c303_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1794_c7_c303_return_output,
 t16_MUX_uxn_opcodes_h_l1794_c7_c303_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1794_c7_c303_return_output,
 CONST_SL_8_uxn_opcodes_h_l1796_c3_4335_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1798_c11_8798_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1798_c7_9147_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c7_9147_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1798_c7_9147_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1798_c7_9147_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1798_c7_9147_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c7_9147_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1798_c7_9147_return_output,
 t16_MUX_uxn_opcodes_h_l1798_c7_9147_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1798_c7_9147_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1799_c3_9e93_return_output,
 sp_relative_shift_uxn_opcodes_h_l1800_c30_366b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1803_c11_d08e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1805_c22_7835_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1807_c11_6222_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_0210_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_0210_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_0210_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1807_c7_0210_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1807_c7_0210_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1807_c7_0210_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1813_c11_99a7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1813_c7_3872_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c7_3872_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1813_c7_3872_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1813_c7_3872_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c6_23ee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c6_23ee_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c6_23ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1778_c2_832a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1778_c2_832a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1778_c2_832a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1778_c2_832a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1778_c2_832a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1778_c2_832a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1778_c2_832a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1778_c2_832a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1778_c2_832a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1778_c2_832a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1788_c3_02d6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c2_832a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c2_832a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1778_c2_832a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1778_c2_832a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1778_c2_832a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1778_c2_832a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1783_c3_92b6 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c2_832a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c2_832a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1778_c2_832a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1778_c2_832a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1778_c2_832a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1778_c2_832a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1778_c2_832a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1778_c2_832a_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1778_c2_832a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1778_c2_832a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1778_c2_832a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1778_c2_832a_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1778_c2_832a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1778_c2_832a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_59ed_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_59ed_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_59ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c303_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1792_c3_ec50 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_c303_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c303_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c303_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_c303_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c303_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1794_c7_c303_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1794_c7_c303_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1794_c7_c303_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_2cb4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_2cb4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_2cb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1798_c7_9147_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c303_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c7_9147_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_c303_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1798_c7_9147_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c303_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1798_c7_9147_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c303_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1798_c7_9147_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_c303_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c7_9147_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c303_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1798_c7_9147_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1794_c7_c303_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1798_c7_9147_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1794_c7_c303_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1798_c7_9147_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1794_c7_c303_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1796_c3_4335_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1796_c3_4335_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1798_c11_8798_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1798_c11_8798_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1798_c11_8798_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1798_c7_9147_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c7_9147_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1798_c7_9147_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1798_c7_9147_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1798_c7_9147_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c7_9147_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1798_c7_9147_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1798_c7_9147_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1798_c7_9147_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1799_c3_9e93_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1799_c3_9e93_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1799_c3_9e93_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1800_c30_366b_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1800_c30_366b_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1800_c30_366b_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1800_c30_366b_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_d08e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_d08e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_d08e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_fb57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_fb57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_0210_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_fb57_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_fb57_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_fb57_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_0210_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_fb57_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1803_c7_fb57_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1803_c7_fb57_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1807_c7_0210_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1803_c7_fb57_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1803_c7_fb57_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1805_c3_0823 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1803_c7_fb57_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1803_c7_fb57_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_fb57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_fb57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_0210_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_fb57_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_fb57_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1804_c3_9f5d : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_fb57_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_fb57_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1803_c7_fb57_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1803_c7_fb57_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1807_c7_0210_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1803_c7_fb57_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1803_c7_fb57_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1803_c7_fb57_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1807_c7_0210_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1803_c7_fb57_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1805_c22_7835_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1805_c22_7835_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1805_c22_7835_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1807_c11_6222_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1807_c11_6222_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1807_c11_6222_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_0210_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_0210_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1813_c7_3872_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_0210_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_0210_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_0210_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_0210_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_0210_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1810_c3_f199 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_0210_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c7_3872_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_0210_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1807_c7_0210_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1807_c7_0210_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1813_c7_3872_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1807_c7_0210_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1807_c7_0210_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1807_c7_0210_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1813_c7_3872_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1807_c7_0210_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1807_c7_0210_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1807_c7_0210_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1807_c7_0210_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c11_99a7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c11_99a7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c11_99a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1813_c7_3872_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1813_c7_3872_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1813_c7_3872_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c7_3872_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1815_c3_ce04 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c7_3872_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c7_3872_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1813_c7_3872_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1813_c7_3872_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1813_c7_3872_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1813_c7_3872_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1813_c7_3872_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1813_c7_3872_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1803_l1778_l1798_l1794_l1791_l1813_DUPLICATE_e94b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1794_l1791_l1803_l1778_DUPLICATE_9a9a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1807_l1803_l1798_l1794_l1791_l1813_DUPLICATE_4e9b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1807_l1803_l1798_l1794_l1791_DUPLICATE_0e76_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1791_l1803_l1794_DUPLICATE_5955_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1799_l1795_DUPLICATE_cc8c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1813_l1798_l1803_l1794_DUPLICATE_3570_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l1820_l1773_DUPLICATE_f045_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1815_c3_ce04 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c7_3872_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1815_c3_ce04;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_0210_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c6_23ee_right := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_d08e_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_59ed_right := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1798_c11_8798_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c11_99a7_right := to_unsigned(6, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1783_c3_92b6 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1783_c3_92b6;
     VAR_sp_relative_shift_uxn_opcodes_h_l1800_c30_366b_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1800_c30_366b_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1807_c11_6222_right := to_unsigned(5, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1804_c3_9f5d := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_fb57_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1804_c3_9f5d;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1813_c7_3872_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1810_c3_f199 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_0210_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1810_c3_f199;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1792_c3_ec50 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1792_c3_ec50;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1805_c22_7835_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1788_c3_02d6 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1788_c3_02d6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_2cb4_right := to_unsigned(2, 2);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1800_c30_366b_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c6_23ee_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_59ed_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_2cb4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1798_c11_8798_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_d08e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1807_c11_6222_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c11_99a7_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1807_c7_0210_iftrue := VAR_previous_ram_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1813_c7_3872_iftrue := VAR_previous_ram_read;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1807_c7_0210_iftrue := VAR_previous_ram_read;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1813_c7_3872_iftrue := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1799_c3_9e93_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1805_c22_7835_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse := t16;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1803_c7_fb57_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1807_c7_0210_iffalse := tmp8_high;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1803_c7_fb57_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1807_c7_0210_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1813_c7_3872_iffalse := tmp8_low;
     -- BIN_OP_EQ[uxn_opcodes_h_l1778_c6_23ee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1778_c6_23ee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c6_23ee_left;
     BIN_OP_EQ_uxn_opcodes_h_l1778_c6_23ee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c6_23ee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c6_23ee_return_output := BIN_OP_EQ_uxn_opcodes_h_l1778_c6_23ee_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1778_c2_832a] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1778_c2_832a_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1798_c11_8798] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1798_c11_8798_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1798_c11_8798_left;
     BIN_OP_EQ_uxn_opcodes_h_l1798_c11_8798_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1798_c11_8798_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1798_c11_8798_return_output := BIN_OP_EQ_uxn_opcodes_h_l1798_c11_8798_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1813_l1798_l1803_l1794_DUPLICATE_3570 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1813_l1798_l1803_l1794_DUPLICATE_3570_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1791_l1803_l1794_DUPLICATE_5955 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1791_l1803_l1794_DUPLICATE_5955_return_output := result.sp_relative_shift;

     -- sp_relative_shift[uxn_opcodes_h_l1800_c30_366b] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1800_c30_366b_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1800_c30_366b_ins;
     sp_relative_shift_uxn_opcodes_h_l1800_c30_366b_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1800_c30_366b_x;
     sp_relative_shift_uxn_opcodes_h_l1800_c30_366b_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1800_c30_366b_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1800_c30_366b_return_output := sp_relative_shift_uxn_opcodes_h_l1800_c30_366b_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1778_c2_832a] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1778_c2_832a_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1813_c11_99a7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1813_c11_99a7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c11_99a7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1813_c11_99a7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c11_99a7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c11_99a7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1813_c11_99a7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1803_c11_d08e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1803_c11_d08e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_d08e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1803_c11_d08e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_d08e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_d08e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1803_c11_d08e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1807_l1803_l1798_l1794_l1791_l1813_DUPLICATE_4e9b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1807_l1803_l1798_l1794_l1791_l1813_DUPLICATE_4e9b_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1803_l1778_l1798_l1794_l1791_l1813_DUPLICATE_e94b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1803_l1778_l1798_l1794_l1791_l1813_DUPLICATE_e94b_return_output := result.u8_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1799_l1795_DUPLICATE_cc8c LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1799_l1795_DUPLICATE_cc8c_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1778_c2_832a] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1778_c2_832a_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1794_c11_2cb4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1794_c11_2cb4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_2cb4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1794_c11_2cb4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_2cb4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_2cb4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1794_c11_2cb4_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1778_c2_832a] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1778_c2_832a_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1807_c11_6222] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1807_c11_6222_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1807_c11_6222_left;
     BIN_OP_EQ_uxn_opcodes_h_l1807_c11_6222_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1807_c11_6222_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1807_c11_6222_return_output := BIN_OP_EQ_uxn_opcodes_h_l1807_c11_6222_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1791_c11_59ed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1791_c11_59ed_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_59ed_left;
     BIN_OP_EQ_uxn_opcodes_h_l1791_c11_59ed_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_59ed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_59ed_return_output := BIN_OP_EQ_uxn_opcodes_h_l1791_c11_59ed_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1805_c22_7835] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1805_c22_7835_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1805_c22_7835_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1805_c22_7835_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1805_c22_7835_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1805_c22_7835_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1805_c22_7835_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1807_l1803_l1798_l1794_l1791_DUPLICATE_0e76 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1807_l1803_l1798_l1794_l1791_DUPLICATE_0e76_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1794_l1791_l1803_l1778_DUPLICATE_9a9a LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1794_l1791_l1803_l1778_DUPLICATE_9a9a_return_output := result.u16_value;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1778_c2_832a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c6_23ee_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1778_c2_832a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c6_23ee_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1778_c2_832a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c6_23ee_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1778_c2_832a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c6_23ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1778_c2_832a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c6_23ee_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1778_c2_832a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c6_23ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c2_832a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c6_23ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c2_832a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c6_23ee_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1778_c2_832a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c6_23ee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1778_c2_832a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c6_23ee_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1778_c2_832a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c6_23ee_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1778_c2_832a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c6_23ee_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1778_c2_832a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1778_c6_23ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_59ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_59ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_59ed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_59ed_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_59ed_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_59ed_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_59ed_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_59ed_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1791_c11_59ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c303_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_2cb4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_c303_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_2cb4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c303_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_2cb4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_c303_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_2cb4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c303_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_2cb4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c303_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_2cb4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1794_c7_c303_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_2cb4_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1794_c7_c303_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_2cb4_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1794_c7_c303_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c11_2cb4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1798_c7_9147_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1798_c11_8798_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1798_c7_9147_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1798_c11_8798_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c7_9147_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1798_c11_8798_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c7_9147_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1798_c11_8798_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1798_c7_9147_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1798_c11_8798_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1798_c7_9147_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1798_c11_8798_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1798_c7_9147_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1798_c11_8798_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1798_c7_9147_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1798_c11_8798_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1798_c7_9147_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1798_c11_8798_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_fb57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_d08e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_fb57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_d08e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_fb57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_d08e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_fb57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_d08e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1803_c7_fb57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_d08e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1803_c7_fb57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_d08e_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1803_c7_fb57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_d08e_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1803_c7_fb57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_d08e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_0210_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1807_c11_6222_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_0210_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1807_c11_6222_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_0210_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1807_c11_6222_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1807_c7_0210_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1807_c11_6222_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1807_c7_0210_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1807_c11_6222_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1807_c7_0210_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1807_c11_6222_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1813_c7_3872_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c11_99a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c7_3872_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c11_99a7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1813_c7_3872_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c11_99a7_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1813_c7_3872_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c11_99a7_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1805_c3_0823 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1805_c22_7835_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l1799_c3_9e93_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1799_l1795_DUPLICATE_cc8c_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1796_c3_4335_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1799_l1795_DUPLICATE_cc8c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1791_l1803_l1794_DUPLICATE_5955_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1791_l1803_l1794_DUPLICATE_5955_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_fb57_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1791_l1803_l1794_DUPLICATE_5955_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1794_l1791_l1803_l1778_DUPLICATE_9a9a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1794_l1791_l1803_l1778_DUPLICATE_9a9a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1794_l1791_l1803_l1778_DUPLICATE_9a9a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1803_c7_fb57_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1794_l1791_l1803_l1778_DUPLICATE_9a9a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1807_l1803_l1798_l1794_l1791_l1813_DUPLICATE_4e9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1807_l1803_l1798_l1794_l1791_l1813_DUPLICATE_4e9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1807_l1803_l1798_l1794_l1791_l1813_DUPLICATE_4e9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_fb57_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1807_l1803_l1798_l1794_l1791_l1813_DUPLICATE_4e9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_0210_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1807_l1803_l1798_l1794_l1791_l1813_DUPLICATE_4e9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1813_c7_3872_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1807_l1803_l1798_l1794_l1791_l1813_DUPLICATE_4e9b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1807_l1803_l1798_l1794_l1791_DUPLICATE_0e76_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1807_l1803_l1798_l1794_l1791_DUPLICATE_0e76_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1807_l1803_l1798_l1794_l1791_DUPLICATE_0e76_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_fb57_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1807_l1803_l1798_l1794_l1791_DUPLICATE_0e76_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_0210_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1807_l1803_l1798_l1794_l1791_DUPLICATE_0e76_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1813_l1798_l1803_l1794_DUPLICATE_3570_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1813_l1798_l1803_l1794_DUPLICATE_3570_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_fb57_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1813_l1798_l1803_l1794_DUPLICATE_3570_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c7_3872_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1813_l1798_l1803_l1794_DUPLICATE_3570_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1803_l1778_l1798_l1794_l1791_l1813_DUPLICATE_e94b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1803_l1778_l1798_l1794_l1791_l1813_DUPLICATE_e94b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1803_l1778_l1798_l1794_l1791_l1813_DUPLICATE_e94b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1803_l1778_l1798_l1794_l1791_l1813_DUPLICATE_e94b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1803_c7_fb57_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1803_l1778_l1798_l1794_l1791_l1813_DUPLICATE_e94b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1813_c7_3872_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1803_l1778_l1798_l1794_l1791_l1813_DUPLICATE_e94b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1778_c2_832a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1778_c2_832a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1778_c2_832a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1778_c2_832a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1800_c30_366b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1803_c7_fb57_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1805_c3_0823;
     -- CONST_SL_8[uxn_opcodes_h_l1796_c3_4335] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1796_c3_4335_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1796_c3_4335_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1796_c3_4335_return_output := CONST_SL_8_uxn_opcodes_h_l1796_c3_4335_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1778_c2_832a] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1778_c2_832a_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1778_c2_832a_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1778_c2_832a_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1778_c2_832a_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1807_c7_0210] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1807_c7_0210_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1807_c7_0210_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1807_c7_0210_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1807_c7_0210_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1807_c7_0210_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1807_c7_0210_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1807_c7_0210_return_output := tmp8_high_MUX_uxn_opcodes_h_l1807_c7_0210_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1813_c7_3872] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1813_c7_3872_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1813_c7_3872_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1813_c7_3872_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1813_c7_3872_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1813_c7_3872_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1813_c7_3872_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1813_c7_3872_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1813_c7_3872_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1813_c7_3872] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c7_3872_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c7_3872_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c7_3872_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c7_3872_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c7_3872_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c7_3872_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c7_3872_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c7_3872_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1807_c7_0210] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_0210_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_0210_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_0210_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_0210_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_0210_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_0210_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_0210_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_0210_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1778_c2_832a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1778_c2_832a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1778_c2_832a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1778_c2_832a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1778_c2_832a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1803_c7_fb57] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_fb57_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_fb57_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_fb57_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_fb57_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_fb57_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_fb57_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1813_c7_3872] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1813_c7_3872_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1813_c7_3872_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1813_c7_3872_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1813_c7_3872_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1813_c7_3872_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1813_c7_3872_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1813_c7_3872_return_output := tmp8_low_MUX_uxn_opcodes_h_l1813_c7_3872_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1778_c2_832a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1778_c2_832a_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1778_c2_832a_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1778_c2_832a_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1778_c2_832a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1813_c7_3872] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1813_c7_3872_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1813_c7_3872_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1813_c7_3872_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1813_c7_3872_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1813_c7_3872_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1813_c7_3872_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1813_c7_3872_return_output := result_u8_value_MUX_uxn_opcodes_h_l1813_c7_3872_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1803_c7_fb57] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1803_c7_fb57_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1803_c7_fb57_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1803_c7_fb57_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1803_c7_fb57_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1803_c7_fb57_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1803_c7_fb57_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output := result_u16_value_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1799_c3_9e93] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1799_c3_9e93_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1799_c3_9e93_left;
     BIN_OP_OR_uxn_opcodes_h_l1799_c3_9e93_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1799_c3_9e93_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1799_c3_9e93_return_output := BIN_OP_OR_uxn_opcodes_h_l1799_c3_9e93_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1778_c2_832a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1778_c2_832a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1778_c2_832a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1778_c2_832a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1778_c2_832a_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1799_c3_9e93_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1799_c3_9e93_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1796_c3_4335_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_0210_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1813_c7_3872_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_fb57_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1807_c7_0210_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_0210_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c7_3872_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1807_c7_0210_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1813_c7_3872_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1803_c7_fb57_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1807_c7_0210_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1807_c7_0210_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1813_c7_3872_return_output;
     -- t16_MUX[uxn_opcodes_h_l1798_c7_9147] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1798_c7_9147_cond <= VAR_t16_MUX_uxn_opcodes_h_l1798_c7_9147_cond;
     t16_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue;
     t16_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1798_c7_9147_return_output := t16_MUX_uxn_opcodes_h_l1798_c7_9147_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1807_c7_0210] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1807_c7_0210_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1807_c7_0210_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1807_c7_0210_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1807_c7_0210_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1807_c7_0210_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1807_c7_0210_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1807_c7_0210_return_output := tmp8_low_MUX_uxn_opcodes_h_l1807_c7_0210_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1807_c7_0210] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_0210_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_0210_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_0210_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_0210_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_0210_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_0210_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_0210_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_0210_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1798_c7_9147] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c7_9147_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c7_9147_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c7_9147_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c7_9147_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1807_c7_0210] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_0210_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_0210_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_0210_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_0210_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_0210_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_0210_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_0210_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_0210_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1803_c7_fb57] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_fb57_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_fb57_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_fb57_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_fb57_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_fb57_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_fb57_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1798_c7_9147] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1798_c7_9147_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1798_c7_9147_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1798_c7_9147_return_output := result_u16_value_MUX_uxn_opcodes_h_l1798_c7_9147_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1803_c7_fb57] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1803_c7_fb57_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1803_c7_fb57_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1803_c7_fb57_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1803_c7_fb57_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1803_c7_fb57_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1803_c7_fb57_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output := tmp8_high_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1807_c7_0210] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1807_c7_0210_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1807_c7_0210_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1807_c7_0210_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1807_c7_0210_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1807_c7_0210_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1807_c7_0210_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1807_c7_0210_return_output := result_u8_value_MUX_uxn_opcodes_h_l1807_c7_0210_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_fb57_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1807_c7_0210_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1798_c7_9147_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_fb57_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1807_c7_0210_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1798_c7_9147_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1803_c7_fb57_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1807_c7_0210_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1798_c7_9147_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1803_c7_fb57_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1807_c7_0210_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1803_c7_fb57] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1803_c7_fb57_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1803_c7_fb57_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1803_c7_fb57_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1803_c7_fb57_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1803_c7_fb57_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1803_c7_fb57_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output := result_u8_value_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1803_c7_fb57] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1803_c7_fb57_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1803_c7_fb57_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1803_c7_fb57_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1803_c7_fb57_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1803_c7_fb57_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1803_c7_fb57_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output := tmp8_low_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1794_c7_c303] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c303_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c303_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c303_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c303_return_output;

     -- t16_MUX[uxn_opcodes_h_l1794_c7_c303] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1794_c7_c303_cond <= VAR_t16_MUX_uxn_opcodes_h_l1794_c7_c303_cond;
     t16_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue;
     t16_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1794_c7_c303_return_output := t16_MUX_uxn_opcodes_h_l1794_c7_c303_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1798_c7_9147] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1798_c7_9147_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1798_c7_9147_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1798_c7_9147_return_output := tmp8_high_MUX_uxn_opcodes_h_l1798_c7_9147_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1803_c7_fb57] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_fb57_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_fb57_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_fb57_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_fb57_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_fb57_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_fb57_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1803_c7_fb57] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_fb57_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_fb57_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_fb57_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_fb57_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_fb57_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_fb57_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1798_c7_9147] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1798_c7_9147_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1798_c7_9147_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1798_c7_9147_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1798_c7_9147_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1794_c7_c303] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c303_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c303_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c303_return_output := result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c303_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1798_c7_9147_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c7_c303_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1794_c7_c303_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1794_c7_c303_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1798_c7_9147_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1803_c7_fb57_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1791_c7_1e3b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output := result_u16_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1794_c7_c303] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1794_c7_c303_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1794_c7_c303_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1794_c7_c303_return_output := tmp8_high_MUX_uxn_opcodes_h_l1794_c7_c303_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1798_c7_9147] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1798_c7_9147_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1798_c7_9147_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1798_c7_9147_return_output := result_u8_value_MUX_uxn_opcodes_h_l1798_c7_9147_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1798_c7_9147] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c7_9147_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c7_9147_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c7_9147_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c7_9147_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1794_c7_c303] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_c303_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_c303_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_c303_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_c303_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1798_c7_9147] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1798_c7_9147_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1798_c7_9147_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1798_c7_9147_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1798_c7_9147_return_output;

     -- t16_MUX[uxn_opcodes_h_l1791_c7_1e3b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond;
     t16_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue;
     t16_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output := t16_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1798_c7_9147] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1798_c7_9147_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1798_c7_9147_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1798_c7_9147_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1798_c7_9147_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1798_c7_9147_return_output := tmp8_low_MUX_uxn_opcodes_h_l1798_c7_9147_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1791_c7_1e3b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1798_c7_9147_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c7_c303_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1798_c7_9147_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1798_c7_9147_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1794_c7_c303_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1798_c7_9147_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1791_c7_1e3b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1778_c2_832a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1778_c2_832a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1778_c2_832a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1778_c2_832a_return_output := result_u16_value_MUX_uxn_opcodes_h_l1778_c2_832a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1794_c7_c303] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_c303_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_c303_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_c303_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_c303_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1794_c7_c303] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c303_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c303_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c303_return_output := result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c303_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1794_c7_c303] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1794_c7_c303_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1794_c7_c303_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1794_c7_c303_return_output := tmp8_low_MUX_uxn_opcodes_h_l1794_c7_c303_return_output;

     -- t16_MUX[uxn_opcodes_h_l1778_c2_832a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1778_c2_832a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1778_c2_832a_cond;
     t16_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue;
     t16_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1778_c2_832a_return_output := t16_MUX_uxn_opcodes_h_l1778_c2_832a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1794_c7_c303] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c303_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c303_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c303_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c303_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c303_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c303_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1791_c7_1e3b] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output := tmp8_high_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1778_c2_832a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c2_832a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c2_832a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c2_832a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c2_832a_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c7_c303_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c7_c303_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1794_c7_c303_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1778_c2_832a_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1794_c7_c303_return_output;
     -- tmp8_low_MUX[uxn_opcodes_h_l1791_c7_1e3b] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output := tmp8_low_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1778_c2_832a] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1778_c2_832a_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1778_c2_832a_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1778_c2_832a_return_output := tmp8_high_MUX_uxn_opcodes_h_l1778_c2_832a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1778_c2_832a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1778_c2_832a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1778_c2_832a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1778_c2_832a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1778_c2_832a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1791_c7_1e3b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1791_c7_1e3b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1791_c7_1e3b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_1e3b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_1e3b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_1e3b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output;
     REG_VAR_tmp8_high := VAR_tmp8_high_MUX_uxn_opcodes_h_l1778_c2_832a_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1791_c7_1e3b_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1778_c2_832a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c2_832a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c2_832a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c2_832a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c2_832a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1778_c2_832a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1778_c2_832a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1778_c2_832a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1778_c2_832a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1778_c2_832a_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1778_c2_832a] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1778_c2_832a_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1778_c2_832a_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1778_c2_832a_return_output := tmp8_low_MUX_uxn_opcodes_h_l1778_c2_832a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1778_c2_832a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1778_c2_832a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1778_c2_832a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1778_c2_832a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1778_c2_832a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1778_c2_832a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1778_c2_832a_return_output;

     -- Submodule level 8
     REG_VAR_tmp8_low := VAR_tmp8_low_MUX_uxn_opcodes_h_l1778_c2_832a_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l1820_l1773_DUPLICATE_f045 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l1820_l1773_DUPLICATE_f045_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_9f32(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1778_c2_832a_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1778_c2_832a_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1778_c2_832a_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1778_c2_832a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1778_c2_832a_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1778_c2_832a_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1778_c2_832a_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1778_c2_832a_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1778_c2_832a_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1778_c2_832a_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l1820_l1773_DUPLICATE_f045_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l1820_l1773_DUPLICATE_f045_return_output;
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
