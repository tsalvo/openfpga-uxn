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
-- BIN_OP_EQ[uxn_opcodes_h_l1197_c6_c9df]
signal BIN_OP_EQ_uxn_opcodes_h_l1197_c6_c9df_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1197_c6_c9df_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1197_c6_c9df_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1197_c2_21c7]
signal t16_MUX_uxn_opcodes_h_l1197_c2_21c7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1197_c2_21c7]
signal n16_MUX_uxn_opcodes_h_l1197_c2_21c7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1197_c2_21c7]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1197_c2_21c7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_21c7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1197_c2_21c7]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1197_c2_21c7]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_21c7_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1197_c2_21c7]
signal result_u8_value_MUX_uxn_opcodes_h_l1197_c2_21c7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1197_c2_21c7]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_21c7_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1197_c2_21c7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_21c7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1197_c2_21c7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_21c7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1197_c2_21c7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_21c7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1210_c11_0fb6]
signal BIN_OP_EQ_uxn_opcodes_h_l1210_c11_0fb6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1210_c11_0fb6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1210_c11_0fb6_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1210_c7_aa5c]
signal t16_MUX_uxn_opcodes_h_l1210_c7_aa5c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1210_c7_aa5c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1210_c7_aa5c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1210_c7_aa5c_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1210_c7_aa5c]
signal n16_MUX_uxn_opcodes_h_l1210_c7_aa5c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1210_c7_aa5c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1210_c7_aa5c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1210_c7_aa5c_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1210_c7_aa5c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_aa5c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_aa5c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_aa5c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_aa5c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1210_c7_aa5c]
signal result_u8_value_MUX_uxn_opcodes_h_l1210_c7_aa5c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1210_c7_aa5c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1210_c7_aa5c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1210_c7_aa5c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1210_c7_aa5c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_aa5c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_aa5c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_aa5c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_aa5c_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1210_c7_aa5c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_aa5c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_aa5c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_aa5c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_aa5c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1210_c7_aa5c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_aa5c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_aa5c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_aa5c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_aa5c_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1213_c11_f719]
signal BIN_OP_EQ_uxn_opcodes_h_l1213_c11_f719_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1213_c11_f719_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1213_c11_f719_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1213_c7_133e]
signal t16_MUX_uxn_opcodes_h_l1213_c7_133e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1213_c7_133e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1213_c7_133e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1213_c7_133e_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1213_c7_133e]
signal n16_MUX_uxn_opcodes_h_l1213_c7_133e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1213_c7_133e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1213_c7_133e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1213_c7_133e_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1213_c7_133e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_133e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_133e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_133e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_133e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1213_c7_133e]
signal result_u8_value_MUX_uxn_opcodes_h_l1213_c7_133e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1213_c7_133e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1213_c7_133e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1213_c7_133e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1213_c7_133e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_133e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_133e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_133e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_133e_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1213_c7_133e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_133e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_133e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_133e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_133e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1213_c7_133e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_133e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_133e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_133e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_133e_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1218_c11_b0b6]
signal BIN_OP_EQ_uxn_opcodes_h_l1218_c11_b0b6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1218_c11_b0b6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1218_c11_b0b6_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1218_c7_310e]
signal t16_MUX_uxn_opcodes_h_l1218_c7_310e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1218_c7_310e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1218_c7_310e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1218_c7_310e_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1218_c7_310e]
signal n16_MUX_uxn_opcodes_h_l1218_c7_310e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1218_c7_310e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1218_c7_310e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1218_c7_310e_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1218_c7_310e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_310e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_310e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_310e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_310e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1218_c7_310e]
signal result_u8_value_MUX_uxn_opcodes_h_l1218_c7_310e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1218_c7_310e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1218_c7_310e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1218_c7_310e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1218_c7_310e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_310e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_310e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_310e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_310e_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1218_c7_310e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_310e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_310e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_310e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_310e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1218_c7_310e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_310e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_310e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_310e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_310e_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1219_c3_a4a3]
signal BIN_OP_OR_uxn_opcodes_h_l1219_c3_a4a3_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1219_c3_a4a3_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1219_c3_a4a3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1222_c11_7ba0]
signal BIN_OP_EQ_uxn_opcodes_h_l1222_c11_7ba0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1222_c11_7ba0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1222_c11_7ba0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1222_c7_33d9]
signal n16_MUX_uxn_opcodes_h_l1222_c7_33d9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1222_c7_33d9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1222_c7_33d9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1222_c7_33d9_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1222_c7_33d9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_33d9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_33d9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_33d9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_33d9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1222_c7_33d9]
signal result_u8_value_MUX_uxn_opcodes_h_l1222_c7_33d9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1222_c7_33d9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1222_c7_33d9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1222_c7_33d9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1222_c7_33d9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_33d9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_33d9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_33d9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_33d9_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1222_c7_33d9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_33d9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_33d9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_33d9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_33d9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1222_c7_33d9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_33d9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_33d9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_33d9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_33d9_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1226_c11_205d]
signal BIN_OP_EQ_uxn_opcodes_h_l1226_c11_205d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1226_c11_205d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1226_c11_205d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1226_c7_ec76]
signal n16_MUX_uxn_opcodes_h_l1226_c7_ec76_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1226_c7_ec76_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1226_c7_ec76_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1226_c7_ec76_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1226_c7_ec76]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ec76_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ec76_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ec76_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ec76_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1226_c7_ec76]
signal result_u8_value_MUX_uxn_opcodes_h_l1226_c7_ec76_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1226_c7_ec76_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1226_c7_ec76_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1226_c7_ec76_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1226_c7_ec76]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ec76_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ec76_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ec76_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ec76_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1226_c7_ec76]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ec76_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ec76_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ec76_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ec76_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1226_c7_ec76]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ec76_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ec76_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ec76_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ec76_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1227_c3_0fa9]
signal BIN_OP_OR_uxn_opcodes_h_l1227_c3_0fa9_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1227_c3_0fa9_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1227_c3_0fa9_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1228_c30_8885]
signal sp_relative_shift_uxn_opcodes_h_l1228_c30_8885_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1228_c30_8885_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1228_c30_8885_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1228_c30_8885_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1231_c21_c3bb]
signal BIN_OP_EQ_uxn_opcodes_h_l1231_c21_c3bb_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1231_c21_c3bb_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1231_c21_c3bb_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1231_c21_483f]
signal MUX_uxn_opcodes_h_l1231_c21_483f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1231_c21_483f_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1231_c21_483f_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1231_c21_483f_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_188d
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_188d_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_188d_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_ram_write := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_opc_done := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1197_c6_c9df
BIN_OP_EQ_uxn_opcodes_h_l1197_c6_c9df : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1197_c6_c9df_left,
BIN_OP_EQ_uxn_opcodes_h_l1197_c6_c9df_right,
BIN_OP_EQ_uxn_opcodes_h_l1197_c6_c9df_return_output);

-- t16_MUX_uxn_opcodes_h_l1197_c2_21c7
t16_MUX_uxn_opcodes_h_l1197_c2_21c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1197_c2_21c7_cond,
t16_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue,
t16_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse,
t16_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output);

-- n16_MUX_uxn_opcodes_h_l1197_c2_21c7
n16_MUX_uxn_opcodes_h_l1197_c2_21c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1197_c2_21c7_cond,
n16_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue,
n16_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse,
n16_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_21c7
result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_21c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_21c7
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_21c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_21c7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_21c7
result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_21c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_21c7
result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_21c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_21c7_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1197_c2_21c7
result_u8_value_MUX_uxn_opcodes_h_l1197_c2_21c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1197_c2_21c7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_21c7
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_21c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_21c7_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_21c7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_21c7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_21c7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_21c7
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_21c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_21c7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_21c7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_21c7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_21c7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1210_c11_0fb6
BIN_OP_EQ_uxn_opcodes_h_l1210_c11_0fb6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1210_c11_0fb6_left,
BIN_OP_EQ_uxn_opcodes_h_l1210_c11_0fb6_right,
BIN_OP_EQ_uxn_opcodes_h_l1210_c11_0fb6_return_output);

-- t16_MUX_uxn_opcodes_h_l1210_c7_aa5c
t16_MUX_uxn_opcodes_h_l1210_c7_aa5c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1210_c7_aa5c_cond,
t16_MUX_uxn_opcodes_h_l1210_c7_aa5c_iftrue,
t16_MUX_uxn_opcodes_h_l1210_c7_aa5c_iffalse,
t16_MUX_uxn_opcodes_h_l1210_c7_aa5c_return_output);

-- n16_MUX_uxn_opcodes_h_l1210_c7_aa5c
n16_MUX_uxn_opcodes_h_l1210_c7_aa5c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1210_c7_aa5c_cond,
n16_MUX_uxn_opcodes_h_l1210_c7_aa5c_iftrue,
n16_MUX_uxn_opcodes_h_l1210_c7_aa5c_iffalse,
n16_MUX_uxn_opcodes_h_l1210_c7_aa5c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_aa5c
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_aa5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_aa5c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_aa5c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_aa5c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_aa5c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1210_c7_aa5c
result_u8_value_MUX_uxn_opcodes_h_l1210_c7_aa5c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1210_c7_aa5c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1210_c7_aa5c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1210_c7_aa5c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1210_c7_aa5c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_aa5c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_aa5c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_aa5c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_aa5c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_aa5c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_aa5c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_aa5c
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_aa5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_aa5c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_aa5c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_aa5c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_aa5c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_aa5c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_aa5c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_aa5c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_aa5c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_aa5c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_aa5c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1213_c11_f719
BIN_OP_EQ_uxn_opcodes_h_l1213_c11_f719 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1213_c11_f719_left,
BIN_OP_EQ_uxn_opcodes_h_l1213_c11_f719_right,
BIN_OP_EQ_uxn_opcodes_h_l1213_c11_f719_return_output);

-- t16_MUX_uxn_opcodes_h_l1213_c7_133e
t16_MUX_uxn_opcodes_h_l1213_c7_133e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1213_c7_133e_cond,
t16_MUX_uxn_opcodes_h_l1213_c7_133e_iftrue,
t16_MUX_uxn_opcodes_h_l1213_c7_133e_iffalse,
t16_MUX_uxn_opcodes_h_l1213_c7_133e_return_output);

-- n16_MUX_uxn_opcodes_h_l1213_c7_133e
n16_MUX_uxn_opcodes_h_l1213_c7_133e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1213_c7_133e_cond,
n16_MUX_uxn_opcodes_h_l1213_c7_133e_iftrue,
n16_MUX_uxn_opcodes_h_l1213_c7_133e_iffalse,
n16_MUX_uxn_opcodes_h_l1213_c7_133e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_133e
result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_133e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_133e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_133e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_133e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_133e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1213_c7_133e
result_u8_value_MUX_uxn_opcodes_h_l1213_c7_133e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1213_c7_133e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1213_c7_133e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1213_c7_133e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1213_c7_133e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_133e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_133e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_133e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_133e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_133e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_133e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_133e
result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_133e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_133e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_133e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_133e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_133e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_133e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_133e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_133e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_133e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_133e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_133e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1218_c11_b0b6
BIN_OP_EQ_uxn_opcodes_h_l1218_c11_b0b6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1218_c11_b0b6_left,
BIN_OP_EQ_uxn_opcodes_h_l1218_c11_b0b6_right,
BIN_OP_EQ_uxn_opcodes_h_l1218_c11_b0b6_return_output);

-- t16_MUX_uxn_opcodes_h_l1218_c7_310e
t16_MUX_uxn_opcodes_h_l1218_c7_310e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1218_c7_310e_cond,
t16_MUX_uxn_opcodes_h_l1218_c7_310e_iftrue,
t16_MUX_uxn_opcodes_h_l1218_c7_310e_iffalse,
t16_MUX_uxn_opcodes_h_l1218_c7_310e_return_output);

-- n16_MUX_uxn_opcodes_h_l1218_c7_310e
n16_MUX_uxn_opcodes_h_l1218_c7_310e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1218_c7_310e_cond,
n16_MUX_uxn_opcodes_h_l1218_c7_310e_iftrue,
n16_MUX_uxn_opcodes_h_l1218_c7_310e_iffalse,
n16_MUX_uxn_opcodes_h_l1218_c7_310e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_310e
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_310e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_310e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_310e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_310e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_310e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1218_c7_310e
result_u8_value_MUX_uxn_opcodes_h_l1218_c7_310e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1218_c7_310e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1218_c7_310e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1218_c7_310e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1218_c7_310e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_310e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_310e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_310e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_310e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_310e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_310e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_310e
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_310e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_310e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_310e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_310e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_310e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_310e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_310e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_310e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_310e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_310e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_310e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1219_c3_a4a3
BIN_OP_OR_uxn_opcodes_h_l1219_c3_a4a3 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1219_c3_a4a3_left,
BIN_OP_OR_uxn_opcodes_h_l1219_c3_a4a3_right,
BIN_OP_OR_uxn_opcodes_h_l1219_c3_a4a3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1222_c11_7ba0
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_7ba0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_7ba0_left,
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_7ba0_right,
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_7ba0_return_output);

-- n16_MUX_uxn_opcodes_h_l1222_c7_33d9
n16_MUX_uxn_opcodes_h_l1222_c7_33d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1222_c7_33d9_cond,
n16_MUX_uxn_opcodes_h_l1222_c7_33d9_iftrue,
n16_MUX_uxn_opcodes_h_l1222_c7_33d9_iffalse,
n16_MUX_uxn_opcodes_h_l1222_c7_33d9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_33d9
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_33d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_33d9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_33d9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_33d9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_33d9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1222_c7_33d9
result_u8_value_MUX_uxn_opcodes_h_l1222_c7_33d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1222_c7_33d9_cond,
result_u8_value_MUX_uxn_opcodes_h_l1222_c7_33d9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1222_c7_33d9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1222_c7_33d9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_33d9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_33d9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_33d9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_33d9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_33d9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_33d9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_33d9
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_33d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_33d9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_33d9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_33d9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_33d9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_33d9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_33d9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_33d9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_33d9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_33d9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_33d9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1226_c11_205d
BIN_OP_EQ_uxn_opcodes_h_l1226_c11_205d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1226_c11_205d_left,
BIN_OP_EQ_uxn_opcodes_h_l1226_c11_205d_right,
BIN_OP_EQ_uxn_opcodes_h_l1226_c11_205d_return_output);

-- n16_MUX_uxn_opcodes_h_l1226_c7_ec76
n16_MUX_uxn_opcodes_h_l1226_c7_ec76 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1226_c7_ec76_cond,
n16_MUX_uxn_opcodes_h_l1226_c7_ec76_iftrue,
n16_MUX_uxn_opcodes_h_l1226_c7_ec76_iffalse,
n16_MUX_uxn_opcodes_h_l1226_c7_ec76_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ec76
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ec76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ec76_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ec76_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ec76_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ec76_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1226_c7_ec76
result_u8_value_MUX_uxn_opcodes_h_l1226_c7_ec76 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1226_c7_ec76_cond,
result_u8_value_MUX_uxn_opcodes_h_l1226_c7_ec76_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1226_c7_ec76_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1226_c7_ec76_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ec76
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ec76 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ec76_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ec76_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ec76_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ec76_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ec76
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ec76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ec76_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ec76_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ec76_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ec76_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ec76
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ec76 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ec76_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ec76_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ec76_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ec76_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1227_c3_0fa9
BIN_OP_OR_uxn_opcodes_h_l1227_c3_0fa9 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1227_c3_0fa9_left,
BIN_OP_OR_uxn_opcodes_h_l1227_c3_0fa9_right,
BIN_OP_OR_uxn_opcodes_h_l1227_c3_0fa9_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1228_c30_8885
sp_relative_shift_uxn_opcodes_h_l1228_c30_8885 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1228_c30_8885_ins,
sp_relative_shift_uxn_opcodes_h_l1228_c30_8885_x,
sp_relative_shift_uxn_opcodes_h_l1228_c30_8885_y,
sp_relative_shift_uxn_opcodes_h_l1228_c30_8885_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1231_c21_c3bb
BIN_OP_EQ_uxn_opcodes_h_l1231_c21_c3bb : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1231_c21_c3bb_left,
BIN_OP_EQ_uxn_opcodes_h_l1231_c21_c3bb_right,
BIN_OP_EQ_uxn_opcodes_h_l1231_c21_c3bb_return_output);

-- MUX_uxn_opcodes_h_l1231_c21_483f
MUX_uxn_opcodes_h_l1231_c21_483f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1231_c21_483f_cond,
MUX_uxn_opcodes_h_l1231_c21_483f_iftrue,
MUX_uxn_opcodes_h_l1231_c21_483f_iffalse,
MUX_uxn_opcodes_h_l1231_c21_483f_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_188d
CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_188d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_188d_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_188d_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1197_c6_c9df_return_output,
 t16_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output,
 n16_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1210_c11_0fb6_return_output,
 t16_MUX_uxn_opcodes_h_l1210_c7_aa5c_return_output,
 n16_MUX_uxn_opcodes_h_l1210_c7_aa5c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_aa5c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1210_c7_aa5c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_aa5c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_aa5c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_aa5c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1213_c11_f719_return_output,
 t16_MUX_uxn_opcodes_h_l1213_c7_133e_return_output,
 n16_MUX_uxn_opcodes_h_l1213_c7_133e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_133e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1213_c7_133e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_133e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_133e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_133e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1218_c11_b0b6_return_output,
 t16_MUX_uxn_opcodes_h_l1218_c7_310e_return_output,
 n16_MUX_uxn_opcodes_h_l1218_c7_310e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_310e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1218_c7_310e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_310e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_310e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_310e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1219_c3_a4a3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1222_c11_7ba0_return_output,
 n16_MUX_uxn_opcodes_h_l1222_c7_33d9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_33d9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1222_c7_33d9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_33d9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_33d9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_33d9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1226_c11_205d_return_output,
 n16_MUX_uxn_opcodes_h_l1226_c7_ec76_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ec76_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1226_c7_ec76_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ec76_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ec76_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ec76_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1227_c3_0fa9_return_output,
 sp_relative_shift_uxn_opcodes_h_l1228_c30_8885_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1231_c21_c3bb_return_output,
 MUX_uxn_opcodes_h_l1231_c21_483f_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_188d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_c9df_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_c9df_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_c9df_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1210_c7_aa5c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1197_c2_21c7_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1210_c7_aa5c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c2_21c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1197_c2_21c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_aa5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_21c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1197_c2_21c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1197_c2_21c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_21c7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_aa5c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_21c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1197_c2_21c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_21c7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1202_c3_766b : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_aa5c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_21c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_aa5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_21c7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1207_c3_41f0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_aa5c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_21c7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_0fb6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_0fb6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_0fb6_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1210_c7_aa5c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1210_c7_aa5c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1213_c7_133e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1210_c7_aa5c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1210_c7_aa5c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1210_c7_aa5c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1213_c7_133e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1210_c7_aa5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_aa5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_aa5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_133e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_aa5c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_aa5c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_aa5c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_133e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_aa5c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_aa5c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_aa5c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_133e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_aa5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_aa5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_aa5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_133e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_aa5c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_aa5c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1211_c3_1cd3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_aa5c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_133e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_aa5c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_f719_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_f719_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_f719_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1213_c7_133e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1213_c7_133e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1218_c7_310e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1213_c7_133e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1213_c7_133e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1213_c7_133e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1218_c7_310e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1213_c7_133e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_133e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_133e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_310e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_133e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_133e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_133e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_310e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_133e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_133e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_133e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_310e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_133e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_133e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_133e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_310e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_133e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_133e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1216_c3_8151 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_133e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_310e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_133e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_b0b6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_b0b6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_b0b6_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1218_c7_310e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1218_c7_310e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1218_c7_310e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1218_c7_310e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1218_c7_310e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1222_c7_33d9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1218_c7_310e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_310e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_310e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_33d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_310e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_310e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_310e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_33d9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_310e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_310e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_310e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_33d9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_310e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_310e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_310e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_33d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_310e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_310e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1220_c3_a946 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_310e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_33d9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_310e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_a4a3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_a4a3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_a4a3_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_7ba0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_7ba0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_7ba0_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1222_c7_33d9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1222_c7_33d9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1226_c7_ec76_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1222_c7_33d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_33d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_33d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ec76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_33d9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_33d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_33d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_ec76_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_33d9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_33d9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_33d9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ec76_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_33d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_33d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_33d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ec76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_33d9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_33d9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_33d9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ec76_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_33d9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_205d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_205d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_205d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1226_c7_ec76_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1226_c7_ec76_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1226_c7_ec76_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ec76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ec76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ec76_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_ec76_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_ec76_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_ec76_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ec76_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ec76_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ec76_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ec76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ec76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ec76_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ec76_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1230_c3_da43 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ec76_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ec76_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_0fa9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_0fa9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_0fa9_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_8885_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_8885_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_8885_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_8885_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1231_c21_483f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_c3bb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_c3bb_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_c3bb_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1231_c21_483f_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1231_c21_483f_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1231_c21_483f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1197_l1226_l1222_l1218_l1213_l1210_DUPLICATE_cd2c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1226_l1222_l1218_l1213_l1210_DUPLICATE_01c9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1226_l1222_l1218_l1213_l1210_DUPLICATE_e6b9_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1226_l1222_l1218_l1213_l1210_DUPLICATE_5342_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1214_l1219_l1227_l1223_DUPLICATE_e652_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_188d_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_188d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1222_l1226_DUPLICATE_de9c_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l1193_l1235_DUPLICATE_1579_return_output : opcode_result_t;
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
     VAR_MUX_uxn_opcodes_h_l1231_c21_483f_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ec76_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1220_c3_a946 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_310e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1220_c3_a946;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1211_c3_1cd3 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_aa5c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1211_c3_1cd3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_0fb6_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1202_c3_766b := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1202_c3_766b;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ec76_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1231_c21_483f_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1216_c3_8151 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_133e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1216_c3_8151;
     VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_8885_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_c9df_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1207_c3_41f0 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1207_c3_41f0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_b0b6_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_205d_right := to_unsigned(5, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_f719_right := to_unsigned(2, 2);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_8885_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1230_c3_da43 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ec76_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1230_c3_da43;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_7ba0_right := to_unsigned(4, 3);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_8885_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_0fa9_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1210_c7_aa5c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1213_c7_133e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1218_c7_310e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1226_c7_ec76_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_c9df_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_0fb6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_f719_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_b0b6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_7ba0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_205d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_c3bb_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_a4a3_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1210_c7_aa5c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1218_c7_310e_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1218_c11_b0b6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1218_c11_b0b6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_b0b6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1218_c11_b0b6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_b0b6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_b0b6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1218_c11_b0b6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1222_c11_7ba0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1222_c11_7ba0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_7ba0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1222_c11_7ba0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_7ba0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_7ba0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1222_c11_7ba0_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1228_c30_8885] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1228_c30_8885_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_8885_ins;
     sp_relative_shift_uxn_opcodes_h_l1228_c30_8885_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_8885_x;
     sp_relative_shift_uxn_opcodes_h_l1228_c30_8885_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_8885_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_8885_return_output := sp_relative_shift_uxn_opcodes_h_l1228_c30_8885_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1197_c2_21c7] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1197_c2_21c7_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1226_l1222_l1218_l1213_l1210_DUPLICATE_5342 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1226_l1222_l1218_l1213_l1210_DUPLICATE_5342_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1210_c11_0fb6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1210_c11_0fb6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_0fb6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1210_c11_0fb6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_0fb6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_0fb6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1210_c11_0fb6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1197_c6_c9df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1197_c6_c9df_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_c9df_left;
     BIN_OP_EQ_uxn_opcodes_h_l1197_c6_c9df_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_c9df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_c9df_return_output := BIN_OP_EQ_uxn_opcodes_h_l1197_c6_c9df_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1197_l1226_l1222_l1218_l1213_l1210_DUPLICATE_cd2c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1197_l1226_l1222_l1218_l1213_l1210_DUPLICATE_cd2c_return_output := result.u8_value;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1197_c2_21c7] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1197_c2_21c7_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1222_l1226_DUPLICATE_de9c LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1222_l1226_DUPLICATE_de9c_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1226_c11_205d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1226_c11_205d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_205d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1226_c11_205d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_205d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_205d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1226_c11_205d_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1226_l1222_l1218_l1213_l1210_DUPLICATE_e6b9 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1226_l1222_l1218_l1213_l1210_DUPLICATE_e6b9_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1213_c11_f719] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1213_c11_f719_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_f719_left;
     BIN_OP_EQ_uxn_opcodes_h_l1213_c11_f719_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_f719_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_f719_return_output := BIN_OP_EQ_uxn_opcodes_h_l1213_c11_f719_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1226_l1222_l1218_l1213_l1210_DUPLICATE_01c9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1226_l1222_l1218_l1213_l1210_DUPLICATE_01c9_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1214_l1219_l1227_l1223_DUPLICATE_e652 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1214_l1219_l1227_l1223_DUPLICATE_e652_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1197_c2_21c7] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1197_c2_21c7_return_output := result.is_ram_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1197_c2_21c7] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1197_c2_21c7_return_output := result.is_vram_write;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1197_c2_21c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_c9df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_21c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_c9df_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_21c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_c9df_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_c9df_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_21c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_c9df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_21c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_c9df_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_c9df_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_21c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_c9df_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_21c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_c9df_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_21c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_c9df_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1197_c2_21c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_c9df_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1210_c7_aa5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_0fb6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_aa5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_0fb6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_aa5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_0fb6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_aa5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_0fb6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_aa5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_0fb6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_aa5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_0fb6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1210_c7_aa5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_0fb6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1213_c7_133e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_f719_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_133e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_f719_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_133e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_f719_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_133e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_f719_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_133e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_f719_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_133e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_f719_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1213_c7_133e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_f719_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1218_c7_310e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_b0b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_310e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_b0b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_310e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_b0b6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_310e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_b0b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_310e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_b0b6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_310e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_b0b6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1218_c7_310e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_b0b6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1222_c7_33d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_7ba0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_33d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_7ba0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_33d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_7ba0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_33d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_7ba0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_33d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_7ba0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_33d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_7ba0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1226_c7_ec76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_205d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ec76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_205d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ec76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_205d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ec76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_205d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ec76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_205d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_ec76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_205d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_a4a3_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1214_l1219_l1227_l1223_DUPLICATE_e652_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_0fa9_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1214_l1219_l1227_l1223_DUPLICATE_e652_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_188d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1214_l1219_l1227_l1223_DUPLICATE_e652_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_aa5c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1226_l1222_l1218_l1213_l1210_DUPLICATE_e6b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_133e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1226_l1222_l1218_l1213_l1210_DUPLICATE_e6b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_310e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1226_l1222_l1218_l1213_l1210_DUPLICATE_e6b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_33d9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1226_l1222_l1218_l1213_l1210_DUPLICATE_e6b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ec76_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1226_l1222_l1218_l1213_l1210_DUPLICATE_e6b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_aa5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1226_l1222_l1218_l1213_l1210_DUPLICATE_5342_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_133e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1226_l1222_l1218_l1213_l1210_DUPLICATE_5342_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_310e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1226_l1222_l1218_l1213_l1210_DUPLICATE_5342_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_33d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1226_l1222_l1218_l1213_l1210_DUPLICATE_5342_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ec76_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1226_l1222_l1218_l1213_l1210_DUPLICATE_5342_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_aa5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1226_l1222_l1218_l1213_l1210_DUPLICATE_01c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_133e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1226_l1222_l1218_l1213_l1210_DUPLICATE_01c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_310e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1226_l1222_l1218_l1213_l1210_DUPLICATE_01c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_33d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1226_l1222_l1218_l1213_l1210_DUPLICATE_01c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ec76_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1226_l1222_l1218_l1213_l1210_DUPLICATE_01c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_33d9_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1222_l1226_DUPLICATE_de9c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ec76_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1222_l1226_DUPLICATE_de9c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1197_l1226_l1222_l1218_l1213_l1210_DUPLICATE_cd2c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_aa5c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1197_l1226_l1222_l1218_l1213_l1210_DUPLICATE_cd2c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_133e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1197_l1226_l1222_l1218_l1213_l1210_DUPLICATE_cd2c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_310e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1197_l1226_l1222_l1218_l1213_l1210_DUPLICATE_cd2c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_33d9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1197_l1226_l1222_l1218_l1213_l1210_DUPLICATE_cd2c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_ec76_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1197_l1226_l1222_l1218_l1213_l1210_DUPLICATE_cd2c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1197_c2_21c7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1197_c2_21c7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1197_c2_21c7_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1197_c2_21c7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ec76_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_8885_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1219_c3_a4a3] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1219_c3_a4a3_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_a4a3_left;
     BIN_OP_OR_uxn_opcodes_h_l1219_c3_a4a3_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_a4a3_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_a4a3_return_output := BIN_OP_OR_uxn_opcodes_h_l1219_c3_a4a3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1226_c7_ec76] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ec76_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ec76_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ec76_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ec76_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ec76_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ec76_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ec76_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ec76_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1226_c7_ec76] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ec76_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ec76_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ec76_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ec76_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ec76_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ec76_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ec76_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ec76_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_188d LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_188d_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_188d_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_188d_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_188d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1227_c3_0fa9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1227_c3_0fa9_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_0fa9_left;
     BIN_OP_OR_uxn_opcodes_h_l1227_c3_0fa9_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_0fa9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_0fa9_return_output := BIN_OP_OR_uxn_opcodes_h_l1227_c3_0fa9_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1197_c2_21c7] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1226_c7_ec76] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ec76_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ec76_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ec76_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ec76_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ec76_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ec76_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ec76_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ec76_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1197_c2_21c7] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_21c7_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_21c7_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1197_c2_21c7] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_21c7_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_21c7_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1226_c7_ec76] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ec76_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ec76_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ec76_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ec76_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ec76_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ec76_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ec76_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ec76_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1197_c2_21c7] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1218_c7_310e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_a4a3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_c3bb_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_0fa9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1226_c7_ec76_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_0fa9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1222_c7_33d9_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_188d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1213_c7_133e_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_188d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_33d9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_ec76_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_33d9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_ec76_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_33d9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_ec76_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_33d9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_ec76_return_output;
     -- BIN_OP_EQ[uxn_opcodes_h_l1231_c21_c3bb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1231_c21_c3bb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_c3bb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1231_c21_c3bb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_c3bb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_c3bb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1231_c21_c3bb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1222_c7_33d9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_33d9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_33d9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_33d9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_33d9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_33d9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_33d9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_33d9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_33d9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1222_c7_33d9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_33d9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_33d9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_33d9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_33d9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_33d9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_33d9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_33d9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_33d9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1222_c7_33d9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_33d9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_33d9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_33d9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_33d9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_33d9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_33d9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_33d9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_33d9_return_output;

     -- n16_MUX[uxn_opcodes_h_l1226_c7_ec76] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1226_c7_ec76_cond <= VAR_n16_MUX_uxn_opcodes_h_l1226_c7_ec76_cond;
     n16_MUX_uxn_opcodes_h_l1226_c7_ec76_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1226_c7_ec76_iftrue;
     n16_MUX_uxn_opcodes_h_l1226_c7_ec76_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1226_c7_ec76_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1226_c7_ec76_return_output := n16_MUX_uxn_opcodes_h_l1226_c7_ec76_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1222_c7_33d9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_33d9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_33d9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_33d9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_33d9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_33d9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_33d9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_33d9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_33d9_return_output;

     -- t16_MUX[uxn_opcodes_h_l1218_c7_310e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1218_c7_310e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1218_c7_310e_cond;
     t16_MUX_uxn_opcodes_h_l1218_c7_310e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1218_c7_310e_iftrue;
     t16_MUX_uxn_opcodes_h_l1218_c7_310e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1218_c7_310e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1218_c7_310e_return_output := t16_MUX_uxn_opcodes_h_l1218_c7_310e_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1231_c21_483f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_c3bb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1222_c7_33d9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1226_c7_ec76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_310e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_33d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_310e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_33d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_310e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_33d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_310e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_33d9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1213_c7_133e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1218_c7_310e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1218_c7_310e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_310e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_310e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_310e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_310e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_310e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_310e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_310e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_310e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1222_c7_33d9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1222_c7_33d9_cond <= VAR_n16_MUX_uxn_opcodes_h_l1222_c7_33d9_cond;
     n16_MUX_uxn_opcodes_h_l1222_c7_33d9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1222_c7_33d9_iftrue;
     n16_MUX_uxn_opcodes_h_l1222_c7_33d9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1222_c7_33d9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1222_c7_33d9_return_output := n16_MUX_uxn_opcodes_h_l1222_c7_33d9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1218_c7_310e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_310e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_310e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_310e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_310e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_310e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_310e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_310e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_310e_return_output;

     -- MUX[uxn_opcodes_h_l1231_c21_483f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1231_c21_483f_cond <= VAR_MUX_uxn_opcodes_h_l1231_c21_483f_cond;
     MUX_uxn_opcodes_h_l1231_c21_483f_iftrue <= VAR_MUX_uxn_opcodes_h_l1231_c21_483f_iftrue;
     MUX_uxn_opcodes_h_l1231_c21_483f_iffalse <= VAR_MUX_uxn_opcodes_h_l1231_c21_483f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1231_c21_483f_return_output := MUX_uxn_opcodes_h_l1231_c21_483f_return_output;

     -- t16_MUX[uxn_opcodes_h_l1213_c7_133e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1213_c7_133e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1213_c7_133e_cond;
     t16_MUX_uxn_opcodes_h_l1213_c7_133e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1213_c7_133e_iftrue;
     t16_MUX_uxn_opcodes_h_l1213_c7_133e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1213_c7_133e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1213_c7_133e_return_output := t16_MUX_uxn_opcodes_h_l1213_c7_133e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1218_c7_310e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_310e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_310e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_310e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_310e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_310e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_310e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_310e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_310e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1218_c7_310e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_310e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_310e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_310e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_310e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_310e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_310e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_310e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_310e_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_ec76_iftrue := VAR_MUX_uxn_opcodes_h_l1231_c21_483f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1218_c7_310e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1222_c7_33d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_133e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_310e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_133e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_310e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_133e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_310e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_133e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_310e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1210_c7_aa5c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1213_c7_133e_return_output;
     -- t16_MUX[uxn_opcodes_h_l1210_c7_aa5c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1210_c7_aa5c_cond <= VAR_t16_MUX_uxn_opcodes_h_l1210_c7_aa5c_cond;
     t16_MUX_uxn_opcodes_h_l1210_c7_aa5c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1210_c7_aa5c_iftrue;
     t16_MUX_uxn_opcodes_h_l1210_c7_aa5c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1210_c7_aa5c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1210_c7_aa5c_return_output := t16_MUX_uxn_opcodes_h_l1210_c7_aa5c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1213_c7_133e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_133e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_133e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_133e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_133e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_133e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_133e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_133e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_133e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1218_c7_310e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1218_c7_310e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1218_c7_310e_cond;
     n16_MUX_uxn_opcodes_h_l1218_c7_310e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1218_c7_310e_iftrue;
     n16_MUX_uxn_opcodes_h_l1218_c7_310e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1218_c7_310e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1218_c7_310e_return_output := n16_MUX_uxn_opcodes_h_l1218_c7_310e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1226_c7_ec76] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1226_c7_ec76_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_ec76_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1226_c7_ec76_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_ec76_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1226_c7_ec76_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_ec76_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_ec76_return_output := result_u8_value_MUX_uxn_opcodes_h_l1226_c7_ec76_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1213_c7_133e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_133e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_133e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_133e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_133e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_133e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_133e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_133e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_133e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1213_c7_133e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_133e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_133e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_133e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_133e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_133e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_133e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_133e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_133e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1213_c7_133e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_133e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_133e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_133e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_133e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_133e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_133e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_133e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_133e_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1213_c7_133e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1218_c7_310e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_aa5c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_133e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_aa5c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_133e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_aa5c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_133e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_aa5c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_133e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_33d9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_ec76_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1210_c7_aa5c_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1210_c7_aa5c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_aa5c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_aa5c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_aa5c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_aa5c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_aa5c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_aa5c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_aa5c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_aa5c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1197_c2_21c7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1197_c2_21c7_cond <= VAR_t16_MUX_uxn_opcodes_h_l1197_c2_21c7_cond;
     t16_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue;
     t16_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output := t16_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1210_c7_aa5c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_aa5c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_aa5c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_aa5c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_aa5c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_aa5c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_aa5c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_aa5c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_aa5c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1210_c7_aa5c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_aa5c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_aa5c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_aa5c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_aa5c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_aa5c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_aa5c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_aa5c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_aa5c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1222_c7_33d9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1222_c7_33d9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_33d9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1222_c7_33d9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_33d9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1222_c7_33d9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_33d9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_33d9_return_output := result_u8_value_MUX_uxn_opcodes_h_l1222_c7_33d9_return_output;

     -- n16_MUX[uxn_opcodes_h_l1213_c7_133e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1213_c7_133e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1213_c7_133e_cond;
     n16_MUX_uxn_opcodes_h_l1213_c7_133e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1213_c7_133e_iftrue;
     n16_MUX_uxn_opcodes_h_l1213_c7_133e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1213_c7_133e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1213_c7_133e_return_output := n16_MUX_uxn_opcodes_h_l1213_c7_133e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1210_c7_aa5c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_aa5c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_aa5c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_aa5c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_aa5c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_aa5c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_aa5c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_aa5c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_aa5c_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1210_c7_aa5c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1213_c7_133e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_aa5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_aa5c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_aa5c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_aa5c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_310e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_33d9_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1197_c2_21c7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_21c7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_21c7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1197_c2_21c7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_21c7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_21c7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1197_c2_21c7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_21c7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_21c7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1197_c2_21c7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_21c7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_21c7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output;

     -- n16_MUX[uxn_opcodes_h_l1210_c7_aa5c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1210_c7_aa5c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1210_c7_aa5c_cond;
     n16_MUX_uxn_opcodes_h_l1210_c7_aa5c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1210_c7_aa5c_iftrue;
     n16_MUX_uxn_opcodes_h_l1210_c7_aa5c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1210_c7_aa5c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1210_c7_aa5c_return_output := n16_MUX_uxn_opcodes_h_l1210_c7_aa5c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1218_c7_310e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1218_c7_310e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_310e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1218_c7_310e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_310e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1218_c7_310e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_310e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_310e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1218_c7_310e_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1210_c7_aa5c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_133e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_310e_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1213_c7_133e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1213_c7_133e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_133e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1213_c7_133e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_133e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1213_c7_133e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_133e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_133e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1213_c7_133e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1197_c2_21c7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1197_c2_21c7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1197_c2_21c7_cond;
     n16_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue;
     n16_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output := n16_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_aa5c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_133e_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1210_c7_aa5c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1210_c7_aa5c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_aa5c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1210_c7_aa5c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_aa5c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1210_c7_aa5c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_aa5c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_aa5c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1210_c7_aa5c_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_aa5c_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1197_c2_21c7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1197_c2_21c7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_21c7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_21c7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_21c7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l1193_l1235_DUPLICATE_1579 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l1193_l1235_DUPLICATE_1579_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_21c7_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l1193_l1235_DUPLICATE_1579_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l1193_l1235_DUPLICATE_1579_return_output;
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
