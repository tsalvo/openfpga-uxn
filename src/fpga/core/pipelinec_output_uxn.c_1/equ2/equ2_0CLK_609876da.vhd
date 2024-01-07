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
-- Submodules: 58
entity equ2_0CLK_609876da is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end equ2_0CLK_609876da;
architecture arch of equ2_0CLK_609876da is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1197_c6_ea5d]
signal BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ea5d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ea5d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ea5d_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1197_c2_26d6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_26d6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1197_c2_26d6]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1197_c2_26d6]
signal result_u8_value_MUX_uxn_opcodes_h_l1197_c2_26d6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1197_c2_26d6]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1197_c2_26d6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_26d6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1197_c2_26d6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_26d6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1197_c2_26d6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_26d6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1197_c2_26d6]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_26d6_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1197_c2_26d6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_26d6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1197_c2_26d6]
signal t16_MUX_uxn_opcodes_h_l1197_c2_26d6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1197_c2_26d6]
signal n16_MUX_uxn_opcodes_h_l1197_c2_26d6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1210_c11_6a05]
signal BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6a05_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6a05_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6a05_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1210_c7_75c2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_75c2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_75c2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_75c2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_75c2_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1210_c7_75c2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_75c2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_75c2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_75c2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_75c2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1210_c7_75c2]
signal result_u8_value_MUX_uxn_opcodes_h_l1210_c7_75c2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1210_c7_75c2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1210_c7_75c2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1210_c7_75c2_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1210_c7_75c2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_75c2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_75c2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_75c2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_75c2_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1210_c7_75c2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_75c2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_75c2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_75c2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_75c2_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1210_c7_75c2]
signal t16_MUX_uxn_opcodes_h_l1210_c7_75c2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1210_c7_75c2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1210_c7_75c2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1210_c7_75c2_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1210_c7_75c2]
signal n16_MUX_uxn_opcodes_h_l1210_c7_75c2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1210_c7_75c2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1210_c7_75c2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1210_c7_75c2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1213_c11_cc85]
signal BIN_OP_EQ_uxn_opcodes_h_l1213_c11_cc85_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1213_c11_cc85_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1213_c11_cc85_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1213_c7_d794]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d794_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d794_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d794_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d794_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1213_c7_d794]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d794_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d794_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d794_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d794_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1213_c7_d794]
signal result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d794_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d794_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d794_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d794_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1213_c7_d794]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d794_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d794_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d794_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d794_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1213_c7_d794]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d794_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d794_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d794_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d794_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1213_c7_d794]
signal t16_MUX_uxn_opcodes_h_l1213_c7_d794_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1213_c7_d794_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1213_c7_d794_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1213_c7_d794_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1213_c7_d794]
signal n16_MUX_uxn_opcodes_h_l1213_c7_d794_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1213_c7_d794_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1213_c7_d794_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1213_c7_d794_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1218_c11_150a]
signal BIN_OP_EQ_uxn_opcodes_h_l1218_c11_150a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1218_c11_150a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1218_c11_150a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1218_c7_d48e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d48e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d48e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d48e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d48e_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1218_c7_d48e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d48e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d48e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d48e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d48e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1218_c7_d48e]
signal result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d48e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d48e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d48e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d48e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1218_c7_d48e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d48e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d48e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d48e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d48e_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1218_c7_d48e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d48e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d48e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d48e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d48e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1218_c7_d48e]
signal t16_MUX_uxn_opcodes_h_l1218_c7_d48e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1218_c7_d48e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1218_c7_d48e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1218_c7_d48e_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1218_c7_d48e]
signal n16_MUX_uxn_opcodes_h_l1218_c7_d48e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1218_c7_d48e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1218_c7_d48e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1218_c7_d48e_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1219_c3_7e1f]
signal BIN_OP_OR_uxn_opcodes_h_l1219_c3_7e1f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1219_c3_7e1f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1219_c3_7e1f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1222_c11_10d2]
signal BIN_OP_EQ_uxn_opcodes_h_l1222_c11_10d2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1222_c11_10d2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1222_c11_10d2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1222_c7_7388]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_7388_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_7388_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_7388_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_7388_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1222_c7_7388]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_7388_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_7388_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_7388_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_7388_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1222_c7_7388]
signal result_u8_value_MUX_uxn_opcodes_h_l1222_c7_7388_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1222_c7_7388_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1222_c7_7388_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1222_c7_7388_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1222_c7_7388]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_7388_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_7388_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_7388_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_7388_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1222_c7_7388]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_7388_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_7388_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_7388_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_7388_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1222_c7_7388]
signal n16_MUX_uxn_opcodes_h_l1222_c7_7388_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1222_c7_7388_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1222_c7_7388_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1222_c7_7388_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1226_c11_426a]
signal BIN_OP_EQ_uxn_opcodes_h_l1226_c11_426a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1226_c11_426a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1226_c11_426a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1226_c7_3849]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3849_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3849_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3849_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3849_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1226_c7_3849]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3849_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3849_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3849_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3849_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1226_c7_3849]
signal result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3849_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3849_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3849_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3849_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1226_c7_3849]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3849_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3849_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3849_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3849_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1226_c7_3849]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3849_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3849_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3849_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3849_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1226_c7_3849]
signal n16_MUX_uxn_opcodes_h_l1226_c7_3849_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1226_c7_3849_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1226_c7_3849_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1226_c7_3849_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1227_c3_ed33]
signal BIN_OP_OR_uxn_opcodes_h_l1227_c3_ed33_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1227_c3_ed33_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1227_c3_ed33_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1228_c30_5983]
signal sp_relative_shift_uxn_opcodes_h_l1228_c30_5983_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1228_c30_5983_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1228_c30_5983_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1228_c30_5983_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1231_c21_139e]
signal BIN_OP_EQ_uxn_opcodes_h_l1231_c21_139e_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1231_c21_139e_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1231_c21_139e_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1231_c21_02aa]
signal MUX_uxn_opcodes_h_l1231_c21_02aa_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1231_c21_02aa_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1231_c21_02aa_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1231_c21_02aa_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_c53d
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_c53d_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_c53d_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_pc_updated := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.is_ram_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ea5d
BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ea5d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ea5d_left,
BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ea5d_right,
BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ea5d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_26d6
result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_26d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_26d6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_26d6
result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_26d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1197_c2_26d6
result_u8_value_MUX_uxn_opcodes_h_l1197_c2_26d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1197_c2_26d6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_26d6
result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_26d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_26d6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_26d6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_26d6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_26d6
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_26d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_26d6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_26d6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_26d6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_26d6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_26d6
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_26d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_26d6_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_26d6
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_26d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_26d6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output);

-- t16_MUX_uxn_opcodes_h_l1197_c2_26d6
t16_MUX_uxn_opcodes_h_l1197_c2_26d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1197_c2_26d6_cond,
t16_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue,
t16_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse,
t16_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output);

-- n16_MUX_uxn_opcodes_h_l1197_c2_26d6
n16_MUX_uxn_opcodes_h_l1197_c2_26d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1197_c2_26d6_cond,
n16_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue,
n16_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse,
n16_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6a05
BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6a05 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6a05_left,
BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6a05_right,
BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6a05_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_75c2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_75c2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_75c2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_75c2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_75c2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_75c2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_75c2
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_75c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_75c2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_75c2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_75c2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_75c2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1210_c7_75c2
result_u8_value_MUX_uxn_opcodes_h_l1210_c7_75c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1210_c7_75c2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1210_c7_75c2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1210_c7_75c2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1210_c7_75c2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_75c2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_75c2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_75c2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_75c2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_75c2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_75c2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_75c2
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_75c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_75c2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_75c2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_75c2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_75c2_return_output);

-- t16_MUX_uxn_opcodes_h_l1210_c7_75c2
t16_MUX_uxn_opcodes_h_l1210_c7_75c2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1210_c7_75c2_cond,
t16_MUX_uxn_opcodes_h_l1210_c7_75c2_iftrue,
t16_MUX_uxn_opcodes_h_l1210_c7_75c2_iffalse,
t16_MUX_uxn_opcodes_h_l1210_c7_75c2_return_output);

-- n16_MUX_uxn_opcodes_h_l1210_c7_75c2
n16_MUX_uxn_opcodes_h_l1210_c7_75c2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1210_c7_75c2_cond,
n16_MUX_uxn_opcodes_h_l1210_c7_75c2_iftrue,
n16_MUX_uxn_opcodes_h_l1210_c7_75c2_iffalse,
n16_MUX_uxn_opcodes_h_l1210_c7_75c2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1213_c11_cc85
BIN_OP_EQ_uxn_opcodes_h_l1213_c11_cc85 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1213_c11_cc85_left,
BIN_OP_EQ_uxn_opcodes_h_l1213_c11_cc85_right,
BIN_OP_EQ_uxn_opcodes_h_l1213_c11_cc85_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d794
result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d794 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d794_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d794_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d794_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d794_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d794
result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d794 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d794_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d794_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d794_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d794_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d794
result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d794 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d794_cond,
result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d794_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d794_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d794_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d794
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d794 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d794_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d794_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d794_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d794_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d794
result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d794 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d794_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d794_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d794_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d794_return_output);

-- t16_MUX_uxn_opcodes_h_l1213_c7_d794
t16_MUX_uxn_opcodes_h_l1213_c7_d794 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1213_c7_d794_cond,
t16_MUX_uxn_opcodes_h_l1213_c7_d794_iftrue,
t16_MUX_uxn_opcodes_h_l1213_c7_d794_iffalse,
t16_MUX_uxn_opcodes_h_l1213_c7_d794_return_output);

-- n16_MUX_uxn_opcodes_h_l1213_c7_d794
n16_MUX_uxn_opcodes_h_l1213_c7_d794 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1213_c7_d794_cond,
n16_MUX_uxn_opcodes_h_l1213_c7_d794_iftrue,
n16_MUX_uxn_opcodes_h_l1213_c7_d794_iffalse,
n16_MUX_uxn_opcodes_h_l1213_c7_d794_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1218_c11_150a
BIN_OP_EQ_uxn_opcodes_h_l1218_c11_150a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1218_c11_150a_left,
BIN_OP_EQ_uxn_opcodes_h_l1218_c11_150a_right,
BIN_OP_EQ_uxn_opcodes_h_l1218_c11_150a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d48e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d48e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d48e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d48e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d48e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d48e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d48e
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d48e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d48e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d48e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d48e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d48e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d48e
result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d48e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d48e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d48e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d48e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d48e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d48e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d48e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d48e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d48e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d48e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d48e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d48e
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d48e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d48e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d48e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d48e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d48e_return_output);

-- t16_MUX_uxn_opcodes_h_l1218_c7_d48e
t16_MUX_uxn_opcodes_h_l1218_c7_d48e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1218_c7_d48e_cond,
t16_MUX_uxn_opcodes_h_l1218_c7_d48e_iftrue,
t16_MUX_uxn_opcodes_h_l1218_c7_d48e_iffalse,
t16_MUX_uxn_opcodes_h_l1218_c7_d48e_return_output);

-- n16_MUX_uxn_opcodes_h_l1218_c7_d48e
n16_MUX_uxn_opcodes_h_l1218_c7_d48e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1218_c7_d48e_cond,
n16_MUX_uxn_opcodes_h_l1218_c7_d48e_iftrue,
n16_MUX_uxn_opcodes_h_l1218_c7_d48e_iffalse,
n16_MUX_uxn_opcodes_h_l1218_c7_d48e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1219_c3_7e1f
BIN_OP_OR_uxn_opcodes_h_l1219_c3_7e1f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1219_c3_7e1f_left,
BIN_OP_OR_uxn_opcodes_h_l1219_c3_7e1f_right,
BIN_OP_OR_uxn_opcodes_h_l1219_c3_7e1f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1222_c11_10d2
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_10d2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_10d2_left,
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_10d2_right,
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_10d2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_7388
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_7388 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_7388_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_7388_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_7388_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_7388_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_7388
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_7388 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_7388_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_7388_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_7388_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_7388_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1222_c7_7388
result_u8_value_MUX_uxn_opcodes_h_l1222_c7_7388 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1222_c7_7388_cond,
result_u8_value_MUX_uxn_opcodes_h_l1222_c7_7388_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1222_c7_7388_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1222_c7_7388_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_7388
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_7388 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_7388_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_7388_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_7388_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_7388_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_7388
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_7388 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_7388_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_7388_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_7388_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_7388_return_output);

-- n16_MUX_uxn_opcodes_h_l1222_c7_7388
n16_MUX_uxn_opcodes_h_l1222_c7_7388 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1222_c7_7388_cond,
n16_MUX_uxn_opcodes_h_l1222_c7_7388_iftrue,
n16_MUX_uxn_opcodes_h_l1222_c7_7388_iffalse,
n16_MUX_uxn_opcodes_h_l1222_c7_7388_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1226_c11_426a
BIN_OP_EQ_uxn_opcodes_h_l1226_c11_426a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1226_c11_426a_left,
BIN_OP_EQ_uxn_opcodes_h_l1226_c11_426a_right,
BIN_OP_EQ_uxn_opcodes_h_l1226_c11_426a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3849
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3849 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3849_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3849_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3849_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3849_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3849
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3849 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3849_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3849_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3849_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3849_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3849
result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3849 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3849_cond,
result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3849_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3849_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3849_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3849
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3849 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3849_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3849_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3849_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3849_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3849
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3849 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3849_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3849_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3849_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3849_return_output);

-- n16_MUX_uxn_opcodes_h_l1226_c7_3849
n16_MUX_uxn_opcodes_h_l1226_c7_3849 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1226_c7_3849_cond,
n16_MUX_uxn_opcodes_h_l1226_c7_3849_iftrue,
n16_MUX_uxn_opcodes_h_l1226_c7_3849_iffalse,
n16_MUX_uxn_opcodes_h_l1226_c7_3849_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1227_c3_ed33
BIN_OP_OR_uxn_opcodes_h_l1227_c3_ed33 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1227_c3_ed33_left,
BIN_OP_OR_uxn_opcodes_h_l1227_c3_ed33_right,
BIN_OP_OR_uxn_opcodes_h_l1227_c3_ed33_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1228_c30_5983
sp_relative_shift_uxn_opcodes_h_l1228_c30_5983 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1228_c30_5983_ins,
sp_relative_shift_uxn_opcodes_h_l1228_c30_5983_x,
sp_relative_shift_uxn_opcodes_h_l1228_c30_5983_y,
sp_relative_shift_uxn_opcodes_h_l1228_c30_5983_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1231_c21_139e
BIN_OP_EQ_uxn_opcodes_h_l1231_c21_139e : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1231_c21_139e_left,
BIN_OP_EQ_uxn_opcodes_h_l1231_c21_139e_right,
BIN_OP_EQ_uxn_opcodes_h_l1231_c21_139e_return_output);

-- MUX_uxn_opcodes_h_l1231_c21_02aa
MUX_uxn_opcodes_h_l1231_c21_02aa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1231_c21_02aa_cond,
MUX_uxn_opcodes_h_l1231_c21_02aa_iftrue,
MUX_uxn_opcodes_h_l1231_c21_02aa_iffalse,
MUX_uxn_opcodes_h_l1231_c21_02aa_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_c53d
CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_c53d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_c53d_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_c53d_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ea5d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output,
 t16_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output,
 n16_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6a05_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_75c2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_75c2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1210_c7_75c2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_75c2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_75c2_return_output,
 t16_MUX_uxn_opcodes_h_l1210_c7_75c2_return_output,
 n16_MUX_uxn_opcodes_h_l1210_c7_75c2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1213_c11_cc85_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d794_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d794_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d794_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d794_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d794_return_output,
 t16_MUX_uxn_opcodes_h_l1213_c7_d794_return_output,
 n16_MUX_uxn_opcodes_h_l1213_c7_d794_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1218_c11_150a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d48e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d48e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d48e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d48e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d48e_return_output,
 t16_MUX_uxn_opcodes_h_l1218_c7_d48e_return_output,
 n16_MUX_uxn_opcodes_h_l1218_c7_d48e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1219_c3_7e1f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1222_c11_10d2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_7388_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_7388_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1222_c7_7388_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_7388_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_7388_return_output,
 n16_MUX_uxn_opcodes_h_l1222_c7_7388_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1226_c11_426a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3849_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3849_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3849_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3849_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3849_return_output,
 n16_MUX_uxn_opcodes_h_l1226_c7_3849_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1227_c3_ed33_return_output,
 sp_relative_shift_uxn_opcodes_h_l1228_c30_5983_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1231_c21_139e_return_output,
 MUX_uxn_opcodes_h_l1231_c21_02aa_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_c53d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ea5d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ea5d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ea5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1197_c2_26d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_26d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1197_c2_26d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_75c2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_26d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1197_c2_26d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1202_c3_22be : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_75c2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_26d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_75c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_26d6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1207_c3_e6b9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_75c2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_26d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1197_c2_26d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_26d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_75c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_26d6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1210_c7_75c2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1197_c2_26d6_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1210_c7_75c2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c2_26d6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6a05_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6a05_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6a05_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_75c2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_75c2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d794_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_75c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_75c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_75c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d794_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_75c2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_75c2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_75c2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d794_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_75c2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_75c2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1211_c3_1ba8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_75c2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d794_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_75c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_75c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_75c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d794_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_75c2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1210_c7_75c2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1210_c7_75c2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1213_c7_d794_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1210_c7_75c2_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1210_c7_75c2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1210_c7_75c2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1213_c7_d794_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1210_c7_75c2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_cc85_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_cc85_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_cc85_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d794_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d794_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d48e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d794_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d794_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d794_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d48e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d794_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d794_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d794_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d48e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d794_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d794_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1216_c3_30a5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d794_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d48e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d794_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d794_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d794_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d48e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d794_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1213_c7_d794_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1213_c7_d794_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1218_c7_d48e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1213_c7_d794_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1213_c7_d794_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1213_c7_d794_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1218_c7_d48e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1213_c7_d794_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_150a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_150a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_150a_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d48e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d48e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_7388_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d48e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d48e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d48e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_7388_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d48e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d48e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d48e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_7388_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d48e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d48e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1220_c3_a078 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d48e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_7388_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d48e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d48e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d48e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_7388_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d48e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1218_c7_d48e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1218_c7_d48e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1218_c7_d48e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1218_c7_d48e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1218_c7_d48e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1222_c7_7388_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1218_c7_d48e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_7e1f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_7e1f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_7e1f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_10d2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_10d2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_10d2_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_7388_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_7388_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3849_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_7388_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_7388_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_7388_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3849_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_7388_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_7388_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_7388_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3849_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_7388_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_7388_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_7388_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3849_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_7388_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_7388_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_7388_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3849_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_7388_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1222_c7_7388_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1222_c7_7388_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1226_c7_3849_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1222_c7_7388_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_426a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_426a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_426a_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3849_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3849_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3849_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3849_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3849_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3849_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3849_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3849_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3849_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3849_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1230_c3_27c0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3849_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3849_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3849_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3849_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3849_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1226_c7_3849_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1226_c7_3849_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1226_c7_3849_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_ed33_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_ed33_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_ed33_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_5983_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_5983_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_5983_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_5983_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1231_c21_02aa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_139e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_139e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_139e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1231_c21_02aa_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1231_c21_02aa_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1231_c21_02aa_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1213_l1210_l1197_l1226_l1222_l1218_DUPLICATE_1eff_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1213_l1210_l1226_l1222_l1218_DUPLICATE_8335_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1213_l1210_l1226_l1222_l1218_DUPLICATE_fb6e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1213_l1210_l1226_l1222_l1218_DUPLICATE_b980_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1227_l1219_l1214_l1223_DUPLICATE_1c2f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_c53d_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_c53d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1222_l1226_DUPLICATE_5b6c_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l1193_l1235_DUPLICATE_ea99_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_5983_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3849_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1202_c3_22be := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1202_c3_22be;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_cc85_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1220_c3_a078 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d48e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1220_c3_a078;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3849_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_426a_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_10d2_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1207_c3_e6b9 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1207_c3_e6b9;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6a05_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1231_c21_02aa_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1216_c3_30a5 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d794_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1216_c3_30a5;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ea5d_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_5983_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_150a_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1211_c3_1ba8 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_75c2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1211_c3_1ba8;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1231_c21_02aa_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1230_c3_27c0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3849_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1230_c3_27c0;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue := to_unsigned(0, 1);

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

     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_5983_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_ed33_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1210_c7_75c2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1213_c7_d794_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1218_c7_d48e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1226_c7_3849_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ea5d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6a05_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_cc85_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_150a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_10d2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_426a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_139e_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_7e1f_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1210_c7_75c2_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1218_c7_d48e_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1226_c11_426a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1226_c11_426a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_426a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1226_c11_426a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_426a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_426a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1226_c11_426a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1213_l1210_l1226_l1222_l1218_DUPLICATE_b980 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1213_l1210_l1226_l1222_l1218_DUPLICATE_b980_return_output := result.is_opc_done;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1197_c2_26d6] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1197_c2_26d6_return_output := result.is_pc_updated;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1213_l1210_l1226_l1222_l1218_DUPLICATE_8335 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1213_l1210_l1226_l1222_l1218_DUPLICATE_8335_return_output := result.sp_relative_shift;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1197_c2_26d6] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1197_c2_26d6_return_output := result.is_stack_index_flipped;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1197_c2_26d6] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1197_c2_26d6_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1213_l1210_l1197_l1226_l1222_l1218_DUPLICATE_1eff LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1213_l1210_l1197_l1226_l1222_l1218_DUPLICATE_1eff_return_output := result.u8_value;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1197_c2_26d6] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1197_c2_26d6_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1218_c11_150a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1218_c11_150a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_150a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1218_c11_150a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_150a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_150a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1218_c11_150a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1213_l1210_l1226_l1222_l1218_DUPLICATE_fb6e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1213_l1210_l1226_l1222_l1218_DUPLICATE_fb6e_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1210_c11_6a05] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6a05_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6a05_left;
     BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6a05_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6a05_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6a05_return_output := BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6a05_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1197_c6_ea5d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ea5d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ea5d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ea5d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ea5d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ea5d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ea5d_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1227_l1219_l1214_l1223_DUPLICATE_1c2f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1227_l1219_l1214_l1223_DUPLICATE_1c2f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- sp_relative_shift[uxn_opcodes_h_l1228_c30_5983] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1228_c30_5983_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_5983_ins;
     sp_relative_shift_uxn_opcodes_h_l1228_c30_5983_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_5983_x;
     sp_relative_shift_uxn_opcodes_h_l1228_c30_5983_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_5983_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_5983_return_output := sp_relative_shift_uxn_opcodes_h_l1228_c30_5983_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1222_l1226_DUPLICATE_5b6c LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1222_l1226_DUPLICATE_5b6c_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1222_c11_10d2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1222_c11_10d2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_10d2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1222_c11_10d2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_10d2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_10d2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1222_c11_10d2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1213_c11_cc85] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1213_c11_cc85_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_cc85_left;
     BIN_OP_EQ_uxn_opcodes_h_l1213_c11_cc85_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_cc85_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_cc85_return_output := BIN_OP_EQ_uxn_opcodes_h_l1213_c11_cc85_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1197_c2_26d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ea5d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_26d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ea5d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_26d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ea5d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ea5d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_26d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ea5d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_26d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ea5d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ea5d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_26d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ea5d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_26d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ea5d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_26d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ea5d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1197_c2_26d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ea5d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1210_c7_75c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6a05_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_75c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6a05_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_75c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6a05_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_75c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6a05_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_75c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6a05_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_75c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6a05_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1210_c7_75c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6a05_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1213_c7_d794_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_cc85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d794_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_cc85_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d794_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_cc85_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d794_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_cc85_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d794_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_cc85_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d794_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_cc85_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1213_c7_d794_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_cc85_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1218_c7_d48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_150a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_150a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_150a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_150a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_150a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_150a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1218_c7_d48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_150a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1222_c7_7388_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_10d2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_7388_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_10d2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_7388_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_10d2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_7388_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_10d2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_7388_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_10d2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_7388_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_10d2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1226_c7_3849_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_426a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3849_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_426a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3849_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_426a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3849_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_426a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3849_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_426a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3849_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_426a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_7e1f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1227_l1219_l1214_l1223_DUPLICATE_1c2f_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_ed33_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1227_l1219_l1214_l1223_DUPLICATE_1c2f_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_c53d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1227_l1219_l1214_l1223_DUPLICATE_1c2f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_75c2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1213_l1210_l1226_l1222_l1218_DUPLICATE_8335_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d794_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1213_l1210_l1226_l1222_l1218_DUPLICATE_8335_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d48e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1213_l1210_l1226_l1222_l1218_DUPLICATE_8335_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_7388_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1213_l1210_l1226_l1222_l1218_DUPLICATE_8335_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3849_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1213_l1210_l1226_l1222_l1218_DUPLICATE_8335_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_75c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1213_l1210_l1226_l1222_l1218_DUPLICATE_b980_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d794_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1213_l1210_l1226_l1222_l1218_DUPLICATE_b980_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d48e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1213_l1210_l1226_l1222_l1218_DUPLICATE_b980_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_7388_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1213_l1210_l1226_l1222_l1218_DUPLICATE_b980_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3849_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1213_l1210_l1226_l1222_l1218_DUPLICATE_b980_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_75c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1213_l1210_l1226_l1222_l1218_DUPLICATE_fb6e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d794_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1213_l1210_l1226_l1222_l1218_DUPLICATE_fb6e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d48e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1213_l1210_l1226_l1222_l1218_DUPLICATE_fb6e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_7388_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1213_l1210_l1226_l1222_l1218_DUPLICATE_fb6e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3849_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1213_l1210_l1226_l1222_l1218_DUPLICATE_fb6e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_7388_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1222_l1226_DUPLICATE_5b6c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3849_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1222_l1226_DUPLICATE_5b6c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1213_l1210_l1197_l1226_l1222_l1218_DUPLICATE_1eff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_75c2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1213_l1210_l1197_l1226_l1222_l1218_DUPLICATE_1eff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d794_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1213_l1210_l1197_l1226_l1222_l1218_DUPLICATE_1eff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d48e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1213_l1210_l1197_l1226_l1222_l1218_DUPLICATE_1eff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_7388_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1213_l1210_l1197_l1226_l1222_l1218_DUPLICATE_1eff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3849_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1213_l1210_l1197_l1226_l1222_l1218_DUPLICATE_1eff_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1197_c2_26d6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1197_c2_26d6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1197_c2_26d6_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1197_c2_26d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3849_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_5983_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1219_c3_7e1f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1219_c3_7e1f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_7e1f_left;
     BIN_OP_OR_uxn_opcodes_h_l1219_c3_7e1f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_7e1f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_7e1f_return_output := BIN_OP_OR_uxn_opcodes_h_l1219_c3_7e1f_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_c53d LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_c53d_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_c53d_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_c53d_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_c53d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1227_c3_ed33] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1227_c3_ed33_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_ed33_left;
     BIN_OP_OR_uxn_opcodes_h_l1227_c3_ed33_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_ed33_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_ed33_return_output := BIN_OP_OR_uxn_opcodes_h_l1227_c3_ed33_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1197_c2_26d6] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_26d6_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_26d6_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1197_c2_26d6] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1197_c2_26d6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_26d6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_26d6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1226_c7_3849] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3849_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3849_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3849_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3849_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3849_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3849_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3849_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3849_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1226_c7_3849] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3849_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3849_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3849_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3849_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3849_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3849_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3849_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3849_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1226_c7_3849] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3849_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3849_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3849_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3849_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3849_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3849_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3849_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3849_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1226_c7_3849] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3849_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3849_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3849_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3849_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3849_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3849_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3849_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3849_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1197_c2_26d6] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1218_c7_d48e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_7e1f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_139e_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_ed33_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1226_c7_3849_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_ed33_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1222_c7_7388_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_c53d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1213_c7_d794_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_c53d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_7388_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3849_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_7388_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3849_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_7388_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3849_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_7388_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3849_return_output;
     -- n16_MUX[uxn_opcodes_h_l1226_c7_3849] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1226_c7_3849_cond <= VAR_n16_MUX_uxn_opcodes_h_l1226_c7_3849_cond;
     n16_MUX_uxn_opcodes_h_l1226_c7_3849_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1226_c7_3849_iftrue;
     n16_MUX_uxn_opcodes_h_l1226_c7_3849_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1226_c7_3849_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1226_c7_3849_return_output := n16_MUX_uxn_opcodes_h_l1226_c7_3849_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1222_c7_7388] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_7388_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_7388_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_7388_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_7388_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_7388_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_7388_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_7388_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_7388_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1222_c7_7388] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_7388_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_7388_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_7388_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_7388_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_7388_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_7388_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_7388_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_7388_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1222_c7_7388] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_7388_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_7388_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_7388_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_7388_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_7388_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_7388_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_7388_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_7388_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1222_c7_7388] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_7388_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_7388_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_7388_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_7388_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_7388_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_7388_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_7388_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_7388_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1231_c21_139e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1231_c21_139e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_139e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1231_c21_139e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_139e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_139e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1231_c21_139e_return_output;

     -- t16_MUX[uxn_opcodes_h_l1218_c7_d48e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1218_c7_d48e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1218_c7_d48e_cond;
     t16_MUX_uxn_opcodes_h_l1218_c7_d48e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1218_c7_d48e_iftrue;
     t16_MUX_uxn_opcodes_h_l1218_c7_d48e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1218_c7_d48e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1218_c7_d48e_return_output := t16_MUX_uxn_opcodes_h_l1218_c7_d48e_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1231_c21_02aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_139e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1222_c7_7388_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1226_c7_3849_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d48e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_7388_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d48e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_7388_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d48e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_7388_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d48e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_7388_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1213_c7_d794_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1218_c7_d48e_return_output;
     -- MUX[uxn_opcodes_h_l1231_c21_02aa] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1231_c21_02aa_cond <= VAR_MUX_uxn_opcodes_h_l1231_c21_02aa_cond;
     MUX_uxn_opcodes_h_l1231_c21_02aa_iftrue <= VAR_MUX_uxn_opcodes_h_l1231_c21_02aa_iftrue;
     MUX_uxn_opcodes_h_l1231_c21_02aa_iffalse <= VAR_MUX_uxn_opcodes_h_l1231_c21_02aa_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1231_c21_02aa_return_output := MUX_uxn_opcodes_h_l1231_c21_02aa_return_output;

     -- n16_MUX[uxn_opcodes_h_l1222_c7_7388] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1222_c7_7388_cond <= VAR_n16_MUX_uxn_opcodes_h_l1222_c7_7388_cond;
     n16_MUX_uxn_opcodes_h_l1222_c7_7388_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1222_c7_7388_iftrue;
     n16_MUX_uxn_opcodes_h_l1222_c7_7388_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1222_c7_7388_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1222_c7_7388_return_output := n16_MUX_uxn_opcodes_h_l1222_c7_7388_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1218_c7_d48e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d48e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d48e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d48e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d48e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d48e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d48e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d48e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d48e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1218_c7_d48e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d48e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d48e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d48e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d48e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d48e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d48e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d48e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d48e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1218_c7_d48e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d48e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d48e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d48e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d48e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d48e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d48e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d48e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d48e_return_output;

     -- t16_MUX[uxn_opcodes_h_l1213_c7_d794] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1213_c7_d794_cond <= VAR_t16_MUX_uxn_opcodes_h_l1213_c7_d794_cond;
     t16_MUX_uxn_opcodes_h_l1213_c7_d794_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1213_c7_d794_iftrue;
     t16_MUX_uxn_opcodes_h_l1213_c7_d794_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1213_c7_d794_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1213_c7_d794_return_output := t16_MUX_uxn_opcodes_h_l1213_c7_d794_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1218_c7_d48e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d48e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d48e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d48e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d48e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d48e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d48e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d48e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d48e_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3849_iftrue := VAR_MUX_uxn_opcodes_h_l1231_c21_02aa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1218_c7_d48e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1222_c7_7388_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d794_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d48e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d794_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d48e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d794_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d48e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d794_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d48e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1210_c7_75c2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1213_c7_d794_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1213_c7_d794] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d794_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d794_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d794_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d794_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d794_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d794_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d794_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d794_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1226_c7_3849] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3849_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3849_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3849_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3849_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3849_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3849_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3849_return_output := result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3849_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1213_c7_d794] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d794_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d794_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d794_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d794_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d794_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d794_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d794_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d794_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1213_c7_d794] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d794_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d794_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d794_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d794_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d794_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d794_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d794_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d794_return_output;

     -- n16_MUX[uxn_opcodes_h_l1218_c7_d48e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1218_c7_d48e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1218_c7_d48e_cond;
     n16_MUX_uxn_opcodes_h_l1218_c7_d48e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1218_c7_d48e_iftrue;
     n16_MUX_uxn_opcodes_h_l1218_c7_d48e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1218_c7_d48e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1218_c7_d48e_return_output := n16_MUX_uxn_opcodes_h_l1218_c7_d48e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1213_c7_d794] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d794_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d794_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d794_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d794_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d794_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d794_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d794_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d794_return_output;

     -- t16_MUX[uxn_opcodes_h_l1210_c7_75c2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1210_c7_75c2_cond <= VAR_t16_MUX_uxn_opcodes_h_l1210_c7_75c2_cond;
     t16_MUX_uxn_opcodes_h_l1210_c7_75c2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1210_c7_75c2_iftrue;
     t16_MUX_uxn_opcodes_h_l1210_c7_75c2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1210_c7_75c2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1210_c7_75c2_return_output := t16_MUX_uxn_opcodes_h_l1210_c7_75c2_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1213_c7_d794_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1218_c7_d48e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_75c2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d794_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_75c2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d794_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_75c2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d794_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_75c2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d794_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_7388_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3849_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1210_c7_75c2_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1210_c7_75c2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_75c2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_75c2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_75c2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_75c2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_75c2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_75c2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_75c2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_75c2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1210_c7_75c2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_75c2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_75c2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_75c2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_75c2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_75c2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_75c2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_75c2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_75c2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1222_c7_7388] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1222_c7_7388_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_7388_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1222_c7_7388_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_7388_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1222_c7_7388_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_7388_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_7388_return_output := result_u8_value_MUX_uxn_opcodes_h_l1222_c7_7388_return_output;

     -- t16_MUX[uxn_opcodes_h_l1197_c2_26d6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1197_c2_26d6_cond <= VAR_t16_MUX_uxn_opcodes_h_l1197_c2_26d6_cond;
     t16_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue;
     t16_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output := t16_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output;

     -- n16_MUX[uxn_opcodes_h_l1213_c7_d794] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1213_c7_d794_cond <= VAR_n16_MUX_uxn_opcodes_h_l1213_c7_d794_cond;
     n16_MUX_uxn_opcodes_h_l1213_c7_d794_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1213_c7_d794_iftrue;
     n16_MUX_uxn_opcodes_h_l1213_c7_d794_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1213_c7_d794_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1213_c7_d794_return_output := n16_MUX_uxn_opcodes_h_l1213_c7_d794_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1210_c7_75c2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_75c2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_75c2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_75c2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_75c2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_75c2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_75c2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_75c2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_75c2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1210_c7_75c2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_75c2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_75c2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_75c2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_75c2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_75c2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_75c2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_75c2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_75c2_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1210_c7_75c2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1213_c7_d794_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_75c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_75c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_75c2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_75c2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d48e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_7388_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1197_c2_26d6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_26d6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_26d6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1197_c2_26d6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_26d6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_26d6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1197_c2_26d6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_26d6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_26d6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1218_c7_d48e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d48e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d48e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d48e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d48e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d48e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d48e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d48e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d48e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1197_c2_26d6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_26d6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_26d6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output;

     -- n16_MUX[uxn_opcodes_h_l1210_c7_75c2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1210_c7_75c2_cond <= VAR_n16_MUX_uxn_opcodes_h_l1210_c7_75c2_cond;
     n16_MUX_uxn_opcodes_h_l1210_c7_75c2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1210_c7_75c2_iftrue;
     n16_MUX_uxn_opcodes_h_l1210_c7_75c2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1210_c7_75c2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1210_c7_75c2_return_output := n16_MUX_uxn_opcodes_h_l1210_c7_75c2_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1210_c7_75c2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d794_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d48e_return_output;
     -- n16_MUX[uxn_opcodes_h_l1197_c2_26d6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1197_c2_26d6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1197_c2_26d6_cond;
     n16_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue;
     n16_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output := n16_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1213_c7_d794] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d794_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d794_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d794_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d794_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d794_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d794_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d794_return_output := result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d794_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_75c2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d794_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1210_c7_75c2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1210_c7_75c2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_75c2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1210_c7_75c2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_75c2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1210_c7_75c2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_75c2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_75c2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1210_c7_75c2_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_75c2_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1197_c2_26d6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1197_c2_26d6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_26d6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_26d6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_26d6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l1193_l1235_DUPLICATE_ea99 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l1193_l1235_DUPLICATE_ea99_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_26d6_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l1193_l1235_DUPLICATE_ea99_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l1193_l1235_DUPLICATE_ea99_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
