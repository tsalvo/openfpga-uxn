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
entity neq2_0CLK_609876da is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end neq2_0CLK_609876da;
architecture arch of neq2_0CLK_609876da is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1277_c6_daf9]
signal BIN_OP_EQ_uxn_opcodes_h_l1277_c6_daf9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1277_c6_daf9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1277_c6_daf9_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1277_c2_5159]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_5159_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_5159_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1277_c2_5159]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_5159_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_5159_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1277_c2_5159]
signal result_u8_value_MUX_uxn_opcodes_h_l1277_c2_5159_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1277_c2_5159_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1277_c2_5159]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_5159_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_5159_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1277_c2_5159]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_5159_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_5159_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1277_c2_5159]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_5159_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_5159_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1277_c2_5159]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_5159_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_5159_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1277_c2_5159]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_5159_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_5159_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1277_c2_5159]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_5159_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_5159_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1277_c2_5159]
signal t16_MUX_uxn_opcodes_h_l1277_c2_5159_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1277_c2_5159_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1277_c2_5159]
signal n16_MUX_uxn_opcodes_h_l1277_c2_5159_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1277_c2_5159_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1290_c11_d8ad]
signal BIN_OP_EQ_uxn_opcodes_h_l1290_c11_d8ad_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1290_c11_d8ad_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1290_c11_d8ad_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1290_c7_90da]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_90da_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_90da_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_90da_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_90da_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1290_c7_90da]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_90da_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_90da_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_90da_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_90da_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1290_c7_90da]
signal result_u8_value_MUX_uxn_opcodes_h_l1290_c7_90da_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1290_c7_90da_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1290_c7_90da_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1290_c7_90da_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1290_c7_90da]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_90da_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_90da_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_90da_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_90da_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1290_c7_90da]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_90da_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_90da_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_90da_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_90da_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1290_c7_90da]
signal t16_MUX_uxn_opcodes_h_l1290_c7_90da_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1290_c7_90da_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1290_c7_90da_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1290_c7_90da_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1290_c7_90da]
signal n16_MUX_uxn_opcodes_h_l1290_c7_90da_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1290_c7_90da_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1290_c7_90da_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1290_c7_90da_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1293_c11_af25]
signal BIN_OP_EQ_uxn_opcodes_h_l1293_c11_af25_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1293_c11_af25_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1293_c11_af25_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1293_c7_910d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_910d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_910d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_910d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_910d_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1293_c7_910d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_910d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_910d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_910d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_910d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1293_c7_910d]
signal result_u8_value_MUX_uxn_opcodes_h_l1293_c7_910d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1293_c7_910d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1293_c7_910d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1293_c7_910d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1293_c7_910d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_910d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_910d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_910d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_910d_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1293_c7_910d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_910d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_910d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_910d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_910d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1293_c7_910d]
signal t16_MUX_uxn_opcodes_h_l1293_c7_910d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1293_c7_910d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1293_c7_910d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1293_c7_910d_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1293_c7_910d]
signal n16_MUX_uxn_opcodes_h_l1293_c7_910d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1293_c7_910d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1293_c7_910d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1293_c7_910d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1298_c11_4faf]
signal BIN_OP_EQ_uxn_opcodes_h_l1298_c11_4faf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1298_c11_4faf_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1298_c11_4faf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1298_c7_b28c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_b28c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_b28c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_b28c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_b28c_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1298_c7_b28c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_b28c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_b28c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_b28c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_b28c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1298_c7_b28c]
signal result_u8_value_MUX_uxn_opcodes_h_l1298_c7_b28c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1298_c7_b28c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1298_c7_b28c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1298_c7_b28c_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1298_c7_b28c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_b28c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_b28c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_b28c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_b28c_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1298_c7_b28c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_b28c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_b28c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_b28c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_b28c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1298_c7_b28c]
signal t16_MUX_uxn_opcodes_h_l1298_c7_b28c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1298_c7_b28c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1298_c7_b28c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1298_c7_b28c_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1298_c7_b28c]
signal n16_MUX_uxn_opcodes_h_l1298_c7_b28c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1298_c7_b28c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1298_c7_b28c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1298_c7_b28c_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1299_c3_9e8e]
signal BIN_OP_OR_uxn_opcodes_h_l1299_c3_9e8e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1299_c3_9e8e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1299_c3_9e8e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1302_c11_eb8f]
signal BIN_OP_EQ_uxn_opcodes_h_l1302_c11_eb8f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1302_c11_eb8f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1302_c11_eb8f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1302_c7_0a4f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0a4f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0a4f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0a4f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0a4f_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1302_c7_0a4f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0a4f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0a4f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0a4f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0a4f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1302_c7_0a4f]
signal result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0a4f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0a4f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0a4f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0a4f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1302_c7_0a4f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0a4f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0a4f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0a4f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0a4f_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1302_c7_0a4f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0a4f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0a4f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0a4f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0a4f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1302_c7_0a4f]
signal n16_MUX_uxn_opcodes_h_l1302_c7_0a4f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1302_c7_0a4f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1302_c7_0a4f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1302_c7_0a4f_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1305_c30_dfea]
signal sp_relative_shift_uxn_opcodes_h_l1305_c30_dfea_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1305_c30_dfea_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1305_c30_dfea_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1305_c30_dfea_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1307_c11_23e6]
signal BIN_OP_EQ_uxn_opcodes_h_l1307_c11_23e6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1307_c11_23e6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1307_c11_23e6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1307_c7_ee9f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_ee9f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_ee9f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_ee9f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_ee9f_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1307_c7_ee9f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_ee9f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_ee9f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_ee9f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_ee9f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1307_c7_ee9f]
signal result_u8_value_MUX_uxn_opcodes_h_l1307_c7_ee9f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1307_c7_ee9f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1307_c7_ee9f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1307_c7_ee9f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1307_c7_ee9f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_ee9f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_ee9f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_ee9f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_ee9f_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1307_c7_ee9f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_ee9f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_ee9f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_ee9f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_ee9f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1307_c7_ee9f]
signal n16_MUX_uxn_opcodes_h_l1307_c7_ee9f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1307_c7_ee9f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1307_c7_ee9f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1307_c7_ee9f_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1308_c3_a653]
signal BIN_OP_OR_uxn_opcodes_h_l1308_c3_a653_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1308_c3_a653_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1308_c3_a653_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1312_c21_5f07]
signal BIN_OP_EQ_uxn_opcodes_h_l1312_c21_5f07_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1312_c21_5f07_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1312_c21_5f07_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1312_c21_8152]
signal MUX_uxn_opcodes_h_l1312_c21_8152_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1312_c21_8152_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1312_c21_8152_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1312_c21_8152_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_3ae8
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_3ae8_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_3ae8_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1277_c6_daf9
BIN_OP_EQ_uxn_opcodes_h_l1277_c6_daf9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1277_c6_daf9_left,
BIN_OP_EQ_uxn_opcodes_h_l1277_c6_daf9_right,
BIN_OP_EQ_uxn_opcodes_h_l1277_c6_daf9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_5159
result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_5159 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_5159_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_5159_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_5159
result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_5159 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_5159_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_5159_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1277_c2_5159
result_u8_value_MUX_uxn_opcodes_h_l1277_c2_5159 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1277_c2_5159_cond,
result_u8_value_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1277_c2_5159_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_5159
result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_5159 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_5159_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_5159_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_5159
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_5159 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_5159_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_5159_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_5159
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_5159 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_5159_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_5159_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_5159
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_5159 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_5159_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_5159_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_5159
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_5159 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_5159_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_5159_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_5159
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_5159 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_5159_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_5159_return_output);

-- t16_MUX_uxn_opcodes_h_l1277_c2_5159
t16_MUX_uxn_opcodes_h_l1277_c2_5159 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1277_c2_5159_cond,
t16_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue,
t16_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse,
t16_MUX_uxn_opcodes_h_l1277_c2_5159_return_output);

-- n16_MUX_uxn_opcodes_h_l1277_c2_5159
n16_MUX_uxn_opcodes_h_l1277_c2_5159 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1277_c2_5159_cond,
n16_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue,
n16_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse,
n16_MUX_uxn_opcodes_h_l1277_c2_5159_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1290_c11_d8ad
BIN_OP_EQ_uxn_opcodes_h_l1290_c11_d8ad : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1290_c11_d8ad_left,
BIN_OP_EQ_uxn_opcodes_h_l1290_c11_d8ad_right,
BIN_OP_EQ_uxn_opcodes_h_l1290_c11_d8ad_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_90da
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_90da : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_90da_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_90da_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_90da_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_90da_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_90da
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_90da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_90da_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_90da_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_90da_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_90da_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1290_c7_90da
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_90da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_90da_cond,
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_90da_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_90da_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_90da_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_90da
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_90da : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_90da_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_90da_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_90da_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_90da_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_90da
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_90da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_90da_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_90da_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_90da_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_90da_return_output);

-- t16_MUX_uxn_opcodes_h_l1290_c7_90da
t16_MUX_uxn_opcodes_h_l1290_c7_90da : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1290_c7_90da_cond,
t16_MUX_uxn_opcodes_h_l1290_c7_90da_iftrue,
t16_MUX_uxn_opcodes_h_l1290_c7_90da_iffalse,
t16_MUX_uxn_opcodes_h_l1290_c7_90da_return_output);

-- n16_MUX_uxn_opcodes_h_l1290_c7_90da
n16_MUX_uxn_opcodes_h_l1290_c7_90da : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1290_c7_90da_cond,
n16_MUX_uxn_opcodes_h_l1290_c7_90da_iftrue,
n16_MUX_uxn_opcodes_h_l1290_c7_90da_iffalse,
n16_MUX_uxn_opcodes_h_l1290_c7_90da_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1293_c11_af25
BIN_OP_EQ_uxn_opcodes_h_l1293_c11_af25 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1293_c11_af25_left,
BIN_OP_EQ_uxn_opcodes_h_l1293_c11_af25_right,
BIN_OP_EQ_uxn_opcodes_h_l1293_c11_af25_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_910d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_910d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_910d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_910d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_910d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_910d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_910d
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_910d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_910d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_910d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_910d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_910d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1293_c7_910d
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_910d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_910d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_910d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_910d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_910d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_910d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_910d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_910d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_910d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_910d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_910d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_910d
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_910d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_910d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_910d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_910d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_910d_return_output);

-- t16_MUX_uxn_opcodes_h_l1293_c7_910d
t16_MUX_uxn_opcodes_h_l1293_c7_910d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1293_c7_910d_cond,
t16_MUX_uxn_opcodes_h_l1293_c7_910d_iftrue,
t16_MUX_uxn_opcodes_h_l1293_c7_910d_iffalse,
t16_MUX_uxn_opcodes_h_l1293_c7_910d_return_output);

-- n16_MUX_uxn_opcodes_h_l1293_c7_910d
n16_MUX_uxn_opcodes_h_l1293_c7_910d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1293_c7_910d_cond,
n16_MUX_uxn_opcodes_h_l1293_c7_910d_iftrue,
n16_MUX_uxn_opcodes_h_l1293_c7_910d_iffalse,
n16_MUX_uxn_opcodes_h_l1293_c7_910d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1298_c11_4faf
BIN_OP_EQ_uxn_opcodes_h_l1298_c11_4faf : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1298_c11_4faf_left,
BIN_OP_EQ_uxn_opcodes_h_l1298_c11_4faf_right,
BIN_OP_EQ_uxn_opcodes_h_l1298_c11_4faf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_b28c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_b28c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_b28c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_b28c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_b28c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_b28c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_b28c
result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_b28c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_b28c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_b28c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_b28c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_b28c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1298_c7_b28c
result_u8_value_MUX_uxn_opcodes_h_l1298_c7_b28c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1298_c7_b28c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1298_c7_b28c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1298_c7_b28c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1298_c7_b28c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_b28c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_b28c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_b28c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_b28c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_b28c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_b28c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_b28c
result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_b28c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_b28c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_b28c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_b28c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_b28c_return_output);

-- t16_MUX_uxn_opcodes_h_l1298_c7_b28c
t16_MUX_uxn_opcodes_h_l1298_c7_b28c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1298_c7_b28c_cond,
t16_MUX_uxn_opcodes_h_l1298_c7_b28c_iftrue,
t16_MUX_uxn_opcodes_h_l1298_c7_b28c_iffalse,
t16_MUX_uxn_opcodes_h_l1298_c7_b28c_return_output);

-- n16_MUX_uxn_opcodes_h_l1298_c7_b28c
n16_MUX_uxn_opcodes_h_l1298_c7_b28c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1298_c7_b28c_cond,
n16_MUX_uxn_opcodes_h_l1298_c7_b28c_iftrue,
n16_MUX_uxn_opcodes_h_l1298_c7_b28c_iffalse,
n16_MUX_uxn_opcodes_h_l1298_c7_b28c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1299_c3_9e8e
BIN_OP_OR_uxn_opcodes_h_l1299_c3_9e8e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1299_c3_9e8e_left,
BIN_OP_OR_uxn_opcodes_h_l1299_c3_9e8e_right,
BIN_OP_OR_uxn_opcodes_h_l1299_c3_9e8e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1302_c11_eb8f
BIN_OP_EQ_uxn_opcodes_h_l1302_c11_eb8f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1302_c11_eb8f_left,
BIN_OP_EQ_uxn_opcodes_h_l1302_c11_eb8f_right,
BIN_OP_EQ_uxn_opcodes_h_l1302_c11_eb8f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0a4f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0a4f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0a4f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0a4f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0a4f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0a4f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0a4f
result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0a4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0a4f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0a4f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0a4f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0a4f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0a4f
result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0a4f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0a4f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0a4f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0a4f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0a4f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0a4f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0a4f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0a4f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0a4f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0a4f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0a4f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0a4f
result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0a4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0a4f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0a4f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0a4f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0a4f_return_output);

-- n16_MUX_uxn_opcodes_h_l1302_c7_0a4f
n16_MUX_uxn_opcodes_h_l1302_c7_0a4f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1302_c7_0a4f_cond,
n16_MUX_uxn_opcodes_h_l1302_c7_0a4f_iftrue,
n16_MUX_uxn_opcodes_h_l1302_c7_0a4f_iffalse,
n16_MUX_uxn_opcodes_h_l1302_c7_0a4f_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1305_c30_dfea
sp_relative_shift_uxn_opcodes_h_l1305_c30_dfea : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1305_c30_dfea_ins,
sp_relative_shift_uxn_opcodes_h_l1305_c30_dfea_x,
sp_relative_shift_uxn_opcodes_h_l1305_c30_dfea_y,
sp_relative_shift_uxn_opcodes_h_l1305_c30_dfea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1307_c11_23e6
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_23e6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_23e6_left,
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_23e6_right,
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_23e6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_ee9f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_ee9f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_ee9f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_ee9f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_ee9f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_ee9f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_ee9f
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_ee9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_ee9f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_ee9f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_ee9f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_ee9f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1307_c7_ee9f
result_u8_value_MUX_uxn_opcodes_h_l1307_c7_ee9f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1307_c7_ee9f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1307_c7_ee9f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1307_c7_ee9f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1307_c7_ee9f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_ee9f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_ee9f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_ee9f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_ee9f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_ee9f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_ee9f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_ee9f
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_ee9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_ee9f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_ee9f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_ee9f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_ee9f_return_output);

-- n16_MUX_uxn_opcodes_h_l1307_c7_ee9f
n16_MUX_uxn_opcodes_h_l1307_c7_ee9f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1307_c7_ee9f_cond,
n16_MUX_uxn_opcodes_h_l1307_c7_ee9f_iftrue,
n16_MUX_uxn_opcodes_h_l1307_c7_ee9f_iffalse,
n16_MUX_uxn_opcodes_h_l1307_c7_ee9f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1308_c3_a653
BIN_OP_OR_uxn_opcodes_h_l1308_c3_a653 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1308_c3_a653_left,
BIN_OP_OR_uxn_opcodes_h_l1308_c3_a653_right,
BIN_OP_OR_uxn_opcodes_h_l1308_c3_a653_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1312_c21_5f07
BIN_OP_EQ_uxn_opcodes_h_l1312_c21_5f07 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1312_c21_5f07_left,
BIN_OP_EQ_uxn_opcodes_h_l1312_c21_5f07_right,
BIN_OP_EQ_uxn_opcodes_h_l1312_c21_5f07_return_output);

-- MUX_uxn_opcodes_h_l1312_c21_8152
MUX_uxn_opcodes_h_l1312_c21_8152 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1312_c21_8152_cond,
MUX_uxn_opcodes_h_l1312_c21_8152_iftrue,
MUX_uxn_opcodes_h_l1312_c21_8152_iffalse,
MUX_uxn_opcodes_h_l1312_c21_8152_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_3ae8
CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_3ae8 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_3ae8_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_3ae8_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1277_c6_daf9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_5159_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_5159_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1277_c2_5159_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_5159_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_5159_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_5159_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_5159_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_5159_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_5159_return_output,
 t16_MUX_uxn_opcodes_h_l1277_c2_5159_return_output,
 n16_MUX_uxn_opcodes_h_l1277_c2_5159_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1290_c11_d8ad_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_90da_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_90da_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1290_c7_90da_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_90da_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_90da_return_output,
 t16_MUX_uxn_opcodes_h_l1290_c7_90da_return_output,
 n16_MUX_uxn_opcodes_h_l1290_c7_90da_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1293_c11_af25_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_910d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_910d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1293_c7_910d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_910d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_910d_return_output,
 t16_MUX_uxn_opcodes_h_l1293_c7_910d_return_output,
 n16_MUX_uxn_opcodes_h_l1293_c7_910d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1298_c11_4faf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_b28c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_b28c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1298_c7_b28c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_b28c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_b28c_return_output,
 t16_MUX_uxn_opcodes_h_l1298_c7_b28c_return_output,
 n16_MUX_uxn_opcodes_h_l1298_c7_b28c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1299_c3_9e8e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1302_c11_eb8f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0a4f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0a4f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0a4f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0a4f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0a4f_return_output,
 n16_MUX_uxn_opcodes_h_l1302_c7_0a4f_return_output,
 sp_relative_shift_uxn_opcodes_h_l1305_c30_dfea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1307_c11_23e6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_ee9f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_ee9f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1307_c7_ee9f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_ee9f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_ee9f_return_output,
 n16_MUX_uxn_opcodes_h_l1307_c7_ee9f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1308_c3_a653_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1312_c21_5f07_return_output,
 MUX_uxn_opcodes_h_l1312_c21_8152_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_3ae8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_daf9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_daf9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_daf9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1277_c2_5159_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_5159_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_5159_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1277_c2_5159_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_5159_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_5159_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_90da_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_5159_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_5159_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1277_c2_5159_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_5159_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_5159_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1282_c3_0cfa : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_90da_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_5159_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_5159_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_90da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_5159_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_5159_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1287_c3_79b1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_90da_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_5159_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_5159_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1277_c2_5159_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_5159_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_5159_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_90da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_5159_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_5159_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1290_c7_90da_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1277_c2_5159_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1277_c2_5159_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1290_c7_90da_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1277_c2_5159_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1277_c2_5159_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_d8ad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_d8ad_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_d8ad_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_90da_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_90da_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_910d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_90da_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_90da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_90da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_910d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_90da_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_90da_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_90da_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_910d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_90da_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_90da_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1291_c3_a651 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_90da_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_910d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_90da_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_90da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_90da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_910d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_90da_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1290_c7_90da_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1290_c7_90da_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1293_c7_910d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1290_c7_90da_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1290_c7_90da_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1290_c7_90da_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1293_c7_910d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1290_c7_90da_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_af25_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_af25_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_af25_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_910d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_910d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_b28c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_910d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_910d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_910d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_b28c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_910d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_910d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_910d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_b28c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_910d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_910d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1296_c3_9ece : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_910d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_b28c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_910d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_910d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_910d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_b28c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_910d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1293_c7_910d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1293_c7_910d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1298_c7_b28c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1293_c7_910d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1293_c7_910d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1293_c7_910d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1298_c7_b28c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1293_c7_910d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_4faf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_4faf_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_4faf_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_b28c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_b28c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0a4f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_b28c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_b28c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_b28c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0a4f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_b28c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_b28c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_b28c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0a4f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_b28c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_b28c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1300_c3_daae : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_b28c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0a4f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_b28c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_b28c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_b28c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0a4f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_b28c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1298_c7_b28c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1298_c7_b28c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1298_c7_b28c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1298_c7_b28c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1298_c7_b28c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1302_c7_0a4f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1298_c7_b28c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_9e8e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_9e8e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_9e8e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_eb8f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_eb8f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_eb8f_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0a4f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0a4f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_ee9f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0a4f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0a4f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0a4f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_ee9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0a4f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0a4f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0a4f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_ee9f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0a4f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0a4f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0a4f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_ee9f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0a4f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0a4f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0a4f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_ee9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0a4f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1302_c7_0a4f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1302_c7_0a4f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_ee9f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1302_c7_0a4f_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_dfea_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_dfea_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_dfea_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_dfea_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_23e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_23e6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_23e6_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_ee9f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1309_c3_4226 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_ee9f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_ee9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_ee9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_ee9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_ee9f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_ee9f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_ee9f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_ee9f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_ee9f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1311_c3_827c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_ee9f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_ee9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_ee9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_ee9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_ee9f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_ee9f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_ee9f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_ee9f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_a653_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_a653_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_a653_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1312_c21_8152_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_5f07_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_5f07_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_5f07_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1312_c21_8152_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1312_c21_8152_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1312_c21_8152_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_l1277_DUPLICATE_fe5f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1293_l1307_l1298_l1290_DUPLICATE_3849_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_DUPLICATE_c1e8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_DUPLICATE_8da1_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1299_l1308_l1294_l1303_DUPLICATE_94cd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_3ae8_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_3ae8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1307_l1302_DUPLICATE_0da2_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l1316_l1273_DUPLICATE_e11a_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_ee9f_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1300_c3_daae := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_b28c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1300_c3_daae;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_ee9f_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_23e6_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_4faf_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_dfea_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1282_c3_0cfa := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1282_c3_0cfa;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1311_c3_827c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_ee9f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1311_c3_827c;
     VAR_MUX_uxn_opcodes_h_l1312_c21_8152_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_eb8f_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1287_c3_79b1 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1287_c3_79b1;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1296_c3_9ece := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_910d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1296_c3_9ece;
     VAR_MUX_uxn_opcodes_h_l1312_c21_8152_iffalse := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1291_c3_a651 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_90da_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1291_c3_a651;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1309_c3_4226 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_ee9f_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1309_c3_4226;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_daf9_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_dfea_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_d8ad_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_af25_right := to_unsigned(2, 2);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_dfea_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_a653_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1290_c7_90da_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1293_c7_910d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1298_c7_b28c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_ee9f_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_daf9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_d8ad_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_af25_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_4faf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_eb8f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_23e6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_5f07_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_9e8e_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1290_c7_90da_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1298_c7_b28c_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1298_c11_4faf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1298_c11_4faf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_4faf_left;
     BIN_OP_EQ_uxn_opcodes_h_l1298_c11_4faf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_4faf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_4faf_return_output := BIN_OP_EQ_uxn_opcodes_h_l1298_c11_4faf_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1305_c30_dfea] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1305_c30_dfea_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_dfea_ins;
     sp_relative_shift_uxn_opcodes_h_l1305_c30_dfea_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_dfea_x;
     sp_relative_shift_uxn_opcodes_h_l1305_c30_dfea_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_dfea_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_dfea_return_output := sp_relative_shift_uxn_opcodes_h_l1305_c30_dfea_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1307_c11_23e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1307_c11_23e6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_23e6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1307_c11_23e6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_23e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_23e6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1307_c11_23e6_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1277_c2_5159] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1277_c2_5159_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_DUPLICATE_8da1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_DUPLICATE_8da1_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1293_c11_af25] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1293_c11_af25_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_af25_left;
     BIN_OP_EQ_uxn_opcodes_h_l1293_c11_af25_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_af25_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_af25_return_output := BIN_OP_EQ_uxn_opcodes_h_l1293_c11_af25_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_l1277_DUPLICATE_fe5f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_l1277_DUPLICATE_fe5f_return_output := result.u8_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1299_l1308_l1294_l1303_DUPLICATE_94cd LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1299_l1308_l1294_l1303_DUPLICATE_94cd_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1302_c11_eb8f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1302_c11_eb8f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_eb8f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1302_c11_eb8f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_eb8f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_eb8f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1302_c11_eb8f_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1277_c2_5159] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1277_c2_5159_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1290_c11_d8ad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1290_c11_d8ad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_d8ad_left;
     BIN_OP_EQ_uxn_opcodes_h_l1290_c11_d8ad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_d8ad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_d8ad_return_output := BIN_OP_EQ_uxn_opcodes_h_l1290_c11_d8ad_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1277_c2_5159] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1277_c2_5159_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1307_l1302_DUPLICATE_0da2 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1307_l1302_DUPLICATE_0da2_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_DUPLICATE_c1e8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_DUPLICATE_c1e8_return_output := result.is_stack_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1277_c2_5159] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1277_c2_5159_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1277_c6_daf9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1277_c6_daf9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_daf9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1277_c6_daf9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_daf9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_daf9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1277_c6_daf9_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1293_l1307_l1298_l1290_DUPLICATE_3849 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1293_l1307_l1298_l1290_DUPLICATE_3849_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1277_c2_5159_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_daf9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_5159_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_daf9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_5159_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_daf9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_5159_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_daf9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_5159_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_daf9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_5159_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_daf9_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_5159_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_daf9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_5159_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_daf9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_5159_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_daf9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_5159_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_daf9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1277_c2_5159_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_daf9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1290_c7_90da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_d8ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_90da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_d8ad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_90da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_d8ad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_90da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_d8ad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_90da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_d8ad_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_90da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_d8ad_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1290_c7_90da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_d8ad_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1293_c7_910d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_af25_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_910d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_af25_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_910d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_af25_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_910d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_af25_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_910d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_af25_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_910d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_af25_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1293_c7_910d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_af25_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1298_c7_b28c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_4faf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_b28c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_4faf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_b28c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_4faf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_b28c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_4faf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_b28c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_4faf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_b28c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_4faf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1298_c7_b28c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_4faf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1302_c7_0a4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_eb8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0a4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_eb8f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0a4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_eb8f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0a4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_eb8f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0a4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_eb8f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0a4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_eb8f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_ee9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_23e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_ee9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_23e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_ee9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_23e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_ee9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_23e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_ee9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_23e6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_ee9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_23e6_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_9e8e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1299_l1308_l1294_l1303_DUPLICATE_94cd_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_a653_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1299_l1308_l1294_l1303_DUPLICATE_94cd_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_3ae8_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1299_l1308_l1294_l1303_DUPLICATE_94cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_90da_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1293_l1307_l1298_l1290_DUPLICATE_3849_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_910d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1293_l1307_l1298_l1290_DUPLICATE_3849_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_b28c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1293_l1307_l1298_l1290_DUPLICATE_3849_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_ee9f_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1293_l1307_l1298_l1290_DUPLICATE_3849_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_90da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_DUPLICATE_8da1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_910d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_DUPLICATE_8da1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_b28c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_DUPLICATE_8da1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0a4f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_DUPLICATE_8da1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_ee9f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_DUPLICATE_8da1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_90da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_DUPLICATE_c1e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_910d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_DUPLICATE_c1e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_b28c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_DUPLICATE_c1e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0a4f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_DUPLICATE_c1e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_ee9f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_DUPLICATE_c1e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0a4f_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1307_l1302_DUPLICATE_0da2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_ee9f_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1307_l1302_DUPLICATE_0da2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_l1277_DUPLICATE_fe5f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_90da_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_l1277_DUPLICATE_fe5f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_910d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_l1277_DUPLICATE_fe5f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_b28c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_l1277_DUPLICATE_fe5f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0a4f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_l1277_DUPLICATE_fe5f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_ee9f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_l1277_DUPLICATE_fe5f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1277_c2_5159_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1277_c2_5159_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1277_c2_5159_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1277_c2_5159_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0a4f_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_dfea_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l1277_c2_5159] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_5159_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_5159_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_5159_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_5159_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1299_c3_9e8e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1299_c3_9e8e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_9e8e_left;
     BIN_OP_OR_uxn_opcodes_h_l1299_c3_9e8e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_9e8e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_9e8e_return_output := BIN_OP_OR_uxn_opcodes_h_l1299_c3_9e8e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1277_c2_5159] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_5159_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_5159_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_5159_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_5159_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1307_c7_ee9f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_ee9f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_ee9f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_ee9f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_ee9f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_ee9f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_ee9f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_ee9f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_ee9f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1307_c7_ee9f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_ee9f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_ee9f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_ee9f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_ee9f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_ee9f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_ee9f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_ee9f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_ee9f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1307_c7_ee9f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_ee9f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_ee9f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_ee9f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_ee9f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_ee9f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_ee9f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_ee9f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_ee9f_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1277_c2_5159] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_5159_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_5159_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_5159_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_5159_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1307_c7_ee9f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_ee9f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_ee9f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_ee9f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_ee9f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_ee9f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_ee9f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_ee9f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_ee9f_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_3ae8 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_3ae8_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_3ae8_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_3ae8_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_3ae8_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1277_c2_5159] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_5159_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_5159_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_5159_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_5159_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1308_c3_a653] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1308_c3_a653_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_a653_left;
     BIN_OP_OR_uxn_opcodes_h_l1308_c3_a653_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_a653_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_a653_return_output := BIN_OP_OR_uxn_opcodes_h_l1308_c3_a653_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1298_c7_b28c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_9e8e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_5f07_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_a653_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_ee9f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_a653_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1302_c7_0a4f_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_3ae8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1293_c7_910d_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_3ae8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0a4f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_ee9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0a4f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_ee9f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0a4f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_ee9f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0a4f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_ee9f_return_output;
     -- BIN_OP_EQ[uxn_opcodes_h_l1312_c21_5f07] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1312_c21_5f07_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_5f07_left;
     BIN_OP_EQ_uxn_opcodes_h_l1312_c21_5f07_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_5f07_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_5f07_return_output := BIN_OP_EQ_uxn_opcodes_h_l1312_c21_5f07_return_output;

     -- n16_MUX[uxn_opcodes_h_l1307_c7_ee9f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1307_c7_ee9f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1307_c7_ee9f_cond;
     n16_MUX_uxn_opcodes_h_l1307_c7_ee9f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1307_c7_ee9f_iftrue;
     n16_MUX_uxn_opcodes_h_l1307_c7_ee9f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1307_c7_ee9f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_ee9f_return_output := n16_MUX_uxn_opcodes_h_l1307_c7_ee9f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1302_c7_0a4f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0a4f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0a4f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0a4f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0a4f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0a4f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0a4f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0a4f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0a4f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1302_c7_0a4f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0a4f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0a4f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0a4f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0a4f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0a4f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0a4f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0a4f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0a4f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1302_c7_0a4f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0a4f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0a4f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0a4f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0a4f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0a4f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0a4f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0a4f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0a4f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1302_c7_0a4f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0a4f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0a4f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0a4f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0a4f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0a4f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0a4f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0a4f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0a4f_return_output;

     -- t16_MUX[uxn_opcodes_h_l1298_c7_b28c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1298_c7_b28c_cond <= VAR_t16_MUX_uxn_opcodes_h_l1298_c7_b28c_cond;
     t16_MUX_uxn_opcodes_h_l1298_c7_b28c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1298_c7_b28c_iftrue;
     t16_MUX_uxn_opcodes_h_l1298_c7_b28c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1298_c7_b28c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1298_c7_b28c_return_output := t16_MUX_uxn_opcodes_h_l1298_c7_b28c_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1312_c21_8152_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_5f07_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1302_c7_0a4f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1307_c7_ee9f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_b28c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0a4f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_b28c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0a4f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_b28c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0a4f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_b28c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0a4f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1293_c7_910d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1298_c7_b28c_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1298_c7_b28c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_b28c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_b28c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_b28c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_b28c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_b28c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_b28c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_b28c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_b28c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1293_c7_910d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1293_c7_910d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1293_c7_910d_cond;
     t16_MUX_uxn_opcodes_h_l1293_c7_910d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1293_c7_910d_iftrue;
     t16_MUX_uxn_opcodes_h_l1293_c7_910d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1293_c7_910d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1293_c7_910d_return_output := t16_MUX_uxn_opcodes_h_l1293_c7_910d_return_output;

     -- MUX[uxn_opcodes_h_l1312_c21_8152] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1312_c21_8152_cond <= VAR_MUX_uxn_opcodes_h_l1312_c21_8152_cond;
     MUX_uxn_opcodes_h_l1312_c21_8152_iftrue <= VAR_MUX_uxn_opcodes_h_l1312_c21_8152_iftrue;
     MUX_uxn_opcodes_h_l1312_c21_8152_iffalse <= VAR_MUX_uxn_opcodes_h_l1312_c21_8152_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1312_c21_8152_return_output := MUX_uxn_opcodes_h_l1312_c21_8152_return_output;

     -- n16_MUX[uxn_opcodes_h_l1302_c7_0a4f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1302_c7_0a4f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1302_c7_0a4f_cond;
     n16_MUX_uxn_opcodes_h_l1302_c7_0a4f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1302_c7_0a4f_iftrue;
     n16_MUX_uxn_opcodes_h_l1302_c7_0a4f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1302_c7_0a4f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1302_c7_0a4f_return_output := n16_MUX_uxn_opcodes_h_l1302_c7_0a4f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1298_c7_b28c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_b28c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_b28c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_b28c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_b28c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_b28c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_b28c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_b28c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_b28c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1298_c7_b28c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_b28c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_b28c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_b28c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_b28c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_b28c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_b28c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_b28c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_b28c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1298_c7_b28c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_b28c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_b28c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_b28c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_b28c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_b28c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_b28c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_b28c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_b28c_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_ee9f_iftrue := VAR_MUX_uxn_opcodes_h_l1312_c21_8152_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1298_c7_b28c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1302_c7_0a4f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_910d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_b28c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_910d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_b28c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_910d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_b28c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_910d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_b28c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1290_c7_90da_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1293_c7_910d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1293_c7_910d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_910d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_910d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_910d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_910d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_910d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_910d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_910d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_910d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1293_c7_910d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_910d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_910d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_910d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_910d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_910d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_910d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_910d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_910d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1298_c7_b28c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1298_c7_b28c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1298_c7_b28c_cond;
     n16_MUX_uxn_opcodes_h_l1298_c7_b28c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1298_c7_b28c_iftrue;
     n16_MUX_uxn_opcodes_h_l1298_c7_b28c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1298_c7_b28c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1298_c7_b28c_return_output := n16_MUX_uxn_opcodes_h_l1298_c7_b28c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1290_c7_90da] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1290_c7_90da_cond <= VAR_t16_MUX_uxn_opcodes_h_l1290_c7_90da_cond;
     t16_MUX_uxn_opcodes_h_l1290_c7_90da_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1290_c7_90da_iftrue;
     t16_MUX_uxn_opcodes_h_l1290_c7_90da_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1290_c7_90da_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1290_c7_90da_return_output := t16_MUX_uxn_opcodes_h_l1290_c7_90da_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1293_c7_910d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_910d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_910d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_910d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_910d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_910d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_910d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_910d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_910d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1293_c7_910d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_910d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_910d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_910d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_910d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_910d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_910d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_910d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_910d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1307_c7_ee9f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1307_c7_ee9f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_ee9f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1307_c7_ee9f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_ee9f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1307_c7_ee9f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_ee9f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_ee9f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1307_c7_ee9f_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1293_c7_910d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1298_c7_b28c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_90da_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_910d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_90da_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_910d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_90da_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_910d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_90da_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_910d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0a4f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_ee9f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1290_c7_90da_return_output;
     -- t16_MUX[uxn_opcodes_h_l1277_c2_5159] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1277_c2_5159_cond <= VAR_t16_MUX_uxn_opcodes_h_l1277_c2_5159_cond;
     t16_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue;
     t16_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1277_c2_5159_return_output := t16_MUX_uxn_opcodes_h_l1277_c2_5159_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1302_c7_0a4f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0a4f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0a4f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0a4f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0a4f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0a4f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0a4f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0a4f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0a4f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1290_c7_90da] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_90da_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_90da_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_90da_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_90da_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_90da_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_90da_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_90da_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_90da_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1290_c7_90da] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_90da_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_90da_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_90da_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_90da_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_90da_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_90da_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_90da_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_90da_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1290_c7_90da] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_90da_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_90da_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_90da_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_90da_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_90da_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_90da_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_90da_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_90da_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1290_c7_90da] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_90da_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_90da_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_90da_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_90da_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_90da_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_90da_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_90da_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_90da_return_output;

     -- n16_MUX[uxn_opcodes_h_l1293_c7_910d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1293_c7_910d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1293_c7_910d_cond;
     n16_MUX_uxn_opcodes_h_l1293_c7_910d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1293_c7_910d_iftrue;
     n16_MUX_uxn_opcodes_h_l1293_c7_910d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1293_c7_910d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1293_c7_910d_return_output := n16_MUX_uxn_opcodes_h_l1293_c7_910d_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1290_c7_90da_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1293_c7_910d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_90da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_90da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_90da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_90da_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_b28c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0a4f_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1277_c2_5159_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1277_c2_5159] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_5159_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_5159_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_5159_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_5159_return_output;

     -- n16_MUX[uxn_opcodes_h_l1290_c7_90da] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1290_c7_90da_cond <= VAR_n16_MUX_uxn_opcodes_h_l1290_c7_90da_cond;
     n16_MUX_uxn_opcodes_h_l1290_c7_90da_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1290_c7_90da_iftrue;
     n16_MUX_uxn_opcodes_h_l1290_c7_90da_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1290_c7_90da_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1290_c7_90da_return_output := n16_MUX_uxn_opcodes_h_l1290_c7_90da_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1277_c2_5159] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_5159_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_5159_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_5159_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_5159_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1277_c2_5159] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_5159_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_5159_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_5159_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_5159_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1298_c7_b28c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1298_c7_b28c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_b28c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1298_c7_b28c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_b28c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1298_c7_b28c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_b28c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_b28c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1298_c7_b28c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1277_c2_5159] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_5159_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_5159_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_5159_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_5159_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1290_c7_90da_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_910d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_b28c_return_output;
     -- n16_MUX[uxn_opcodes_h_l1277_c2_5159] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1277_c2_5159_cond <= VAR_n16_MUX_uxn_opcodes_h_l1277_c2_5159_cond;
     n16_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue;
     n16_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1277_c2_5159_return_output := n16_MUX_uxn_opcodes_h_l1277_c2_5159_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1293_c7_910d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1293_c7_910d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_910d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1293_c7_910d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_910d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1293_c7_910d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_910d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_910d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1293_c7_910d_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1277_c2_5159_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_90da_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_910d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1290_c7_90da] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1290_c7_90da_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_90da_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1290_c7_90da_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_90da_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1290_c7_90da_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_90da_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_90da_return_output := result_u8_value_MUX_uxn_opcodes_h_l1290_c7_90da_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_90da_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1277_c2_5159] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1277_c2_5159_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_5159_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_5159_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_5159_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_5159_return_output := result_u8_value_MUX_uxn_opcodes_h_l1277_c2_5159_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l1316_l1273_DUPLICATE_e11a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l1316_l1273_DUPLICATE_e11a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_5159_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_5159_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_5159_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_5159_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_5159_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_5159_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_5159_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_5159_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_5159_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l1316_l1273_DUPLICATE_e11a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l1316_l1273_DUPLICATE_e11a_return_output;
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
