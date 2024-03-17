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
-- Submodules: 75
entity ovr2_0CLK_bb09c2cb is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ovr2_0CLK_bb09c2cb;
architecture arch of ovr2_0CLK_bb09c2cb is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16_low : unsigned(7 downto 0) := to_unsigned(0, 8);
signal t16_high : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16_low : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16_high : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16_low : unsigned(7 downto 0);
signal REG_COMB_t16_high : unsigned(7 downto 0);
signal REG_COMB_n16_low : unsigned(7 downto 0);
signal REG_COMB_n16_high : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l339_c6_7d17]
signal BIN_OP_EQ_uxn_opcodes_h_l339_c6_7d17_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l339_c6_7d17_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l339_c6_7d17_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l339_c2_5e6c]
signal t16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l339_c2_5e6c]
signal t16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l339_c2_5e6c]
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_5e6c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l339_c2_5e6c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5e6c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l339_c2_5e6c]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5e6c_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l339_c2_5e6c]
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l339_c2_5e6c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5e6c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l339_c2_5e6c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5e6c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l339_c2_5e6c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l339_c2_5e6c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5e6c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l339_c2_5e6c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5e6c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l339_c2_5e6c]
signal n16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l339_c2_5e6c]
signal n16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l352_c11_b116]
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_b116_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_b116_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_b116_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l352_c7_8b92]
signal t16_low_MUX_uxn_opcodes_h_l352_c7_8b92_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l352_c7_8b92_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l352_c7_8b92]
signal t16_high_MUX_uxn_opcodes_h_l352_c7_8b92_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l352_c7_8b92_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l352_c7_8b92]
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_8b92_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_8b92_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l352_c7_8b92]
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8b92_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8b92_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l352_c7_8b92]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8b92_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8b92_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l352_c7_8b92]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_8b92_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_8b92_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l352_c7_8b92]
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8b92_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8b92_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l352_c7_8b92]
signal n16_low_MUX_uxn_opcodes_h_l352_c7_8b92_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l352_c7_8b92_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l352_c7_8b92]
signal n16_high_MUX_uxn_opcodes_h_l352_c7_8b92_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l352_c7_8b92_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l355_c11_60b1]
signal BIN_OP_EQ_uxn_opcodes_h_l355_c11_60b1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l355_c11_60b1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l355_c11_60b1_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l355_c7_de13]
signal t16_low_MUX_uxn_opcodes_h_l355_c7_de13_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l355_c7_de13_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l355_c7_de13_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l355_c7_de13_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l355_c7_de13]
signal t16_high_MUX_uxn_opcodes_h_l355_c7_de13_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l355_c7_de13_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l355_c7_de13_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l355_c7_de13_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l355_c7_de13]
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_de13_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_de13_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_de13_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_de13_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l355_c7_de13]
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_de13_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_de13_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_de13_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_de13_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l355_c7_de13]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_de13_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_de13_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_de13_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_de13_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l355_c7_de13]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_de13_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_de13_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_de13_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_de13_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l355_c7_de13]
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_de13_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_de13_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_de13_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_de13_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l355_c7_de13]
signal n16_low_MUX_uxn_opcodes_h_l355_c7_de13_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l355_c7_de13_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l355_c7_de13_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l355_c7_de13_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l355_c7_de13]
signal n16_high_MUX_uxn_opcodes_h_l355_c7_de13_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l355_c7_de13_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l355_c7_de13_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l355_c7_de13_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l359_c11_d831]
signal BIN_OP_EQ_uxn_opcodes_h_l359_c11_d831_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l359_c11_d831_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l359_c11_d831_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l359_c7_54db]
signal t16_low_MUX_uxn_opcodes_h_l359_c7_54db_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l359_c7_54db_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l359_c7_54db_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l359_c7_54db_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l359_c7_54db]
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_54db_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_54db_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_54db_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_54db_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l359_c7_54db]
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_54db_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_54db_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_54db_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_54db_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l359_c7_54db]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_54db_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_54db_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_54db_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_54db_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l359_c7_54db]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_54db_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_54db_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_54db_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_54db_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l359_c7_54db]
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_54db_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_54db_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_54db_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_54db_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l359_c7_54db]
signal n16_low_MUX_uxn_opcodes_h_l359_c7_54db_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l359_c7_54db_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l359_c7_54db_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l359_c7_54db_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l359_c7_54db]
signal n16_high_MUX_uxn_opcodes_h_l359_c7_54db_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l359_c7_54db_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l359_c7_54db_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l359_c7_54db_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l363_c11_4f21]
signal BIN_OP_EQ_uxn_opcodes_h_l363_c11_4f21_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l363_c11_4f21_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l363_c11_4f21_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l363_c7_1886]
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_1886_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_1886_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_1886_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_1886_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l363_c7_1886]
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_1886_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_1886_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_1886_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_1886_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l363_c7_1886]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_1886_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_1886_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_1886_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_1886_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l363_c7_1886]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_1886_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_1886_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_1886_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_1886_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l363_c7_1886]
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_1886_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_1886_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_1886_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_1886_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l363_c7_1886]
signal n16_low_MUX_uxn_opcodes_h_l363_c7_1886_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l363_c7_1886_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l363_c7_1886_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l363_c7_1886_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l363_c7_1886]
signal n16_high_MUX_uxn_opcodes_h_l363_c7_1886_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l363_c7_1886_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l363_c7_1886_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l363_c7_1886_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l365_c30_93c9]
signal sp_relative_shift_uxn_opcodes_h_l365_c30_93c9_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l365_c30_93c9_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l365_c30_93c9_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l365_c30_93c9_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l370_c11_2add]
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_2add_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_2add_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_2add_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l370_c7_59c9]
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_59c9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_59c9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_59c9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_59c9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l370_c7_59c9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_59c9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_59c9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_59c9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_59c9_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l370_c7_59c9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_59c9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_59c9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_59c9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_59c9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l370_c7_59c9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_59c9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_59c9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_59c9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_59c9_return_output : unsigned(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l370_c7_59c9]
signal n16_low_MUX_uxn_opcodes_h_l370_c7_59c9_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l370_c7_59c9_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l370_c7_59c9_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l370_c7_59c9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l376_c11_7a97]
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_7a97_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_7a97_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_7a97_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l376_c7_550c]
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_550c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_550c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_550c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_550c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l376_c7_550c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_550c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_550c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_550c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_550c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l376_c7_550c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_550c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_550c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_550c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_550c_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l380_c11_e701]
signal BIN_OP_EQ_uxn_opcodes_h_l380_c11_e701_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l380_c11_e701_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l380_c11_e701_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l380_c7_c34a]
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_c34a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_c34a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_c34a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_c34a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l380_c7_c34a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_c34a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_c34a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_c34a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_c34a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l380_c7_c34a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_c34a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_c34a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_c34a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_c34a_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l384_c11_76e1]
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_76e1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_76e1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_76e1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l384_c7_03c2]
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_03c2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_03c2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_03c2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_03c2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l384_c7_03c2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_03c2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_03c2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_03c2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_03c2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l384_c7_03c2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_03c2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_03c2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_03c2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_03c2_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l388_c11_5bf7]
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_5bf7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_5bf7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_5bf7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l388_c7_c83a]
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_c83a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_c83a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_c83a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_c83a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l388_c7_c83a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_c83a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_c83a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_c83a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_c83a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l388_c7_c83a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_c83a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_c83a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_c83a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_c83a_return_output : unsigned(3 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_243c( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_pc_updated := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l339_c6_7d17
BIN_OP_EQ_uxn_opcodes_h_l339_c6_7d17 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l339_c6_7d17_left,
BIN_OP_EQ_uxn_opcodes_h_l339_c6_7d17_right,
BIN_OP_EQ_uxn_opcodes_h_l339_c6_7d17_return_output);

-- t16_low_MUX_uxn_opcodes_h_l339_c2_5e6c
t16_low_MUX_uxn_opcodes_h_l339_c2_5e6c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_cond,
t16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue,
t16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse,
t16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output);

-- t16_high_MUX_uxn_opcodes_h_l339_c2_5e6c
t16_high_MUX_uxn_opcodes_h_l339_c2_5e6c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_cond,
t16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue,
t16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse,
t16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l339_c2_5e6c
result_u8_value_MUX_uxn_opcodes_h_l339_c2_5e6c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l339_c2_5e6c_cond,
result_u8_value_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5e6c
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5e6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5e6c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5e6c
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5e6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5e6c_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5e6c
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5e6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5e6c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5e6c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5e6c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5e6c
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5e6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5e6c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5e6c
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5e6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5e6c
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5e6c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5e6c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5e6c
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5e6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5e6c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output);

-- n16_low_MUX_uxn_opcodes_h_l339_c2_5e6c
n16_low_MUX_uxn_opcodes_h_l339_c2_5e6c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_cond,
n16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue,
n16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse,
n16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output);

-- n16_high_MUX_uxn_opcodes_h_l339_c2_5e6c
n16_high_MUX_uxn_opcodes_h_l339_c2_5e6c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_cond,
n16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue,
n16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse,
n16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l352_c11_b116
BIN_OP_EQ_uxn_opcodes_h_l352_c11_b116 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l352_c11_b116_left,
BIN_OP_EQ_uxn_opcodes_h_l352_c11_b116_right,
BIN_OP_EQ_uxn_opcodes_h_l352_c11_b116_return_output);

-- t16_low_MUX_uxn_opcodes_h_l352_c7_8b92
t16_low_MUX_uxn_opcodes_h_l352_c7_8b92 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l352_c7_8b92_cond,
t16_low_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue,
t16_low_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse,
t16_low_MUX_uxn_opcodes_h_l352_c7_8b92_return_output);

-- t16_high_MUX_uxn_opcodes_h_l352_c7_8b92
t16_high_MUX_uxn_opcodes_h_l352_c7_8b92 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l352_c7_8b92_cond,
t16_high_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue,
t16_high_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse,
t16_high_MUX_uxn_opcodes_h_l352_c7_8b92_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l352_c7_8b92
result_u8_value_MUX_uxn_opcodes_h_l352_c7_8b92 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l352_c7_8b92_cond,
result_u8_value_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l352_c7_8b92_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8b92
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8b92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8b92_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8b92_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8b92
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8b92 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8b92_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8b92_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_8b92
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_8b92 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_8b92_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_8b92_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8b92
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8b92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8b92_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8b92_return_output);

-- n16_low_MUX_uxn_opcodes_h_l352_c7_8b92
n16_low_MUX_uxn_opcodes_h_l352_c7_8b92 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l352_c7_8b92_cond,
n16_low_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue,
n16_low_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse,
n16_low_MUX_uxn_opcodes_h_l352_c7_8b92_return_output);

-- n16_high_MUX_uxn_opcodes_h_l352_c7_8b92
n16_high_MUX_uxn_opcodes_h_l352_c7_8b92 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l352_c7_8b92_cond,
n16_high_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue,
n16_high_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse,
n16_high_MUX_uxn_opcodes_h_l352_c7_8b92_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l355_c11_60b1
BIN_OP_EQ_uxn_opcodes_h_l355_c11_60b1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l355_c11_60b1_left,
BIN_OP_EQ_uxn_opcodes_h_l355_c11_60b1_right,
BIN_OP_EQ_uxn_opcodes_h_l355_c11_60b1_return_output);

-- t16_low_MUX_uxn_opcodes_h_l355_c7_de13
t16_low_MUX_uxn_opcodes_h_l355_c7_de13 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l355_c7_de13_cond,
t16_low_MUX_uxn_opcodes_h_l355_c7_de13_iftrue,
t16_low_MUX_uxn_opcodes_h_l355_c7_de13_iffalse,
t16_low_MUX_uxn_opcodes_h_l355_c7_de13_return_output);

-- t16_high_MUX_uxn_opcodes_h_l355_c7_de13
t16_high_MUX_uxn_opcodes_h_l355_c7_de13 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l355_c7_de13_cond,
t16_high_MUX_uxn_opcodes_h_l355_c7_de13_iftrue,
t16_high_MUX_uxn_opcodes_h_l355_c7_de13_iffalse,
t16_high_MUX_uxn_opcodes_h_l355_c7_de13_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l355_c7_de13
result_u8_value_MUX_uxn_opcodes_h_l355_c7_de13 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l355_c7_de13_cond,
result_u8_value_MUX_uxn_opcodes_h_l355_c7_de13_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l355_c7_de13_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l355_c7_de13_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_de13
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_de13 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_de13_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_de13_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_de13_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_de13_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_de13
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_de13 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_de13_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_de13_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_de13_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_de13_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_de13
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_de13 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_de13_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_de13_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_de13_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_de13_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_de13
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_de13 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_de13_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_de13_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_de13_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_de13_return_output);

-- n16_low_MUX_uxn_opcodes_h_l355_c7_de13
n16_low_MUX_uxn_opcodes_h_l355_c7_de13 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l355_c7_de13_cond,
n16_low_MUX_uxn_opcodes_h_l355_c7_de13_iftrue,
n16_low_MUX_uxn_opcodes_h_l355_c7_de13_iffalse,
n16_low_MUX_uxn_opcodes_h_l355_c7_de13_return_output);

-- n16_high_MUX_uxn_opcodes_h_l355_c7_de13
n16_high_MUX_uxn_opcodes_h_l355_c7_de13 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l355_c7_de13_cond,
n16_high_MUX_uxn_opcodes_h_l355_c7_de13_iftrue,
n16_high_MUX_uxn_opcodes_h_l355_c7_de13_iffalse,
n16_high_MUX_uxn_opcodes_h_l355_c7_de13_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l359_c11_d831
BIN_OP_EQ_uxn_opcodes_h_l359_c11_d831 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l359_c11_d831_left,
BIN_OP_EQ_uxn_opcodes_h_l359_c11_d831_right,
BIN_OP_EQ_uxn_opcodes_h_l359_c11_d831_return_output);

-- t16_low_MUX_uxn_opcodes_h_l359_c7_54db
t16_low_MUX_uxn_opcodes_h_l359_c7_54db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l359_c7_54db_cond,
t16_low_MUX_uxn_opcodes_h_l359_c7_54db_iftrue,
t16_low_MUX_uxn_opcodes_h_l359_c7_54db_iffalse,
t16_low_MUX_uxn_opcodes_h_l359_c7_54db_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l359_c7_54db
result_u8_value_MUX_uxn_opcodes_h_l359_c7_54db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l359_c7_54db_cond,
result_u8_value_MUX_uxn_opcodes_h_l359_c7_54db_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l359_c7_54db_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l359_c7_54db_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_54db
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_54db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_54db_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_54db_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_54db_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_54db_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_54db
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_54db : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_54db_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_54db_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_54db_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_54db_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_54db
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_54db : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_54db_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_54db_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_54db_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_54db_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_54db
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_54db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_54db_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_54db_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_54db_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_54db_return_output);

-- n16_low_MUX_uxn_opcodes_h_l359_c7_54db
n16_low_MUX_uxn_opcodes_h_l359_c7_54db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l359_c7_54db_cond,
n16_low_MUX_uxn_opcodes_h_l359_c7_54db_iftrue,
n16_low_MUX_uxn_opcodes_h_l359_c7_54db_iffalse,
n16_low_MUX_uxn_opcodes_h_l359_c7_54db_return_output);

-- n16_high_MUX_uxn_opcodes_h_l359_c7_54db
n16_high_MUX_uxn_opcodes_h_l359_c7_54db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l359_c7_54db_cond,
n16_high_MUX_uxn_opcodes_h_l359_c7_54db_iftrue,
n16_high_MUX_uxn_opcodes_h_l359_c7_54db_iffalse,
n16_high_MUX_uxn_opcodes_h_l359_c7_54db_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l363_c11_4f21
BIN_OP_EQ_uxn_opcodes_h_l363_c11_4f21 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l363_c11_4f21_left,
BIN_OP_EQ_uxn_opcodes_h_l363_c11_4f21_right,
BIN_OP_EQ_uxn_opcodes_h_l363_c11_4f21_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l363_c7_1886
result_u8_value_MUX_uxn_opcodes_h_l363_c7_1886 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l363_c7_1886_cond,
result_u8_value_MUX_uxn_opcodes_h_l363_c7_1886_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l363_c7_1886_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l363_c7_1886_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_1886
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_1886 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_1886_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_1886_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_1886_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_1886_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_1886
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_1886 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_1886_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_1886_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_1886_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_1886_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_1886
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_1886 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_1886_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_1886_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_1886_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_1886_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_1886
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_1886 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_1886_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_1886_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_1886_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_1886_return_output);

-- n16_low_MUX_uxn_opcodes_h_l363_c7_1886
n16_low_MUX_uxn_opcodes_h_l363_c7_1886 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l363_c7_1886_cond,
n16_low_MUX_uxn_opcodes_h_l363_c7_1886_iftrue,
n16_low_MUX_uxn_opcodes_h_l363_c7_1886_iffalse,
n16_low_MUX_uxn_opcodes_h_l363_c7_1886_return_output);

-- n16_high_MUX_uxn_opcodes_h_l363_c7_1886
n16_high_MUX_uxn_opcodes_h_l363_c7_1886 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l363_c7_1886_cond,
n16_high_MUX_uxn_opcodes_h_l363_c7_1886_iftrue,
n16_high_MUX_uxn_opcodes_h_l363_c7_1886_iffalse,
n16_high_MUX_uxn_opcodes_h_l363_c7_1886_return_output);

-- sp_relative_shift_uxn_opcodes_h_l365_c30_93c9
sp_relative_shift_uxn_opcodes_h_l365_c30_93c9 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l365_c30_93c9_ins,
sp_relative_shift_uxn_opcodes_h_l365_c30_93c9_x,
sp_relative_shift_uxn_opcodes_h_l365_c30_93c9_y,
sp_relative_shift_uxn_opcodes_h_l365_c30_93c9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l370_c11_2add
BIN_OP_EQ_uxn_opcodes_h_l370_c11_2add : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l370_c11_2add_left,
BIN_OP_EQ_uxn_opcodes_h_l370_c11_2add_right,
BIN_OP_EQ_uxn_opcodes_h_l370_c11_2add_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l370_c7_59c9
result_u8_value_MUX_uxn_opcodes_h_l370_c7_59c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l370_c7_59c9_cond,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_59c9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_59c9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_59c9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_59c9
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_59c9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_59c9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_59c9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_59c9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_59c9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_59c9
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_59c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_59c9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_59c9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_59c9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_59c9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_59c9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_59c9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_59c9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_59c9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_59c9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_59c9_return_output);

-- n16_low_MUX_uxn_opcodes_h_l370_c7_59c9
n16_low_MUX_uxn_opcodes_h_l370_c7_59c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l370_c7_59c9_cond,
n16_low_MUX_uxn_opcodes_h_l370_c7_59c9_iftrue,
n16_low_MUX_uxn_opcodes_h_l370_c7_59c9_iffalse,
n16_low_MUX_uxn_opcodes_h_l370_c7_59c9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l376_c11_7a97
BIN_OP_EQ_uxn_opcodes_h_l376_c11_7a97 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l376_c11_7a97_left,
BIN_OP_EQ_uxn_opcodes_h_l376_c11_7a97_right,
BIN_OP_EQ_uxn_opcodes_h_l376_c11_7a97_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l376_c7_550c
result_u8_value_MUX_uxn_opcodes_h_l376_c7_550c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l376_c7_550c_cond,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_550c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_550c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_550c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_550c
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_550c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_550c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_550c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_550c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_550c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_550c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_550c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_550c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_550c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_550c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_550c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l380_c11_e701
BIN_OP_EQ_uxn_opcodes_h_l380_c11_e701 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l380_c11_e701_left,
BIN_OP_EQ_uxn_opcodes_h_l380_c11_e701_right,
BIN_OP_EQ_uxn_opcodes_h_l380_c11_e701_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l380_c7_c34a
result_u8_value_MUX_uxn_opcodes_h_l380_c7_c34a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l380_c7_c34a_cond,
result_u8_value_MUX_uxn_opcodes_h_l380_c7_c34a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l380_c7_c34a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l380_c7_c34a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_c34a
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_c34a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_c34a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_c34a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_c34a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_c34a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_c34a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_c34a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_c34a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_c34a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_c34a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_c34a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l384_c11_76e1
BIN_OP_EQ_uxn_opcodes_h_l384_c11_76e1 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l384_c11_76e1_left,
BIN_OP_EQ_uxn_opcodes_h_l384_c11_76e1_right,
BIN_OP_EQ_uxn_opcodes_h_l384_c11_76e1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l384_c7_03c2
result_u8_value_MUX_uxn_opcodes_h_l384_c7_03c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l384_c7_03c2_cond,
result_u8_value_MUX_uxn_opcodes_h_l384_c7_03c2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l384_c7_03c2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l384_c7_03c2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_03c2
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_03c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_03c2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_03c2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_03c2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_03c2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_03c2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_03c2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_03c2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_03c2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_03c2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_03c2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l388_c11_5bf7
BIN_OP_EQ_uxn_opcodes_h_l388_c11_5bf7 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l388_c11_5bf7_left,
BIN_OP_EQ_uxn_opcodes_h_l388_c11_5bf7_right,
BIN_OP_EQ_uxn_opcodes_h_l388_c11_5bf7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l388_c7_c83a
result_u8_value_MUX_uxn_opcodes_h_l388_c7_c83a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l388_c7_c83a_cond,
result_u8_value_MUX_uxn_opcodes_h_l388_c7_c83a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l388_c7_c83a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l388_c7_c83a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_c83a
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_c83a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_c83a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_c83a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_c83a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_c83a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_c83a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_c83a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_c83a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_c83a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_c83a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_c83a_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16_low,
 t16_high,
 n16_low,
 n16_high,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l339_c6_7d17_return_output,
 t16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output,
 t16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output,
 n16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output,
 n16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l352_c11_b116_return_output,
 t16_low_MUX_uxn_opcodes_h_l352_c7_8b92_return_output,
 t16_high_MUX_uxn_opcodes_h_l352_c7_8b92_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l352_c7_8b92_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8b92_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8b92_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_8b92_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8b92_return_output,
 n16_low_MUX_uxn_opcodes_h_l352_c7_8b92_return_output,
 n16_high_MUX_uxn_opcodes_h_l352_c7_8b92_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l355_c11_60b1_return_output,
 t16_low_MUX_uxn_opcodes_h_l355_c7_de13_return_output,
 t16_high_MUX_uxn_opcodes_h_l355_c7_de13_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l355_c7_de13_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_de13_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_de13_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_de13_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_de13_return_output,
 n16_low_MUX_uxn_opcodes_h_l355_c7_de13_return_output,
 n16_high_MUX_uxn_opcodes_h_l355_c7_de13_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l359_c11_d831_return_output,
 t16_low_MUX_uxn_opcodes_h_l359_c7_54db_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l359_c7_54db_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_54db_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_54db_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_54db_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_54db_return_output,
 n16_low_MUX_uxn_opcodes_h_l359_c7_54db_return_output,
 n16_high_MUX_uxn_opcodes_h_l359_c7_54db_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l363_c11_4f21_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l363_c7_1886_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_1886_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_1886_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_1886_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_1886_return_output,
 n16_low_MUX_uxn_opcodes_h_l363_c7_1886_return_output,
 n16_high_MUX_uxn_opcodes_h_l363_c7_1886_return_output,
 sp_relative_shift_uxn_opcodes_h_l365_c30_93c9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l370_c11_2add_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l370_c7_59c9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_59c9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_59c9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_59c9_return_output,
 n16_low_MUX_uxn_opcodes_h_l370_c7_59c9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l376_c11_7a97_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l376_c7_550c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_550c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_550c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l380_c11_e701_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l380_c7_c34a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_c34a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_c34a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l384_c11_76e1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l384_c7_03c2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_03c2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_03c2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l388_c11_5bf7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l388_c7_c83a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_c83a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_c83a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_7d17_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_7d17_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_7d17_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_8b92_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_8b92_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_8b92_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_5e6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8b92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5e6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l339_c2_5e6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5e6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l339_c2_5e6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l349_c3_9fce : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8b92_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5e6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l339_c2_5e6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5e6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l339_c2_5e6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l344_c3_e535 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_8b92_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5e6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8b92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5e6c_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_8b92_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_8b92_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_b116_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_b116_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_b116_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_de13_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_8b92_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_de13_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_8b92_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_de13_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_8b92_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_de13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8b92_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l353_c3_f694 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_de13_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8b92_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_de13_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_8b92_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_de13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8b92_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_de13_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_8b92_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_de13_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_8b92_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_60b1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_60b1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_60b1_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_de13_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_de13_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_54db_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_de13_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_de13_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_de13_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_de13_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_de13_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_de13_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_54db_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_de13_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_de13_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_de13_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_54db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_de13_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_de13_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_532f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_de13_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_54db_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_de13_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_de13_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_de13_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_54db_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_de13_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_de13_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_de13_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_54db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_de13_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_de13_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_de13_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_54db_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_de13_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_de13_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_de13_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_54db_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_de13_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_d831_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_d831_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_d831_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_54db_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_54db_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_54db_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_54db_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_54db_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_1886_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_54db_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_54db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_54db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_1886_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_54db_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_54db_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l361_c3_4777 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_54db_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_1886_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_54db_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_54db_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_54db_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_1886_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_54db_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_54db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_54db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_1886_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_54db_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_54db_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_54db_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_1886_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_54db_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_54db_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_54db_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_1886_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_54db_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_4f21_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_4f21_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_4f21_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_1886_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_1886_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_59c9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_1886_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_1886_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_1886_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_1886_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_1886_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_6c9d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_1886_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_59c9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_1886_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_1886_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_1886_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_59c9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_1886_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_1886_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_1886_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_59c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_1886_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_1886_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_1886_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_59c9_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_1886_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_1886_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_1886_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_1886_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_93c9_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_93c9_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_93c9_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_93c9_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_2add_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_2add_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_2add_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_59c9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_59c9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_550c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_59c9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_59c9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l372_c3_fb17 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_59c9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_59c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_59c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_59c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_550c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_59c9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_59c9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l373_c3_ac9a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_59c9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_550c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_59c9_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_59c9_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_59c9_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_59c9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_7a97_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_7a97_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_7a97_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_550c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_550c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_c34a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_550c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_550c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_550c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_c34a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_550c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_550c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_e423 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_550c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_c34a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_550c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_e701_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_e701_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_e701_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_c34a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_c34a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_03c2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_c34a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_c34a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_c34a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_03c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_c34a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_c34a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_8de3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_c34a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_03c2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_c34a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_76e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_76e1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_76e1_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_03c2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_03c2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_c83a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_03c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_03c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_03c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_c83a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_03c2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_03c2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_1da2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_03c2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_c83a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_03c2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_5bf7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_5bf7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_5bf7_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_c83a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_c83a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_c83a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_c83a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_c83a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_c83a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_c83a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_f6f4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_c83a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l388_c7_c83a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_c83a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_252f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l359_l352_l363_l355_DUPLICATE_b790_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l359_l352_l355_l370_DUPLICATE_29f8_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l370_l363_l359_l388_l355_l384_l352_l380_DUPLICATE_762d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l335_l394_DUPLICATE_18a3_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16_low : unsigned(7 downto 0);
variable REG_VAR_t16_high : unsigned(7 downto 0);
variable REG_VAR_n16_low : unsigned(7 downto 0);
variable REG_VAR_n16_high : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16_low := t16_low;
  REG_VAR_t16_high := t16_high;
  REG_VAR_n16_low := n16_low;
  REG_VAR_n16_high := n16_high;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_1da2 := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_03c2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_1da2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_4f21_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l361_c3_4777 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_54db_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l361_c3_4777;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_e423 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_550c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_e423;
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_93c9_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_5bf7_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_e701_right := to_unsigned(7, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_93c9_y := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_532f := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_de13_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_532f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_7d17_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_6c9d := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_1886_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_6c9d;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_1886_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_d831_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l353_c3_f694 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l353_c3_f694;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_60b1_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_8de3 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_c34a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_8de3;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l344_c3_e535 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l344_c3_e535;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_76e1_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_7a97_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l349_c3_9fce := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l349_c3_9fce;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l373_c3_ac9a := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_59c9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l373_c3_ac9a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_b116_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l372_c3_fb17 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_59c9_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l372_c3_fb17;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_f6f4 := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_c83a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_f6f4;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_c83a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_2add_right := to_unsigned(5, 3);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_93c9_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_de13_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_54db_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_1886_iffalse := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_c34a_iftrue := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_c83a_iftrue := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_de13_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_54db_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_1886_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_59c9_iffalse := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_550c_iftrue := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_03c2_iftrue := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_7d17_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_b116_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_60b1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_d831_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_4f21_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_2add_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_7a97_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_e701_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_76e1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_5bf7_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_1886_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_59c9_iftrue := VAR_previous_stack_read;
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_de13_iftrue := VAR_previous_stack_read;
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_54db_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_59c9_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_de13_iffalse := t16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_1886_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_de13_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_54db_iffalse := t16_low;
     -- BIN_OP_EQ[uxn_opcodes_h_l363_c11_4f21] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l363_c11_4f21_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_4f21_left;
     BIN_OP_EQ_uxn_opcodes_h_l363_c11_4f21_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_4f21_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_4f21_return_output := BIN_OP_EQ_uxn_opcodes_h_l363_c11_4f21_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l339_c2_5e6c] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l339_c2_5e6c_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l370_l363_l359_l388_l355_l384_l352_l380_DUPLICATE_762d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l370_l363_l359_l388_l355_l384_l352_l380_DUPLICATE_762d_return_output := result.is_opc_done;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l339_c2_5e6c] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l339_c2_5e6c_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l352_c11_b116] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l352_c11_b116_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_b116_left;
     BIN_OP_EQ_uxn_opcodes_h_l352_c11_b116_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_b116_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_b116_return_output := BIN_OP_EQ_uxn_opcodes_h_l352_c11_b116_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l339_c6_7d17] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l339_c6_7d17_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_7d17_left;
     BIN_OP_EQ_uxn_opcodes_h_l339_c6_7d17_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_7d17_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_7d17_return_output := BIN_OP_EQ_uxn_opcodes_h_l339_c6_7d17_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l365_c30_93c9] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l365_c30_93c9_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_93c9_ins;
     sp_relative_shift_uxn_opcodes_h_l365_c30_93c9_x <= VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_93c9_x;
     sp_relative_shift_uxn_opcodes_h_l365_c30_93c9_y <= VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_93c9_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_93c9_return_output := sp_relative_shift_uxn_opcodes_h_l365_c30_93c9_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l339_c2_5e6c] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l339_c2_5e6c_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l388_c11_5bf7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l388_c11_5bf7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_5bf7_left;
     BIN_OP_EQ_uxn_opcodes_h_l388_c11_5bf7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_5bf7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_5bf7_return_output := BIN_OP_EQ_uxn_opcodes_h_l388_c11_5bf7_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l388_c7_c83a] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l388_c7_c83a_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l359_l352_l355_l370_DUPLICATE_29f8 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l359_l352_l355_l370_DUPLICATE_29f8_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l380_c11_e701] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l380_c11_e701_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_e701_left;
     BIN_OP_EQ_uxn_opcodes_h_l380_c11_e701_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_e701_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_e701_return_output := BIN_OP_EQ_uxn_opcodes_h_l380_c11_e701_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l376_c11_7a97] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l376_c11_7a97_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_7a97_left;
     BIN_OP_EQ_uxn_opcodes_h_l376_c11_7a97_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_7a97_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_7a97_return_output := BIN_OP_EQ_uxn_opcodes_h_l376_c11_7a97_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_252f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_252f_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l359_l352_l363_l355_DUPLICATE_b790 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l359_l352_l363_l355_DUPLICATE_b790_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l384_c11_76e1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l384_c11_76e1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_76e1_left;
     BIN_OP_EQ_uxn_opcodes_h_l384_c11_76e1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_76e1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_76e1_return_output := BIN_OP_EQ_uxn_opcodes_h_l384_c11_76e1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l370_c11_2add] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l370_c11_2add_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_2add_left;
     BIN_OP_EQ_uxn_opcodes_h_l370_c11_2add_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_2add_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_2add_return_output := BIN_OP_EQ_uxn_opcodes_h_l370_c11_2add_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l359_c11_d831] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l359_c11_d831_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_d831_left;
     BIN_OP_EQ_uxn_opcodes_h_l359_c11_d831_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_d831_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_d831_return_output := BIN_OP_EQ_uxn_opcodes_h_l359_c11_d831_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l355_c11_60b1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l355_c11_60b1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_60b1_left;
     BIN_OP_EQ_uxn_opcodes_h_l355_c11_60b1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_60b1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_60b1_return_output := BIN_OP_EQ_uxn_opcodes_h_l355_c11_60b1_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l339_c2_5e6c] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l339_c2_5e6c_return_output := result.is_vram_write;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_7d17_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_7d17_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5e6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_7d17_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5e6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_7d17_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_7d17_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5e6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_7d17_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5e6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_7d17_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_7d17_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5e6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_7d17_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5e6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_7d17_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_5e6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_7d17_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_7d17_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_7d17_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_8b92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_b116_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_8b92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_b116_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8b92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_b116_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8b92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_b116_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_8b92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_b116_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8b92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_b116_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_8b92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_b116_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_8b92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_b116_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_8b92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_b116_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_de13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_60b1_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_de13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_60b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_de13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_60b1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_de13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_60b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_de13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_60b1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_de13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_60b1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_de13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_60b1_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_de13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_60b1_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_de13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_60b1_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_54db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_d831_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_54db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_d831_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_54db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_d831_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_54db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_d831_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_54db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_d831_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_54db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_d831_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_54db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_d831_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_54db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_d831_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_1886_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_4f21_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_1886_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_4f21_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_1886_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_4f21_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_1886_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_4f21_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_1886_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_4f21_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_1886_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_4f21_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_1886_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_4f21_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_59c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_2add_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_59c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_2add_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_59c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_2add_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_59c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_2add_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_59c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_2add_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_550c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_7a97_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_550c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_7a97_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_550c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_7a97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_c34a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_e701_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_c34a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_e701_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_c34a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_e701_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_03c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_76e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_03c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_76e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_03c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_76e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_c83a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_5bf7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_c83a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_5bf7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_c83a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_5bf7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l359_l352_l355_l370_DUPLICATE_29f8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_de13_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l359_l352_l355_l370_DUPLICATE_29f8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_54db_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l359_l352_l355_l370_DUPLICATE_29f8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_59c9_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l359_l352_l355_l370_DUPLICATE_29f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l370_l363_l359_l388_l355_l384_l352_l380_DUPLICATE_762d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_de13_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l370_l363_l359_l388_l355_l384_l352_l380_DUPLICATE_762d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_54db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l370_l363_l359_l388_l355_l384_l352_l380_DUPLICATE_762d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_1886_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l370_l363_l359_l388_l355_l384_l352_l380_DUPLICATE_762d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_59c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l370_l363_l359_l388_l355_l384_l352_l380_DUPLICATE_762d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_550c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l370_l363_l359_l388_l355_l384_l352_l380_DUPLICATE_762d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_c34a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l370_l363_l359_l388_l355_l384_l352_l380_DUPLICATE_762d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_03c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l370_l363_l359_l388_l355_l384_l352_l380_DUPLICATE_762d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_c83a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l370_l363_l359_l388_l355_l384_l352_l380_DUPLICATE_762d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l359_l352_l363_l355_DUPLICATE_b790_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_de13_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l359_l352_l363_l355_DUPLICATE_b790_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_54db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l359_l352_l363_l355_DUPLICATE_b790_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_1886_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l359_l352_l363_l355_DUPLICATE_b790_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_252f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_252f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_de13_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_252f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_54db_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_252f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_c83a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_252f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l339_c2_5e6c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l339_c2_5e6c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l339_c2_5e6c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l339_c2_5e6c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_c83a_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l388_c7_c83a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_1886_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_93c9_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l339_c2_5e6c] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l388_c7_c83a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l388_c7_c83a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_c83a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l388_c7_c83a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_c83a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l388_c7_c83a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_c83a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_c83a_return_output := result_u8_value_MUX_uxn_opcodes_h_l388_c7_c83a_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l339_c2_5e6c] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5e6c_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5e6c_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l363_c7_1886] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_1886_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_1886_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_1886_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_1886_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_1886_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_1886_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_1886_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_1886_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l339_c2_5e6c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l370_c7_59c9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_59c9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_59c9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_59c9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_59c9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_59c9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_59c9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_59c9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_59c9_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l363_c7_1886] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l363_c7_1886_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_1886_cond;
     n16_high_MUX_uxn_opcodes_h_l363_c7_1886_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_1886_iftrue;
     n16_high_MUX_uxn_opcodes_h_l363_c7_1886_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_1886_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_1886_return_output := n16_high_MUX_uxn_opcodes_h_l363_c7_1886_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l388_c7_c83a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_c83a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_c83a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_c83a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_c83a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_c83a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_c83a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_c83a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_c83a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l339_c2_5e6c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5e6c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5e6c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l370_c7_59c9] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l370_c7_59c9_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_59c9_cond;
     n16_low_MUX_uxn_opcodes_h_l370_c7_59c9_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_59c9_iftrue;
     n16_low_MUX_uxn_opcodes_h_l370_c7_59c9_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_59c9_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_59c9_return_output := n16_low_MUX_uxn_opcodes_h_l370_c7_59c9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l388_c7_c83a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_c83a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_c83a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_c83a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_c83a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_c83a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_c83a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_c83a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_c83a_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l359_c7_54db] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l359_c7_54db_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_54db_cond;
     t16_low_MUX_uxn_opcodes_h_l359_c7_54db_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_54db_iftrue;
     t16_low_MUX_uxn_opcodes_h_l359_c7_54db_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_54db_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_54db_return_output := t16_low_MUX_uxn_opcodes_h_l359_c7_54db_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l355_c7_de13] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l355_c7_de13_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_de13_cond;
     t16_high_MUX_uxn_opcodes_h_l355_c7_de13_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_de13_iftrue;
     t16_high_MUX_uxn_opcodes_h_l355_c7_de13_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_de13_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_de13_return_output := t16_high_MUX_uxn_opcodes_h_l355_c7_de13_return_output;

     -- Submodule level 2
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_54db_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_1886_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_1886_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_59c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_03c2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_c83a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_54db_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_1886_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_1886_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_59c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_03c2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_c83a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_03c2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_c83a_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_de13_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_de13_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_54db_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l363_c7_1886] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_1886_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_1886_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_1886_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_1886_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_1886_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_1886_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_1886_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_1886_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l352_c7_8b92] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l352_c7_8b92_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_8b92_cond;
     t16_high_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue;
     t16_high_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_8b92_return_output := t16_high_MUX_uxn_opcodes_h_l352_c7_8b92_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l384_c7_03c2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l384_c7_03c2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_03c2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l384_c7_03c2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_03c2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l384_c7_03c2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_03c2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_03c2_return_output := result_u8_value_MUX_uxn_opcodes_h_l384_c7_03c2_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l363_c7_1886] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l363_c7_1886_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_1886_cond;
     n16_low_MUX_uxn_opcodes_h_l363_c7_1886_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_1886_iftrue;
     n16_low_MUX_uxn_opcodes_h_l363_c7_1886_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_1886_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_1886_return_output := n16_low_MUX_uxn_opcodes_h_l363_c7_1886_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l359_c7_54db] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l359_c7_54db_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_54db_cond;
     n16_high_MUX_uxn_opcodes_h_l359_c7_54db_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_54db_iftrue;
     n16_high_MUX_uxn_opcodes_h_l359_c7_54db_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_54db_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_54db_return_output := n16_high_MUX_uxn_opcodes_h_l359_c7_54db_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l384_c7_03c2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_03c2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_03c2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_03c2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_03c2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_03c2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_03c2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_03c2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_03c2_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l355_c7_de13] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l355_c7_de13_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_de13_cond;
     t16_low_MUX_uxn_opcodes_h_l355_c7_de13_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_de13_iftrue;
     t16_low_MUX_uxn_opcodes_h_l355_c7_de13_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_de13_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_de13_return_output := t16_low_MUX_uxn_opcodes_h_l355_c7_de13_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l384_c7_03c2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_03c2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_03c2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_03c2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_03c2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_03c2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_03c2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_03c2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_03c2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l359_c7_54db] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_54db_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_54db_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_54db_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_54db_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_54db_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_54db_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_54db_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_54db_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_de13_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_54db_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_54db_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_1886_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_c34a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_03c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_de13_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_54db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_54db_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_1886_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_c34a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_03c2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_c34a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_03c2_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_8b92_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_de13_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l380_c7_c34a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l380_c7_c34a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_c34a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l380_c7_c34a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_c34a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l380_c7_c34a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_c34a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_c34a_return_output := result_u8_value_MUX_uxn_opcodes_h_l380_c7_c34a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l355_c7_de13] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_de13_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_de13_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_de13_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_de13_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_de13_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_de13_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_de13_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_de13_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l380_c7_c34a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_c34a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_c34a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_c34a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_c34a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_c34a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_c34a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_c34a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_c34a_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l339_c2_5e6c] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_cond;
     t16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue;
     t16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output := t16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l380_c7_c34a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_c34a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_c34a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_c34a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_c34a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_c34a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_c34a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_c34a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_c34a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l359_c7_54db] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_54db_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_54db_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_54db_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_54db_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_54db_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_54db_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_54db_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_54db_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l355_c7_de13] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l355_c7_de13_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_de13_cond;
     n16_high_MUX_uxn_opcodes_h_l355_c7_de13_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_de13_iftrue;
     n16_high_MUX_uxn_opcodes_h_l355_c7_de13_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_de13_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_de13_return_output := n16_high_MUX_uxn_opcodes_h_l355_c7_de13_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l352_c7_8b92] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l352_c7_8b92_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_8b92_cond;
     t16_low_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue;
     t16_low_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_8b92_return_output := t16_low_MUX_uxn_opcodes_h_l352_c7_8b92_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l359_c7_54db] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l359_c7_54db_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_54db_cond;
     n16_low_MUX_uxn_opcodes_h_l359_c7_54db_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_54db_iftrue;
     n16_low_MUX_uxn_opcodes_h_l359_c7_54db_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_54db_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_54db_return_output := n16_low_MUX_uxn_opcodes_h_l359_c7_54db_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_de13_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_de13_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_54db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_550c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_c34a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_de13_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_de13_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_54db_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_550c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_c34a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_550c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_c34a_return_output;
     REG_VAR_t16_high := VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_8b92_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l376_c7_550c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_550c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_550c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_550c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_550c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_550c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_550c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_550c_return_output := result_u8_value_MUX_uxn_opcodes_h_l376_c7_550c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l376_c7_550c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_550c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_550c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_550c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_550c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_550c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_550c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_550c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_550c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l352_c7_8b92] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8b92_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8b92_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8b92_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8b92_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l355_c7_de13] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_de13_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_de13_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_de13_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_de13_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_de13_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_de13_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_de13_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_de13_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l339_c2_5e6c] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_cond;
     t16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue;
     t16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output := t16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l376_c7_550c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_550c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_550c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_550c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_550c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_550c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_550c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_550c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_550c_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l355_c7_de13] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l355_c7_de13_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_de13_cond;
     n16_low_MUX_uxn_opcodes_h_l355_c7_de13_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_de13_iftrue;
     n16_low_MUX_uxn_opcodes_h_l355_c7_de13_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_de13_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_de13_return_output := n16_low_MUX_uxn_opcodes_h_l355_c7_de13_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l352_c7_8b92] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l352_c7_8b92_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_8b92_cond;
     n16_high_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue;
     n16_high_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_8b92_return_output := n16_high_MUX_uxn_opcodes_h_l352_c7_8b92_return_output;

     -- Submodule level 5
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_8b92_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_de13_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_59c9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_550c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8b92_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_de13_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_59c9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_550c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_59c9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_550c_return_output;
     REG_VAR_t16_low := VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l339_c2_5e6c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5e6c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5e6c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l370_c7_59c9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_59c9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_59c9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_59c9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_59c9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_59c9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_59c9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_59c9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_59c9_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l352_c7_8b92] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l352_c7_8b92_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_8b92_cond;
     n16_low_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue;
     n16_low_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_8b92_return_output := n16_low_MUX_uxn_opcodes_h_l352_c7_8b92_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l352_c7_8b92] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_8b92_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_8b92_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_8b92_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_8b92_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l370_c7_59c9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_59c9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_59c9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_59c9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_59c9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_59c9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_59c9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_59c9_return_output := result_u8_value_MUX_uxn_opcodes_h_l370_c7_59c9_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l339_c2_5e6c] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_cond;
     n16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue;
     n16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output := n16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l370_c7_59c9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_59c9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_59c9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_59c9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_59c9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_59c9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_59c9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_59c9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_59c9_return_output;

     -- Submodule level 6
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_8b92_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_1886_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_59c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_8b92_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_1886_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_59c9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_1886_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_59c9_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l339_c2_5e6c] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_cond;
     n16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue;
     n16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output := n16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l363_c7_1886] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_1886_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_1886_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_1886_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_1886_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_1886_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_1886_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_1886_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_1886_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l339_c2_5e6c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5e6c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5e6c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l363_c7_1886] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l363_c7_1886_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_1886_cond;
     result_u8_value_MUX_uxn_opcodes_h_l363_c7_1886_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_1886_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l363_c7_1886_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_1886_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_1886_return_output := result_u8_value_MUX_uxn_opcodes_h_l363_c7_1886_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l363_c7_1886] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_1886_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_1886_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_1886_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_1886_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_1886_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_1886_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_1886_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_1886_return_output;

     -- Submodule level 7
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_54db_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_1886_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_54db_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_1886_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_54db_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_1886_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l359_c7_54db] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l359_c7_54db_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_54db_cond;
     result_u8_value_MUX_uxn_opcodes_h_l359_c7_54db_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_54db_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l359_c7_54db_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_54db_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_54db_return_output := result_u8_value_MUX_uxn_opcodes_h_l359_c7_54db_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l359_c7_54db] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_54db_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_54db_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_54db_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_54db_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_54db_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_54db_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_54db_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_54db_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l359_c7_54db] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_54db_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_54db_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_54db_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_54db_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_54db_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_54db_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_54db_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_54db_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_de13_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_54db_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_de13_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_54db_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_de13_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_54db_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l355_c7_de13] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_de13_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_de13_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_de13_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_de13_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_de13_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_de13_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_de13_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_de13_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l355_c7_de13] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l355_c7_de13_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_de13_cond;
     result_u8_value_MUX_uxn_opcodes_h_l355_c7_de13_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_de13_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l355_c7_de13_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_de13_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_de13_return_output := result_u8_value_MUX_uxn_opcodes_h_l355_c7_de13_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l355_c7_de13] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_de13_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_de13_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_de13_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_de13_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_de13_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_de13_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_de13_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_de13_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_de13_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_de13_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_de13_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l352_c7_8b92] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8b92_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8b92_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8b92_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8b92_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l352_c7_8b92] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8b92_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8b92_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8b92_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8b92_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l352_c7_8b92] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l352_c7_8b92_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_8b92_cond;
     result_u8_value_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_8b92_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_8b92_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_8b92_return_output := result_u8_value_MUX_uxn_opcodes_h_l352_c7_8b92_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8b92_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8b92_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_8b92_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l339_c2_5e6c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5e6c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5e6c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l339_c2_5e6c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5e6c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5e6c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l339_c2_5e6c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l339_c2_5e6c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_5e6c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_5e6c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_5e6c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output := result_u8_value_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l335_l394_DUPLICATE_18a3 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l335_l394_DUPLICATE_18a3_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_243c(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5e6c_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l335_l394_DUPLICATE_18a3_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l335_l394_DUPLICATE_18a3_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16_low <= REG_VAR_t16_low;
REG_COMB_t16_high <= REG_VAR_t16_high;
REG_COMB_n16_low <= REG_VAR_n16_low;
REG_COMB_n16_high <= REG_VAR_n16_high;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16_low <= REG_COMB_t16_low;
     t16_high <= REG_COMB_t16_high;
     n16_low <= REG_COMB_n16_low;
     n16_high <= REG_COMB_n16_high;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
