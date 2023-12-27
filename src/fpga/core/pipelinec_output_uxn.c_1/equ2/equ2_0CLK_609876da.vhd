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
-- BIN_OP_EQ[uxn_opcodes_h_l1197_c6_453e]
signal BIN_OP_EQ_uxn_opcodes_h_l1197_c6_453e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1197_c6_453e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1197_c6_453e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1197_c2_0b82]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_0b82_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1197_c2_0b82]
signal result_u8_value_MUX_uxn_opcodes_h_l1197_c2_0b82_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1197_c2_0b82]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1197_c2_0b82]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_0b82_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1197_c2_0b82]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_0b82_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1197_c2_0b82]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_0b82_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1197_c2_0b82]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1197_c2_0b82]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_0b82_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1197_c2_0b82]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_0b82_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1197_c2_0b82]
signal t16_MUX_uxn_opcodes_h_l1197_c2_0b82_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1197_c2_0b82]
signal n16_MUX_uxn_opcodes_h_l1197_c2_0b82_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1210_c11_6b75]
signal BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6b75_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6b75_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6b75_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1210_c7_be40]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_be40_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_be40_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_be40_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_be40_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1210_c7_be40]
signal result_u8_value_MUX_uxn_opcodes_h_l1210_c7_be40_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1210_c7_be40_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1210_c7_be40_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1210_c7_be40_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1210_c7_be40]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_be40_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_be40_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_be40_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_be40_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1210_c7_be40]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_be40_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_be40_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_be40_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_be40_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1210_c7_be40]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_be40_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_be40_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_be40_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_be40_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1210_c7_be40]
signal t16_MUX_uxn_opcodes_h_l1210_c7_be40_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1210_c7_be40_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1210_c7_be40_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1210_c7_be40_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1210_c7_be40]
signal n16_MUX_uxn_opcodes_h_l1210_c7_be40_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1210_c7_be40_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1210_c7_be40_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1210_c7_be40_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1213_c11_0665]
signal BIN_OP_EQ_uxn_opcodes_h_l1213_c11_0665_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1213_c11_0665_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1213_c11_0665_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1213_c7_4f78]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4f78_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4f78_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4f78_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4f78_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1213_c7_4f78]
signal result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4f78_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4f78_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4f78_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4f78_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1213_c7_4f78]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4f78_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4f78_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4f78_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4f78_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1213_c7_4f78]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4f78_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4f78_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4f78_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4f78_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1213_c7_4f78]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4f78_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4f78_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4f78_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4f78_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1213_c7_4f78]
signal t16_MUX_uxn_opcodes_h_l1213_c7_4f78_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1213_c7_4f78_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1213_c7_4f78_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1213_c7_4f78_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1213_c7_4f78]
signal n16_MUX_uxn_opcodes_h_l1213_c7_4f78_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1213_c7_4f78_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1213_c7_4f78_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1213_c7_4f78_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1218_c11_9469]
signal BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9469_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9469_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9469_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1218_c7_d957]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d957_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d957_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d957_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d957_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1218_c7_d957]
signal result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d957_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d957_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d957_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d957_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1218_c7_d957]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d957_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d957_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d957_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d957_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1218_c7_d957]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d957_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d957_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d957_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d957_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1218_c7_d957]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d957_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d957_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d957_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d957_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1218_c7_d957]
signal t16_MUX_uxn_opcodes_h_l1218_c7_d957_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1218_c7_d957_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1218_c7_d957_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1218_c7_d957_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1218_c7_d957]
signal n16_MUX_uxn_opcodes_h_l1218_c7_d957_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1218_c7_d957_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1218_c7_d957_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1218_c7_d957_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1219_c3_dc75]
signal BIN_OP_OR_uxn_opcodes_h_l1219_c3_dc75_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1219_c3_dc75_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1219_c3_dc75_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1222_c11_dff0]
signal BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dff0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dff0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dff0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1222_c7_566b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_566b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_566b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_566b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_566b_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1222_c7_566b]
signal result_u8_value_MUX_uxn_opcodes_h_l1222_c7_566b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1222_c7_566b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1222_c7_566b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1222_c7_566b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1222_c7_566b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_566b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_566b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_566b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_566b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1222_c7_566b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_566b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_566b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_566b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_566b_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1222_c7_566b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_566b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_566b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_566b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_566b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1222_c7_566b]
signal n16_MUX_uxn_opcodes_h_l1222_c7_566b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1222_c7_566b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1222_c7_566b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1222_c7_566b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1226_c11_f636]
signal BIN_OP_EQ_uxn_opcodes_h_l1226_c11_f636_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1226_c11_f636_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1226_c11_f636_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1226_c7_7b17]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_7b17_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_7b17_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_7b17_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_7b17_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1226_c7_7b17]
signal result_u8_value_MUX_uxn_opcodes_h_l1226_c7_7b17_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1226_c7_7b17_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1226_c7_7b17_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1226_c7_7b17_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1226_c7_7b17]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_7b17_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_7b17_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_7b17_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_7b17_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1226_c7_7b17]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_7b17_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_7b17_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_7b17_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_7b17_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1226_c7_7b17]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_7b17_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_7b17_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_7b17_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_7b17_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1226_c7_7b17]
signal n16_MUX_uxn_opcodes_h_l1226_c7_7b17_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1226_c7_7b17_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1226_c7_7b17_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1226_c7_7b17_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1227_c3_a038]
signal BIN_OP_OR_uxn_opcodes_h_l1227_c3_a038_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1227_c3_a038_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1227_c3_a038_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1228_c30_5448]
signal sp_relative_shift_uxn_opcodes_h_l1228_c30_5448_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1228_c30_5448_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1228_c30_5448_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1228_c30_5448_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1231_c21_2176]
signal BIN_OP_EQ_uxn_opcodes_h_l1231_c21_2176_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1231_c21_2176_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1231_c21_2176_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1231_c21_426c]
signal MUX_uxn_opcodes_h_l1231_c21_426c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1231_c21_426c_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1231_c21_426c_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1231_c21_426c_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_4ee3
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_4ee3_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_4ee3_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_b856( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1197_c6_453e
BIN_OP_EQ_uxn_opcodes_h_l1197_c6_453e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1197_c6_453e_left,
BIN_OP_EQ_uxn_opcodes_h_l1197_c6_453e_right,
BIN_OP_EQ_uxn_opcodes_h_l1197_c6_453e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_0b82
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_0b82 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_0b82_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1197_c2_0b82
result_u8_value_MUX_uxn_opcodes_h_l1197_c2_0b82 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1197_c2_0b82_cond,
result_u8_value_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_0b82
result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_0b82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_0b82
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_0b82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_0b82_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_0b82
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_0b82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_0b82_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_0b82
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_0b82 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_0b82_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_0b82
result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_0b82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_0b82
result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_0b82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_0b82_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_0b82
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_0b82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_0b82_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output);

-- t16_MUX_uxn_opcodes_h_l1197_c2_0b82
t16_MUX_uxn_opcodes_h_l1197_c2_0b82 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1197_c2_0b82_cond,
t16_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue,
t16_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse,
t16_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output);

-- n16_MUX_uxn_opcodes_h_l1197_c2_0b82
n16_MUX_uxn_opcodes_h_l1197_c2_0b82 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1197_c2_0b82_cond,
n16_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue,
n16_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse,
n16_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6b75
BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6b75 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6b75_left,
BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6b75_right,
BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6b75_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_be40
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_be40 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_be40_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_be40_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_be40_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_be40_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1210_c7_be40
result_u8_value_MUX_uxn_opcodes_h_l1210_c7_be40 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1210_c7_be40_cond,
result_u8_value_MUX_uxn_opcodes_h_l1210_c7_be40_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1210_c7_be40_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1210_c7_be40_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_be40
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_be40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_be40_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_be40_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_be40_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_be40_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_be40
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_be40 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_be40_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_be40_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_be40_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_be40_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_be40
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_be40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_be40_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_be40_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_be40_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_be40_return_output);

-- t16_MUX_uxn_opcodes_h_l1210_c7_be40
t16_MUX_uxn_opcodes_h_l1210_c7_be40 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1210_c7_be40_cond,
t16_MUX_uxn_opcodes_h_l1210_c7_be40_iftrue,
t16_MUX_uxn_opcodes_h_l1210_c7_be40_iffalse,
t16_MUX_uxn_opcodes_h_l1210_c7_be40_return_output);

-- n16_MUX_uxn_opcodes_h_l1210_c7_be40
n16_MUX_uxn_opcodes_h_l1210_c7_be40 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1210_c7_be40_cond,
n16_MUX_uxn_opcodes_h_l1210_c7_be40_iftrue,
n16_MUX_uxn_opcodes_h_l1210_c7_be40_iffalse,
n16_MUX_uxn_opcodes_h_l1210_c7_be40_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1213_c11_0665
BIN_OP_EQ_uxn_opcodes_h_l1213_c11_0665 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1213_c11_0665_left,
BIN_OP_EQ_uxn_opcodes_h_l1213_c11_0665_right,
BIN_OP_EQ_uxn_opcodes_h_l1213_c11_0665_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4f78
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4f78 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4f78_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4f78_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4f78_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4f78_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4f78
result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4f78 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4f78_cond,
result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4f78_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4f78_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4f78_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4f78
result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4f78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4f78_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4f78_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4f78_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4f78_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4f78
result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4f78 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4f78_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4f78_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4f78_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4f78_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4f78
result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4f78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4f78_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4f78_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4f78_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4f78_return_output);

-- t16_MUX_uxn_opcodes_h_l1213_c7_4f78
t16_MUX_uxn_opcodes_h_l1213_c7_4f78 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1213_c7_4f78_cond,
t16_MUX_uxn_opcodes_h_l1213_c7_4f78_iftrue,
t16_MUX_uxn_opcodes_h_l1213_c7_4f78_iffalse,
t16_MUX_uxn_opcodes_h_l1213_c7_4f78_return_output);

-- n16_MUX_uxn_opcodes_h_l1213_c7_4f78
n16_MUX_uxn_opcodes_h_l1213_c7_4f78 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1213_c7_4f78_cond,
n16_MUX_uxn_opcodes_h_l1213_c7_4f78_iftrue,
n16_MUX_uxn_opcodes_h_l1213_c7_4f78_iffalse,
n16_MUX_uxn_opcodes_h_l1213_c7_4f78_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9469
BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9469 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9469_left,
BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9469_right,
BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9469_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d957
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d957 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d957_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d957_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d957_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d957_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d957
result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d957 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d957_cond,
result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d957_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d957_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d957_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d957
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d957 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d957_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d957_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d957_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d957_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d957
result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d957 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d957_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d957_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d957_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d957_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d957
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d957 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d957_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d957_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d957_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d957_return_output);

-- t16_MUX_uxn_opcodes_h_l1218_c7_d957
t16_MUX_uxn_opcodes_h_l1218_c7_d957 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1218_c7_d957_cond,
t16_MUX_uxn_opcodes_h_l1218_c7_d957_iftrue,
t16_MUX_uxn_opcodes_h_l1218_c7_d957_iffalse,
t16_MUX_uxn_opcodes_h_l1218_c7_d957_return_output);

-- n16_MUX_uxn_opcodes_h_l1218_c7_d957
n16_MUX_uxn_opcodes_h_l1218_c7_d957 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1218_c7_d957_cond,
n16_MUX_uxn_opcodes_h_l1218_c7_d957_iftrue,
n16_MUX_uxn_opcodes_h_l1218_c7_d957_iffalse,
n16_MUX_uxn_opcodes_h_l1218_c7_d957_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1219_c3_dc75
BIN_OP_OR_uxn_opcodes_h_l1219_c3_dc75 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1219_c3_dc75_left,
BIN_OP_OR_uxn_opcodes_h_l1219_c3_dc75_right,
BIN_OP_OR_uxn_opcodes_h_l1219_c3_dc75_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dff0
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dff0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dff0_left,
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dff0_right,
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dff0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_566b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_566b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_566b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_566b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_566b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_566b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1222_c7_566b
result_u8_value_MUX_uxn_opcodes_h_l1222_c7_566b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1222_c7_566b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1222_c7_566b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1222_c7_566b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1222_c7_566b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_566b
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_566b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_566b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_566b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_566b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_566b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_566b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_566b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_566b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_566b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_566b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_566b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_566b
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_566b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_566b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_566b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_566b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_566b_return_output);

-- n16_MUX_uxn_opcodes_h_l1222_c7_566b
n16_MUX_uxn_opcodes_h_l1222_c7_566b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1222_c7_566b_cond,
n16_MUX_uxn_opcodes_h_l1222_c7_566b_iftrue,
n16_MUX_uxn_opcodes_h_l1222_c7_566b_iffalse,
n16_MUX_uxn_opcodes_h_l1222_c7_566b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1226_c11_f636
BIN_OP_EQ_uxn_opcodes_h_l1226_c11_f636 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1226_c11_f636_left,
BIN_OP_EQ_uxn_opcodes_h_l1226_c11_f636_right,
BIN_OP_EQ_uxn_opcodes_h_l1226_c11_f636_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_7b17
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_7b17 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_7b17_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_7b17_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_7b17_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_7b17_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1226_c7_7b17
result_u8_value_MUX_uxn_opcodes_h_l1226_c7_7b17 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1226_c7_7b17_cond,
result_u8_value_MUX_uxn_opcodes_h_l1226_c7_7b17_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1226_c7_7b17_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1226_c7_7b17_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_7b17
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_7b17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_7b17_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_7b17_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_7b17_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_7b17_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_7b17
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_7b17 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_7b17_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_7b17_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_7b17_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_7b17_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_7b17
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_7b17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_7b17_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_7b17_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_7b17_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_7b17_return_output);

-- n16_MUX_uxn_opcodes_h_l1226_c7_7b17
n16_MUX_uxn_opcodes_h_l1226_c7_7b17 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1226_c7_7b17_cond,
n16_MUX_uxn_opcodes_h_l1226_c7_7b17_iftrue,
n16_MUX_uxn_opcodes_h_l1226_c7_7b17_iffalse,
n16_MUX_uxn_opcodes_h_l1226_c7_7b17_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1227_c3_a038
BIN_OP_OR_uxn_opcodes_h_l1227_c3_a038 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1227_c3_a038_left,
BIN_OP_OR_uxn_opcodes_h_l1227_c3_a038_right,
BIN_OP_OR_uxn_opcodes_h_l1227_c3_a038_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1228_c30_5448
sp_relative_shift_uxn_opcodes_h_l1228_c30_5448 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1228_c30_5448_ins,
sp_relative_shift_uxn_opcodes_h_l1228_c30_5448_x,
sp_relative_shift_uxn_opcodes_h_l1228_c30_5448_y,
sp_relative_shift_uxn_opcodes_h_l1228_c30_5448_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1231_c21_2176
BIN_OP_EQ_uxn_opcodes_h_l1231_c21_2176 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1231_c21_2176_left,
BIN_OP_EQ_uxn_opcodes_h_l1231_c21_2176_right,
BIN_OP_EQ_uxn_opcodes_h_l1231_c21_2176_return_output);

-- MUX_uxn_opcodes_h_l1231_c21_426c
MUX_uxn_opcodes_h_l1231_c21_426c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1231_c21_426c_cond,
MUX_uxn_opcodes_h_l1231_c21_426c_iftrue,
MUX_uxn_opcodes_h_l1231_c21_426c_iffalse,
MUX_uxn_opcodes_h_l1231_c21_426c_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_4ee3
CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_4ee3 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_4ee3_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_4ee3_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1197_c6_453e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output,
 t16_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output,
 n16_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6b75_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_be40_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1210_c7_be40_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_be40_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_be40_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_be40_return_output,
 t16_MUX_uxn_opcodes_h_l1210_c7_be40_return_output,
 n16_MUX_uxn_opcodes_h_l1210_c7_be40_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1213_c11_0665_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4f78_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4f78_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4f78_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4f78_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4f78_return_output,
 t16_MUX_uxn_opcodes_h_l1213_c7_4f78_return_output,
 n16_MUX_uxn_opcodes_h_l1213_c7_4f78_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9469_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d957_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d957_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d957_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d957_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d957_return_output,
 t16_MUX_uxn_opcodes_h_l1218_c7_d957_return_output,
 n16_MUX_uxn_opcodes_h_l1218_c7_d957_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1219_c3_dc75_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dff0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_566b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1222_c7_566b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_566b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_566b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_566b_return_output,
 n16_MUX_uxn_opcodes_h_l1222_c7_566b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1226_c11_f636_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_7b17_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1226_c7_7b17_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_7b17_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_7b17_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_7b17_return_output,
 n16_MUX_uxn_opcodes_h_l1226_c7_7b17_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1227_c3_a038_return_output,
 sp_relative_shift_uxn_opcodes_h_l1228_c30_5448_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1231_c21_2176_return_output,
 MUX_uxn_opcodes_h_l1231_c21_426c_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_4ee3_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_453e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_453e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_453e_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1207_c3_1800 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_be40_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_0b82_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_be40_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_0b82_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1197_c2_0b82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1197_c2_0b82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_0b82_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_be40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_0b82_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1202_c3_d8e7 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_be40_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_0b82_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1197_c2_0b82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1197_c2_0b82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_0b82_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_be40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_0b82_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1210_c7_be40_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1197_c2_0b82_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1210_c7_be40_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c2_0b82_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6b75_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6b75_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6b75_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_be40_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1211_c3_f9d8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_be40_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4f78_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_be40_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_be40_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_be40_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4f78_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_be40_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_be40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_be40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4f78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_be40_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_be40_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_be40_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4f78_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_be40_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_be40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_be40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4f78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_be40_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1210_c7_be40_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1210_c7_be40_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1213_c7_4f78_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1210_c7_be40_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1210_c7_be40_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1210_c7_be40_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1213_c7_4f78_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1210_c7_be40_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_0665_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_0665_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_0665_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4f78_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1216_c3_aaab : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4f78_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d957_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4f78_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4f78_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4f78_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d957_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4f78_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4f78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4f78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d957_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4f78_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4f78_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4f78_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d957_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4f78_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4f78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4f78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d957_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4f78_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1213_c7_4f78_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1213_c7_4f78_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1218_c7_d957_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1213_c7_4f78_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1213_c7_4f78_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1213_c7_4f78_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1218_c7_d957_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1213_c7_4f78_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9469_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9469_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9469_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d957_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1220_c3_7316 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d957_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_566b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d957_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d957_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d957_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_566b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d957_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d957_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d957_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_566b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d957_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d957_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d957_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_566b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d957_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d957_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d957_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_566b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d957_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1218_c7_d957_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1218_c7_d957_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1218_c7_d957_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1218_c7_d957_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1218_c7_d957_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1222_c7_566b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1218_c7_d957_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_dc75_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_dc75_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_dc75_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dff0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dff0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dff0_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_566b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_566b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_7b17_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_566b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_566b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_566b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_7b17_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_566b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_566b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_566b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_7b17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_566b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_566b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_566b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_7b17_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_566b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_566b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_566b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_7b17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_566b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1222_c7_566b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1222_c7_566b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1226_c7_7b17_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1222_c7_566b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_f636_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_f636_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_f636_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_7b17_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1230_c3_eac2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_7b17_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_7b17_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_7b17_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_7b17_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_7b17_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_7b17_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_7b17_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_7b17_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_7b17_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_7b17_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_7b17_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_7b17_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_7b17_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_7b17_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1226_c7_7b17_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1226_c7_7b17_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1226_c7_7b17_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_a038_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_a038_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_a038_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_5448_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_5448_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_5448_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_5448_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1231_c21_426c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_2176_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_2176_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_2176_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1231_c21_426c_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1231_c21_426c_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1231_c21_426c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1197_l1226_l1222_l1218_l1213_l1210_DUPLICATE_2e2a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1226_l1222_l1218_l1213_l1210_DUPLICATE_d776_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1226_l1222_l1218_l1213_l1210_DUPLICATE_fe3c_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1226_l1222_l1218_l1213_l1210_DUPLICATE_fce1_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1214_l1227_l1223_l1219_DUPLICATE_314a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_4ee3_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_4ee3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1222_l1226_DUPLICATE_3977_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l1235_l1193_DUPLICATE_f226_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6b75_right := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_453e_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1211_c3_f9d8 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_be40_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1211_c3_f9d8;
     VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_5448_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_5448_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_f636_right := to_unsigned(5, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dff0_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_0665_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1202_c3_d8e7 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1202_c3_d8e7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1207_c3_1800 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1207_c3_1800;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_7b17_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1220_c3_7316 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d957_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1220_c3_7316;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1230_c3_eac2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_7b17_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1230_c3_eac2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9469_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1216_c3_aaab := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4f78_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1216_c3_aaab;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_7b17_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1231_c21_426c_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_MUX_uxn_opcodes_h_l1231_c21_426c_iftrue := resize(to_unsigned(1, 1), 8);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_5448_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_a038_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1210_c7_be40_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1213_c7_4f78_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1218_c7_d957_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1226_c7_7b17_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_453e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6b75_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_0665_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9469_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dff0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_f636_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_2176_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_dc75_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1210_c7_be40_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1218_c7_d957_iffalse := t16;
     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1197_c2_0b82] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1197_c2_0b82_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1222_c11_dff0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dff0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dff0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dff0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dff0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dff0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dff0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1210_c11_6b75] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6b75_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6b75_left;
     BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6b75_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6b75_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6b75_return_output := BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6b75_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1197_l1226_l1222_l1218_l1213_l1210_DUPLICATE_2e2a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1197_l1226_l1222_l1218_l1213_l1210_DUPLICATE_2e2a_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1226_l1222_l1218_l1213_l1210_DUPLICATE_fce1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1226_l1222_l1218_l1213_l1210_DUPLICATE_fce1_return_output := result.is_opc_done;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1197_c2_0b82] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1197_c2_0b82_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1218_c11_9469] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9469_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9469_left;
     BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9469_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9469_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9469_return_output := BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9469_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1213_c11_0665] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1213_c11_0665_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_0665_left;
     BIN_OP_EQ_uxn_opcodes_h_l1213_c11_0665_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_0665_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_0665_return_output := BIN_OP_EQ_uxn_opcodes_h_l1213_c11_0665_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1226_c11_f636] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1226_c11_f636_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_f636_left;
     BIN_OP_EQ_uxn_opcodes_h_l1226_c11_f636_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_f636_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_f636_return_output := BIN_OP_EQ_uxn_opcodes_h_l1226_c11_f636_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1228_c30_5448] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1228_c30_5448_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_5448_ins;
     sp_relative_shift_uxn_opcodes_h_l1228_c30_5448_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_5448_x;
     sp_relative_shift_uxn_opcodes_h_l1228_c30_5448_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_5448_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_5448_return_output := sp_relative_shift_uxn_opcodes_h_l1228_c30_5448_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1197_c2_0b82] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1197_c2_0b82_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1197_c6_453e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1197_c6_453e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_453e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1197_c6_453e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_453e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_453e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1197_c6_453e_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1197_c2_0b82] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1197_c2_0b82_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1226_l1222_l1218_l1213_l1210_DUPLICATE_d776 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1226_l1222_l1218_l1213_l1210_DUPLICATE_d776_return_output := result.is_stack_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1226_l1222_l1218_l1213_l1210_DUPLICATE_fe3c LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1226_l1222_l1218_l1213_l1210_DUPLICATE_fe3c_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1222_l1226_DUPLICATE_3977 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1222_l1226_DUPLICATE_3977_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1214_l1227_l1223_l1219_DUPLICATE_314a LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1214_l1227_l1223_l1219_DUPLICATE_314a_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1197_c2_0b82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_453e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_0b82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_453e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_0b82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_453e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_453e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_0b82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_453e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_0b82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_453e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_453e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_0b82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_453e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_0b82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_453e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_0b82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_453e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1197_c2_0b82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_453e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1210_c7_be40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6b75_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_be40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6b75_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_be40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6b75_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_be40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6b75_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_be40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6b75_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_be40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6b75_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1210_c7_be40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_6b75_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1213_c7_4f78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_0665_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4f78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_0665_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4f78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_0665_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4f78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_0665_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4f78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_0665_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4f78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_0665_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1213_c7_4f78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_0665_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1218_c7_d957_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9469_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d957_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9469_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d957_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9469_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d957_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9469_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d957_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9469_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d957_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9469_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1218_c7_d957_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9469_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1222_c7_566b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dff0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_566b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dff0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_566b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dff0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_566b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dff0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_566b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dff0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_566b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dff0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1226_c7_7b17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_f636_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_7b17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_f636_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_7b17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_f636_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_7b17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_f636_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_7b17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_f636_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_7b17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_f636_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_dc75_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1214_l1227_l1223_l1219_DUPLICATE_314a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_a038_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1214_l1227_l1223_l1219_DUPLICATE_314a_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_4ee3_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1214_l1227_l1223_l1219_DUPLICATE_314a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_be40_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1226_l1222_l1218_l1213_l1210_DUPLICATE_fe3c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4f78_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1226_l1222_l1218_l1213_l1210_DUPLICATE_fe3c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d957_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1226_l1222_l1218_l1213_l1210_DUPLICATE_fe3c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_566b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1226_l1222_l1218_l1213_l1210_DUPLICATE_fe3c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_7b17_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1226_l1222_l1218_l1213_l1210_DUPLICATE_fe3c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_be40_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1226_l1222_l1218_l1213_l1210_DUPLICATE_fce1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4f78_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1226_l1222_l1218_l1213_l1210_DUPLICATE_fce1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d957_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1226_l1222_l1218_l1213_l1210_DUPLICATE_fce1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_566b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1226_l1222_l1218_l1213_l1210_DUPLICATE_fce1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_7b17_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1226_l1222_l1218_l1213_l1210_DUPLICATE_fce1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_be40_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1226_l1222_l1218_l1213_l1210_DUPLICATE_d776_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4f78_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1226_l1222_l1218_l1213_l1210_DUPLICATE_d776_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d957_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1226_l1222_l1218_l1213_l1210_DUPLICATE_d776_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_566b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1226_l1222_l1218_l1213_l1210_DUPLICATE_d776_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_7b17_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1226_l1222_l1218_l1213_l1210_DUPLICATE_d776_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_566b_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1222_l1226_DUPLICATE_3977_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_7b17_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1222_l1226_DUPLICATE_3977_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1197_l1226_l1222_l1218_l1213_l1210_DUPLICATE_2e2a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_be40_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1197_l1226_l1222_l1218_l1213_l1210_DUPLICATE_2e2a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4f78_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1197_l1226_l1222_l1218_l1213_l1210_DUPLICATE_2e2a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d957_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1197_l1226_l1222_l1218_l1213_l1210_DUPLICATE_2e2a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_566b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1197_l1226_l1222_l1218_l1213_l1210_DUPLICATE_2e2a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_7b17_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1197_l1226_l1222_l1218_l1213_l1210_DUPLICATE_2e2a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1197_c2_0b82_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1197_c2_0b82_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1197_c2_0b82_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1197_c2_0b82_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_7b17_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_5448_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1226_c7_7b17] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_7b17_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_7b17_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_7b17_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_7b17_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_7b17_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_7b17_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_7b17_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_7b17_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1197_c2_0b82] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1197_c2_0b82] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_0b82_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_0b82_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1197_c2_0b82] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1219_c3_dc75] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1219_c3_dc75_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_dc75_left;
     BIN_OP_OR_uxn_opcodes_h_l1219_c3_dc75_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_dc75_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_dc75_return_output := BIN_OP_OR_uxn_opcodes_h_l1219_c3_dc75_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1226_c7_7b17] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_7b17_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_7b17_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_7b17_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_7b17_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_7b17_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_7b17_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_7b17_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_7b17_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1227_c3_a038] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1227_c3_a038_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_a038_left;
     BIN_OP_OR_uxn_opcodes_h_l1227_c3_a038_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_a038_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_a038_return_output := BIN_OP_OR_uxn_opcodes_h_l1227_c3_a038_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1197_c2_0b82] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_0b82_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_0b82_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1226_c7_7b17] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_7b17_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_7b17_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_7b17_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_7b17_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_7b17_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_7b17_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_7b17_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_7b17_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_4ee3 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_4ee3_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_4ee3_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_4ee3_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_4ee3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1226_c7_7b17] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_7b17_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_7b17_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_7b17_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_7b17_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_7b17_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_7b17_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_7b17_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_7b17_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1218_c7_d957_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_dc75_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_2176_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_a038_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1226_c7_7b17_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_a038_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1222_c7_566b_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_4ee3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1213_c7_4f78_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_4ee3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_566b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_7b17_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_566b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_7b17_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_566b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_7b17_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_566b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_7b17_return_output;
     -- n16_MUX[uxn_opcodes_h_l1226_c7_7b17] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1226_c7_7b17_cond <= VAR_n16_MUX_uxn_opcodes_h_l1226_c7_7b17_cond;
     n16_MUX_uxn_opcodes_h_l1226_c7_7b17_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1226_c7_7b17_iftrue;
     n16_MUX_uxn_opcodes_h_l1226_c7_7b17_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1226_c7_7b17_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1226_c7_7b17_return_output := n16_MUX_uxn_opcodes_h_l1226_c7_7b17_return_output;

     -- t16_MUX[uxn_opcodes_h_l1218_c7_d957] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1218_c7_d957_cond <= VAR_t16_MUX_uxn_opcodes_h_l1218_c7_d957_cond;
     t16_MUX_uxn_opcodes_h_l1218_c7_d957_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1218_c7_d957_iftrue;
     t16_MUX_uxn_opcodes_h_l1218_c7_d957_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1218_c7_d957_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1218_c7_d957_return_output := t16_MUX_uxn_opcodes_h_l1218_c7_d957_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1231_c21_2176] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1231_c21_2176_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_2176_left;
     BIN_OP_EQ_uxn_opcodes_h_l1231_c21_2176_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_2176_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_2176_return_output := BIN_OP_EQ_uxn_opcodes_h_l1231_c21_2176_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1222_c7_566b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_566b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_566b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_566b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_566b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_566b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_566b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_566b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_566b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1222_c7_566b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_566b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_566b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_566b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_566b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_566b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_566b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_566b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_566b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1222_c7_566b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_566b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_566b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_566b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_566b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_566b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_566b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_566b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_566b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1222_c7_566b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_566b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_566b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_566b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_566b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_566b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_566b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_566b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_566b_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1231_c21_426c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_2176_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1222_c7_566b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1226_c7_7b17_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d957_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_566b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d957_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_566b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d957_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_566b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d957_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_566b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1213_c7_4f78_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1218_c7_d957_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1218_c7_d957] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d957_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d957_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d957_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d957_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d957_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d957_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d957_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d957_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1218_c7_d957] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d957_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d957_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d957_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d957_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d957_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d957_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d957_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d957_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1218_c7_d957] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d957_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d957_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d957_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d957_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d957_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d957_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d957_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d957_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1218_c7_d957] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d957_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d957_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d957_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d957_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d957_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d957_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d957_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d957_return_output;

     -- t16_MUX[uxn_opcodes_h_l1213_c7_4f78] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1213_c7_4f78_cond <= VAR_t16_MUX_uxn_opcodes_h_l1213_c7_4f78_cond;
     t16_MUX_uxn_opcodes_h_l1213_c7_4f78_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1213_c7_4f78_iftrue;
     t16_MUX_uxn_opcodes_h_l1213_c7_4f78_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1213_c7_4f78_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1213_c7_4f78_return_output := t16_MUX_uxn_opcodes_h_l1213_c7_4f78_return_output;

     -- n16_MUX[uxn_opcodes_h_l1222_c7_566b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1222_c7_566b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1222_c7_566b_cond;
     n16_MUX_uxn_opcodes_h_l1222_c7_566b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1222_c7_566b_iftrue;
     n16_MUX_uxn_opcodes_h_l1222_c7_566b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1222_c7_566b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1222_c7_566b_return_output := n16_MUX_uxn_opcodes_h_l1222_c7_566b_return_output;

     -- MUX[uxn_opcodes_h_l1231_c21_426c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1231_c21_426c_cond <= VAR_MUX_uxn_opcodes_h_l1231_c21_426c_cond;
     MUX_uxn_opcodes_h_l1231_c21_426c_iftrue <= VAR_MUX_uxn_opcodes_h_l1231_c21_426c_iftrue;
     MUX_uxn_opcodes_h_l1231_c21_426c_iffalse <= VAR_MUX_uxn_opcodes_h_l1231_c21_426c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1231_c21_426c_return_output := MUX_uxn_opcodes_h_l1231_c21_426c_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_7b17_iftrue := VAR_MUX_uxn_opcodes_h_l1231_c21_426c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1218_c7_d957_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1222_c7_566b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4f78_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_d957_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4f78_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_d957_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4f78_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_d957_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4f78_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_d957_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1210_c7_be40_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1213_c7_4f78_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1213_c7_4f78] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4f78_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4f78_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4f78_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4f78_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4f78_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4f78_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4f78_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4f78_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1213_c7_4f78] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4f78_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4f78_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4f78_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4f78_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4f78_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4f78_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4f78_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4f78_return_output;

     -- t16_MUX[uxn_opcodes_h_l1210_c7_be40] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1210_c7_be40_cond <= VAR_t16_MUX_uxn_opcodes_h_l1210_c7_be40_cond;
     t16_MUX_uxn_opcodes_h_l1210_c7_be40_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1210_c7_be40_iftrue;
     t16_MUX_uxn_opcodes_h_l1210_c7_be40_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1210_c7_be40_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1210_c7_be40_return_output := t16_MUX_uxn_opcodes_h_l1210_c7_be40_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1226_c7_7b17] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1226_c7_7b17_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_7b17_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1226_c7_7b17_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_7b17_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1226_c7_7b17_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_7b17_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_7b17_return_output := result_u8_value_MUX_uxn_opcodes_h_l1226_c7_7b17_return_output;

     -- n16_MUX[uxn_opcodes_h_l1218_c7_d957] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1218_c7_d957_cond <= VAR_n16_MUX_uxn_opcodes_h_l1218_c7_d957_cond;
     n16_MUX_uxn_opcodes_h_l1218_c7_d957_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1218_c7_d957_iftrue;
     n16_MUX_uxn_opcodes_h_l1218_c7_d957_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1218_c7_d957_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1218_c7_d957_return_output := n16_MUX_uxn_opcodes_h_l1218_c7_d957_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1213_c7_4f78] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4f78_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4f78_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4f78_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4f78_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4f78_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4f78_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4f78_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4f78_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1213_c7_4f78] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4f78_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4f78_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4f78_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4f78_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4f78_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4f78_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4f78_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4f78_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1213_c7_4f78_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1218_c7_d957_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_be40_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_4f78_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_be40_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_4f78_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_be40_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_4f78_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_be40_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_4f78_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_566b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_7b17_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1210_c7_be40_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1210_c7_be40] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_be40_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_be40_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_be40_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_be40_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_be40_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_be40_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_be40_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_be40_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1222_c7_566b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1222_c7_566b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_566b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1222_c7_566b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_566b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1222_c7_566b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_566b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_566b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1222_c7_566b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1213_c7_4f78] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1213_c7_4f78_cond <= VAR_n16_MUX_uxn_opcodes_h_l1213_c7_4f78_cond;
     n16_MUX_uxn_opcodes_h_l1213_c7_4f78_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1213_c7_4f78_iftrue;
     n16_MUX_uxn_opcodes_h_l1213_c7_4f78_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1213_c7_4f78_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1213_c7_4f78_return_output := n16_MUX_uxn_opcodes_h_l1213_c7_4f78_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1210_c7_be40] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_be40_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_be40_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_be40_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_be40_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_be40_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_be40_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_be40_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_be40_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1210_c7_be40] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_be40_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_be40_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_be40_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_be40_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_be40_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_be40_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_be40_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_be40_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1210_c7_be40] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_be40_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_be40_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_be40_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_be40_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_be40_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_be40_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_be40_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_be40_return_output;

     -- t16_MUX[uxn_opcodes_h_l1197_c2_0b82] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1197_c2_0b82_cond <= VAR_t16_MUX_uxn_opcodes_h_l1197_c2_0b82_cond;
     t16_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue;
     t16_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output := t16_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1210_c7_be40_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1213_c7_4f78_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_be40_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_be40_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_be40_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_be40_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d957_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_566b_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1197_c2_0b82] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_0b82_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_0b82_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1218_c7_d957] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d957_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d957_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d957_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d957_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d957_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d957_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d957_return_output := result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d957_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1197_c2_0b82] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_0b82_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_0b82_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1197_c2_0b82] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_0b82_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_0b82_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1197_c2_0b82] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_0b82_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_0b82_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output;

     -- n16_MUX[uxn_opcodes_h_l1210_c7_be40] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1210_c7_be40_cond <= VAR_n16_MUX_uxn_opcodes_h_l1210_c7_be40_cond;
     n16_MUX_uxn_opcodes_h_l1210_c7_be40_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1210_c7_be40_iftrue;
     n16_MUX_uxn_opcodes_h_l1210_c7_be40_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1210_c7_be40_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1210_c7_be40_return_output := n16_MUX_uxn_opcodes_h_l1210_c7_be40_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1210_c7_be40_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4f78_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_d957_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1213_c7_4f78] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4f78_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4f78_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4f78_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4f78_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4f78_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4f78_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4f78_return_output := result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4f78_return_output;

     -- n16_MUX[uxn_opcodes_h_l1197_c2_0b82] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1197_c2_0b82_cond <= VAR_n16_MUX_uxn_opcodes_h_l1197_c2_0b82_cond;
     n16_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue;
     n16_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output := n16_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_be40_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_4f78_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1210_c7_be40] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1210_c7_be40_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_be40_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1210_c7_be40_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_be40_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1210_c7_be40_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_be40_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_be40_return_output := result_u8_value_MUX_uxn_opcodes_h_l1210_c7_be40_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_be40_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1197_c2_0b82] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1197_c2_0b82_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_0b82_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_0b82_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_0b82_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output := result_u8_value_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l1235_l1193_DUPLICATE_f226 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l1235_l1193_DUPLICATE_f226_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b856(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_0b82_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l1235_l1193_DUPLICATE_f226_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l1235_l1193_DUPLICATE_f226_return_output;
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
