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
-- BIN_OP_EQ[uxn_opcodes_h_l1197_c6_fe7e]
signal BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fe7e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fe7e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fe7e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1197_c2_1386]
signal result_u8_value_MUX_uxn_opcodes_h_l1197_c2_1386_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1197_c2_1386_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1197_c2_1386]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_1386_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_1386_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1197_c2_1386]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_1386_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_1386_return_output : unsigned(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1197_c2_1386]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_1386_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_1386_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1197_c2_1386]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_1386_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_1386_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1197_c2_1386]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_1386_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_1386_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1197_c2_1386]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_1386_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_1386_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1197_c2_1386]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_1386_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_1386_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1197_c2_1386]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_1386_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_1386_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1197_c2_1386]
signal n16_MUX_uxn_opcodes_h_l1197_c2_1386_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1197_c2_1386_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1197_c2_1386]
signal t16_MUX_uxn_opcodes_h_l1197_c2_1386_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1197_c2_1386_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1210_c11_3e37]
signal BIN_OP_EQ_uxn_opcodes_h_l1210_c11_3e37_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1210_c11_3e37_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1210_c11_3e37_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1210_c7_9177]
signal result_u8_value_MUX_uxn_opcodes_h_l1210_c7_9177_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1210_c7_9177_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1210_c7_9177_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1210_c7_9177_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1210_c7_9177]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_9177_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_9177_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_9177_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_9177_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1210_c7_9177]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_9177_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_9177_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_9177_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_9177_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1210_c7_9177]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_9177_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_9177_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_9177_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_9177_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1210_c7_9177]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_9177_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_9177_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_9177_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_9177_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1210_c7_9177]
signal n16_MUX_uxn_opcodes_h_l1210_c7_9177_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1210_c7_9177_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1210_c7_9177_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1210_c7_9177_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1210_c7_9177]
signal t16_MUX_uxn_opcodes_h_l1210_c7_9177_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1210_c7_9177_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1210_c7_9177_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1210_c7_9177_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1213_c11_4846]
signal BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4846_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4846_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4846_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1213_c7_6367]
signal result_u8_value_MUX_uxn_opcodes_h_l1213_c7_6367_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1213_c7_6367_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1213_c7_6367_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1213_c7_6367_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1213_c7_6367]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_6367_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_6367_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_6367_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_6367_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1213_c7_6367]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_6367_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_6367_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_6367_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_6367_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1213_c7_6367]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_6367_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_6367_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_6367_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_6367_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1213_c7_6367]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_6367_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_6367_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_6367_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_6367_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1213_c7_6367]
signal n16_MUX_uxn_opcodes_h_l1213_c7_6367_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1213_c7_6367_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1213_c7_6367_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1213_c7_6367_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1213_c7_6367]
signal t16_MUX_uxn_opcodes_h_l1213_c7_6367_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1213_c7_6367_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1213_c7_6367_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1213_c7_6367_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1218_c11_e6b9]
signal BIN_OP_EQ_uxn_opcodes_h_l1218_c11_e6b9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1218_c11_e6b9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1218_c11_e6b9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1218_c7_060b]
signal result_u8_value_MUX_uxn_opcodes_h_l1218_c7_060b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1218_c7_060b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1218_c7_060b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1218_c7_060b_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1218_c7_060b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_060b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_060b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_060b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_060b_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1218_c7_060b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_060b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_060b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_060b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_060b_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1218_c7_060b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_060b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_060b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_060b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_060b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1218_c7_060b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_060b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_060b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_060b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_060b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1218_c7_060b]
signal n16_MUX_uxn_opcodes_h_l1218_c7_060b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1218_c7_060b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1218_c7_060b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1218_c7_060b_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1218_c7_060b]
signal t16_MUX_uxn_opcodes_h_l1218_c7_060b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1218_c7_060b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1218_c7_060b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1218_c7_060b_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1219_c3_ee67]
signal BIN_OP_OR_uxn_opcodes_h_l1219_c3_ee67_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1219_c3_ee67_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1219_c3_ee67_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1222_c11_0802]
signal BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0802_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0802_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0802_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1222_c7_82cb]
signal result_u8_value_MUX_uxn_opcodes_h_l1222_c7_82cb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1222_c7_82cb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1222_c7_82cb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1222_c7_82cb_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1222_c7_82cb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_82cb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_82cb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_82cb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_82cb_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1222_c7_82cb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_82cb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_82cb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_82cb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_82cb_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1222_c7_82cb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_82cb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_82cb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_82cb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_82cb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1222_c7_82cb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_82cb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_82cb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_82cb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_82cb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1222_c7_82cb]
signal n16_MUX_uxn_opcodes_h_l1222_c7_82cb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1222_c7_82cb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1222_c7_82cb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1222_c7_82cb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1226_c11_3d09]
signal BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3d09_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3d09_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3d09_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1226_c7_3be2]
signal result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3be2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3be2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3be2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3be2_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1226_c7_3be2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3be2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3be2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3be2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3be2_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1226_c7_3be2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3be2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3be2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3be2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3be2_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1226_c7_3be2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3be2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3be2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3be2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3be2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1226_c7_3be2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3be2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3be2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3be2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3be2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1226_c7_3be2]
signal n16_MUX_uxn_opcodes_h_l1226_c7_3be2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1226_c7_3be2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1226_c7_3be2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1226_c7_3be2_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1227_c3_05ab]
signal BIN_OP_OR_uxn_opcodes_h_l1227_c3_05ab_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1227_c3_05ab_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1227_c3_05ab_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1228_c30_b481]
signal sp_relative_shift_uxn_opcodes_h_l1228_c30_b481_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1228_c30_b481_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1228_c30_b481_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1228_c30_b481_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1231_c21_465d]
signal BIN_OP_EQ_uxn_opcodes_h_l1231_c21_465d_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1231_c21_465d_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1231_c21_465d_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1231_c21_88c0]
signal MUX_uxn_opcodes_h_l1231_c21_88c0_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1231_c21_88c0_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1231_c21_88c0_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1231_c21_88c0_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_786b
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_786b_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_786b_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_922a( ref_toks_0 : opcode_result_t;
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
      base.u8_value := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_pc_updated := ref_toks_6;
      base.is_opc_done := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.is_stack_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fe7e
BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fe7e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fe7e_left,
BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fe7e_right,
BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fe7e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1197_c2_1386
result_u8_value_MUX_uxn_opcodes_h_l1197_c2_1386 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1197_c2_1386_cond,
result_u8_value_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1197_c2_1386_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_1386
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_1386 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_1386_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_1386_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_1386
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_1386 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_1386_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_1386_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_1386
result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_1386 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_1386_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_1386_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_1386
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_1386 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_1386_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_1386_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_1386
result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_1386 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_1386_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_1386_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_1386
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_1386 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_1386_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_1386_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_1386
result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_1386 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_1386_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_1386_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_1386
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_1386 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_1386_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_1386_return_output);

-- n16_MUX_uxn_opcodes_h_l1197_c2_1386
n16_MUX_uxn_opcodes_h_l1197_c2_1386 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1197_c2_1386_cond,
n16_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue,
n16_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse,
n16_MUX_uxn_opcodes_h_l1197_c2_1386_return_output);

-- t16_MUX_uxn_opcodes_h_l1197_c2_1386
t16_MUX_uxn_opcodes_h_l1197_c2_1386 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1197_c2_1386_cond,
t16_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue,
t16_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse,
t16_MUX_uxn_opcodes_h_l1197_c2_1386_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1210_c11_3e37
BIN_OP_EQ_uxn_opcodes_h_l1210_c11_3e37 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1210_c11_3e37_left,
BIN_OP_EQ_uxn_opcodes_h_l1210_c11_3e37_right,
BIN_OP_EQ_uxn_opcodes_h_l1210_c11_3e37_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1210_c7_9177
result_u8_value_MUX_uxn_opcodes_h_l1210_c7_9177 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1210_c7_9177_cond,
result_u8_value_MUX_uxn_opcodes_h_l1210_c7_9177_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1210_c7_9177_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1210_c7_9177_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_9177
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_9177 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_9177_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_9177_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_9177_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_9177_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_9177
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_9177 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_9177_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_9177_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_9177_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_9177_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_9177
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_9177 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_9177_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_9177_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_9177_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_9177_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_9177
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_9177 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_9177_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_9177_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_9177_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_9177_return_output);

-- n16_MUX_uxn_opcodes_h_l1210_c7_9177
n16_MUX_uxn_opcodes_h_l1210_c7_9177 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1210_c7_9177_cond,
n16_MUX_uxn_opcodes_h_l1210_c7_9177_iftrue,
n16_MUX_uxn_opcodes_h_l1210_c7_9177_iffalse,
n16_MUX_uxn_opcodes_h_l1210_c7_9177_return_output);

-- t16_MUX_uxn_opcodes_h_l1210_c7_9177
t16_MUX_uxn_opcodes_h_l1210_c7_9177 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1210_c7_9177_cond,
t16_MUX_uxn_opcodes_h_l1210_c7_9177_iftrue,
t16_MUX_uxn_opcodes_h_l1210_c7_9177_iffalse,
t16_MUX_uxn_opcodes_h_l1210_c7_9177_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4846
BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4846 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4846_left,
BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4846_right,
BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4846_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1213_c7_6367
result_u8_value_MUX_uxn_opcodes_h_l1213_c7_6367 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1213_c7_6367_cond,
result_u8_value_MUX_uxn_opcodes_h_l1213_c7_6367_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1213_c7_6367_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1213_c7_6367_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_6367
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_6367 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_6367_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_6367_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_6367_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_6367_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_6367
result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_6367 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_6367_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_6367_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_6367_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_6367_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_6367
result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_6367 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_6367_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_6367_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_6367_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_6367_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_6367
result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_6367 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_6367_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_6367_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_6367_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_6367_return_output);

-- n16_MUX_uxn_opcodes_h_l1213_c7_6367
n16_MUX_uxn_opcodes_h_l1213_c7_6367 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1213_c7_6367_cond,
n16_MUX_uxn_opcodes_h_l1213_c7_6367_iftrue,
n16_MUX_uxn_opcodes_h_l1213_c7_6367_iffalse,
n16_MUX_uxn_opcodes_h_l1213_c7_6367_return_output);

-- t16_MUX_uxn_opcodes_h_l1213_c7_6367
t16_MUX_uxn_opcodes_h_l1213_c7_6367 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1213_c7_6367_cond,
t16_MUX_uxn_opcodes_h_l1213_c7_6367_iftrue,
t16_MUX_uxn_opcodes_h_l1213_c7_6367_iffalse,
t16_MUX_uxn_opcodes_h_l1213_c7_6367_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1218_c11_e6b9
BIN_OP_EQ_uxn_opcodes_h_l1218_c11_e6b9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1218_c11_e6b9_left,
BIN_OP_EQ_uxn_opcodes_h_l1218_c11_e6b9_right,
BIN_OP_EQ_uxn_opcodes_h_l1218_c11_e6b9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1218_c7_060b
result_u8_value_MUX_uxn_opcodes_h_l1218_c7_060b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1218_c7_060b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1218_c7_060b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1218_c7_060b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1218_c7_060b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_060b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_060b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_060b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_060b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_060b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_060b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_060b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_060b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_060b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_060b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_060b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_060b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_060b
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_060b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_060b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_060b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_060b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_060b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_060b
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_060b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_060b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_060b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_060b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_060b_return_output);

-- n16_MUX_uxn_opcodes_h_l1218_c7_060b
n16_MUX_uxn_opcodes_h_l1218_c7_060b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1218_c7_060b_cond,
n16_MUX_uxn_opcodes_h_l1218_c7_060b_iftrue,
n16_MUX_uxn_opcodes_h_l1218_c7_060b_iffalse,
n16_MUX_uxn_opcodes_h_l1218_c7_060b_return_output);

-- t16_MUX_uxn_opcodes_h_l1218_c7_060b
t16_MUX_uxn_opcodes_h_l1218_c7_060b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1218_c7_060b_cond,
t16_MUX_uxn_opcodes_h_l1218_c7_060b_iftrue,
t16_MUX_uxn_opcodes_h_l1218_c7_060b_iffalse,
t16_MUX_uxn_opcodes_h_l1218_c7_060b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1219_c3_ee67
BIN_OP_OR_uxn_opcodes_h_l1219_c3_ee67 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1219_c3_ee67_left,
BIN_OP_OR_uxn_opcodes_h_l1219_c3_ee67_right,
BIN_OP_OR_uxn_opcodes_h_l1219_c3_ee67_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0802
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0802 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0802_left,
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0802_right,
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0802_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1222_c7_82cb
result_u8_value_MUX_uxn_opcodes_h_l1222_c7_82cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1222_c7_82cb_cond,
result_u8_value_MUX_uxn_opcodes_h_l1222_c7_82cb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1222_c7_82cb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1222_c7_82cb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_82cb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_82cb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_82cb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_82cb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_82cb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_82cb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_82cb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_82cb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_82cb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_82cb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_82cb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_82cb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_82cb
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_82cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_82cb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_82cb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_82cb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_82cb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_82cb
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_82cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_82cb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_82cb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_82cb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_82cb_return_output);

-- n16_MUX_uxn_opcodes_h_l1222_c7_82cb
n16_MUX_uxn_opcodes_h_l1222_c7_82cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1222_c7_82cb_cond,
n16_MUX_uxn_opcodes_h_l1222_c7_82cb_iftrue,
n16_MUX_uxn_opcodes_h_l1222_c7_82cb_iffalse,
n16_MUX_uxn_opcodes_h_l1222_c7_82cb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3d09
BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3d09 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3d09_left,
BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3d09_right,
BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3d09_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3be2
result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3be2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3be2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3be2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3be2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3be2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3be2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3be2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3be2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3be2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3be2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3be2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3be2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3be2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3be2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3be2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3be2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3be2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3be2
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3be2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3be2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3be2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3be2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3be2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3be2
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3be2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3be2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3be2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3be2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3be2_return_output);

-- n16_MUX_uxn_opcodes_h_l1226_c7_3be2
n16_MUX_uxn_opcodes_h_l1226_c7_3be2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1226_c7_3be2_cond,
n16_MUX_uxn_opcodes_h_l1226_c7_3be2_iftrue,
n16_MUX_uxn_opcodes_h_l1226_c7_3be2_iffalse,
n16_MUX_uxn_opcodes_h_l1226_c7_3be2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1227_c3_05ab
BIN_OP_OR_uxn_opcodes_h_l1227_c3_05ab : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1227_c3_05ab_left,
BIN_OP_OR_uxn_opcodes_h_l1227_c3_05ab_right,
BIN_OP_OR_uxn_opcodes_h_l1227_c3_05ab_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1228_c30_b481
sp_relative_shift_uxn_opcodes_h_l1228_c30_b481 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1228_c30_b481_ins,
sp_relative_shift_uxn_opcodes_h_l1228_c30_b481_x,
sp_relative_shift_uxn_opcodes_h_l1228_c30_b481_y,
sp_relative_shift_uxn_opcodes_h_l1228_c30_b481_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1231_c21_465d
BIN_OP_EQ_uxn_opcodes_h_l1231_c21_465d : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1231_c21_465d_left,
BIN_OP_EQ_uxn_opcodes_h_l1231_c21_465d_right,
BIN_OP_EQ_uxn_opcodes_h_l1231_c21_465d_return_output);

-- MUX_uxn_opcodes_h_l1231_c21_88c0
MUX_uxn_opcodes_h_l1231_c21_88c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1231_c21_88c0_cond,
MUX_uxn_opcodes_h_l1231_c21_88c0_iftrue,
MUX_uxn_opcodes_h_l1231_c21_88c0_iffalse,
MUX_uxn_opcodes_h_l1231_c21_88c0_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_786b
CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_786b : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_786b_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_786b_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fe7e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1197_c2_1386_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_1386_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_1386_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_1386_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_1386_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_1386_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_1386_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_1386_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_1386_return_output,
 n16_MUX_uxn_opcodes_h_l1197_c2_1386_return_output,
 t16_MUX_uxn_opcodes_h_l1197_c2_1386_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1210_c11_3e37_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1210_c7_9177_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_9177_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_9177_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_9177_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_9177_return_output,
 n16_MUX_uxn_opcodes_h_l1210_c7_9177_return_output,
 t16_MUX_uxn_opcodes_h_l1210_c7_9177_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4846_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1213_c7_6367_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_6367_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_6367_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_6367_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_6367_return_output,
 n16_MUX_uxn_opcodes_h_l1213_c7_6367_return_output,
 t16_MUX_uxn_opcodes_h_l1213_c7_6367_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1218_c11_e6b9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1218_c7_060b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_060b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_060b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_060b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_060b_return_output,
 n16_MUX_uxn_opcodes_h_l1218_c7_060b_return_output,
 t16_MUX_uxn_opcodes_h_l1218_c7_060b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1219_c3_ee67_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0802_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1222_c7_82cb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_82cb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_82cb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_82cb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_82cb_return_output,
 n16_MUX_uxn_opcodes_h_l1222_c7_82cb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3d09_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3be2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3be2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3be2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3be2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3be2_return_output,
 n16_MUX_uxn_opcodes_h_l1226_c7_3be2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1227_c3_05ab_return_output,
 sp_relative_shift_uxn_opcodes_h_l1228_c30_b481_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1231_c21_465d_return_output,
 MUX_uxn_opcodes_h_l1231_c21_88c0_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_786b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fe7e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fe7e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fe7e_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_9177_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_1386_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_1386_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1197_c2_1386_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_1386_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_1386_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1207_c3_6204 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_9177_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_1386_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_1386_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1197_c2_1386_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_1386_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_1386_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1202_c3_36a2 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_9177_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_1386_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_1386_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1197_c2_1386_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_1386_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_1386_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_9177_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_1386_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_1386_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1197_c2_1386_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_1386_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_1386_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_9177_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_1386_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_1386_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1210_c7_9177_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c2_1386_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c2_1386_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1210_c7_9177_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1197_c2_1386_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1197_c2_1386_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_3e37_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_3e37_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_3e37_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_9177_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_9177_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_6367_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_9177_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_9177_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1211_c3_d0ac : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_9177_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_6367_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_9177_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_9177_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_9177_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_6367_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_9177_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_9177_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_9177_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_6367_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_9177_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_9177_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_9177_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_6367_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_9177_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1210_c7_9177_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1210_c7_9177_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1213_c7_6367_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1210_c7_9177_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1210_c7_9177_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1210_c7_9177_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1213_c7_6367_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1210_c7_9177_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4846_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4846_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4846_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_6367_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_6367_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_060b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_6367_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_6367_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1216_c3_869c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_6367_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_060b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_6367_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_6367_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_6367_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_060b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_6367_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_6367_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_6367_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_060b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_6367_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_6367_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_6367_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_060b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_6367_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1213_c7_6367_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1213_c7_6367_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1218_c7_060b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1213_c7_6367_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1213_c7_6367_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1213_c7_6367_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1218_c7_060b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1213_c7_6367_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_e6b9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_e6b9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_e6b9_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_060b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_060b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_82cb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_060b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_060b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1220_c3_b018 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_060b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_82cb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_060b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_060b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_060b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_82cb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_060b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_060b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_060b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_82cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_060b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_060b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_060b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_82cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_060b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1218_c7_060b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1218_c7_060b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1222_c7_82cb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1218_c7_060b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1218_c7_060b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1218_c7_060b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1218_c7_060b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_ee67_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_ee67_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_ee67_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0802_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0802_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0802_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_82cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_82cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3be2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_82cb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_82cb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_82cb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3be2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_82cb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_82cb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_82cb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3be2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_82cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_82cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_82cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3be2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_82cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_82cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_82cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3be2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_82cb_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1222_c7_82cb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1222_c7_82cb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1226_c7_3be2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1222_c7_82cb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3d09_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3d09_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3d09_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3be2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3be2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3be2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3be2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1230_c3_e594 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3be2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3be2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3be2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3be2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3be2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3be2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3be2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3be2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3be2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3be2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3be2_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1226_c7_3be2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1226_c7_3be2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1226_c7_3be2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_05ab_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_05ab_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_05ab_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_b481_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_b481_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_b481_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_b481_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1231_c21_88c0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_465d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_465d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_465d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1231_c21_88c0_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1231_c21_88c0_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1231_c21_88c0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1197_l1226_DUPLICATE_ffe3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1226_DUPLICATE_06cd_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1226_DUPLICATE_d6a4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1226_DUPLICATE_bde5_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1214_l1227_l1223_l1219_DUPLICATE_73ab_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_786b_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_786b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1222_l1226_DUPLICATE_f73d_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l1235_l1193_DUPLICATE_1460_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4846_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1211_c3_d0ac := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_9177_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1211_c3_d0ac;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1231_c21_88c0_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1231_c21_88c0_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3be2_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1202_c3_36a2 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1202_c3_36a2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0802_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3d09_right := to_unsigned(5, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_b481_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1230_c3_e594 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3be2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1230_c3_e594;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1216_c3_869c := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_6367_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1216_c3_869c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1220_c3_b018 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_060b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1220_c3_b018;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1207_c3_6204 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1207_c3_6204;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_3e37_right := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fe7e_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_b481_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_e6b9_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3be2_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_b481_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_05ab_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1210_c7_9177_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1213_c7_6367_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1218_c7_060b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1226_c7_3be2_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fe7e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_3e37_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4846_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_e6b9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0802_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3d09_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_465d_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_ee67_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1210_c7_9177_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1218_c7_060b_iffalse := t16;
     -- sp_relative_shift[uxn_opcodes_h_l1228_c30_b481] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1228_c30_b481_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_b481_ins;
     sp_relative_shift_uxn_opcodes_h_l1228_c30_b481_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_b481_x;
     sp_relative_shift_uxn_opcodes_h_l1228_c30_b481_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_b481_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_b481_return_output := sp_relative_shift_uxn_opcodes_h_l1228_c30_b481_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1197_c2_1386] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1197_c2_1386_return_output := result.is_ram_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1197_c2_1386] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1197_c2_1386_return_output := result.is_pc_updated;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1226_DUPLICATE_06cd LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1226_DUPLICATE_06cd_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1226_DUPLICATE_d6a4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1226_DUPLICATE_d6a4_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1222_c11_0802] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0802_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0802_left;
     BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0802_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0802_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0802_return_output := BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0802_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1226_c11_3d09] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3d09_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3d09_left;
     BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3d09_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3d09_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3d09_return_output := BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3d09_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1197_l1226_DUPLICATE_ffe3 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1197_l1226_DUPLICATE_ffe3_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1213_c11_4846] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4846_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4846_left;
     BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4846_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4846_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4846_return_output := BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4846_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1197_c6_fe7e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fe7e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fe7e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fe7e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fe7e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fe7e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fe7e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1210_c11_3e37] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1210_c11_3e37_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_3e37_left;
     BIN_OP_EQ_uxn_opcodes_h_l1210_c11_3e37_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_3e37_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_3e37_return_output := BIN_OP_EQ_uxn_opcodes_h_l1210_c11_3e37_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1197_c2_1386] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1197_c2_1386_return_output := result.is_vram_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1197_c2_1386] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1197_c2_1386_return_output := result.is_stack_index_flipped;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1214_l1227_l1223_l1219_DUPLICATE_73ab LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1214_l1227_l1223_l1219_DUPLICATE_73ab_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1222_l1226_DUPLICATE_f73d LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1222_l1226_DUPLICATE_f73d_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1218_c11_e6b9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1218_c11_e6b9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_e6b9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1218_c11_e6b9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_e6b9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_e6b9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1218_c11_e6b9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1226_DUPLICATE_bde5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1226_DUPLICATE_bde5_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1197_c2_1386_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fe7e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_1386_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fe7e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_1386_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fe7e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_1386_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fe7e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_1386_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fe7e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_1386_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fe7e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_1386_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fe7e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_1386_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fe7e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_1386_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fe7e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_1386_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fe7e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1197_c2_1386_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_fe7e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1210_c7_9177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_3e37_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_9177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_3e37_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_9177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_3e37_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_9177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_3e37_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_9177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_3e37_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_9177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_3e37_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1210_c7_9177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_3e37_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1213_c7_6367_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4846_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_6367_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4846_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_6367_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4846_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_6367_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4846_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_6367_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4846_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_6367_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4846_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1213_c7_6367_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_4846_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1218_c7_060b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_e6b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_060b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_e6b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_060b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_e6b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_060b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_e6b9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_060b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_e6b9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_060b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_e6b9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1218_c7_060b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_e6b9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1222_c7_82cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0802_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_82cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0802_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_82cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0802_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_82cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0802_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_82cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0802_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_82cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0802_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1226_c7_3be2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3d09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3be2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3d09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3be2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3d09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3be2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3d09_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3be2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3d09_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3be2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3d09_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_ee67_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1214_l1227_l1223_l1219_DUPLICATE_73ab_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_05ab_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1214_l1227_l1223_l1219_DUPLICATE_73ab_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_786b_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1214_l1227_l1223_l1219_DUPLICATE_73ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_9177_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1226_DUPLICATE_06cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_6367_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1226_DUPLICATE_06cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_060b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1226_DUPLICATE_06cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_82cb_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1226_DUPLICATE_06cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3be2_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1226_DUPLICATE_06cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_9177_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1226_DUPLICATE_d6a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_6367_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1226_DUPLICATE_d6a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_060b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1226_DUPLICATE_d6a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_82cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1226_DUPLICATE_d6a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3be2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1226_DUPLICATE_d6a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_9177_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1226_DUPLICATE_bde5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_6367_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1226_DUPLICATE_bde5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_060b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1226_DUPLICATE_bde5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_82cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1226_DUPLICATE_bde5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3be2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1226_DUPLICATE_bde5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_82cb_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1222_l1226_DUPLICATE_f73d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3be2_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1222_l1226_DUPLICATE_f73d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1197_l1226_DUPLICATE_ffe3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_9177_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1197_l1226_DUPLICATE_ffe3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_6367_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1197_l1226_DUPLICATE_ffe3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_060b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1197_l1226_DUPLICATE_ffe3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_82cb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1197_l1226_DUPLICATE_ffe3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3be2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1222_l1218_l1213_l1210_l1197_l1226_DUPLICATE_ffe3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1197_c2_1386_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1197_c2_1386_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1197_c2_1386_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1197_c2_1386_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3be2_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_b481_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1219_c3_ee67] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1219_c3_ee67_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_ee67_left;
     BIN_OP_OR_uxn_opcodes_h_l1219_c3_ee67_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_ee67_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_ee67_return_output := BIN_OP_OR_uxn_opcodes_h_l1219_c3_ee67_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1226_c7_3be2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3be2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3be2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3be2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3be2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3be2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3be2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3be2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3be2_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1197_c2_1386] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_1386_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_1386_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_1386_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_1386_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1197_c2_1386] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_1386_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_1386_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_1386_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_1386_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1197_c2_1386] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_1386_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_1386_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_1386_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_1386_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_786b LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_786b_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_786b_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_786b_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_786b_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1197_c2_1386] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_1386_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_1386_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_1386_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_1386_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1226_c7_3be2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3be2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3be2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3be2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3be2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3be2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3be2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3be2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3be2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1226_c7_3be2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3be2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3be2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3be2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3be2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3be2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3be2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3be2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3be2_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1227_c3_05ab] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1227_c3_05ab_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_05ab_left;
     BIN_OP_OR_uxn_opcodes_h_l1227_c3_05ab_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_05ab_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_05ab_return_output := BIN_OP_OR_uxn_opcodes_h_l1227_c3_05ab_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1226_c7_3be2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3be2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3be2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3be2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3be2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3be2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3be2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3be2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3be2_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1218_c7_060b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_ee67_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_465d_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_05ab_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1226_c7_3be2_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_05ab_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1222_c7_82cb_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_786b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1213_c7_6367_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_786b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_82cb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_3be2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_82cb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_3be2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_82cb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_3be2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_82cb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_3be2_return_output;
     -- BIN_OP_EQ[uxn_opcodes_h_l1231_c21_465d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1231_c21_465d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_465d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1231_c21_465d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_465d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_465d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1231_c21_465d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1226_c7_3be2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1226_c7_3be2_cond <= VAR_n16_MUX_uxn_opcodes_h_l1226_c7_3be2_cond;
     n16_MUX_uxn_opcodes_h_l1226_c7_3be2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1226_c7_3be2_iftrue;
     n16_MUX_uxn_opcodes_h_l1226_c7_3be2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1226_c7_3be2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1226_c7_3be2_return_output := n16_MUX_uxn_opcodes_h_l1226_c7_3be2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1222_c7_82cb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_82cb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_82cb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_82cb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_82cb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_82cb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_82cb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_82cb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_82cb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1222_c7_82cb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_82cb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_82cb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_82cb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_82cb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_82cb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_82cb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_82cb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_82cb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1222_c7_82cb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_82cb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_82cb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_82cb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_82cb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_82cb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_82cb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_82cb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_82cb_return_output;

     -- t16_MUX[uxn_opcodes_h_l1218_c7_060b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1218_c7_060b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1218_c7_060b_cond;
     t16_MUX_uxn_opcodes_h_l1218_c7_060b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1218_c7_060b_iftrue;
     t16_MUX_uxn_opcodes_h_l1218_c7_060b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1218_c7_060b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1218_c7_060b_return_output := t16_MUX_uxn_opcodes_h_l1218_c7_060b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1222_c7_82cb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_82cb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_82cb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_82cb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_82cb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_82cb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_82cb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_82cb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_82cb_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1231_c21_88c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_465d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1222_c7_82cb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1226_c7_3be2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_060b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_82cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_060b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_82cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_060b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_82cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_060b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_82cb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1213_c7_6367_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1218_c7_060b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1218_c7_060b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_060b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_060b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_060b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_060b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_060b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_060b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_060b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_060b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1218_c7_060b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_060b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_060b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_060b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_060b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_060b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_060b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_060b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_060b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1218_c7_060b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_060b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_060b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_060b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_060b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_060b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_060b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_060b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_060b_return_output;

     -- MUX[uxn_opcodes_h_l1231_c21_88c0] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1231_c21_88c0_cond <= VAR_MUX_uxn_opcodes_h_l1231_c21_88c0_cond;
     MUX_uxn_opcodes_h_l1231_c21_88c0_iftrue <= VAR_MUX_uxn_opcodes_h_l1231_c21_88c0_iftrue;
     MUX_uxn_opcodes_h_l1231_c21_88c0_iffalse <= VAR_MUX_uxn_opcodes_h_l1231_c21_88c0_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1231_c21_88c0_return_output := MUX_uxn_opcodes_h_l1231_c21_88c0_return_output;

     -- n16_MUX[uxn_opcodes_h_l1222_c7_82cb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1222_c7_82cb_cond <= VAR_n16_MUX_uxn_opcodes_h_l1222_c7_82cb_cond;
     n16_MUX_uxn_opcodes_h_l1222_c7_82cb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1222_c7_82cb_iftrue;
     n16_MUX_uxn_opcodes_h_l1222_c7_82cb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1222_c7_82cb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1222_c7_82cb_return_output := n16_MUX_uxn_opcodes_h_l1222_c7_82cb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1218_c7_060b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_060b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_060b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_060b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_060b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_060b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_060b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_060b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_060b_return_output;

     -- t16_MUX[uxn_opcodes_h_l1213_c7_6367] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1213_c7_6367_cond <= VAR_t16_MUX_uxn_opcodes_h_l1213_c7_6367_cond;
     t16_MUX_uxn_opcodes_h_l1213_c7_6367_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1213_c7_6367_iftrue;
     t16_MUX_uxn_opcodes_h_l1213_c7_6367_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1213_c7_6367_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1213_c7_6367_return_output := t16_MUX_uxn_opcodes_h_l1213_c7_6367_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3be2_iftrue := VAR_MUX_uxn_opcodes_h_l1231_c21_88c0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1218_c7_060b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1222_c7_82cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_6367_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_060b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_6367_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_060b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_6367_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_060b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_6367_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_060b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1210_c7_9177_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1213_c7_6367_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1213_c7_6367] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_6367_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_6367_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_6367_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_6367_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_6367_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_6367_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_6367_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_6367_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1213_c7_6367] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_6367_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_6367_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_6367_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_6367_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_6367_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_6367_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_6367_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_6367_return_output;

     -- n16_MUX[uxn_opcodes_h_l1218_c7_060b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1218_c7_060b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1218_c7_060b_cond;
     n16_MUX_uxn_opcodes_h_l1218_c7_060b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1218_c7_060b_iftrue;
     n16_MUX_uxn_opcodes_h_l1218_c7_060b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1218_c7_060b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1218_c7_060b_return_output := n16_MUX_uxn_opcodes_h_l1218_c7_060b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1213_c7_6367] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_6367_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_6367_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_6367_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_6367_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_6367_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_6367_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_6367_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_6367_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1213_c7_6367] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_6367_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_6367_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_6367_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_6367_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_6367_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_6367_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_6367_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_6367_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1226_c7_3be2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3be2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3be2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3be2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3be2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3be2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3be2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3be2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3be2_return_output;

     -- t16_MUX[uxn_opcodes_h_l1210_c7_9177] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1210_c7_9177_cond <= VAR_t16_MUX_uxn_opcodes_h_l1210_c7_9177_cond;
     t16_MUX_uxn_opcodes_h_l1210_c7_9177_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1210_c7_9177_iftrue;
     t16_MUX_uxn_opcodes_h_l1210_c7_9177_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1210_c7_9177_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1210_c7_9177_return_output := t16_MUX_uxn_opcodes_h_l1210_c7_9177_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1213_c7_6367_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1218_c7_060b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_9177_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_6367_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_9177_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_6367_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_9177_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_6367_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_9177_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_6367_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_82cb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_3be2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1210_c7_9177_return_output;
     -- n16_MUX[uxn_opcodes_h_l1213_c7_6367] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1213_c7_6367_cond <= VAR_n16_MUX_uxn_opcodes_h_l1213_c7_6367_cond;
     n16_MUX_uxn_opcodes_h_l1213_c7_6367_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1213_c7_6367_iftrue;
     n16_MUX_uxn_opcodes_h_l1213_c7_6367_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1213_c7_6367_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1213_c7_6367_return_output := n16_MUX_uxn_opcodes_h_l1213_c7_6367_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1222_c7_82cb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1222_c7_82cb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_82cb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1222_c7_82cb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_82cb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1222_c7_82cb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_82cb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_82cb_return_output := result_u8_value_MUX_uxn_opcodes_h_l1222_c7_82cb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1210_c7_9177] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_9177_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_9177_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_9177_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_9177_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_9177_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_9177_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_9177_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_9177_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1210_c7_9177] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_9177_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_9177_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_9177_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_9177_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_9177_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_9177_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_9177_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_9177_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1210_c7_9177] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_9177_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_9177_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_9177_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_9177_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_9177_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_9177_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_9177_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_9177_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1210_c7_9177] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_9177_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_9177_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_9177_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_9177_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_9177_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_9177_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_9177_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_9177_return_output;

     -- t16_MUX[uxn_opcodes_h_l1197_c2_1386] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1197_c2_1386_cond <= VAR_t16_MUX_uxn_opcodes_h_l1197_c2_1386_cond;
     t16_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue;
     t16_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1197_c2_1386_return_output := t16_MUX_uxn_opcodes_h_l1197_c2_1386_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1210_c7_9177_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1213_c7_6367_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_9177_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_9177_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_9177_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_9177_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_060b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_82cb_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1197_c2_1386_return_output;
     -- n16_MUX[uxn_opcodes_h_l1210_c7_9177] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1210_c7_9177_cond <= VAR_n16_MUX_uxn_opcodes_h_l1210_c7_9177_cond;
     n16_MUX_uxn_opcodes_h_l1210_c7_9177_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1210_c7_9177_iftrue;
     n16_MUX_uxn_opcodes_h_l1210_c7_9177_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1210_c7_9177_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1210_c7_9177_return_output := n16_MUX_uxn_opcodes_h_l1210_c7_9177_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1197_c2_1386] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_1386_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_1386_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_1386_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_1386_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1197_c2_1386] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_1386_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_1386_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_1386_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_1386_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1197_c2_1386] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_1386_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_1386_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_1386_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_1386_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1197_c2_1386] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_1386_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_1386_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_1386_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_1386_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1218_c7_060b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1218_c7_060b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_060b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1218_c7_060b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_060b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1218_c7_060b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_060b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_060b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1218_c7_060b_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1210_c7_9177_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_6367_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_060b_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1213_c7_6367] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1213_c7_6367_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_6367_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1213_c7_6367_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_6367_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1213_c7_6367_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_6367_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_6367_return_output := result_u8_value_MUX_uxn_opcodes_h_l1213_c7_6367_return_output;

     -- n16_MUX[uxn_opcodes_h_l1197_c2_1386] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1197_c2_1386_cond <= VAR_n16_MUX_uxn_opcodes_h_l1197_c2_1386_cond;
     n16_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue;
     n16_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1197_c2_1386_return_output := n16_MUX_uxn_opcodes_h_l1197_c2_1386_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1197_c2_1386_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_9177_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_6367_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1210_c7_9177] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1210_c7_9177_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_9177_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1210_c7_9177_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_9177_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1210_c7_9177_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_9177_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_9177_return_output := result_u8_value_MUX_uxn_opcodes_h_l1210_c7_9177_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_9177_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1197_c2_1386] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1197_c2_1386_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_1386_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_1386_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_1386_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_1386_return_output := result_u8_value_MUX_uxn_opcodes_h_l1197_c2_1386_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l1235_l1193_DUPLICATE_1460 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l1235_l1193_DUPLICATE_1460_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_922a(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_1386_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_1386_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_1386_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_1386_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_1386_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_1386_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_1386_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_1386_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_1386_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l1235_l1193_DUPLICATE_1460_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l1235_l1193_DUPLICATE_1460_return_output;
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
