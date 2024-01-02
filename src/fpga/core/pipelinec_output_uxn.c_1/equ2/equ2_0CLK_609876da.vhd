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
-- BIN_OP_EQ[uxn_opcodes_h_l1197_c6_fa78]
signal BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fa78_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fa78_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fa78_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1197_c2_8b41]
signal n16_MUX_uxn_opcodes_h_l1197_c2_8b41_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1197_c2_8b41]
signal t16_MUX_uxn_opcodes_h_l1197_c2_8b41_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1197_c2_8b41]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_8b41_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1197_c2_8b41]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1197_c2_8b41]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_8b41_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1197_c2_8b41]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_8b41_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1197_c2_8b41]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_8b41_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1197_c2_8b41]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_8b41_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1197_c2_8b41]
signal result_u8_value_MUX_uxn_opcodes_h_l1197_c2_8b41_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1197_c2_8b41]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_8b41_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1197_c2_8b41]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1210_c11_7b6e]
signal BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7b6e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7b6e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7b6e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1210_c7_f9bb]
signal n16_MUX_uxn_opcodes_h_l1210_c7_f9bb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1210_c7_f9bb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1210_c7_f9bb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1210_c7_f9bb_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1210_c7_f9bb]
signal t16_MUX_uxn_opcodes_h_l1210_c7_f9bb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1210_c7_f9bb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1210_c7_f9bb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1210_c7_f9bb_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1210_c7_f9bb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_f9bb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_f9bb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_f9bb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_f9bb_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1210_c7_f9bb]
signal result_u8_value_MUX_uxn_opcodes_h_l1210_c7_f9bb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1210_c7_f9bb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1210_c7_f9bb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1210_c7_f9bb_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1210_c7_f9bb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_f9bb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_f9bb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_f9bb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_f9bb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1210_c7_f9bb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_f9bb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_f9bb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_f9bb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_f9bb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1210_c7_f9bb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_f9bb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_f9bb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_f9bb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_f9bb_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1213_c11_4ed2]
signal BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4ed2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4ed2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4ed2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1213_c7_4852]
signal n16_MUX_uxn_opcodes_h_l1213_c7_4852_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1213_c7_4852_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1213_c7_4852_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1213_c7_4852_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1213_c7_4852]
signal t16_MUX_uxn_opcodes_h_l1213_c7_4852_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1213_c7_4852_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1213_c7_4852_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1213_c7_4852_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1213_c7_4852]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4852_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4852_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4852_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4852_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1213_c7_4852]
signal result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4852_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4852_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4852_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4852_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1213_c7_4852]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4852_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4852_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4852_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4852_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1213_c7_4852]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4852_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4852_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4852_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4852_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1213_c7_4852]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4852_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4852_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4852_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4852_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1218_c11_0fe3]
signal BIN_OP_EQ_uxn_opcodes_h_l1218_c11_0fe3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1218_c11_0fe3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1218_c11_0fe3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1218_c7_5b42]
signal n16_MUX_uxn_opcodes_h_l1218_c7_5b42_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1218_c7_5b42_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1218_c7_5b42_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1218_c7_5b42_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1218_c7_5b42]
signal t16_MUX_uxn_opcodes_h_l1218_c7_5b42_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1218_c7_5b42_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1218_c7_5b42_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1218_c7_5b42_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1218_c7_5b42]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_5b42_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_5b42_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_5b42_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_5b42_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1218_c7_5b42]
signal result_u8_value_MUX_uxn_opcodes_h_l1218_c7_5b42_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1218_c7_5b42_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1218_c7_5b42_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1218_c7_5b42_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1218_c7_5b42]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_5b42_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_5b42_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_5b42_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_5b42_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1218_c7_5b42]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_5b42_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_5b42_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_5b42_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_5b42_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1218_c7_5b42]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_5b42_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_5b42_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_5b42_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_5b42_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1219_c3_ea0e]
signal BIN_OP_OR_uxn_opcodes_h_l1219_c3_ea0e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1219_c3_ea0e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1219_c3_ea0e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1222_c11_e88f]
signal BIN_OP_EQ_uxn_opcodes_h_l1222_c11_e88f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1222_c11_e88f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1222_c11_e88f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1222_c7_cf45]
signal n16_MUX_uxn_opcodes_h_l1222_c7_cf45_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1222_c7_cf45_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1222_c7_cf45_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1222_c7_cf45_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1222_c7_cf45]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_cf45_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_cf45_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_cf45_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_cf45_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1222_c7_cf45]
signal result_u8_value_MUX_uxn_opcodes_h_l1222_c7_cf45_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1222_c7_cf45_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1222_c7_cf45_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1222_c7_cf45_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1222_c7_cf45]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_cf45_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_cf45_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_cf45_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_cf45_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1222_c7_cf45]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_cf45_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_cf45_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_cf45_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_cf45_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1222_c7_cf45]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_cf45_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_cf45_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_cf45_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_cf45_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1226_c11_82fb]
signal BIN_OP_EQ_uxn_opcodes_h_l1226_c11_82fb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1226_c11_82fb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1226_c11_82fb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1226_c7_8cb5]
signal n16_MUX_uxn_opcodes_h_l1226_c7_8cb5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1226_c7_8cb5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1226_c7_8cb5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1226_c7_8cb5_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1226_c7_8cb5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_8cb5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_8cb5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_8cb5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_8cb5_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1226_c7_8cb5]
signal result_u8_value_MUX_uxn_opcodes_h_l1226_c7_8cb5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1226_c7_8cb5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1226_c7_8cb5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1226_c7_8cb5_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1226_c7_8cb5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_8cb5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_8cb5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_8cb5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_8cb5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1226_c7_8cb5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_8cb5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_8cb5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_8cb5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_8cb5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1226_c7_8cb5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_8cb5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_8cb5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_8cb5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_8cb5_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1227_c3_bd62]
signal BIN_OP_OR_uxn_opcodes_h_l1227_c3_bd62_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1227_c3_bd62_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1227_c3_bd62_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1228_c30_94eb]
signal sp_relative_shift_uxn_opcodes_h_l1228_c30_94eb_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1228_c30_94eb_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1228_c30_94eb_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1228_c30_94eb_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1231_c21_aa64]
signal BIN_OP_EQ_uxn_opcodes_h_l1231_c21_aa64_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1231_c21_aa64_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1231_c21_aa64_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1231_c21_f930]
signal MUX_uxn_opcodes_h_l1231_c21_f930_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1231_c21_f930_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1231_c21_f930_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1231_c21_f930_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_f545
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_f545_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_f545_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_ee25( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.u8_value := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_vram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fa78
BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fa78 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fa78_left,
BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fa78_right,
BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fa78_return_output);

-- n16_MUX_uxn_opcodes_h_l1197_c2_8b41
n16_MUX_uxn_opcodes_h_l1197_c2_8b41 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1197_c2_8b41_cond,
n16_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue,
n16_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse,
n16_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output);

-- t16_MUX_uxn_opcodes_h_l1197_c2_8b41
t16_MUX_uxn_opcodes_h_l1197_c2_8b41 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1197_c2_8b41_cond,
t16_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue,
t16_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse,
t16_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_8b41
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_8b41 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_8b41_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_8b41
result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_8b41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_8b41
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_8b41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_8b41_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_8b41
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_8b41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_8b41_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_8b41
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_8b41 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_8b41_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_8b41
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_8b41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_8b41_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1197_c2_8b41
result_u8_value_MUX_uxn_opcodes_h_l1197_c2_8b41 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1197_c2_8b41_cond,
result_u8_value_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_8b41
result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_8b41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_8b41_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_8b41
result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_8b41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7b6e
BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7b6e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7b6e_left,
BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7b6e_right,
BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7b6e_return_output);

-- n16_MUX_uxn_opcodes_h_l1210_c7_f9bb
n16_MUX_uxn_opcodes_h_l1210_c7_f9bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1210_c7_f9bb_cond,
n16_MUX_uxn_opcodes_h_l1210_c7_f9bb_iftrue,
n16_MUX_uxn_opcodes_h_l1210_c7_f9bb_iffalse,
n16_MUX_uxn_opcodes_h_l1210_c7_f9bb_return_output);

-- t16_MUX_uxn_opcodes_h_l1210_c7_f9bb
t16_MUX_uxn_opcodes_h_l1210_c7_f9bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1210_c7_f9bb_cond,
t16_MUX_uxn_opcodes_h_l1210_c7_f9bb_iftrue,
t16_MUX_uxn_opcodes_h_l1210_c7_f9bb_iffalse,
t16_MUX_uxn_opcodes_h_l1210_c7_f9bb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_f9bb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_f9bb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_f9bb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_f9bb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_f9bb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_f9bb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1210_c7_f9bb
result_u8_value_MUX_uxn_opcodes_h_l1210_c7_f9bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1210_c7_f9bb_cond,
result_u8_value_MUX_uxn_opcodes_h_l1210_c7_f9bb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1210_c7_f9bb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1210_c7_f9bb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_f9bb
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_f9bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_f9bb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_f9bb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_f9bb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_f9bb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_f9bb
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_f9bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_f9bb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_f9bb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_f9bb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_f9bb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_f9bb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_f9bb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_f9bb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_f9bb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_f9bb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_f9bb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4ed2
BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4ed2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4ed2_left,
BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4ed2_right,
BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4ed2_return_output);

-- n16_MUX_uxn_opcodes_h_l1213_c7_4852
n16_MUX_uxn_opcodes_h_l1213_c7_4852 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1213_c7_4852_cond,
n16_MUX_uxn_opcodes_h_l1213_c7_4852_iftrue,
n16_MUX_uxn_opcodes_h_l1213_c7_4852_iffalse,
n16_MUX_uxn_opcodes_h_l1213_c7_4852_return_output);

-- t16_MUX_uxn_opcodes_h_l1213_c7_4852
t16_MUX_uxn_opcodes_h_l1213_c7_4852 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1213_c7_4852_cond,
t16_MUX_uxn_opcodes_h_l1213_c7_4852_iftrue,
t16_MUX_uxn_opcodes_h_l1213_c7_4852_iffalse,
t16_MUX_uxn_opcodes_h_l1213_c7_4852_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4852
result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4852 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4852_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4852_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4852_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4852_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4852
result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4852 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4852_cond,
result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4852_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4852_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4852_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4852
result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4852 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4852_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4852_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4852_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4852_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4852
result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4852 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4852_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4852_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4852_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4852_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4852
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4852 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4852_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4852_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4852_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4852_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1218_c11_0fe3
BIN_OP_EQ_uxn_opcodes_h_l1218_c11_0fe3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1218_c11_0fe3_left,
BIN_OP_EQ_uxn_opcodes_h_l1218_c11_0fe3_right,
BIN_OP_EQ_uxn_opcodes_h_l1218_c11_0fe3_return_output);

-- n16_MUX_uxn_opcodes_h_l1218_c7_5b42
n16_MUX_uxn_opcodes_h_l1218_c7_5b42 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1218_c7_5b42_cond,
n16_MUX_uxn_opcodes_h_l1218_c7_5b42_iftrue,
n16_MUX_uxn_opcodes_h_l1218_c7_5b42_iffalse,
n16_MUX_uxn_opcodes_h_l1218_c7_5b42_return_output);

-- t16_MUX_uxn_opcodes_h_l1218_c7_5b42
t16_MUX_uxn_opcodes_h_l1218_c7_5b42 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1218_c7_5b42_cond,
t16_MUX_uxn_opcodes_h_l1218_c7_5b42_iftrue,
t16_MUX_uxn_opcodes_h_l1218_c7_5b42_iffalse,
t16_MUX_uxn_opcodes_h_l1218_c7_5b42_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_5b42
result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_5b42 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_5b42_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_5b42_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_5b42_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_5b42_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1218_c7_5b42
result_u8_value_MUX_uxn_opcodes_h_l1218_c7_5b42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1218_c7_5b42_cond,
result_u8_value_MUX_uxn_opcodes_h_l1218_c7_5b42_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1218_c7_5b42_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1218_c7_5b42_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_5b42
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_5b42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_5b42_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_5b42_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_5b42_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_5b42_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_5b42
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_5b42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_5b42_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_5b42_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_5b42_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_5b42_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_5b42
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_5b42 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_5b42_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_5b42_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_5b42_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_5b42_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1219_c3_ea0e
BIN_OP_OR_uxn_opcodes_h_l1219_c3_ea0e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1219_c3_ea0e_left,
BIN_OP_OR_uxn_opcodes_h_l1219_c3_ea0e_right,
BIN_OP_OR_uxn_opcodes_h_l1219_c3_ea0e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1222_c11_e88f
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_e88f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_e88f_left,
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_e88f_right,
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_e88f_return_output);

-- n16_MUX_uxn_opcodes_h_l1222_c7_cf45
n16_MUX_uxn_opcodes_h_l1222_c7_cf45 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1222_c7_cf45_cond,
n16_MUX_uxn_opcodes_h_l1222_c7_cf45_iftrue,
n16_MUX_uxn_opcodes_h_l1222_c7_cf45_iffalse,
n16_MUX_uxn_opcodes_h_l1222_c7_cf45_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_cf45
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_cf45 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_cf45_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_cf45_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_cf45_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_cf45_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1222_c7_cf45
result_u8_value_MUX_uxn_opcodes_h_l1222_c7_cf45 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1222_c7_cf45_cond,
result_u8_value_MUX_uxn_opcodes_h_l1222_c7_cf45_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1222_c7_cf45_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1222_c7_cf45_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_cf45
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_cf45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_cf45_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_cf45_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_cf45_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_cf45_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_cf45
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_cf45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_cf45_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_cf45_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_cf45_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_cf45_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_cf45
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_cf45 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_cf45_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_cf45_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_cf45_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_cf45_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1226_c11_82fb
BIN_OP_EQ_uxn_opcodes_h_l1226_c11_82fb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1226_c11_82fb_left,
BIN_OP_EQ_uxn_opcodes_h_l1226_c11_82fb_right,
BIN_OP_EQ_uxn_opcodes_h_l1226_c11_82fb_return_output);

-- n16_MUX_uxn_opcodes_h_l1226_c7_8cb5
n16_MUX_uxn_opcodes_h_l1226_c7_8cb5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1226_c7_8cb5_cond,
n16_MUX_uxn_opcodes_h_l1226_c7_8cb5_iftrue,
n16_MUX_uxn_opcodes_h_l1226_c7_8cb5_iffalse,
n16_MUX_uxn_opcodes_h_l1226_c7_8cb5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_8cb5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_8cb5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_8cb5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_8cb5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_8cb5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_8cb5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1226_c7_8cb5
result_u8_value_MUX_uxn_opcodes_h_l1226_c7_8cb5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1226_c7_8cb5_cond,
result_u8_value_MUX_uxn_opcodes_h_l1226_c7_8cb5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1226_c7_8cb5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1226_c7_8cb5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_8cb5
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_8cb5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_8cb5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_8cb5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_8cb5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_8cb5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_8cb5
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_8cb5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_8cb5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_8cb5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_8cb5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_8cb5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_8cb5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_8cb5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_8cb5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_8cb5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_8cb5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_8cb5_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1227_c3_bd62
BIN_OP_OR_uxn_opcodes_h_l1227_c3_bd62 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1227_c3_bd62_left,
BIN_OP_OR_uxn_opcodes_h_l1227_c3_bd62_right,
BIN_OP_OR_uxn_opcodes_h_l1227_c3_bd62_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1228_c30_94eb
sp_relative_shift_uxn_opcodes_h_l1228_c30_94eb : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1228_c30_94eb_ins,
sp_relative_shift_uxn_opcodes_h_l1228_c30_94eb_x,
sp_relative_shift_uxn_opcodes_h_l1228_c30_94eb_y,
sp_relative_shift_uxn_opcodes_h_l1228_c30_94eb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1231_c21_aa64
BIN_OP_EQ_uxn_opcodes_h_l1231_c21_aa64 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1231_c21_aa64_left,
BIN_OP_EQ_uxn_opcodes_h_l1231_c21_aa64_right,
BIN_OP_EQ_uxn_opcodes_h_l1231_c21_aa64_return_output);

-- MUX_uxn_opcodes_h_l1231_c21_f930
MUX_uxn_opcodes_h_l1231_c21_f930 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1231_c21_f930_cond,
MUX_uxn_opcodes_h_l1231_c21_f930_iftrue,
MUX_uxn_opcodes_h_l1231_c21_f930_iffalse,
MUX_uxn_opcodes_h_l1231_c21_f930_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_f545
CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_f545 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_f545_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_f545_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fa78_return_output,
 n16_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output,
 t16_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7b6e_return_output,
 n16_MUX_uxn_opcodes_h_l1210_c7_f9bb_return_output,
 t16_MUX_uxn_opcodes_h_l1210_c7_f9bb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_f9bb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1210_c7_f9bb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_f9bb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_f9bb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_f9bb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4ed2_return_output,
 n16_MUX_uxn_opcodes_h_l1213_c7_4852_return_output,
 t16_MUX_uxn_opcodes_h_l1213_c7_4852_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4852_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4852_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4852_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4852_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4852_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1218_c11_0fe3_return_output,
 n16_MUX_uxn_opcodes_h_l1218_c7_5b42_return_output,
 t16_MUX_uxn_opcodes_h_l1218_c7_5b42_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_5b42_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1218_c7_5b42_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_5b42_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_5b42_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_5b42_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1219_c3_ea0e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1222_c11_e88f_return_output,
 n16_MUX_uxn_opcodes_h_l1222_c7_cf45_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_cf45_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1222_c7_cf45_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_cf45_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_cf45_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_cf45_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1226_c11_82fb_return_output,
 n16_MUX_uxn_opcodes_h_l1226_c7_8cb5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_8cb5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1226_c7_8cb5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_8cb5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_8cb5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_8cb5_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1227_c3_bd62_return_output,
 sp_relative_shift_uxn_opcodes_h_l1228_c30_94eb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1231_c21_aa64_return_output,
 MUX_uxn_opcodes_h_l1231_c21_f930_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_f545_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fa78_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fa78_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fa78_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1210_c7_f9bb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c2_8b41_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1210_c7_f9bb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1197_c2_8b41_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1202_c3_233d : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_f9bb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_8b41_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1197_c2_8b41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_f9bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_8b41_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_f9bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_8b41_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1207_c3_e815 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_f9bb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_8b41_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1197_c2_8b41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_8b41_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_f9bb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_8b41_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1197_c2_8b41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_8b41_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1197_c2_8b41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7b6e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7b6e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7b6e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1210_c7_f9bb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1210_c7_f9bb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1213_c7_4852_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1210_c7_f9bb_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1210_c7_f9bb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1210_c7_f9bb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1213_c7_4852_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1210_c7_f9bb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_f9bb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_f9bb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4852_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_f9bb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_f9bb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_f9bb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4852_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_f9bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_f9bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_f9bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4852_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_f9bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_f9bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_f9bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4852_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_f9bb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_f9bb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1211_c3_f40f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_f9bb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4852_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_f9bb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4ed2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4ed2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4ed2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1213_c7_4852_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1213_c7_4852_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1218_c7_5b42_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1213_c7_4852_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1213_c7_4852_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1213_c7_4852_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1218_c7_5b42_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1213_c7_4852_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4852_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4852_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_5b42_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4852_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4852_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4852_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_5b42_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4852_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4852_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4852_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_5b42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4852_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4852_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4852_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_5b42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4852_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4852_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1216_c3_57af : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4852_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_5b42_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4852_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_0fe3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_0fe3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_0fe3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1218_c7_5b42_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1218_c7_5b42_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1222_c7_cf45_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1218_c7_5b42_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1218_c7_5b42_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1218_c7_5b42_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1218_c7_5b42_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_5b42_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_5b42_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_cf45_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_5b42_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_5b42_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_5b42_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_cf45_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_5b42_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_5b42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_5b42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_cf45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_5b42_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_5b42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_5b42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_cf45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_5b42_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_5b42_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1220_c3_045c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_5b42_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_cf45_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_5b42_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_ea0e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_ea0e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_ea0e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_e88f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_e88f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_e88f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1222_c7_cf45_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1222_c7_cf45_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1226_c7_8cb5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1222_c7_cf45_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_cf45_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_cf45_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_8cb5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_cf45_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_cf45_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_cf45_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_8cb5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_cf45_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_cf45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_cf45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_8cb5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_cf45_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_cf45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_cf45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_8cb5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_cf45_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_cf45_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_cf45_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_8cb5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_cf45_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_82fb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_82fb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_82fb_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1226_c7_8cb5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1226_c7_8cb5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1226_c7_8cb5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_8cb5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_8cb5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_8cb5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_8cb5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_8cb5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_8cb5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_8cb5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_8cb5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_8cb5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_8cb5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_8cb5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_8cb5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_8cb5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1230_c3_6bdc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_8cb5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_8cb5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_bd62_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_bd62_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_bd62_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_94eb_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_94eb_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_94eb_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_94eb_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1231_c21_f930_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_aa64_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_aa64_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_aa64_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1231_c21_f930_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1231_c21_f930_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1231_c21_f930_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1210_l1197_l1226_l1222_l1218_l1213_DUPLICATE_f11b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1210_l1226_l1222_l1218_l1213_DUPLICATE_e329_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1210_l1226_l1222_l1218_l1213_DUPLICATE_ead1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1210_l1226_l1222_l1218_l1213_DUPLICATE_e4f2_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1219_l1227_l1214_l1223_DUPLICATE_98b4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_f545_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_f545_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1222_l1226_DUPLICATE_4082_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l1235_l1193_DUPLICATE_0f36_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4ed2_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1220_c3_045c := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_5b42_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1220_c3_045c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1211_c3_f40f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_f9bb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1211_c3_f40f;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1230_c3_6bdc := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_8cb5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1230_c3_6bdc;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1216_c3_57af := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4852_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1216_c3_57af;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1207_c3_e815 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1207_c3_e815;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_8cb5_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_94eb_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_8cb5_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1231_c21_f930_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_94eb_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_0fe3_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1202_c3_233d := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1202_c3_233d;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1231_c21_f930_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7b6e_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_e88f_right := to_unsigned(4, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_82fb_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fa78_right := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_94eb_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_bd62_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1210_c7_f9bb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1213_c7_4852_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1218_c7_5b42_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1226_c7_8cb5_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fa78_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7b6e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4ed2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_0fe3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_e88f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_82fb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_aa64_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_ea0e_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1210_c7_f9bb_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1218_c7_5b42_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1213_c11_4ed2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4ed2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4ed2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4ed2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4ed2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4ed2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4ed2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1197_c6_fa78] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fa78_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fa78_left;
     BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fa78_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fa78_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fa78_return_output := BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fa78_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1228_c30_94eb] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1228_c30_94eb_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_94eb_ins;
     sp_relative_shift_uxn_opcodes_h_l1228_c30_94eb_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_94eb_x;
     sp_relative_shift_uxn_opcodes_h_l1228_c30_94eb_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_94eb_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_94eb_return_output := sp_relative_shift_uxn_opcodes_h_l1228_c30_94eb_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1210_l1197_l1226_l1222_l1218_l1213_DUPLICATE_f11b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1210_l1197_l1226_l1222_l1218_l1213_DUPLICATE_f11b_return_output := result.u8_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1219_l1227_l1214_l1223_DUPLICATE_98b4 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1219_l1227_l1214_l1223_DUPLICATE_98b4_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1218_c11_0fe3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1218_c11_0fe3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_0fe3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1218_c11_0fe3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_0fe3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_0fe3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1218_c11_0fe3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1226_c11_82fb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1226_c11_82fb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_82fb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1226_c11_82fb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_82fb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_82fb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1226_c11_82fb_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1210_l1226_l1222_l1218_l1213_DUPLICATE_ead1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1210_l1226_l1222_l1218_l1213_DUPLICATE_ead1_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1210_l1226_l1222_l1218_l1213_DUPLICATE_e4f2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1210_l1226_l1222_l1218_l1213_DUPLICATE_e4f2_return_output := result.is_opc_done;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1197_c2_8b41] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1197_c2_8b41_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1222_c11_e88f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1222_c11_e88f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_e88f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1222_c11_e88f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_e88f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_e88f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1222_c11_e88f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1210_c11_7b6e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7b6e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7b6e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7b6e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7b6e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7b6e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7b6e_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1197_c2_8b41] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1197_c2_8b41_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1222_l1226_DUPLICATE_4082 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1222_l1226_DUPLICATE_4082_return_output := result.stack_address_sp_offset;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1197_c2_8b41] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1197_c2_8b41_return_output := result.is_vram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1210_l1226_l1222_l1218_l1213_DUPLICATE_e329 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1210_l1226_l1222_l1218_l1213_DUPLICATE_e329_return_output := result.sp_relative_shift;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1197_c2_8b41] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1197_c2_8b41_return_output := result.is_pc_updated;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1197_c2_8b41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fa78_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_8b41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fa78_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_8b41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fa78_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fa78_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_8b41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fa78_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_8b41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fa78_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fa78_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_8b41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fa78_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_8b41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fa78_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_8b41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fa78_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1197_c2_8b41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fa78_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1210_c7_f9bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7b6e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_f9bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7b6e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_f9bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7b6e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_f9bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7b6e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_f9bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7b6e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_f9bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7b6e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1210_c7_f9bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7b6e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1213_c7_4852_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4ed2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4852_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4ed2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4852_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4ed2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4852_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4ed2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4852_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4ed2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4852_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4ed2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1213_c7_4852_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4ed2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1218_c7_5b42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_0fe3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_5b42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_0fe3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_5b42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_0fe3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_5b42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_0fe3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_5b42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_0fe3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_5b42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_0fe3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1218_c7_5b42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_0fe3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1222_c7_cf45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_e88f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_cf45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_e88f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_cf45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_e88f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_cf45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_e88f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_cf45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_e88f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_cf45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_e88f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1226_c7_8cb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_82fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_8cb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_82fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_8cb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_82fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_8cb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_82fb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_8cb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_82fb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_8cb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_82fb_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_ea0e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1219_l1227_l1214_l1223_DUPLICATE_98b4_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_bd62_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1219_l1227_l1214_l1223_DUPLICATE_98b4_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_f545_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1219_l1227_l1214_l1223_DUPLICATE_98b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_f9bb_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1210_l1226_l1222_l1218_l1213_DUPLICATE_e329_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4852_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1210_l1226_l1222_l1218_l1213_DUPLICATE_e329_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_5b42_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1210_l1226_l1222_l1218_l1213_DUPLICATE_e329_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_cf45_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1210_l1226_l1222_l1218_l1213_DUPLICATE_e329_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_8cb5_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1210_l1226_l1222_l1218_l1213_DUPLICATE_e329_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_f9bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1210_l1226_l1222_l1218_l1213_DUPLICATE_e4f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4852_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1210_l1226_l1222_l1218_l1213_DUPLICATE_e4f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_5b42_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1210_l1226_l1222_l1218_l1213_DUPLICATE_e4f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_cf45_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1210_l1226_l1222_l1218_l1213_DUPLICATE_e4f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_8cb5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1210_l1226_l1222_l1218_l1213_DUPLICATE_e4f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_f9bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1210_l1226_l1222_l1218_l1213_DUPLICATE_ead1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4852_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1210_l1226_l1222_l1218_l1213_DUPLICATE_ead1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_5b42_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1210_l1226_l1222_l1218_l1213_DUPLICATE_ead1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_cf45_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1210_l1226_l1222_l1218_l1213_DUPLICATE_ead1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_8cb5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1210_l1226_l1222_l1218_l1213_DUPLICATE_ead1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_cf45_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1222_l1226_DUPLICATE_4082_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_8cb5_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1222_l1226_DUPLICATE_4082_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1210_l1197_l1226_l1222_l1218_l1213_DUPLICATE_f11b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_f9bb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1210_l1197_l1226_l1222_l1218_l1213_DUPLICATE_f11b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4852_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1210_l1197_l1226_l1222_l1218_l1213_DUPLICATE_f11b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_5b42_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1210_l1197_l1226_l1222_l1218_l1213_DUPLICATE_f11b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_cf45_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1210_l1197_l1226_l1222_l1218_l1213_DUPLICATE_f11b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_8cb5_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1210_l1197_l1226_l1222_l1218_l1213_DUPLICATE_f11b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1197_c2_8b41_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1197_c2_8b41_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1197_c2_8b41_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1197_c2_8b41_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_8cb5_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_94eb_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1226_c7_8cb5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_8cb5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_8cb5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_8cb5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_8cb5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_8cb5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_8cb5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_8cb5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_8cb5_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1197_c2_8b41] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_8b41_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_8b41_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1197_c2_8b41] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_8b41_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_8b41_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1226_c7_8cb5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_8cb5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_8cb5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_8cb5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_8cb5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_8cb5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_8cb5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_8cb5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_8cb5_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1197_c2_8b41] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_f545 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_f545_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_f545_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_f545_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_f545_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1226_c7_8cb5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_8cb5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_8cb5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_8cb5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_8cb5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_8cb5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_8cb5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_8cb5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_8cb5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1226_c7_8cb5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_8cb5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_8cb5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_8cb5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_8cb5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_8cb5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_8cb5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_8cb5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_8cb5_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1197_c2_8b41] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1219_c3_ea0e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1219_c3_ea0e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_ea0e_left;
     BIN_OP_OR_uxn_opcodes_h_l1219_c3_ea0e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_ea0e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_ea0e_return_output := BIN_OP_OR_uxn_opcodes_h_l1219_c3_ea0e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1227_c3_bd62] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1227_c3_bd62_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_bd62_left;
     BIN_OP_OR_uxn_opcodes_h_l1227_c3_bd62_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_bd62_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_bd62_return_output := BIN_OP_OR_uxn_opcodes_h_l1227_c3_bd62_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1218_c7_5b42_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_ea0e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_aa64_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_bd62_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1226_c7_8cb5_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_bd62_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1222_c7_cf45_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_f545_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1213_c7_4852_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_f545_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_cf45_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_8cb5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_cf45_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_8cb5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_cf45_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_8cb5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_cf45_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_8cb5_return_output;
     -- t16_MUX[uxn_opcodes_h_l1218_c7_5b42] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1218_c7_5b42_cond <= VAR_t16_MUX_uxn_opcodes_h_l1218_c7_5b42_cond;
     t16_MUX_uxn_opcodes_h_l1218_c7_5b42_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1218_c7_5b42_iftrue;
     t16_MUX_uxn_opcodes_h_l1218_c7_5b42_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1218_c7_5b42_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1218_c7_5b42_return_output := t16_MUX_uxn_opcodes_h_l1218_c7_5b42_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1222_c7_cf45] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_cf45_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_cf45_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_cf45_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_cf45_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_cf45_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_cf45_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_cf45_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_cf45_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1222_c7_cf45] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_cf45_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_cf45_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_cf45_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_cf45_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_cf45_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_cf45_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_cf45_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_cf45_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1222_c7_cf45] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_cf45_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_cf45_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_cf45_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_cf45_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_cf45_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_cf45_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_cf45_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_cf45_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1222_c7_cf45] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_cf45_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_cf45_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_cf45_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_cf45_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_cf45_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_cf45_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_cf45_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_cf45_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1231_c21_aa64] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1231_c21_aa64_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_aa64_left;
     BIN_OP_EQ_uxn_opcodes_h_l1231_c21_aa64_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_aa64_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_aa64_return_output := BIN_OP_EQ_uxn_opcodes_h_l1231_c21_aa64_return_output;

     -- n16_MUX[uxn_opcodes_h_l1226_c7_8cb5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1226_c7_8cb5_cond <= VAR_n16_MUX_uxn_opcodes_h_l1226_c7_8cb5_cond;
     n16_MUX_uxn_opcodes_h_l1226_c7_8cb5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1226_c7_8cb5_iftrue;
     n16_MUX_uxn_opcodes_h_l1226_c7_8cb5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1226_c7_8cb5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1226_c7_8cb5_return_output := n16_MUX_uxn_opcodes_h_l1226_c7_8cb5_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1231_c21_f930_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_aa64_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1222_c7_cf45_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1226_c7_8cb5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_5b42_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_cf45_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_5b42_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_cf45_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_5b42_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_cf45_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_5b42_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_cf45_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1213_c7_4852_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1218_c7_5b42_return_output;
     -- MUX[uxn_opcodes_h_l1231_c21_f930] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1231_c21_f930_cond <= VAR_MUX_uxn_opcodes_h_l1231_c21_f930_cond;
     MUX_uxn_opcodes_h_l1231_c21_f930_iftrue <= VAR_MUX_uxn_opcodes_h_l1231_c21_f930_iftrue;
     MUX_uxn_opcodes_h_l1231_c21_f930_iffalse <= VAR_MUX_uxn_opcodes_h_l1231_c21_f930_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1231_c21_f930_return_output := MUX_uxn_opcodes_h_l1231_c21_f930_return_output;

     -- n16_MUX[uxn_opcodes_h_l1222_c7_cf45] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1222_c7_cf45_cond <= VAR_n16_MUX_uxn_opcodes_h_l1222_c7_cf45_cond;
     n16_MUX_uxn_opcodes_h_l1222_c7_cf45_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1222_c7_cf45_iftrue;
     n16_MUX_uxn_opcodes_h_l1222_c7_cf45_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1222_c7_cf45_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1222_c7_cf45_return_output := n16_MUX_uxn_opcodes_h_l1222_c7_cf45_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1218_c7_5b42] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_5b42_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_5b42_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_5b42_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_5b42_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_5b42_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_5b42_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_5b42_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_5b42_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1218_c7_5b42] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_5b42_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_5b42_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_5b42_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_5b42_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_5b42_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_5b42_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_5b42_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_5b42_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1218_c7_5b42] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_5b42_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_5b42_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_5b42_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_5b42_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_5b42_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_5b42_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_5b42_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_5b42_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1218_c7_5b42] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_5b42_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_5b42_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_5b42_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_5b42_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_5b42_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_5b42_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_5b42_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_5b42_return_output;

     -- t16_MUX[uxn_opcodes_h_l1213_c7_4852] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1213_c7_4852_cond <= VAR_t16_MUX_uxn_opcodes_h_l1213_c7_4852_cond;
     t16_MUX_uxn_opcodes_h_l1213_c7_4852_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1213_c7_4852_iftrue;
     t16_MUX_uxn_opcodes_h_l1213_c7_4852_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1213_c7_4852_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1213_c7_4852_return_output := t16_MUX_uxn_opcodes_h_l1213_c7_4852_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_8cb5_iftrue := VAR_MUX_uxn_opcodes_h_l1231_c21_f930_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1218_c7_5b42_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1222_c7_cf45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4852_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_5b42_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4852_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_5b42_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4852_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_5b42_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4852_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_5b42_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1210_c7_f9bb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1213_c7_4852_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1213_c7_4852] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4852_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4852_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4852_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4852_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4852_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4852_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4852_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4852_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1213_c7_4852] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4852_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4852_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4852_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4852_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4852_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4852_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4852_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4852_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1213_c7_4852] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4852_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4852_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4852_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4852_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4852_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4852_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4852_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4852_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1213_c7_4852] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4852_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4852_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4852_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4852_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4852_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4852_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4852_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4852_return_output;

     -- t16_MUX[uxn_opcodes_h_l1210_c7_f9bb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1210_c7_f9bb_cond <= VAR_t16_MUX_uxn_opcodes_h_l1210_c7_f9bb_cond;
     t16_MUX_uxn_opcodes_h_l1210_c7_f9bb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1210_c7_f9bb_iftrue;
     t16_MUX_uxn_opcodes_h_l1210_c7_f9bb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1210_c7_f9bb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1210_c7_f9bb_return_output := t16_MUX_uxn_opcodes_h_l1210_c7_f9bb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1226_c7_8cb5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1226_c7_8cb5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_8cb5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1226_c7_8cb5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_8cb5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1226_c7_8cb5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_8cb5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_8cb5_return_output := result_u8_value_MUX_uxn_opcodes_h_l1226_c7_8cb5_return_output;

     -- n16_MUX[uxn_opcodes_h_l1218_c7_5b42] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1218_c7_5b42_cond <= VAR_n16_MUX_uxn_opcodes_h_l1218_c7_5b42_cond;
     n16_MUX_uxn_opcodes_h_l1218_c7_5b42_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1218_c7_5b42_iftrue;
     n16_MUX_uxn_opcodes_h_l1218_c7_5b42_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1218_c7_5b42_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1218_c7_5b42_return_output := n16_MUX_uxn_opcodes_h_l1218_c7_5b42_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1213_c7_4852_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1218_c7_5b42_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_f9bb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4852_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_f9bb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4852_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_f9bb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4852_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_f9bb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4852_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_cf45_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_8cb5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1210_c7_f9bb_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1210_c7_f9bb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_f9bb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_f9bb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_f9bb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_f9bb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_f9bb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_f9bb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_f9bb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_f9bb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1210_c7_f9bb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_f9bb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_f9bb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_f9bb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_f9bb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_f9bb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_f9bb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_f9bb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_f9bb_return_output;

     -- n16_MUX[uxn_opcodes_h_l1213_c7_4852] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1213_c7_4852_cond <= VAR_n16_MUX_uxn_opcodes_h_l1213_c7_4852_cond;
     n16_MUX_uxn_opcodes_h_l1213_c7_4852_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1213_c7_4852_iftrue;
     n16_MUX_uxn_opcodes_h_l1213_c7_4852_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1213_c7_4852_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1213_c7_4852_return_output := n16_MUX_uxn_opcodes_h_l1213_c7_4852_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1210_c7_f9bb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_f9bb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_f9bb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_f9bb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_f9bb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_f9bb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_f9bb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_f9bb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_f9bb_return_output;

     -- t16_MUX[uxn_opcodes_h_l1197_c2_8b41] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1197_c2_8b41_cond <= VAR_t16_MUX_uxn_opcodes_h_l1197_c2_8b41_cond;
     t16_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue;
     t16_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output := t16_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1222_c7_cf45] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1222_c7_cf45_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_cf45_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1222_c7_cf45_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_cf45_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1222_c7_cf45_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_cf45_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_cf45_return_output := result_u8_value_MUX_uxn_opcodes_h_l1222_c7_cf45_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1210_c7_f9bb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_f9bb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_f9bb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_f9bb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_f9bb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_f9bb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_f9bb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_f9bb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_f9bb_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1210_c7_f9bb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1213_c7_4852_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_f9bb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_f9bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_f9bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_f9bb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_5b42_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_cf45_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1197_c2_8b41] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_8b41_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_8b41_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1197_c2_8b41] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_8b41_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_8b41_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1197_c2_8b41] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_8b41_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_8b41_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1197_c2_8b41] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_8b41_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_8b41_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1218_c7_5b42] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1218_c7_5b42_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_5b42_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1218_c7_5b42_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_5b42_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1218_c7_5b42_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_5b42_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_5b42_return_output := result_u8_value_MUX_uxn_opcodes_h_l1218_c7_5b42_return_output;

     -- n16_MUX[uxn_opcodes_h_l1210_c7_f9bb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1210_c7_f9bb_cond <= VAR_n16_MUX_uxn_opcodes_h_l1210_c7_f9bb_cond;
     n16_MUX_uxn_opcodes_h_l1210_c7_f9bb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1210_c7_f9bb_iftrue;
     n16_MUX_uxn_opcodes_h_l1210_c7_f9bb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1210_c7_f9bb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1210_c7_f9bb_return_output := n16_MUX_uxn_opcodes_h_l1210_c7_f9bb_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1210_c7_f9bb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4852_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_5b42_return_output;
     -- n16_MUX[uxn_opcodes_h_l1197_c2_8b41] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1197_c2_8b41_cond <= VAR_n16_MUX_uxn_opcodes_h_l1197_c2_8b41_cond;
     n16_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue;
     n16_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output := n16_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1213_c7_4852] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4852_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4852_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4852_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4852_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4852_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4852_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4852_return_output := result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4852_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_f9bb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4852_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1210_c7_f9bb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1210_c7_f9bb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_f9bb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1210_c7_f9bb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_f9bb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1210_c7_f9bb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_f9bb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_f9bb_return_output := result_u8_value_MUX_uxn_opcodes_h_l1210_c7_f9bb_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_f9bb_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1197_c2_8b41] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1197_c2_8b41_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_8b41_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_8b41_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_8b41_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output := result_u8_value_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l1235_l1193_DUPLICATE_0f36 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l1235_l1193_DUPLICATE_0f36_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_ee25(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_8b41_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l1235_l1193_DUPLICATE_0f36_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l1235_l1193_DUPLICATE_0f36_return_output;
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
