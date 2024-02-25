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
-- BIN_OP_EQ[uxn_opcodes_h_l1197_c6_4461]
signal BIN_OP_EQ_uxn_opcodes_h_l1197_c6_4461_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1197_c6_4461_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1197_c6_4461_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1197_c2_3319]
signal t16_MUX_uxn_opcodes_h_l1197_c2_3319_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1197_c2_3319_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1197_c2_3319]
signal n16_MUX_uxn_opcodes_h_l1197_c2_3319_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1197_c2_3319_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1197_c2_3319]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3319_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3319_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1197_c2_3319]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3319_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3319_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1197_c2_3319]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3319_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3319_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1197_c2_3319]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3319_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3319_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1197_c2_3319]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3319_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3319_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1197_c2_3319]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3319_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3319_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1197_c2_3319]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3319_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3319_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1197_c2_3319]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3319_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3319_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1197_c2_3319]
signal result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3319_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3319_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1210_c11_4197]
signal BIN_OP_EQ_uxn_opcodes_h_l1210_c11_4197_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1210_c11_4197_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1210_c11_4197_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1210_c7_cfc6]
signal t16_MUX_uxn_opcodes_h_l1210_c7_cfc6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1210_c7_cfc6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1210_c7_cfc6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1210_c7_cfc6_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1210_c7_cfc6]
signal n16_MUX_uxn_opcodes_h_l1210_c7_cfc6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1210_c7_cfc6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1210_c7_cfc6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1210_c7_cfc6_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1210_c7_cfc6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cfc6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cfc6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cfc6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cfc6_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1210_c7_cfc6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cfc6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cfc6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cfc6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cfc6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1210_c7_cfc6]
signal result_u8_value_MUX_uxn_opcodes_h_l1210_c7_cfc6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1210_c7_cfc6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1210_c7_cfc6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1210_c7_cfc6_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1210_c7_cfc6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cfc6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cfc6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cfc6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cfc6_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1210_c7_cfc6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cfc6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cfc6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cfc6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cfc6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1213_c11_4650]
signal BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4650_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4650_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4650_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1213_c7_2dd2]
signal t16_MUX_uxn_opcodes_h_l1213_c7_2dd2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1213_c7_2dd2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1213_c7_2dd2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1213_c7_2dd2_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1213_c7_2dd2]
signal n16_MUX_uxn_opcodes_h_l1213_c7_2dd2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1213_c7_2dd2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1213_c7_2dd2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1213_c7_2dd2_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1213_c7_2dd2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_2dd2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_2dd2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_2dd2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_2dd2_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1213_c7_2dd2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_2dd2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_2dd2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_2dd2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_2dd2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1213_c7_2dd2]
signal result_u8_value_MUX_uxn_opcodes_h_l1213_c7_2dd2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1213_c7_2dd2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1213_c7_2dd2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1213_c7_2dd2_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1213_c7_2dd2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_2dd2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_2dd2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_2dd2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_2dd2_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1213_c7_2dd2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_2dd2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_2dd2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_2dd2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_2dd2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1218_c11_9f92]
signal BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9f92_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9f92_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9f92_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1218_c7_7d44]
signal t16_MUX_uxn_opcodes_h_l1218_c7_7d44_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1218_c7_7d44_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1218_c7_7d44_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1218_c7_7d44_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1218_c7_7d44]
signal n16_MUX_uxn_opcodes_h_l1218_c7_7d44_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1218_c7_7d44_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1218_c7_7d44_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1218_c7_7d44_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1218_c7_7d44]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_7d44_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_7d44_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_7d44_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_7d44_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1218_c7_7d44]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_7d44_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_7d44_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_7d44_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_7d44_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1218_c7_7d44]
signal result_u8_value_MUX_uxn_opcodes_h_l1218_c7_7d44_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1218_c7_7d44_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1218_c7_7d44_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1218_c7_7d44_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1218_c7_7d44]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_7d44_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_7d44_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_7d44_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_7d44_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1218_c7_7d44]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_7d44_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_7d44_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_7d44_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_7d44_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1219_c3_fe08]
signal BIN_OP_OR_uxn_opcodes_h_l1219_c3_fe08_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1219_c3_fe08_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1219_c3_fe08_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1222_c11_596b]
signal BIN_OP_EQ_uxn_opcodes_h_l1222_c11_596b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1222_c11_596b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1222_c11_596b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1222_c7_b935]
signal n16_MUX_uxn_opcodes_h_l1222_c7_b935_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1222_c7_b935_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1222_c7_b935_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1222_c7_b935_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1222_c7_b935]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_b935_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_b935_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_b935_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_b935_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1222_c7_b935]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_b935_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_b935_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_b935_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_b935_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1222_c7_b935]
signal result_u8_value_MUX_uxn_opcodes_h_l1222_c7_b935_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1222_c7_b935_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1222_c7_b935_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1222_c7_b935_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1222_c7_b935]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_b935_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_b935_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_b935_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_b935_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1222_c7_b935]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_b935_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_b935_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_b935_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_b935_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1226_c11_b921]
signal BIN_OP_EQ_uxn_opcodes_h_l1226_c11_b921_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1226_c11_b921_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1226_c11_b921_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1226_c7_e64b]
signal n16_MUX_uxn_opcodes_h_l1226_c7_e64b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1226_c7_e64b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1226_c7_e64b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1226_c7_e64b_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1226_c7_e64b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_e64b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_e64b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_e64b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_e64b_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1226_c7_e64b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_e64b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_e64b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_e64b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_e64b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1226_c7_e64b]
signal result_u8_value_MUX_uxn_opcodes_h_l1226_c7_e64b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1226_c7_e64b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1226_c7_e64b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1226_c7_e64b_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1226_c7_e64b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_e64b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_e64b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_e64b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_e64b_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1226_c7_e64b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_e64b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_e64b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_e64b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_e64b_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1227_c3_0a50]
signal BIN_OP_OR_uxn_opcodes_h_l1227_c3_0a50_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1227_c3_0a50_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1227_c3_0a50_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1228_c30_0616]
signal sp_relative_shift_uxn_opcodes_h_l1228_c30_0616_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1228_c30_0616_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1228_c30_0616_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1228_c30_0616_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1231_c21_d927]
signal BIN_OP_EQ_uxn_opcodes_h_l1231_c21_d927_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1231_c21_d927_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1231_c21_d927_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1231_c21_378c]
signal MUX_uxn_opcodes_h_l1231_c21_378c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1231_c21_378c_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1231_c21_378c_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1231_c21_378c_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1224_l1215_DUPLICATE_ad3b
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1224_l1215_DUPLICATE_ad3b_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1224_l1215_DUPLICATE_ad3b_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_8b52( ref_toks_0 : opcode_result_t;
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
      base.is_pc_updated := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.is_vram_write := ref_toks_8;
      base.u8_value := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1197_c6_4461
BIN_OP_EQ_uxn_opcodes_h_l1197_c6_4461 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1197_c6_4461_left,
BIN_OP_EQ_uxn_opcodes_h_l1197_c6_4461_right,
BIN_OP_EQ_uxn_opcodes_h_l1197_c6_4461_return_output);

-- t16_MUX_uxn_opcodes_h_l1197_c2_3319
t16_MUX_uxn_opcodes_h_l1197_c2_3319 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1197_c2_3319_cond,
t16_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue,
t16_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse,
t16_MUX_uxn_opcodes_h_l1197_c2_3319_return_output);

-- n16_MUX_uxn_opcodes_h_l1197_c2_3319
n16_MUX_uxn_opcodes_h_l1197_c2_3319 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1197_c2_3319_cond,
n16_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue,
n16_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse,
n16_MUX_uxn_opcodes_h_l1197_c2_3319_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3319
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3319 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3319_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3319_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3319
result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3319 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3319_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3319_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3319
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3319 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3319_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3319_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3319
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3319 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3319_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3319_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3319
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3319 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3319_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3319_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3319
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3319 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3319_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3319_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3319
result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3319 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3319_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3319_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3319
result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3319 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3319_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3319_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3319
result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3319 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3319_cond,
result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3319_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1210_c11_4197
BIN_OP_EQ_uxn_opcodes_h_l1210_c11_4197 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1210_c11_4197_left,
BIN_OP_EQ_uxn_opcodes_h_l1210_c11_4197_right,
BIN_OP_EQ_uxn_opcodes_h_l1210_c11_4197_return_output);

-- t16_MUX_uxn_opcodes_h_l1210_c7_cfc6
t16_MUX_uxn_opcodes_h_l1210_c7_cfc6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1210_c7_cfc6_cond,
t16_MUX_uxn_opcodes_h_l1210_c7_cfc6_iftrue,
t16_MUX_uxn_opcodes_h_l1210_c7_cfc6_iffalse,
t16_MUX_uxn_opcodes_h_l1210_c7_cfc6_return_output);

-- n16_MUX_uxn_opcodes_h_l1210_c7_cfc6
n16_MUX_uxn_opcodes_h_l1210_c7_cfc6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1210_c7_cfc6_cond,
n16_MUX_uxn_opcodes_h_l1210_c7_cfc6_iftrue,
n16_MUX_uxn_opcodes_h_l1210_c7_cfc6_iffalse,
n16_MUX_uxn_opcodes_h_l1210_c7_cfc6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cfc6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cfc6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cfc6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cfc6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cfc6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cfc6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cfc6
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cfc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cfc6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cfc6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cfc6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cfc6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1210_c7_cfc6
result_u8_value_MUX_uxn_opcodes_h_l1210_c7_cfc6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1210_c7_cfc6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1210_c7_cfc6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1210_c7_cfc6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1210_c7_cfc6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cfc6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cfc6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cfc6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cfc6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cfc6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cfc6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cfc6
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cfc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cfc6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cfc6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cfc6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cfc6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4650
BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4650 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4650_left,
BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4650_right,
BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4650_return_output);

-- t16_MUX_uxn_opcodes_h_l1213_c7_2dd2
t16_MUX_uxn_opcodes_h_l1213_c7_2dd2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1213_c7_2dd2_cond,
t16_MUX_uxn_opcodes_h_l1213_c7_2dd2_iftrue,
t16_MUX_uxn_opcodes_h_l1213_c7_2dd2_iffalse,
t16_MUX_uxn_opcodes_h_l1213_c7_2dd2_return_output);

-- n16_MUX_uxn_opcodes_h_l1213_c7_2dd2
n16_MUX_uxn_opcodes_h_l1213_c7_2dd2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1213_c7_2dd2_cond,
n16_MUX_uxn_opcodes_h_l1213_c7_2dd2_iftrue,
n16_MUX_uxn_opcodes_h_l1213_c7_2dd2_iffalse,
n16_MUX_uxn_opcodes_h_l1213_c7_2dd2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_2dd2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_2dd2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_2dd2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_2dd2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_2dd2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_2dd2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_2dd2
result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_2dd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_2dd2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_2dd2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_2dd2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_2dd2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1213_c7_2dd2
result_u8_value_MUX_uxn_opcodes_h_l1213_c7_2dd2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1213_c7_2dd2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1213_c7_2dd2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1213_c7_2dd2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1213_c7_2dd2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_2dd2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_2dd2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_2dd2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_2dd2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_2dd2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_2dd2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_2dd2
result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_2dd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_2dd2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_2dd2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_2dd2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_2dd2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9f92
BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9f92 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9f92_left,
BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9f92_right,
BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9f92_return_output);

-- t16_MUX_uxn_opcodes_h_l1218_c7_7d44
t16_MUX_uxn_opcodes_h_l1218_c7_7d44 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1218_c7_7d44_cond,
t16_MUX_uxn_opcodes_h_l1218_c7_7d44_iftrue,
t16_MUX_uxn_opcodes_h_l1218_c7_7d44_iffalse,
t16_MUX_uxn_opcodes_h_l1218_c7_7d44_return_output);

-- n16_MUX_uxn_opcodes_h_l1218_c7_7d44
n16_MUX_uxn_opcodes_h_l1218_c7_7d44 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1218_c7_7d44_cond,
n16_MUX_uxn_opcodes_h_l1218_c7_7d44_iftrue,
n16_MUX_uxn_opcodes_h_l1218_c7_7d44_iffalse,
n16_MUX_uxn_opcodes_h_l1218_c7_7d44_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_7d44
result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_7d44 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_7d44_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_7d44_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_7d44_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_7d44_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_7d44
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_7d44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_7d44_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_7d44_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_7d44_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_7d44_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1218_c7_7d44
result_u8_value_MUX_uxn_opcodes_h_l1218_c7_7d44 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1218_c7_7d44_cond,
result_u8_value_MUX_uxn_opcodes_h_l1218_c7_7d44_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1218_c7_7d44_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1218_c7_7d44_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_7d44
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_7d44 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_7d44_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_7d44_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_7d44_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_7d44_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_7d44
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_7d44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_7d44_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_7d44_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_7d44_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_7d44_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1219_c3_fe08
BIN_OP_OR_uxn_opcodes_h_l1219_c3_fe08 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1219_c3_fe08_left,
BIN_OP_OR_uxn_opcodes_h_l1219_c3_fe08_right,
BIN_OP_OR_uxn_opcodes_h_l1219_c3_fe08_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1222_c11_596b
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_596b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_596b_left,
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_596b_right,
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_596b_return_output);

-- n16_MUX_uxn_opcodes_h_l1222_c7_b935
n16_MUX_uxn_opcodes_h_l1222_c7_b935 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1222_c7_b935_cond,
n16_MUX_uxn_opcodes_h_l1222_c7_b935_iftrue,
n16_MUX_uxn_opcodes_h_l1222_c7_b935_iffalse,
n16_MUX_uxn_opcodes_h_l1222_c7_b935_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_b935
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_b935 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_b935_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_b935_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_b935_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_b935_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_b935
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_b935 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_b935_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_b935_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_b935_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_b935_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1222_c7_b935
result_u8_value_MUX_uxn_opcodes_h_l1222_c7_b935 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1222_c7_b935_cond,
result_u8_value_MUX_uxn_opcodes_h_l1222_c7_b935_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1222_c7_b935_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1222_c7_b935_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_b935
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_b935 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_b935_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_b935_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_b935_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_b935_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_b935
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_b935 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_b935_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_b935_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_b935_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_b935_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1226_c11_b921
BIN_OP_EQ_uxn_opcodes_h_l1226_c11_b921 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1226_c11_b921_left,
BIN_OP_EQ_uxn_opcodes_h_l1226_c11_b921_right,
BIN_OP_EQ_uxn_opcodes_h_l1226_c11_b921_return_output);

-- n16_MUX_uxn_opcodes_h_l1226_c7_e64b
n16_MUX_uxn_opcodes_h_l1226_c7_e64b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1226_c7_e64b_cond,
n16_MUX_uxn_opcodes_h_l1226_c7_e64b_iftrue,
n16_MUX_uxn_opcodes_h_l1226_c7_e64b_iffalse,
n16_MUX_uxn_opcodes_h_l1226_c7_e64b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_e64b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_e64b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_e64b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_e64b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_e64b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_e64b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_e64b
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_e64b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_e64b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_e64b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_e64b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_e64b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1226_c7_e64b
result_u8_value_MUX_uxn_opcodes_h_l1226_c7_e64b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1226_c7_e64b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1226_c7_e64b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1226_c7_e64b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1226_c7_e64b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_e64b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_e64b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_e64b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_e64b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_e64b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_e64b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_e64b
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_e64b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_e64b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_e64b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_e64b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_e64b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1227_c3_0a50
BIN_OP_OR_uxn_opcodes_h_l1227_c3_0a50 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1227_c3_0a50_left,
BIN_OP_OR_uxn_opcodes_h_l1227_c3_0a50_right,
BIN_OP_OR_uxn_opcodes_h_l1227_c3_0a50_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1228_c30_0616
sp_relative_shift_uxn_opcodes_h_l1228_c30_0616 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1228_c30_0616_ins,
sp_relative_shift_uxn_opcodes_h_l1228_c30_0616_x,
sp_relative_shift_uxn_opcodes_h_l1228_c30_0616_y,
sp_relative_shift_uxn_opcodes_h_l1228_c30_0616_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1231_c21_d927
BIN_OP_EQ_uxn_opcodes_h_l1231_c21_d927 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1231_c21_d927_left,
BIN_OP_EQ_uxn_opcodes_h_l1231_c21_d927_right,
BIN_OP_EQ_uxn_opcodes_h_l1231_c21_d927_return_output);

-- MUX_uxn_opcodes_h_l1231_c21_378c
MUX_uxn_opcodes_h_l1231_c21_378c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1231_c21_378c_cond,
MUX_uxn_opcodes_h_l1231_c21_378c_iftrue,
MUX_uxn_opcodes_h_l1231_c21_378c_iffalse,
MUX_uxn_opcodes_h_l1231_c21_378c_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1224_l1215_DUPLICATE_ad3b
CONST_SL_8_uint16_t_uxn_opcodes_h_l1224_l1215_DUPLICATE_ad3b : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1224_l1215_DUPLICATE_ad3b_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1224_l1215_DUPLICATE_ad3b_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1197_c6_4461_return_output,
 t16_MUX_uxn_opcodes_h_l1197_c2_3319_return_output,
 n16_MUX_uxn_opcodes_h_l1197_c2_3319_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3319_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3319_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3319_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3319_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3319_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3319_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3319_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3319_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3319_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1210_c11_4197_return_output,
 t16_MUX_uxn_opcodes_h_l1210_c7_cfc6_return_output,
 n16_MUX_uxn_opcodes_h_l1210_c7_cfc6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cfc6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cfc6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1210_c7_cfc6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cfc6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cfc6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4650_return_output,
 t16_MUX_uxn_opcodes_h_l1213_c7_2dd2_return_output,
 n16_MUX_uxn_opcodes_h_l1213_c7_2dd2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_2dd2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_2dd2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1213_c7_2dd2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_2dd2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_2dd2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9f92_return_output,
 t16_MUX_uxn_opcodes_h_l1218_c7_7d44_return_output,
 n16_MUX_uxn_opcodes_h_l1218_c7_7d44_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_7d44_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_7d44_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1218_c7_7d44_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_7d44_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_7d44_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1219_c3_fe08_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1222_c11_596b_return_output,
 n16_MUX_uxn_opcodes_h_l1222_c7_b935_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_b935_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_b935_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1222_c7_b935_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_b935_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_b935_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1226_c11_b921_return_output,
 n16_MUX_uxn_opcodes_h_l1226_c7_e64b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_e64b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_e64b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1226_c7_e64b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_e64b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_e64b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1227_c3_0a50_return_output,
 sp_relative_shift_uxn_opcodes_h_l1228_c30_0616_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1231_c21_d927_return_output,
 MUX_uxn_opcodes_h_l1231_c21_378c_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1224_l1215_DUPLICATE_ad3b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_4461_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_4461_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_4461_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1210_c7_cfc6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1197_c2_3319_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1197_c2_3319_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1210_c7_cfc6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c2_3319_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c2_3319_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1202_c3_f1b2 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cfc6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3319_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3319_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1197_c2_3319_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3319_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3319_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1197_c2_3319_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3319_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3319_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cfc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3319_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3319_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1207_c3_24e8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cfc6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3319_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3319_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cfc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3319_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3319_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1197_c2_3319_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3319_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3319_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1197_c2_3319_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3319_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3319_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_cfc6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3319_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3319_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_4197_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_4197_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_4197_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1210_c7_cfc6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1210_c7_cfc6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1213_c7_2dd2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1210_c7_cfc6_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1210_c7_cfc6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1210_c7_cfc6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1213_c7_2dd2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1210_c7_cfc6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cfc6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cfc6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_2dd2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cfc6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cfc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cfc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_2dd2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cfc6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_cfc6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_cfc6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_2dd2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_cfc6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cfc6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1211_c3_9e71 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cfc6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_2dd2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cfc6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cfc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cfc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_2dd2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cfc6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4650_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4650_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4650_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1213_c7_2dd2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1213_c7_2dd2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1218_c7_7d44_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1213_c7_2dd2_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1213_c7_2dd2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1213_c7_2dd2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1218_c7_7d44_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1213_c7_2dd2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_2dd2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_2dd2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_7d44_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_2dd2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_2dd2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_2dd2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_7d44_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_2dd2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_2dd2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_2dd2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_7d44_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_2dd2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_2dd2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1216_c3_ebd2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_2dd2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_7d44_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_2dd2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_2dd2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_2dd2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_7d44_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_2dd2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9f92_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9f92_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9f92_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1218_c7_7d44_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1218_c7_7d44_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1218_c7_7d44_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1218_c7_7d44_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1218_c7_7d44_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1222_c7_b935_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1218_c7_7d44_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_7d44_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_7d44_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_b935_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_7d44_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_7d44_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_7d44_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_b935_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_7d44_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_7d44_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_7d44_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_b935_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_7d44_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_7d44_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1220_c3_1edd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_7d44_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_b935_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_7d44_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_7d44_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_7d44_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_b935_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_7d44_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_fe08_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_fe08_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_fe08_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_596b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_596b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_596b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1222_c7_b935_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1222_c7_b935_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1226_c7_e64b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1222_c7_b935_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_b935_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_b935_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_e64b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_b935_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_b935_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_b935_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_e64b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_b935_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_b935_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_b935_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_e64b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_b935_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_b935_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_b935_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_e64b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_b935_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_b935_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_b935_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_e64b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_b935_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_b921_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_b921_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_b921_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1226_c7_e64b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1226_c7_e64b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1226_c7_e64b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_e64b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_e64b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_e64b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_e64b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_e64b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_e64b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_e64b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_e64b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_e64b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_e64b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1230_c3_02c2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_e64b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_e64b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_e64b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_e64b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_e64b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_0a50_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_0a50_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_0a50_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_0616_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_0616_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_0616_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_0616_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1231_c21_378c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_d927_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_d927_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_d927_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1231_c21_378c_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1231_c21_378c_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1231_c21_378c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1197_l1226_DUPLICATE_29d5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1226_DUPLICATE_afc5_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1226_DUPLICATE_2cd1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1226_DUPLICATE_a38a_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1223_l1227_l1214_l1219_DUPLICATE_6c1e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1224_l1215_DUPLICATE_ad3b_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1224_l1215_DUPLICATE_ad3b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1222_l1226_DUPLICATE_7402_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l1235_l1193_DUPLICATE_c284_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_e64b_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_0616_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_e64b_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1231_c21_378c_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1211_c3_9e71 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cfc6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1211_c3_9e71;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_596b_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_0616_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1207_c3_24e8 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1207_c3_24e8;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_b921_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4650_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1220_c3_1edd := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_7d44_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1220_c3_1edd;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_4461_right := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_4197_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1202_c3_f1b2 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1202_c3_f1b2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9f92_right := to_unsigned(3, 2);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1230_c3_02c2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_e64b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1230_c3_02c2;
     VAR_MUX_uxn_opcodes_h_l1231_c21_378c_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1216_c3_ebd2 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_2dd2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1216_c3_ebd2;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_0616_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_0a50_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1210_c7_cfc6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1213_c7_2dd2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1218_c7_7d44_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1226_c7_e64b_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_4461_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_4197_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4650_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9f92_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_596b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_b921_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_d927_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_fe08_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1210_c7_cfc6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1218_c7_7d44_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1226_DUPLICATE_a38a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1226_DUPLICATE_a38a_return_output := result.is_opc_done;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1197_c2_3319] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1197_c2_3319_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1222_l1226_DUPLICATE_7402 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1222_l1226_DUPLICATE_7402_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1197_c6_4461] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1197_c6_4461_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_4461_left;
     BIN_OP_EQ_uxn_opcodes_h_l1197_c6_4461_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_4461_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_4461_return_output := BIN_OP_EQ_uxn_opcodes_h_l1197_c6_4461_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1213_c11_4650] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4650_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4650_left;
     BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4650_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4650_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4650_return_output := BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4650_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1197_c2_3319] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1197_c2_3319_return_output := result.is_vram_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1197_c2_3319] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1197_c2_3319_return_output := result.is_pc_updated;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1226_DUPLICATE_afc5 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1226_DUPLICATE_afc5_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1226_DUPLICATE_2cd1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1226_DUPLICATE_2cd1_return_output := result.is_stack_write;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1197_c2_3319] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1197_c2_3319_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1210_c11_4197] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1210_c11_4197_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_4197_left;
     BIN_OP_EQ_uxn_opcodes_h_l1210_c11_4197_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_4197_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_4197_return_output := BIN_OP_EQ_uxn_opcodes_h_l1210_c11_4197_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1223_l1227_l1214_l1219_DUPLICATE_6c1e LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1223_l1227_l1214_l1219_DUPLICATE_6c1e_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- sp_relative_shift[uxn_opcodes_h_l1228_c30_0616] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1228_c30_0616_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_0616_ins;
     sp_relative_shift_uxn_opcodes_h_l1228_c30_0616_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_0616_x;
     sp_relative_shift_uxn_opcodes_h_l1228_c30_0616_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_0616_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_0616_return_output := sp_relative_shift_uxn_opcodes_h_l1228_c30_0616_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1218_c11_9f92] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9f92_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9f92_left;
     BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9f92_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9f92_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9f92_return_output := BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9f92_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1222_c11_596b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1222_c11_596b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_596b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1222_c11_596b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_596b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_596b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1222_c11_596b_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1197_l1226_DUPLICATE_29d5 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1197_l1226_DUPLICATE_29d5_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1226_c11_b921] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1226_c11_b921_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_b921_left;
     BIN_OP_EQ_uxn_opcodes_h_l1226_c11_b921_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_b921_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_b921_return_output := BIN_OP_EQ_uxn_opcodes_h_l1226_c11_b921_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1197_c2_3319_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_4461_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3319_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_4461_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3319_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_4461_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3319_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_4461_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3319_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_4461_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3319_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_4461_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3319_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_4461_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3319_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_4461_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3319_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_4461_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3319_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_4461_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1197_c2_3319_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_4461_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1210_c7_cfc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_4197_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cfc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_4197_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cfc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_4197_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cfc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_4197_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cfc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_4197_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_cfc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_4197_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1210_c7_cfc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_4197_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1213_c7_2dd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4650_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_2dd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4650_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_2dd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4650_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_2dd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4650_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_2dd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4650_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_2dd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4650_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1213_c7_2dd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4650_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1218_c7_7d44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9f92_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_7d44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9f92_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_7d44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9f92_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_7d44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9f92_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_7d44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9f92_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_7d44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9f92_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1218_c7_7d44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_9f92_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1222_c7_b935_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_596b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_b935_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_596b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_b935_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_596b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_b935_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_596b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_b935_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_596b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_b935_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_596b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1226_c7_e64b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_b921_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_e64b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_b921_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_e64b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_b921_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_e64b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_b921_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_e64b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_b921_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_e64b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_b921_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_fe08_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1223_l1227_l1214_l1219_DUPLICATE_6c1e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_0a50_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1223_l1227_l1214_l1219_DUPLICATE_6c1e_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1224_l1215_DUPLICATE_ad3b_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1223_l1227_l1214_l1219_DUPLICATE_6c1e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cfc6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1226_DUPLICATE_afc5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_2dd2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1226_DUPLICATE_afc5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_7d44_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1226_DUPLICATE_afc5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_b935_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1226_DUPLICATE_afc5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_e64b_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1226_DUPLICATE_afc5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cfc6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1226_DUPLICATE_a38a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_2dd2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1226_DUPLICATE_a38a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_7d44_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1226_DUPLICATE_a38a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_b935_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1226_DUPLICATE_a38a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_e64b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1226_DUPLICATE_a38a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cfc6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1226_DUPLICATE_2cd1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_2dd2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1226_DUPLICATE_2cd1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_7d44_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1226_DUPLICATE_2cd1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_b935_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1226_DUPLICATE_2cd1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_e64b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1226_DUPLICATE_2cd1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_b935_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1222_l1226_DUPLICATE_7402_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_e64b_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1222_l1226_DUPLICATE_7402_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1197_l1226_DUPLICATE_29d5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_cfc6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1197_l1226_DUPLICATE_29d5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_2dd2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1197_l1226_DUPLICATE_29d5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_7d44_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1197_l1226_DUPLICATE_29d5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_b935_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1197_l1226_DUPLICATE_29d5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_e64b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1197_l1226_DUPLICATE_29d5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1197_c2_3319_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1197_c2_3319_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1197_c2_3319_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1197_c2_3319_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_e64b_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_0616_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1197_c2_3319] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3319_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3319_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3319_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3319_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1197_c2_3319] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3319_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3319_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3319_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3319_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1226_c7_e64b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_e64b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_e64b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_e64b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_e64b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_e64b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_e64b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_e64b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_e64b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1227_c3_0a50] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1227_c3_0a50_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_0a50_left;
     BIN_OP_OR_uxn_opcodes_h_l1227_c3_0a50_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_0a50_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_0a50_return_output := BIN_OP_OR_uxn_opcodes_h_l1227_c3_0a50_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1226_c7_e64b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_e64b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_e64b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_e64b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_e64b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_e64b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_e64b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_e64b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_e64b_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1224_l1215_DUPLICATE_ad3b LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1224_l1215_DUPLICATE_ad3b_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1224_l1215_DUPLICATE_ad3b_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1224_l1215_DUPLICATE_ad3b_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1224_l1215_DUPLICATE_ad3b_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1197_c2_3319] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3319_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3319_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3319_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3319_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1226_c7_e64b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_e64b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_e64b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_e64b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_e64b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_e64b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_e64b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_e64b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_e64b_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1197_c2_3319] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3319_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3319_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3319_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3319_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1226_c7_e64b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_e64b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_e64b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_e64b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_e64b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_e64b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_e64b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_e64b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_e64b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1219_c3_fe08] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1219_c3_fe08_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_fe08_left;
     BIN_OP_OR_uxn_opcodes_h_l1219_c3_fe08_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_fe08_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_fe08_return_output := BIN_OP_OR_uxn_opcodes_h_l1219_c3_fe08_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1218_c7_7d44_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_fe08_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_d927_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_0a50_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1226_c7_e64b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_0a50_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1222_c7_b935_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1224_l1215_DUPLICATE_ad3b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1213_c7_2dd2_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1224_l1215_DUPLICATE_ad3b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_b935_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_e64b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_b935_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_e64b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_b935_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_e64b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_b935_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_e64b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1222_c7_b935] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_b935_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_b935_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_b935_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_b935_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_b935_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_b935_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_b935_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_b935_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1222_c7_b935] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_b935_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_b935_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_b935_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_b935_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_b935_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_b935_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_b935_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_b935_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1222_c7_b935] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_b935_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_b935_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_b935_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_b935_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_b935_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_b935_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_b935_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_b935_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1231_c21_d927] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1231_c21_d927_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_d927_left;
     BIN_OP_EQ_uxn_opcodes_h_l1231_c21_d927_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_d927_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_d927_return_output := BIN_OP_EQ_uxn_opcodes_h_l1231_c21_d927_return_output;

     -- t16_MUX[uxn_opcodes_h_l1218_c7_7d44] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1218_c7_7d44_cond <= VAR_t16_MUX_uxn_opcodes_h_l1218_c7_7d44_cond;
     t16_MUX_uxn_opcodes_h_l1218_c7_7d44_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1218_c7_7d44_iftrue;
     t16_MUX_uxn_opcodes_h_l1218_c7_7d44_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1218_c7_7d44_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1218_c7_7d44_return_output := t16_MUX_uxn_opcodes_h_l1218_c7_7d44_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1222_c7_b935] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_b935_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_b935_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_b935_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_b935_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_b935_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_b935_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_b935_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_b935_return_output;

     -- n16_MUX[uxn_opcodes_h_l1226_c7_e64b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1226_c7_e64b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1226_c7_e64b_cond;
     n16_MUX_uxn_opcodes_h_l1226_c7_e64b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1226_c7_e64b_iftrue;
     n16_MUX_uxn_opcodes_h_l1226_c7_e64b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1226_c7_e64b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1226_c7_e64b_return_output := n16_MUX_uxn_opcodes_h_l1226_c7_e64b_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1231_c21_378c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_d927_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1222_c7_b935_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1226_c7_e64b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_7d44_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_b935_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_7d44_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_b935_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_7d44_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_b935_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_7d44_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_b935_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1213_c7_2dd2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1218_c7_7d44_return_output;
     -- t16_MUX[uxn_opcodes_h_l1213_c7_2dd2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1213_c7_2dd2_cond <= VAR_t16_MUX_uxn_opcodes_h_l1213_c7_2dd2_cond;
     t16_MUX_uxn_opcodes_h_l1213_c7_2dd2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1213_c7_2dd2_iftrue;
     t16_MUX_uxn_opcodes_h_l1213_c7_2dd2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1213_c7_2dd2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1213_c7_2dd2_return_output := t16_MUX_uxn_opcodes_h_l1213_c7_2dd2_return_output;

     -- n16_MUX[uxn_opcodes_h_l1222_c7_b935] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1222_c7_b935_cond <= VAR_n16_MUX_uxn_opcodes_h_l1222_c7_b935_cond;
     n16_MUX_uxn_opcodes_h_l1222_c7_b935_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1222_c7_b935_iftrue;
     n16_MUX_uxn_opcodes_h_l1222_c7_b935_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1222_c7_b935_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1222_c7_b935_return_output := n16_MUX_uxn_opcodes_h_l1222_c7_b935_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1218_c7_7d44] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_7d44_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_7d44_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_7d44_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_7d44_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_7d44_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_7d44_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_7d44_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_7d44_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1218_c7_7d44] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_7d44_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_7d44_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_7d44_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_7d44_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_7d44_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_7d44_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_7d44_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_7d44_return_output;

     -- MUX[uxn_opcodes_h_l1231_c21_378c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1231_c21_378c_cond <= VAR_MUX_uxn_opcodes_h_l1231_c21_378c_cond;
     MUX_uxn_opcodes_h_l1231_c21_378c_iftrue <= VAR_MUX_uxn_opcodes_h_l1231_c21_378c_iftrue;
     MUX_uxn_opcodes_h_l1231_c21_378c_iffalse <= VAR_MUX_uxn_opcodes_h_l1231_c21_378c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1231_c21_378c_return_output := MUX_uxn_opcodes_h_l1231_c21_378c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1218_c7_7d44] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_7d44_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_7d44_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_7d44_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_7d44_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_7d44_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_7d44_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_7d44_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_7d44_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1218_c7_7d44] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_7d44_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_7d44_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_7d44_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_7d44_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_7d44_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_7d44_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_7d44_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_7d44_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_e64b_iftrue := VAR_MUX_uxn_opcodes_h_l1231_c21_378c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1218_c7_7d44_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1222_c7_b935_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_2dd2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_7d44_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_2dd2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_7d44_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_2dd2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_7d44_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_2dd2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_7d44_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1210_c7_cfc6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1213_c7_2dd2_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1213_c7_2dd2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_2dd2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_2dd2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_2dd2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_2dd2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_2dd2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_2dd2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_2dd2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_2dd2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1213_c7_2dd2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_2dd2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_2dd2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_2dd2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_2dd2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_2dd2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_2dd2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_2dd2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_2dd2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1213_c7_2dd2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_2dd2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_2dd2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_2dd2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_2dd2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_2dd2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_2dd2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_2dd2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_2dd2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1213_c7_2dd2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_2dd2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_2dd2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_2dd2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_2dd2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_2dd2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_2dd2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_2dd2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_2dd2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1226_c7_e64b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1226_c7_e64b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_e64b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1226_c7_e64b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_e64b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1226_c7_e64b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_e64b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_e64b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1226_c7_e64b_return_output;

     -- t16_MUX[uxn_opcodes_h_l1210_c7_cfc6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1210_c7_cfc6_cond <= VAR_t16_MUX_uxn_opcodes_h_l1210_c7_cfc6_cond;
     t16_MUX_uxn_opcodes_h_l1210_c7_cfc6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1210_c7_cfc6_iftrue;
     t16_MUX_uxn_opcodes_h_l1210_c7_cfc6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1210_c7_cfc6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1210_c7_cfc6_return_output := t16_MUX_uxn_opcodes_h_l1210_c7_cfc6_return_output;

     -- n16_MUX[uxn_opcodes_h_l1218_c7_7d44] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1218_c7_7d44_cond <= VAR_n16_MUX_uxn_opcodes_h_l1218_c7_7d44_cond;
     n16_MUX_uxn_opcodes_h_l1218_c7_7d44_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1218_c7_7d44_iftrue;
     n16_MUX_uxn_opcodes_h_l1218_c7_7d44_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1218_c7_7d44_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1218_c7_7d44_return_output := n16_MUX_uxn_opcodes_h_l1218_c7_7d44_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1213_c7_2dd2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1218_c7_7d44_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cfc6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_2dd2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cfc6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_2dd2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cfc6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_2dd2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cfc6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_2dd2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_b935_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_e64b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1210_c7_cfc6_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1210_c7_cfc6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cfc6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cfc6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cfc6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cfc6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cfc6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cfc6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cfc6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cfc6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1222_c7_b935] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1222_c7_b935_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_b935_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1222_c7_b935_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_b935_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1222_c7_b935_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_b935_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_b935_return_output := result_u8_value_MUX_uxn_opcodes_h_l1222_c7_b935_return_output;

     -- t16_MUX[uxn_opcodes_h_l1197_c2_3319] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1197_c2_3319_cond <= VAR_t16_MUX_uxn_opcodes_h_l1197_c2_3319_cond;
     t16_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue;
     t16_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1197_c2_3319_return_output := t16_MUX_uxn_opcodes_h_l1197_c2_3319_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1210_c7_cfc6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cfc6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cfc6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cfc6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cfc6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cfc6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cfc6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cfc6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cfc6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1210_c7_cfc6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cfc6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cfc6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cfc6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cfc6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cfc6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cfc6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cfc6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cfc6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1210_c7_cfc6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cfc6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cfc6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cfc6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cfc6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cfc6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cfc6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cfc6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cfc6_return_output;

     -- n16_MUX[uxn_opcodes_h_l1213_c7_2dd2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1213_c7_2dd2_cond <= VAR_n16_MUX_uxn_opcodes_h_l1213_c7_2dd2_cond;
     n16_MUX_uxn_opcodes_h_l1213_c7_2dd2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1213_c7_2dd2_iftrue;
     n16_MUX_uxn_opcodes_h_l1213_c7_2dd2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1213_c7_2dd2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1213_c7_2dd2_return_output := n16_MUX_uxn_opcodes_h_l1213_c7_2dd2_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1210_c7_cfc6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1213_c7_2dd2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_cfc6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_cfc6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_cfc6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_cfc6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_7d44_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_b935_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1197_c2_3319_return_output;
     -- n16_MUX[uxn_opcodes_h_l1210_c7_cfc6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1210_c7_cfc6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1210_c7_cfc6_cond;
     n16_MUX_uxn_opcodes_h_l1210_c7_cfc6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1210_c7_cfc6_iftrue;
     n16_MUX_uxn_opcodes_h_l1210_c7_cfc6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1210_c7_cfc6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1210_c7_cfc6_return_output := n16_MUX_uxn_opcodes_h_l1210_c7_cfc6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1197_c2_3319] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3319_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3319_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3319_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3319_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1218_c7_7d44] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1218_c7_7d44_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_7d44_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1218_c7_7d44_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_7d44_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1218_c7_7d44_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_7d44_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_7d44_return_output := result_u8_value_MUX_uxn_opcodes_h_l1218_c7_7d44_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1197_c2_3319] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3319_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3319_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3319_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3319_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1197_c2_3319] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3319_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3319_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3319_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3319_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1197_c2_3319] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3319_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3319_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3319_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3319_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1210_c7_cfc6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_2dd2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_7d44_return_output;
     -- n16_MUX[uxn_opcodes_h_l1197_c2_3319] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1197_c2_3319_cond <= VAR_n16_MUX_uxn_opcodes_h_l1197_c2_3319_cond;
     n16_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue;
     n16_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1197_c2_3319_return_output := n16_MUX_uxn_opcodes_h_l1197_c2_3319_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1213_c7_2dd2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1213_c7_2dd2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_2dd2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1213_c7_2dd2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_2dd2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1213_c7_2dd2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_2dd2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_2dd2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1213_c7_2dd2_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1197_c2_3319_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_cfc6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_2dd2_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1210_c7_cfc6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1210_c7_cfc6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_cfc6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1210_c7_cfc6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_cfc6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1210_c7_cfc6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_cfc6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_cfc6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1210_c7_cfc6_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_cfc6_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1197_c2_3319] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3319_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3319_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3319_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3319_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3319_return_output := result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3319_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l1235_l1193_DUPLICATE_c284 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l1235_l1193_DUPLICATE_c284_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8b52(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3319_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3319_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3319_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3319_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3319_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3319_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3319_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3319_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3319_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l1235_l1193_DUPLICATE_c284_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l1235_l1193_DUPLICATE_c284_return_output;
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
