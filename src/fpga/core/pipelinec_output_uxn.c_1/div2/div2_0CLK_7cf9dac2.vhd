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
-- Submodules: 73
entity div2_0CLK_7cf9dac2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end div2_0CLK_7cf9dac2;
architecture arch of div2_0CLK_7cf9dac2 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2107_c6_9271]
signal BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9271_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9271_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9271_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2107_c2_3872]
signal n16_MUX_uxn_opcodes_h_l2107_c2_3872_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2107_c2_3872_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2107_c2_3872]
signal tmp16_MUX_uxn_opcodes_h_l2107_c2_3872_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2107_c2_3872_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2107_c2_3872]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_3872_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_3872_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2107_c2_3872]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_3872_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_3872_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2107_c2_3872]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_3872_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_3872_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2107_c2_3872]
signal result_u8_value_MUX_uxn_opcodes_h_l2107_c2_3872_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2107_c2_3872_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2107_c2_3872]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_3872_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_3872_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2107_c2_3872]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_3872_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_3872_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2107_c2_3872]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_3872_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_3872_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2107_c2_3872]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_3872_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_3872_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2107_c2_3872]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_3872_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_3872_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2107_c2_3872]
signal t16_MUX_uxn_opcodes_h_l2107_c2_3872_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2107_c2_3872_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2120_c11_6e7b]
signal BIN_OP_EQ_uxn_opcodes_h_l2120_c11_6e7b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2120_c11_6e7b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2120_c11_6e7b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2120_c7_4821]
signal n16_MUX_uxn_opcodes_h_l2120_c7_4821_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2120_c7_4821_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2120_c7_4821_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2120_c7_4821_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2120_c7_4821]
signal tmp16_MUX_uxn_opcodes_h_l2120_c7_4821_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2120_c7_4821_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2120_c7_4821_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2120_c7_4821_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2120_c7_4821]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4821_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4821_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4821_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4821_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2120_c7_4821]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4821_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4821_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4821_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4821_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2120_c7_4821]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4821_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4821_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4821_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4821_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2120_c7_4821]
signal result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4821_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4821_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4821_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4821_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2120_c7_4821]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4821_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4821_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4821_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4821_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2120_c7_4821]
signal t16_MUX_uxn_opcodes_h_l2120_c7_4821_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2120_c7_4821_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2120_c7_4821_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2120_c7_4821_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2123_c11_5429]
signal BIN_OP_EQ_uxn_opcodes_h_l2123_c11_5429_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2123_c11_5429_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2123_c11_5429_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2123_c7_1b7d]
signal n16_MUX_uxn_opcodes_h_l2123_c7_1b7d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2123_c7_1b7d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2123_c7_1b7d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2123_c7_1b7d]
signal tmp16_MUX_uxn_opcodes_h_l2123_c7_1b7d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2123_c7_1b7d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2123_c7_1b7d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2123_c7_1b7d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_1b7d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_1b7d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_1b7d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2123_c7_1b7d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_1b7d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_1b7d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_1b7d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2123_c7_1b7d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_1b7d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_1b7d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_1b7d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2123_c7_1b7d]
signal result_u8_value_MUX_uxn_opcodes_h_l2123_c7_1b7d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2123_c7_1b7d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2123_c7_1b7d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2123_c7_1b7d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_1b7d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_1b7d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_1b7d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2123_c7_1b7d]
signal t16_MUX_uxn_opcodes_h_l2123_c7_1b7d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2123_c7_1b7d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2123_c7_1b7d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2128_c11_540d]
signal BIN_OP_EQ_uxn_opcodes_h_l2128_c11_540d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2128_c11_540d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2128_c11_540d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2128_c7_5300]
signal n16_MUX_uxn_opcodes_h_l2128_c7_5300_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2128_c7_5300_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2128_c7_5300_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2128_c7_5300_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2128_c7_5300]
signal tmp16_MUX_uxn_opcodes_h_l2128_c7_5300_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2128_c7_5300_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2128_c7_5300_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2128_c7_5300_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2128_c7_5300]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_5300_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_5300_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_5300_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_5300_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2128_c7_5300]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_5300_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_5300_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_5300_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_5300_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2128_c7_5300]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_5300_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_5300_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_5300_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_5300_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2128_c7_5300]
signal result_u8_value_MUX_uxn_opcodes_h_l2128_c7_5300_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2128_c7_5300_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2128_c7_5300_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2128_c7_5300_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2128_c7_5300]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_5300_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_5300_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_5300_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_5300_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2128_c7_5300]
signal t16_MUX_uxn_opcodes_h_l2128_c7_5300_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2128_c7_5300_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2128_c7_5300_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2128_c7_5300_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2129_c3_b562]
signal BIN_OP_OR_uxn_opcodes_h_l2129_c3_b562_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2129_c3_b562_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2129_c3_b562_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2132_c11_ef94]
signal BIN_OP_EQ_uxn_opcodes_h_l2132_c11_ef94_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2132_c11_ef94_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2132_c11_ef94_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2132_c7_355f]
signal n16_MUX_uxn_opcodes_h_l2132_c7_355f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2132_c7_355f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2132_c7_355f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2132_c7_355f_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2132_c7_355f]
signal tmp16_MUX_uxn_opcodes_h_l2132_c7_355f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2132_c7_355f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2132_c7_355f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2132_c7_355f_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2132_c7_355f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_355f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_355f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_355f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_355f_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2132_c7_355f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_355f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_355f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_355f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_355f_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2132_c7_355f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_355f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_355f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_355f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_355f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2132_c7_355f]
signal result_u8_value_MUX_uxn_opcodes_h_l2132_c7_355f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2132_c7_355f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2132_c7_355f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2132_c7_355f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2132_c7_355f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_355f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_355f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_355f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_355f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2136_c11_35c0]
signal BIN_OP_EQ_uxn_opcodes_h_l2136_c11_35c0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2136_c11_35c0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2136_c11_35c0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2136_c7_d341]
signal n16_MUX_uxn_opcodes_h_l2136_c7_d341_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2136_c7_d341_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2136_c7_d341_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2136_c7_d341_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2136_c7_d341]
signal tmp16_MUX_uxn_opcodes_h_l2136_c7_d341_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2136_c7_d341_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2136_c7_d341_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2136_c7_d341_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2136_c7_d341]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_d341_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_d341_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_d341_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_d341_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2136_c7_d341]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_d341_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_d341_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_d341_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_d341_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2136_c7_d341]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_d341_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_d341_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_d341_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_d341_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2136_c7_d341]
signal result_u8_value_MUX_uxn_opcodes_h_l2136_c7_d341_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2136_c7_d341_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2136_c7_d341_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2136_c7_d341_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2136_c7_d341]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_d341_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_d341_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_d341_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_d341_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2137_c3_8ec7]
signal BIN_OP_OR_uxn_opcodes_h_l2137_c3_8ec7_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2137_c3_8ec7_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2137_c3_8ec7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2138_c11_5444]
signal BIN_OP_EQ_uxn_opcodes_h_l2138_c11_5444_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2138_c11_5444_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2138_c11_5444_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l2138_c26_59d8]
signal BIN_OP_DIV_uxn_opcodes_h_l2138_c26_59d8_left : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2138_c26_59d8_right : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2138_c26_59d8_return_output : unsigned(15 downto 0);

-- MUX[uxn_opcodes_h_l2138_c11_570b]
signal MUX_uxn_opcodes_h_l2138_c11_570b_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2138_c11_570b_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2138_c11_570b_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2138_c11_570b_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2139_c30_bcba]
signal sp_relative_shift_uxn_opcodes_h_l2139_c30_bcba_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2139_c30_bcba_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2139_c30_bcba_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2139_c30_bcba_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2144_c11_a27c]
signal BIN_OP_EQ_uxn_opcodes_h_l2144_c11_a27c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2144_c11_a27c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2144_c11_a27c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2144_c7_8604]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_8604_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_8604_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_8604_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_8604_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2144_c7_8604]
signal result_u8_value_MUX_uxn_opcodes_h_l2144_c7_8604_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2144_c7_8604_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2144_c7_8604_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2144_c7_8604_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2144_c7_8604]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_8604_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_8604_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_8604_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_8604_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2144_c7_8604]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_8604_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_8604_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_8604_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_8604_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2147_c31_218f]
signal CONST_SR_8_uxn_opcodes_h_l2147_c31_218f_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2147_c31_218f_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2134_l2125_DUPLICATE_1d40
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2134_l2125_DUPLICATE_1d40_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2134_l2125_DUPLICATE_1d40_return_output : unsigned(15 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_188e( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_ram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9271
BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9271 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9271_left,
BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9271_right,
BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9271_return_output);

-- n16_MUX_uxn_opcodes_h_l2107_c2_3872
n16_MUX_uxn_opcodes_h_l2107_c2_3872 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2107_c2_3872_cond,
n16_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue,
n16_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse,
n16_MUX_uxn_opcodes_h_l2107_c2_3872_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2107_c2_3872
tmp16_MUX_uxn_opcodes_h_l2107_c2_3872 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2107_c2_3872_cond,
tmp16_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue,
tmp16_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse,
tmp16_MUX_uxn_opcodes_h_l2107_c2_3872_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_3872
result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_3872 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_3872_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_3872_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_3872
result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_3872 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_3872_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_3872_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_3872
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_3872 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_3872_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_3872_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2107_c2_3872
result_u8_value_MUX_uxn_opcodes_h_l2107_c2_3872 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2107_c2_3872_cond,
result_u8_value_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2107_c2_3872_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_3872
result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_3872 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_3872_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_3872_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_3872
result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_3872 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_3872_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_3872_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_3872
result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_3872 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_3872_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_3872_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_3872
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_3872 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_3872_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_3872_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_3872
result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_3872 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_3872_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_3872_return_output);

-- t16_MUX_uxn_opcodes_h_l2107_c2_3872
t16_MUX_uxn_opcodes_h_l2107_c2_3872 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2107_c2_3872_cond,
t16_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue,
t16_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse,
t16_MUX_uxn_opcodes_h_l2107_c2_3872_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2120_c11_6e7b
BIN_OP_EQ_uxn_opcodes_h_l2120_c11_6e7b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2120_c11_6e7b_left,
BIN_OP_EQ_uxn_opcodes_h_l2120_c11_6e7b_right,
BIN_OP_EQ_uxn_opcodes_h_l2120_c11_6e7b_return_output);

-- n16_MUX_uxn_opcodes_h_l2120_c7_4821
n16_MUX_uxn_opcodes_h_l2120_c7_4821 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2120_c7_4821_cond,
n16_MUX_uxn_opcodes_h_l2120_c7_4821_iftrue,
n16_MUX_uxn_opcodes_h_l2120_c7_4821_iffalse,
n16_MUX_uxn_opcodes_h_l2120_c7_4821_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2120_c7_4821
tmp16_MUX_uxn_opcodes_h_l2120_c7_4821 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2120_c7_4821_cond,
tmp16_MUX_uxn_opcodes_h_l2120_c7_4821_iftrue,
tmp16_MUX_uxn_opcodes_h_l2120_c7_4821_iffalse,
tmp16_MUX_uxn_opcodes_h_l2120_c7_4821_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4821
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4821 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4821_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4821_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4821_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4821_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4821
result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4821 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4821_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4821_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4821_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4821_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4821
result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4821 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4821_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4821_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4821_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4821_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4821
result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4821 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4821_cond,
result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4821_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4821_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4821_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4821
result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4821 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4821_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4821_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4821_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4821_return_output);

-- t16_MUX_uxn_opcodes_h_l2120_c7_4821
t16_MUX_uxn_opcodes_h_l2120_c7_4821 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2120_c7_4821_cond,
t16_MUX_uxn_opcodes_h_l2120_c7_4821_iftrue,
t16_MUX_uxn_opcodes_h_l2120_c7_4821_iffalse,
t16_MUX_uxn_opcodes_h_l2120_c7_4821_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2123_c11_5429
BIN_OP_EQ_uxn_opcodes_h_l2123_c11_5429 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2123_c11_5429_left,
BIN_OP_EQ_uxn_opcodes_h_l2123_c11_5429_right,
BIN_OP_EQ_uxn_opcodes_h_l2123_c11_5429_return_output);

-- n16_MUX_uxn_opcodes_h_l2123_c7_1b7d
n16_MUX_uxn_opcodes_h_l2123_c7_1b7d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2123_c7_1b7d_cond,
n16_MUX_uxn_opcodes_h_l2123_c7_1b7d_iftrue,
n16_MUX_uxn_opcodes_h_l2123_c7_1b7d_iffalse,
n16_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2123_c7_1b7d
tmp16_MUX_uxn_opcodes_h_l2123_c7_1b7d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2123_c7_1b7d_cond,
tmp16_MUX_uxn_opcodes_h_l2123_c7_1b7d_iftrue,
tmp16_MUX_uxn_opcodes_h_l2123_c7_1b7d_iffalse,
tmp16_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_1b7d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_1b7d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_1b7d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_1b7d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_1b7d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_1b7d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_1b7d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_1b7d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_1b7d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_1b7d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_1b7d
result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_1b7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_1b7d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_1b7d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_1b7d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2123_c7_1b7d
result_u8_value_MUX_uxn_opcodes_h_l2123_c7_1b7d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2123_c7_1b7d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2123_c7_1b7d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2123_c7_1b7d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_1b7d
result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_1b7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_1b7d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_1b7d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_1b7d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output);

-- t16_MUX_uxn_opcodes_h_l2123_c7_1b7d
t16_MUX_uxn_opcodes_h_l2123_c7_1b7d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2123_c7_1b7d_cond,
t16_MUX_uxn_opcodes_h_l2123_c7_1b7d_iftrue,
t16_MUX_uxn_opcodes_h_l2123_c7_1b7d_iffalse,
t16_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2128_c11_540d
BIN_OP_EQ_uxn_opcodes_h_l2128_c11_540d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2128_c11_540d_left,
BIN_OP_EQ_uxn_opcodes_h_l2128_c11_540d_right,
BIN_OP_EQ_uxn_opcodes_h_l2128_c11_540d_return_output);

-- n16_MUX_uxn_opcodes_h_l2128_c7_5300
n16_MUX_uxn_opcodes_h_l2128_c7_5300 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2128_c7_5300_cond,
n16_MUX_uxn_opcodes_h_l2128_c7_5300_iftrue,
n16_MUX_uxn_opcodes_h_l2128_c7_5300_iffalse,
n16_MUX_uxn_opcodes_h_l2128_c7_5300_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2128_c7_5300
tmp16_MUX_uxn_opcodes_h_l2128_c7_5300 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2128_c7_5300_cond,
tmp16_MUX_uxn_opcodes_h_l2128_c7_5300_iftrue,
tmp16_MUX_uxn_opcodes_h_l2128_c7_5300_iffalse,
tmp16_MUX_uxn_opcodes_h_l2128_c7_5300_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_5300
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_5300 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_5300_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_5300_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_5300_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_5300_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_5300
result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_5300 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_5300_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_5300_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_5300_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_5300_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_5300
result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_5300 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_5300_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_5300_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_5300_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_5300_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2128_c7_5300
result_u8_value_MUX_uxn_opcodes_h_l2128_c7_5300 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2128_c7_5300_cond,
result_u8_value_MUX_uxn_opcodes_h_l2128_c7_5300_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2128_c7_5300_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2128_c7_5300_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_5300
result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_5300 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_5300_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_5300_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_5300_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_5300_return_output);

-- t16_MUX_uxn_opcodes_h_l2128_c7_5300
t16_MUX_uxn_opcodes_h_l2128_c7_5300 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2128_c7_5300_cond,
t16_MUX_uxn_opcodes_h_l2128_c7_5300_iftrue,
t16_MUX_uxn_opcodes_h_l2128_c7_5300_iffalse,
t16_MUX_uxn_opcodes_h_l2128_c7_5300_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2129_c3_b562
BIN_OP_OR_uxn_opcodes_h_l2129_c3_b562 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2129_c3_b562_left,
BIN_OP_OR_uxn_opcodes_h_l2129_c3_b562_right,
BIN_OP_OR_uxn_opcodes_h_l2129_c3_b562_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2132_c11_ef94
BIN_OP_EQ_uxn_opcodes_h_l2132_c11_ef94 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2132_c11_ef94_left,
BIN_OP_EQ_uxn_opcodes_h_l2132_c11_ef94_right,
BIN_OP_EQ_uxn_opcodes_h_l2132_c11_ef94_return_output);

-- n16_MUX_uxn_opcodes_h_l2132_c7_355f
n16_MUX_uxn_opcodes_h_l2132_c7_355f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2132_c7_355f_cond,
n16_MUX_uxn_opcodes_h_l2132_c7_355f_iftrue,
n16_MUX_uxn_opcodes_h_l2132_c7_355f_iffalse,
n16_MUX_uxn_opcodes_h_l2132_c7_355f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2132_c7_355f
tmp16_MUX_uxn_opcodes_h_l2132_c7_355f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2132_c7_355f_cond,
tmp16_MUX_uxn_opcodes_h_l2132_c7_355f_iftrue,
tmp16_MUX_uxn_opcodes_h_l2132_c7_355f_iffalse,
tmp16_MUX_uxn_opcodes_h_l2132_c7_355f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_355f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_355f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_355f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_355f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_355f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_355f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_355f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_355f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_355f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_355f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_355f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_355f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_355f
result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_355f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_355f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_355f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_355f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_355f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2132_c7_355f
result_u8_value_MUX_uxn_opcodes_h_l2132_c7_355f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2132_c7_355f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2132_c7_355f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2132_c7_355f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2132_c7_355f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_355f
result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_355f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_355f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_355f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_355f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_355f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2136_c11_35c0
BIN_OP_EQ_uxn_opcodes_h_l2136_c11_35c0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2136_c11_35c0_left,
BIN_OP_EQ_uxn_opcodes_h_l2136_c11_35c0_right,
BIN_OP_EQ_uxn_opcodes_h_l2136_c11_35c0_return_output);

-- n16_MUX_uxn_opcodes_h_l2136_c7_d341
n16_MUX_uxn_opcodes_h_l2136_c7_d341 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2136_c7_d341_cond,
n16_MUX_uxn_opcodes_h_l2136_c7_d341_iftrue,
n16_MUX_uxn_opcodes_h_l2136_c7_d341_iffalse,
n16_MUX_uxn_opcodes_h_l2136_c7_d341_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2136_c7_d341
tmp16_MUX_uxn_opcodes_h_l2136_c7_d341 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2136_c7_d341_cond,
tmp16_MUX_uxn_opcodes_h_l2136_c7_d341_iftrue,
tmp16_MUX_uxn_opcodes_h_l2136_c7_d341_iffalse,
tmp16_MUX_uxn_opcodes_h_l2136_c7_d341_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_d341
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_d341 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_d341_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_d341_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_d341_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_d341_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_d341
result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_d341 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_d341_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_d341_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_d341_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_d341_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_d341
result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_d341 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_d341_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_d341_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_d341_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_d341_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2136_c7_d341
result_u8_value_MUX_uxn_opcodes_h_l2136_c7_d341 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2136_c7_d341_cond,
result_u8_value_MUX_uxn_opcodes_h_l2136_c7_d341_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2136_c7_d341_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2136_c7_d341_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_d341
result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_d341 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_d341_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_d341_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_d341_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_d341_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2137_c3_8ec7
BIN_OP_OR_uxn_opcodes_h_l2137_c3_8ec7 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2137_c3_8ec7_left,
BIN_OP_OR_uxn_opcodes_h_l2137_c3_8ec7_right,
BIN_OP_OR_uxn_opcodes_h_l2137_c3_8ec7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2138_c11_5444
BIN_OP_EQ_uxn_opcodes_h_l2138_c11_5444 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2138_c11_5444_left,
BIN_OP_EQ_uxn_opcodes_h_l2138_c11_5444_right,
BIN_OP_EQ_uxn_opcodes_h_l2138_c11_5444_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l2138_c26_59d8
BIN_OP_DIV_uxn_opcodes_h_l2138_c26_59d8 : entity work.BIN_OP_DIV_uint16_t_uint16_t_0CLK_2b0015ee port map (
BIN_OP_DIV_uxn_opcodes_h_l2138_c26_59d8_left,
BIN_OP_DIV_uxn_opcodes_h_l2138_c26_59d8_right,
BIN_OP_DIV_uxn_opcodes_h_l2138_c26_59d8_return_output);

-- MUX_uxn_opcodes_h_l2138_c11_570b
MUX_uxn_opcodes_h_l2138_c11_570b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2138_c11_570b_cond,
MUX_uxn_opcodes_h_l2138_c11_570b_iftrue,
MUX_uxn_opcodes_h_l2138_c11_570b_iffalse,
MUX_uxn_opcodes_h_l2138_c11_570b_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2139_c30_bcba
sp_relative_shift_uxn_opcodes_h_l2139_c30_bcba : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2139_c30_bcba_ins,
sp_relative_shift_uxn_opcodes_h_l2139_c30_bcba_x,
sp_relative_shift_uxn_opcodes_h_l2139_c30_bcba_y,
sp_relative_shift_uxn_opcodes_h_l2139_c30_bcba_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2144_c11_a27c
BIN_OP_EQ_uxn_opcodes_h_l2144_c11_a27c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2144_c11_a27c_left,
BIN_OP_EQ_uxn_opcodes_h_l2144_c11_a27c_right,
BIN_OP_EQ_uxn_opcodes_h_l2144_c11_a27c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_8604
result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_8604 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_8604_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_8604_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_8604_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_8604_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2144_c7_8604
result_u8_value_MUX_uxn_opcodes_h_l2144_c7_8604 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2144_c7_8604_cond,
result_u8_value_MUX_uxn_opcodes_h_l2144_c7_8604_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2144_c7_8604_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2144_c7_8604_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_8604
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_8604 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_8604_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_8604_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_8604_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_8604_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_8604
result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_8604 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_8604_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_8604_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_8604_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_8604_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2147_c31_218f
CONST_SR_8_uxn_opcodes_h_l2147_c31_218f : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2147_c31_218f_x,
CONST_SR_8_uxn_opcodes_h_l2147_c31_218f_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2134_l2125_DUPLICATE_1d40
CONST_SL_8_uint16_t_uxn_opcodes_h_l2134_l2125_DUPLICATE_1d40 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2134_l2125_DUPLICATE_1d40_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2134_l2125_DUPLICATE_1d40_return_output);



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
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9271_return_output,
 n16_MUX_uxn_opcodes_h_l2107_c2_3872_return_output,
 tmp16_MUX_uxn_opcodes_h_l2107_c2_3872_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_3872_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_3872_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_3872_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2107_c2_3872_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_3872_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_3872_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_3872_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_3872_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_3872_return_output,
 t16_MUX_uxn_opcodes_h_l2107_c2_3872_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2120_c11_6e7b_return_output,
 n16_MUX_uxn_opcodes_h_l2120_c7_4821_return_output,
 tmp16_MUX_uxn_opcodes_h_l2120_c7_4821_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4821_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4821_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4821_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4821_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4821_return_output,
 t16_MUX_uxn_opcodes_h_l2120_c7_4821_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2123_c11_5429_return_output,
 n16_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output,
 tmp16_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output,
 t16_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2128_c11_540d_return_output,
 n16_MUX_uxn_opcodes_h_l2128_c7_5300_return_output,
 tmp16_MUX_uxn_opcodes_h_l2128_c7_5300_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_5300_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_5300_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_5300_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2128_c7_5300_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_5300_return_output,
 t16_MUX_uxn_opcodes_h_l2128_c7_5300_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2129_c3_b562_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2132_c11_ef94_return_output,
 n16_MUX_uxn_opcodes_h_l2132_c7_355f_return_output,
 tmp16_MUX_uxn_opcodes_h_l2132_c7_355f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_355f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_355f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_355f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2132_c7_355f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_355f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2136_c11_35c0_return_output,
 n16_MUX_uxn_opcodes_h_l2136_c7_d341_return_output,
 tmp16_MUX_uxn_opcodes_h_l2136_c7_d341_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_d341_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_d341_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_d341_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2136_c7_d341_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_d341_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2137_c3_8ec7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2138_c11_5444_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l2138_c26_59d8_return_output,
 MUX_uxn_opcodes_h_l2138_c11_570b_return_output,
 sp_relative_shift_uxn_opcodes_h_l2139_c30_bcba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2144_c11_a27c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_8604_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2144_c7_8604_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_8604_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_8604_return_output,
 CONST_SR_8_uxn_opcodes_h_l2147_c31_218f_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2134_l2125_DUPLICATE_1d40_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9271_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9271_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9271_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2120_c7_4821_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2107_c2_3872_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2107_c2_3872_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_4821_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2107_c2_3872_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2107_c2_3872_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4821_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_3872_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_3872_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2107_c2_3872_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_3872_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_3872_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2107_c2_3872_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_3872_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_3872_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4821_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c2_3872_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c2_3872_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4821_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_3872_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_3872_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2112_c3_44fe : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4821_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_3872_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_3872_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2107_c2_3872_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_3872_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_3872_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2117_c3_9c48 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4821_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_3872_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_3872_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2107_c2_3872_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_3872_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_3872_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2120_c7_4821_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2107_c2_3872_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2107_c2_3872_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_6e7b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_6e7b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_6e7b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2120_c7_4821_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2120_c7_4821_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2120_c7_4821_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_4821_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_4821_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_4821_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4821_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2121_c3_d1dc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4821_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4821_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4821_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4821_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4821_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4821_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4821_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4821_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4821_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4821_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4821_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4821_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4821_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4821_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2120_c7_4821_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2120_c7_4821_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2120_c7_4821_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_5429_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_5429_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_5429_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2123_c7_1b7d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2123_c7_1b7d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2128_c7_5300_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2123_c7_1b7d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2123_c7_1b7d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2123_c7_1b7d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2128_c7_5300_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2123_c7_1b7d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_1b7d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2126_c3_f9e0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_1b7d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_5300_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_1b7d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_1b7d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_1b7d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_5300_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_1b7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_1b7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_1b7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_5300_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_1b7d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2123_c7_1b7d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2123_c7_1b7d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_5300_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2123_c7_1b7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_1b7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_1b7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_5300_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_1b7d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2123_c7_1b7d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2123_c7_1b7d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2128_c7_5300_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2123_c7_1b7d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_540d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_540d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_540d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2128_c7_5300_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2128_c7_5300_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2132_c7_355f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2128_c7_5300_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2128_c7_5300_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2128_c7_5300_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2132_c7_355f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2128_c7_5300_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_5300_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2130_c3_a934 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_5300_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_355f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_5300_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_5300_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_5300_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_355f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_5300_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_5300_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_5300_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_355f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_5300_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_5300_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_5300_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2132_c7_355f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_5300_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_5300_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_5300_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_355f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_5300_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2128_c7_5300_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2128_c7_5300_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2128_c7_5300_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2129_c3_b562_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2129_c3_b562_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2129_c3_b562_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2132_c11_ef94_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2132_c11_ef94_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2132_c11_ef94_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2132_c7_355f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2132_c7_355f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2136_c7_d341_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2132_c7_355f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2132_c7_355f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2132_c7_355f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_d341_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2132_c7_355f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_355f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_355f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_d341_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_355f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_355f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_355f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_d341_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_355f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_355f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_355f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_d341_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_355f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2132_c7_355f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2132_c7_355f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_d341_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2132_c7_355f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_355f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_355f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_d341_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_355f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_35c0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_35c0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_35c0_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2136_c7_d341_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2136_c7_d341_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2136_c7_d341_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_d341_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_d341_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_d341_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_d341_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2141_c3_aaab : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_d341_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_8604_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_d341_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_d341_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_d341_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_8604_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_d341_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_d341_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_d341_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_d341_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_d341_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_d341_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_8604_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_d341_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_d341_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_d341_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_8604_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_d341_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2137_c3_8ec7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2137_c3_8ec7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2137_c3_8ec7_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2138_c11_570b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_5444_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_5444_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_5444_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2138_c11_570b_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2138_c11_570b_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2138_c26_59d8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2138_c26_59d8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2138_c26_59d8_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2138_c11_570b_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2139_c30_bcba_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2139_c30_bcba_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2139_c30_bcba_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2139_c30_bcba_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2142_c21_2a06_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_a27c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_a27c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_a27c_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_8604_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2145_c3_b823 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_8604_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_8604_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_8604_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_8604_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_8604_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_8604_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2146_c3_317a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_8604_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_8604_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_8604_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_8604_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_8604_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2147_c31_218f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2147_c31_218f_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2147_c21_2ff1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2128_l2123_l2120_l2107_l2144_l2132_DUPLICATE_e4e4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2128_l2123_l2120_l2144_l2132_DUPLICATE_8e3d_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2128_l2123_l2120_l2136_l2132_DUPLICATE_2133_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2128_l2123_l2120_l2144_l2136_l2132_DUPLICATE_ac10_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2133_l2129_l2124_l2137_DUPLICATE_f197_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2134_l2125_DUPLICATE_1d40_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2134_l2125_DUPLICATE_1d40_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2144_l2132_DUPLICATE_37f4_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l2151_l2103_DUPLICATE_d7f2_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2126_c3_f9e0 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_1b7d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2126_c3_f9e0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2132_c11_ef94_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_5444_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2141_c3_aaab := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_d341_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2141_c3_aaab;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_5429_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l2138_c11_570b_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2121_c3_d1dc := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4821_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2121_c3_d1dc;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2146_c3_317a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_8604_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2146_c3_317a;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2112_c3_44fe := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2112_c3_44fe;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2139_c30_bcba_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2117_c3_9c48 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2117_c3_9c48;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2139_c30_bcba_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_d341_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9271_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_540d_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_35c0_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_6e7b_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2130_c3_a934 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_5300_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2130_c3_a934;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_a27c_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_8604_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2145_c3_b823 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_8604_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2145_c3_b823;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2139_c30_bcba_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2137_c3_8ec7_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2120_c7_4821_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2123_c7_1b7d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2128_c7_5300_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2136_c7_d341_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9271_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_6e7b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_5429_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_540d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2132_c11_ef94_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_35c0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_a27c_left := VAR_phase;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2138_c26_59d8_right := t16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_5444_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2129_c3_b562_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2120_c7_4821_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2128_c7_5300_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2147_c31_218f_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_4821_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2123_c7_1b7d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2128_c7_5300_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2132_c7_355f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_d341_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2138_c11_5444] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2138_c11_5444_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_5444_left;
     BIN_OP_EQ_uxn_opcodes_h_l2138_c11_5444_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_5444_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_5444_return_output := BIN_OP_EQ_uxn_opcodes_h_l2138_c11_5444_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2107_c6_9271] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9271_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9271_left;
     BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9271_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9271_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9271_return_output := BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9271_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2132_c11_ef94] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2132_c11_ef94_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2132_c11_ef94_left;
     BIN_OP_EQ_uxn_opcodes_h_l2132_c11_ef94_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2132_c11_ef94_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2132_c11_ef94_return_output := BIN_OP_EQ_uxn_opcodes_h_l2132_c11_ef94_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2144_c11_a27c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2144_c11_a27c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_a27c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2144_c11_a27c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_a27c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_a27c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2144_c11_a27c_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2139_c30_bcba] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2139_c30_bcba_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2139_c30_bcba_ins;
     sp_relative_shift_uxn_opcodes_h_l2139_c30_bcba_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2139_c30_bcba_x;
     sp_relative_shift_uxn_opcodes_h_l2139_c30_bcba_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2139_c30_bcba_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2139_c30_bcba_return_output := sp_relative_shift_uxn_opcodes_h_l2139_c30_bcba_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2120_c11_6e7b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2120_c11_6e7b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_6e7b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2120_c11_6e7b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_6e7b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_6e7b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2120_c11_6e7b_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2147_c31_218f] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2147_c31_218f_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2147_c31_218f_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2147_c31_218f_return_output := CONST_SR_8_uxn_opcodes_h_l2147_c31_218f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2128_l2123_l2120_l2144_l2136_l2132_DUPLICATE_ac10 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2128_l2123_l2120_l2144_l2136_l2132_DUPLICATE_ac10_return_output := result.is_opc_done;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2107_c2_3872] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2107_c2_3872_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2136_c11_35c0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2136_c11_35c0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_35c0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2136_c11_35c0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_35c0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_35c0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2136_c11_35c0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2128_c11_540d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2128_c11_540d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_540d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2128_c11_540d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_540d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_540d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2128_c11_540d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2128_l2123_l2120_l2136_l2132_DUPLICATE_2133 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2128_l2123_l2120_l2136_l2132_DUPLICATE_2133_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2128_l2123_l2120_l2107_l2144_l2132_DUPLICATE_e4e4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2128_l2123_l2120_l2107_l2144_l2132_DUPLICATE_e4e4_return_output := result.u8_value;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2107_c2_3872] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2107_c2_3872_return_output := result.is_stack_index_flipped;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2133_l2129_l2124_l2137_DUPLICATE_f197 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2133_l2129_l2124_l2137_DUPLICATE_f197_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2144_l2132_DUPLICATE_37f4 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2144_l2132_DUPLICATE_37f4_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2128_l2123_l2120_l2144_l2132_DUPLICATE_8e3d LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2128_l2123_l2120_l2144_l2132_DUPLICATE_8e3d_return_output := result.sp_relative_shift;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2107_c2_3872] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2107_c2_3872_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l2123_c11_5429] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2123_c11_5429_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_5429_left;
     BIN_OP_EQ_uxn_opcodes_h_l2123_c11_5429_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_5429_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_5429_return_output := BIN_OP_EQ_uxn_opcodes_h_l2123_c11_5429_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2107_c2_3872] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2107_c2_3872_return_output := result.is_ram_write;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2107_c2_3872_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9271_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_3872_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9271_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_3872_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9271_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_3872_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9271_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_3872_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9271_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_3872_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9271_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_3872_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9271_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_3872_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9271_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_3872_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9271_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c2_3872_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9271_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2107_c2_3872_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9271_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2107_c2_3872_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9271_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2120_c7_4821_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_6e7b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4821_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_6e7b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4821_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_6e7b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4821_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_6e7b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4821_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_6e7b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4821_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_6e7b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2120_c7_4821_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_6e7b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_4821_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_6e7b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2123_c7_1b7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_5429_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_1b7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_5429_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_1b7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_5429_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_1b7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_5429_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_1b7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_5429_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2123_c7_1b7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_5429_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2123_c7_1b7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_5429_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2123_c7_1b7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_5429_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2128_c7_5300_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_540d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_5300_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_540d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_5300_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_540d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_5300_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_540d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_5300_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_540d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_5300_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_540d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2128_c7_5300_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_540d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2128_c7_5300_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_540d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2132_c7_355f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2132_c11_ef94_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_355f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2132_c11_ef94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_355f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2132_c11_ef94_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_355f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2132_c11_ef94_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_355f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2132_c11_ef94_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2132_c7_355f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2132_c11_ef94_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2132_c7_355f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2132_c11_ef94_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2136_c7_d341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_35c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_d341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_35c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_d341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_35c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_d341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_35c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_d341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_35c0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_d341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_35c0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_d341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_35c0_return_output;
     VAR_MUX_uxn_opcodes_h_l2138_c11_570b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_5444_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_8604_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_a27c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_8604_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_a27c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_8604_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_a27c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_8604_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_a27c_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2129_c3_b562_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2133_l2129_l2124_l2137_DUPLICATE_f197_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2137_c3_8ec7_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2133_l2129_l2124_l2137_DUPLICATE_f197_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2134_l2125_DUPLICATE_1d40_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2133_l2129_l2124_l2137_DUPLICATE_f197_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4821_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2128_l2123_l2120_l2144_l2132_DUPLICATE_8e3d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_1b7d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2128_l2123_l2120_l2144_l2132_DUPLICATE_8e3d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_5300_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2128_l2123_l2120_l2144_l2132_DUPLICATE_8e3d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_355f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2128_l2123_l2120_l2144_l2132_DUPLICATE_8e3d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_8604_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2128_l2123_l2120_l2144_l2132_DUPLICATE_8e3d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4821_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2128_l2123_l2120_l2144_l2136_l2132_DUPLICATE_ac10_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_1b7d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2128_l2123_l2120_l2144_l2136_l2132_DUPLICATE_ac10_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_5300_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2128_l2123_l2120_l2144_l2136_l2132_DUPLICATE_ac10_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_355f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2128_l2123_l2120_l2144_l2136_l2132_DUPLICATE_ac10_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_d341_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2128_l2123_l2120_l2144_l2136_l2132_DUPLICATE_ac10_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_8604_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2128_l2123_l2120_l2144_l2136_l2132_DUPLICATE_ac10_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4821_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2128_l2123_l2120_l2136_l2132_DUPLICATE_2133_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_1b7d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2128_l2123_l2120_l2136_l2132_DUPLICATE_2133_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_5300_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2128_l2123_l2120_l2136_l2132_DUPLICATE_2133_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_355f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2128_l2123_l2120_l2136_l2132_DUPLICATE_2133_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_d341_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2128_l2123_l2120_l2136_l2132_DUPLICATE_2133_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_355f_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2144_l2132_DUPLICATE_37f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_8604_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2144_l2132_DUPLICATE_37f4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2128_l2123_l2120_l2107_l2144_l2132_DUPLICATE_e4e4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4821_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2128_l2123_l2120_l2107_l2144_l2132_DUPLICATE_e4e4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2123_c7_1b7d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2128_l2123_l2120_l2107_l2144_l2132_DUPLICATE_e4e4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_5300_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2128_l2123_l2120_l2107_l2144_l2132_DUPLICATE_e4e4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2132_c7_355f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2128_l2123_l2120_l2107_l2144_l2132_DUPLICATE_e4e4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_8604_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2128_l2123_l2120_l2107_l2144_l2132_DUPLICATE_e4e4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2107_c2_3872_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2107_c2_3872_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2107_c2_3872_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2107_c2_3872_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_d341_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2139_c30_bcba_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l2107_c2_3872] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_3872_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_3872_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_3872_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_3872_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2107_c2_3872] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_3872_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_3872_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_3872_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_3872_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2136_c7_d341] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_d341_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_d341_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_d341_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_d341_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_d341_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_d341_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_d341_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_d341_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2107_c2_3872] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_3872_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_3872_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_3872_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_3872_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2137_c3_8ec7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2137_c3_8ec7_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2137_c3_8ec7_left;
     BIN_OP_OR_uxn_opcodes_h_l2137_c3_8ec7_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2137_c3_8ec7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2137_c3_8ec7_return_output := BIN_OP_OR_uxn_opcodes_h_l2137_c3_8ec7_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2107_c2_3872] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_3872_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_3872_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_3872_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_3872_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2129_c3_b562] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2129_c3_b562_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2129_c3_b562_left;
     BIN_OP_OR_uxn_opcodes_h_l2129_c3_b562_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2129_c3_b562_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2129_c3_b562_return_output := BIN_OP_OR_uxn_opcodes_h_l2129_c3_b562_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2144_c7_8604] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_8604_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_8604_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_8604_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_8604_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_8604_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_8604_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_8604_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_8604_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2147_c21_2ff1] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2147_c21_2ff1_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2147_c31_218f_return_output);

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2134_l2125_DUPLICATE_1d40 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2134_l2125_DUPLICATE_1d40_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2134_l2125_DUPLICATE_1d40_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2134_l2125_DUPLICATE_1d40_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2134_l2125_DUPLICATE_1d40_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2144_c7_8604] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_8604_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_8604_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_8604_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_8604_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_8604_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_8604_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_8604_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_8604_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2144_c7_8604] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_8604_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_8604_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_8604_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_8604_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_8604_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_8604_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_8604_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_8604_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2128_c7_5300_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2129_c3_b562_return_output;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2138_c26_59d8_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2137_c3_8ec7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2136_c7_d341_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2137_c3_8ec7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_8604_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2147_c21_2ff1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2132_c7_355f_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2134_l2125_DUPLICATE_1d40_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2123_c7_1b7d_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2134_l2125_DUPLICATE_1d40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_d341_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_8604_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_355f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_d341_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_d341_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_8604_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_d341_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_8604_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2132_c7_355f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_355f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_355f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_355f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_355f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_355f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_355f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_355f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_355f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2136_c7_d341] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_d341_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_d341_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_d341_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_d341_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_d341_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_d341_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_d341_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_d341_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2136_c7_d341] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_d341_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_d341_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_d341_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_d341_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_d341_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_d341_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_d341_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_d341_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2144_c7_8604] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2144_c7_8604_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_8604_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2144_c7_8604_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_8604_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2144_c7_8604_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_8604_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_8604_return_output := result_u8_value_MUX_uxn_opcodes_h_l2144_c7_8604_return_output;

     -- BIN_OP_DIV[uxn_opcodes_h_l2138_c26_59d8] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l2138_c26_59d8_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2138_c26_59d8_left;
     BIN_OP_DIV_uxn_opcodes_h_l2138_c26_59d8_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2138_c26_59d8_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2138_c26_59d8_return_output := BIN_OP_DIV_uxn_opcodes_h_l2138_c26_59d8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2136_c7_d341] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_d341_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_d341_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_d341_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_d341_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_d341_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_d341_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_d341_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_d341_return_output;

     -- t16_MUX[uxn_opcodes_h_l2128_c7_5300] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2128_c7_5300_cond <= VAR_t16_MUX_uxn_opcodes_h_l2128_c7_5300_cond;
     t16_MUX_uxn_opcodes_h_l2128_c7_5300_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2128_c7_5300_iftrue;
     t16_MUX_uxn_opcodes_h_l2128_c7_5300_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2128_c7_5300_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2128_c7_5300_return_output := t16_MUX_uxn_opcodes_h_l2128_c7_5300_return_output;

     -- n16_MUX[uxn_opcodes_h_l2136_c7_d341] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2136_c7_d341_cond <= VAR_n16_MUX_uxn_opcodes_h_l2136_c7_d341_cond;
     n16_MUX_uxn_opcodes_h_l2136_c7_d341_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2136_c7_d341_iftrue;
     n16_MUX_uxn_opcodes_h_l2136_c7_d341_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2136_c7_d341_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2136_c7_d341_return_output := n16_MUX_uxn_opcodes_h_l2136_c7_d341_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l2138_c11_570b_iffalse := VAR_BIN_OP_DIV_uxn_opcodes_h_l2138_c26_59d8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2132_c7_355f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2136_c7_d341_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_355f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_d341_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_5300_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_355f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_355f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_d341_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_355f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_d341_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_d341_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_8604_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2123_c7_1b7d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2128_c7_5300_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2132_c7_355f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_355f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_355f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_355f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_355f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_355f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_355f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_355f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_355f_return_output;

     -- t16_MUX[uxn_opcodes_h_l2123_c7_1b7d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2123_c7_1b7d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2123_c7_1b7d_cond;
     t16_MUX_uxn_opcodes_h_l2123_c7_1b7d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2123_c7_1b7d_iftrue;
     t16_MUX_uxn_opcodes_h_l2123_c7_1b7d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2123_c7_1b7d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output := t16_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2132_c7_355f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_355f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_355f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_355f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_355f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_355f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_355f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_355f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_355f_return_output;

     -- MUX[uxn_opcodes_h_l2138_c11_570b] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2138_c11_570b_cond <= VAR_MUX_uxn_opcodes_h_l2138_c11_570b_cond;
     MUX_uxn_opcodes_h_l2138_c11_570b_iftrue <= VAR_MUX_uxn_opcodes_h_l2138_c11_570b_iftrue;
     MUX_uxn_opcodes_h_l2138_c11_570b_iffalse <= VAR_MUX_uxn_opcodes_h_l2138_c11_570b_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2138_c11_570b_return_output := MUX_uxn_opcodes_h_l2138_c11_570b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2132_c7_355f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_355f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_355f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_355f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_355f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_355f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_355f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_355f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_355f_return_output;

     -- n16_MUX[uxn_opcodes_h_l2132_c7_355f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2132_c7_355f_cond <= VAR_n16_MUX_uxn_opcodes_h_l2132_c7_355f_cond;
     n16_MUX_uxn_opcodes_h_l2132_c7_355f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2132_c7_355f_iftrue;
     n16_MUX_uxn_opcodes_h_l2132_c7_355f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2132_c7_355f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2132_c7_355f_return_output := n16_MUX_uxn_opcodes_h_l2132_c7_355f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2128_c7_5300] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_5300_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_5300_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_5300_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_5300_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_5300_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_5300_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_5300_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_5300_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_d341_iftrue := VAR_MUX_uxn_opcodes_h_l2138_c11_570b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2128_c7_5300_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2132_c7_355f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_5300_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_355f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_1b7d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_5300_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_5300_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_355f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_5300_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_355f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2120_c7_4821_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2123_c7_1b7d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_1b7d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_1b7d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_1b7d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_1b7d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_1b7d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_1b7d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2128_c7_5300] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_5300_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_5300_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_5300_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_5300_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_5300_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_5300_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_5300_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_5300_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2128_c7_5300] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_5300_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_5300_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_5300_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_5300_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_5300_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_5300_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_5300_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_5300_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2136_c7_d341] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2136_c7_d341_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_d341_cond;
     tmp16_MUX_uxn_opcodes_h_l2136_c7_d341_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_d341_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2136_c7_d341_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_d341_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_d341_return_output := tmp16_MUX_uxn_opcodes_h_l2136_c7_d341_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2128_c7_5300] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_5300_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_5300_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_5300_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_5300_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_5300_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_5300_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_5300_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_5300_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2142_c21_2a06] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2142_c21_2a06_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_MUX_uxn_opcodes_h_l2138_c11_570b_return_output);

     -- t16_MUX[uxn_opcodes_h_l2120_c7_4821] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2120_c7_4821_cond <= VAR_t16_MUX_uxn_opcodes_h_l2120_c7_4821_cond;
     t16_MUX_uxn_opcodes_h_l2120_c7_4821_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2120_c7_4821_iftrue;
     t16_MUX_uxn_opcodes_h_l2120_c7_4821_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2120_c7_4821_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2120_c7_4821_return_output := t16_MUX_uxn_opcodes_h_l2120_c7_4821_return_output;

     -- n16_MUX[uxn_opcodes_h_l2128_c7_5300] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2128_c7_5300_cond <= VAR_n16_MUX_uxn_opcodes_h_l2128_c7_5300_cond;
     n16_MUX_uxn_opcodes_h_l2128_c7_5300_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2128_c7_5300_iftrue;
     n16_MUX_uxn_opcodes_h_l2128_c7_5300_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2128_c7_5300_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2128_c7_5300_return_output := n16_MUX_uxn_opcodes_h_l2128_c7_5300_return_output;

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_d341_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2142_c21_2a06_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2123_c7_1b7d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2128_c7_5300_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_1b7d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_5300_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4821_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_1b7d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_5300_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_1b7d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_5300_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2120_c7_4821_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2132_c7_355f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_d341_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2120_c7_4821] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4821_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4821_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4821_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4821_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4821_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4821_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4821_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4821_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2123_c7_1b7d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_1b7d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_1b7d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_1b7d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_1b7d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_1b7d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_1b7d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2123_c7_1b7d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_1b7d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_1b7d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_1b7d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_1b7d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_1b7d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_1b7d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output;

     -- t16_MUX[uxn_opcodes_h_l2107_c2_3872] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2107_c2_3872_cond <= VAR_t16_MUX_uxn_opcodes_h_l2107_c2_3872_cond;
     t16_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue;
     t16_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2107_c2_3872_return_output := t16_MUX_uxn_opcodes_h_l2107_c2_3872_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2123_c7_1b7d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_1b7d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_1b7d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_1b7d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_1b7d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_1b7d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_1b7d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output;

     -- n16_MUX[uxn_opcodes_h_l2123_c7_1b7d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2123_c7_1b7d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2123_c7_1b7d_cond;
     n16_MUX_uxn_opcodes_h_l2123_c7_1b7d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2123_c7_1b7d_iftrue;
     n16_MUX_uxn_opcodes_h_l2123_c7_1b7d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2123_c7_1b7d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output := n16_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2132_c7_355f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2132_c7_355f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2132_c7_355f_cond;
     tmp16_MUX_uxn_opcodes_h_l2132_c7_355f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2132_c7_355f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2132_c7_355f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2132_c7_355f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2132_c7_355f_return_output := tmp16_MUX_uxn_opcodes_h_l2132_c7_355f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2136_c7_d341] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2136_c7_d341_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_d341_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2136_c7_d341_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_d341_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2136_c7_d341_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_d341_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_d341_return_output := result_u8_value_MUX_uxn_opcodes_h_l2136_c7_d341_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2120_c7_4821_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4821_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_4821_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4821_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4821_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2132_c7_355f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_d341_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2107_c2_3872_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2128_c7_5300_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2132_c7_355f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2120_c7_4821] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4821_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4821_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4821_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4821_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4821_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4821_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4821_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4821_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2120_c7_4821] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4821_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4821_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4821_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4821_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4821_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4821_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4821_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4821_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2132_c7_355f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2132_c7_355f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2132_c7_355f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2132_c7_355f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2132_c7_355f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2132_c7_355f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2132_c7_355f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2132_c7_355f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2132_c7_355f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2120_c7_4821] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4821_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4821_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4821_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4821_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4821_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4821_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4821_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4821_return_output;

     -- n16_MUX[uxn_opcodes_h_l2120_c7_4821] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2120_c7_4821_cond <= VAR_n16_MUX_uxn_opcodes_h_l2120_c7_4821_cond;
     n16_MUX_uxn_opcodes_h_l2120_c7_4821_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2120_c7_4821_iftrue;
     n16_MUX_uxn_opcodes_h_l2120_c7_4821_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2120_c7_4821_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2120_c7_4821_return_output := n16_MUX_uxn_opcodes_h_l2120_c7_4821_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2107_c2_3872] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_3872_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_3872_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_3872_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_3872_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2128_c7_5300] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2128_c7_5300_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2128_c7_5300_cond;
     tmp16_MUX_uxn_opcodes_h_l2128_c7_5300_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2128_c7_5300_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2128_c7_5300_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2128_c7_5300_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2128_c7_5300_return_output := tmp16_MUX_uxn_opcodes_h_l2128_c7_5300_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2120_c7_4821_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_4821_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_4821_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_4821_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_5300_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2132_c7_355f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2123_c7_1b7d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2128_c7_5300_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2128_c7_5300] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2128_c7_5300_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_5300_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2128_c7_5300_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_5300_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2128_c7_5300_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_5300_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_5300_return_output := result_u8_value_MUX_uxn_opcodes_h_l2128_c7_5300_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2107_c2_3872] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_3872_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_3872_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_3872_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_3872_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2107_c2_3872] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_3872_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_3872_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_3872_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_3872_return_output;

     -- n16_MUX[uxn_opcodes_h_l2107_c2_3872] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2107_c2_3872_cond <= VAR_n16_MUX_uxn_opcodes_h_l2107_c2_3872_cond;
     n16_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue;
     n16_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2107_c2_3872_return_output := n16_MUX_uxn_opcodes_h_l2107_c2_3872_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2123_c7_1b7d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2123_c7_1b7d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2123_c7_1b7d_cond;
     tmp16_MUX_uxn_opcodes_h_l2123_c7_1b7d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2123_c7_1b7d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2123_c7_1b7d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2123_c7_1b7d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output := tmp16_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2107_c2_3872] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_3872_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_3872_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_3872_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_3872_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2107_c2_3872_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2123_c7_1b7d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_5300_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_4821_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2123_c7_1b7d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2123_c7_1b7d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2123_c7_1b7d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2123_c7_1b7d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2123_c7_1b7d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2123_c7_1b7d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2123_c7_1b7d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2120_c7_4821] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2120_c7_4821_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_4821_cond;
     tmp16_MUX_uxn_opcodes_h_l2120_c7_4821_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_4821_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2120_c7_4821_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_4821_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_4821_return_output := tmp16_MUX_uxn_opcodes_h_l2120_c7_4821_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4821_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2123_c7_1b7d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_4821_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2107_c2_3872] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2107_c2_3872_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2107_c2_3872_cond;
     tmp16_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2107_c2_3872_return_output := tmp16_MUX_uxn_opcodes_h_l2107_c2_3872_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2120_c7_4821] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4821_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4821_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4821_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4821_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4821_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4821_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4821_return_output := result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4821_return_output;

     -- Submodule level 10
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_4821_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2107_c2_3872_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2107_c2_3872] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2107_c2_3872_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c2_3872_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c2_3872_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c2_3872_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c2_3872_return_output := result_u8_value_MUX_uxn_opcodes_h_l2107_c2_3872_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l2151_l2103_DUPLICATE_d7f2 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l2151_l2103_DUPLICATE_d7f2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_188e(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_3872_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_3872_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_3872_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c2_3872_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_3872_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_3872_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_3872_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_3872_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_3872_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l2151_l2103_DUPLICATE_d7f2_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l2151_l2103_DUPLICATE_d7f2_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
