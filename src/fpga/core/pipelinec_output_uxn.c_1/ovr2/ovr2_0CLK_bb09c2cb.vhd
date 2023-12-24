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
-- BIN_OP_EQ[uxn_opcodes_h_l339_c6_01e8]
signal BIN_OP_EQ_uxn_opcodes_h_l339_c6_01e8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l339_c6_01e8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l339_c6_01e8_return_output : unsigned(0 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l339_c2_8d56]
signal t16_high_MUX_uxn_opcodes_h_l339_c2_8d56_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l339_c2_8d56_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l339_c2_8d56]
signal n16_low_MUX_uxn_opcodes_h_l339_c2_8d56_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l339_c2_8d56_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l339_c2_8d56]
signal t16_low_MUX_uxn_opcodes_h_l339_c2_8d56_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l339_c2_8d56_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l339_c2_8d56]
signal n16_high_MUX_uxn_opcodes_h_l339_c2_8d56_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l339_c2_8d56_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l339_c2_8d56]
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8d56_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8d56_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l339_c2_8d56]
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8d56_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8d56_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l339_c2_8d56]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8d56_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8d56_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l339_c2_8d56]
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_8d56_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_8d56_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l339_c2_8d56]
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8d56_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8d56_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l339_c2_8d56]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8d56_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8d56_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l339_c2_8d56]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8d56_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8d56_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l339_c2_8d56]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8d56_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8d56_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l339_c2_8d56]
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8d56_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8d56_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l352_c11_0263]
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_0263_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_0263_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_0263_return_output : unsigned(0 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l352_c7_d66e]
signal t16_high_MUX_uxn_opcodes_h_l352_c7_d66e_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l352_c7_d66e_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l352_c7_d66e]
signal n16_low_MUX_uxn_opcodes_h_l352_c7_d66e_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l352_c7_d66e_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l352_c7_d66e]
signal t16_low_MUX_uxn_opcodes_h_l352_c7_d66e_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l352_c7_d66e_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l352_c7_d66e]
signal n16_high_MUX_uxn_opcodes_h_l352_c7_d66e_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l352_c7_d66e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l352_c7_d66e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d66e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d66e_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l352_c7_d66e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d66e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d66e_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l352_c7_d66e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d66e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d66e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l352_c7_d66e]
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_d66e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_d66e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l352_c7_d66e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d66e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d66e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l355_c11_ada9]
signal BIN_OP_EQ_uxn_opcodes_h_l355_c11_ada9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l355_c11_ada9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l355_c11_ada9_return_output : unsigned(0 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l355_c7_ac04]
signal t16_high_MUX_uxn_opcodes_h_l355_c7_ac04_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l355_c7_ac04_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l355_c7_ac04]
signal n16_low_MUX_uxn_opcodes_h_l355_c7_ac04_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l355_c7_ac04_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l355_c7_ac04]
signal t16_low_MUX_uxn_opcodes_h_l355_c7_ac04_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l355_c7_ac04_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l355_c7_ac04]
signal n16_high_MUX_uxn_opcodes_h_l355_c7_ac04_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l355_c7_ac04_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l355_c7_ac04]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ac04_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ac04_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l355_c7_ac04]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ac04_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ac04_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l355_c7_ac04]
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ac04_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ac04_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l355_c7_ac04]
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_ac04_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_ac04_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l355_c7_ac04]
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ac04_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ac04_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l359_c11_5690]
signal BIN_OP_EQ_uxn_opcodes_h_l359_c11_5690_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l359_c11_5690_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l359_c11_5690_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l359_c7_d3ca]
signal n16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l359_c7_d3ca]
signal t16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l359_c7_d3ca]
signal n16_high_MUX_uxn_opcodes_h_l359_c7_d3ca_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l359_c7_d3ca_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l359_c7_d3ca_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l359_c7_d3ca]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_d3ca_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_d3ca_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_d3ca_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l359_c7_d3ca]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_d3ca_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_d3ca_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_d3ca_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l359_c7_d3ca]
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_d3ca_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_d3ca_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_d3ca_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l359_c7_d3ca]
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_d3ca_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_d3ca_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_d3ca_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l359_c7_d3ca]
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_d3ca_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_d3ca_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_d3ca_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l363_c11_7991]
signal BIN_OP_EQ_uxn_opcodes_h_l363_c11_7991_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l363_c11_7991_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l363_c11_7991_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l363_c7_552f]
signal n16_low_MUX_uxn_opcodes_h_l363_c7_552f_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l363_c7_552f_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l363_c7_552f_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l363_c7_552f_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l363_c7_552f]
signal n16_high_MUX_uxn_opcodes_h_l363_c7_552f_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l363_c7_552f_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l363_c7_552f_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l363_c7_552f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l363_c7_552f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_552f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_552f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_552f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_552f_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l363_c7_552f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_552f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_552f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_552f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_552f_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l363_c7_552f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_552f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_552f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_552f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_552f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l363_c7_552f]
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_552f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_552f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_552f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_552f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l363_c7_552f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_552f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_552f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_552f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_552f_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l365_c30_3700]
signal sp_relative_shift_uxn_opcodes_h_l365_c30_3700_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l365_c30_3700_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l365_c30_3700_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l365_c30_3700_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l370_c11_9bfe]
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_9bfe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_9bfe_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_9bfe_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l370_c7_ea33]
signal n16_low_MUX_uxn_opcodes_h_l370_c7_ea33_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l370_c7_ea33_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l370_c7_ea33_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l370_c7_ea33_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l370_c7_ea33]
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_ea33_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_ea33_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_ea33_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_ea33_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l370_c7_ea33]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_ea33_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_ea33_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_ea33_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_ea33_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l370_c7_ea33]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_ea33_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_ea33_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_ea33_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_ea33_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l370_c7_ea33]
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_ea33_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_ea33_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_ea33_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_ea33_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l376_c11_dcfc]
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_dcfc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_dcfc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_dcfc_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l376_c7_f5be]
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_f5be_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_f5be_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_f5be_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_f5be_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l376_c7_f5be]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_f5be_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_f5be_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_f5be_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_f5be_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l376_c7_f5be]
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_f5be_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_f5be_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_f5be_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_f5be_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l380_c11_c6da]
signal BIN_OP_EQ_uxn_opcodes_h_l380_c11_c6da_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l380_c11_c6da_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l380_c11_c6da_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l380_c7_e042]
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_e042_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_e042_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_e042_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_e042_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l380_c7_e042]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e042_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e042_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e042_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e042_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l380_c7_e042]
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e042_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e042_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e042_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e042_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l384_c11_82e7]
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_82e7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_82e7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_82e7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l384_c7_8eda]
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_8eda_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_8eda_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_8eda_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_8eda_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l384_c7_8eda]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_8eda_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_8eda_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_8eda_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_8eda_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l384_c7_8eda]
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_8eda_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_8eda_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_8eda_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_8eda_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l388_c11_87e8]
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_87e8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_87e8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_87e8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l388_c7_87ae]
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_87ae_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_87ae_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_87ae_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_87ae_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l388_c7_87ae]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_87ae_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_87ae_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_87ae_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_87ae_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l388_c7_87ae]
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_87ae_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_87ae_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_87ae_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_87ae_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l339_c6_01e8
BIN_OP_EQ_uxn_opcodes_h_l339_c6_01e8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l339_c6_01e8_left,
BIN_OP_EQ_uxn_opcodes_h_l339_c6_01e8_right,
BIN_OP_EQ_uxn_opcodes_h_l339_c6_01e8_return_output);

-- t16_high_MUX_uxn_opcodes_h_l339_c2_8d56
t16_high_MUX_uxn_opcodes_h_l339_c2_8d56 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l339_c2_8d56_cond,
t16_high_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue,
t16_high_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse,
t16_high_MUX_uxn_opcodes_h_l339_c2_8d56_return_output);

-- n16_low_MUX_uxn_opcodes_h_l339_c2_8d56
n16_low_MUX_uxn_opcodes_h_l339_c2_8d56 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l339_c2_8d56_cond,
n16_low_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue,
n16_low_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse,
n16_low_MUX_uxn_opcodes_h_l339_c2_8d56_return_output);

-- t16_low_MUX_uxn_opcodes_h_l339_c2_8d56
t16_low_MUX_uxn_opcodes_h_l339_c2_8d56 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l339_c2_8d56_cond,
t16_low_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue,
t16_low_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse,
t16_low_MUX_uxn_opcodes_h_l339_c2_8d56_return_output);

-- n16_high_MUX_uxn_opcodes_h_l339_c2_8d56
n16_high_MUX_uxn_opcodes_h_l339_c2_8d56 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l339_c2_8d56_cond,
n16_high_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue,
n16_high_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse,
n16_high_MUX_uxn_opcodes_h_l339_c2_8d56_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8d56
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8d56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8d56_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8d56_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8d56
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8d56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8d56_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8d56_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8d56
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8d56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8d56_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8d56_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l339_c2_8d56
result_u8_value_MUX_uxn_opcodes_h_l339_c2_8d56 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l339_c2_8d56_cond,
result_u8_value_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l339_c2_8d56_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8d56
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8d56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8d56_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8d56_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8d56
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8d56 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8d56_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8d56_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8d56
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8d56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8d56_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8d56_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8d56
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8d56 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8d56_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8d56_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8d56
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8d56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8d56_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8d56_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l352_c11_0263
BIN_OP_EQ_uxn_opcodes_h_l352_c11_0263 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l352_c11_0263_left,
BIN_OP_EQ_uxn_opcodes_h_l352_c11_0263_right,
BIN_OP_EQ_uxn_opcodes_h_l352_c11_0263_return_output);

-- t16_high_MUX_uxn_opcodes_h_l352_c7_d66e
t16_high_MUX_uxn_opcodes_h_l352_c7_d66e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l352_c7_d66e_cond,
t16_high_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue,
t16_high_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse,
t16_high_MUX_uxn_opcodes_h_l352_c7_d66e_return_output);

-- n16_low_MUX_uxn_opcodes_h_l352_c7_d66e
n16_low_MUX_uxn_opcodes_h_l352_c7_d66e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l352_c7_d66e_cond,
n16_low_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue,
n16_low_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse,
n16_low_MUX_uxn_opcodes_h_l352_c7_d66e_return_output);

-- t16_low_MUX_uxn_opcodes_h_l352_c7_d66e
t16_low_MUX_uxn_opcodes_h_l352_c7_d66e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l352_c7_d66e_cond,
t16_low_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue,
t16_low_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse,
t16_low_MUX_uxn_opcodes_h_l352_c7_d66e_return_output);

-- n16_high_MUX_uxn_opcodes_h_l352_c7_d66e
n16_high_MUX_uxn_opcodes_h_l352_c7_d66e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l352_c7_d66e_cond,
n16_high_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue,
n16_high_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse,
n16_high_MUX_uxn_opcodes_h_l352_c7_d66e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d66e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d66e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d66e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d66e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d66e
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d66e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d66e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d66e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d66e
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d66e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d66e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d66e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l352_c7_d66e
result_u8_value_MUX_uxn_opcodes_h_l352_c7_d66e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l352_c7_d66e_cond,
result_u8_value_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l352_c7_d66e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d66e
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d66e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d66e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d66e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l355_c11_ada9
BIN_OP_EQ_uxn_opcodes_h_l355_c11_ada9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l355_c11_ada9_left,
BIN_OP_EQ_uxn_opcodes_h_l355_c11_ada9_right,
BIN_OP_EQ_uxn_opcodes_h_l355_c11_ada9_return_output);

-- t16_high_MUX_uxn_opcodes_h_l355_c7_ac04
t16_high_MUX_uxn_opcodes_h_l355_c7_ac04 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l355_c7_ac04_cond,
t16_high_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue,
t16_high_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse,
t16_high_MUX_uxn_opcodes_h_l355_c7_ac04_return_output);

-- n16_low_MUX_uxn_opcodes_h_l355_c7_ac04
n16_low_MUX_uxn_opcodes_h_l355_c7_ac04 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l355_c7_ac04_cond,
n16_low_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue,
n16_low_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse,
n16_low_MUX_uxn_opcodes_h_l355_c7_ac04_return_output);

-- t16_low_MUX_uxn_opcodes_h_l355_c7_ac04
t16_low_MUX_uxn_opcodes_h_l355_c7_ac04 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l355_c7_ac04_cond,
t16_low_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue,
t16_low_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse,
t16_low_MUX_uxn_opcodes_h_l355_c7_ac04_return_output);

-- n16_high_MUX_uxn_opcodes_h_l355_c7_ac04
n16_high_MUX_uxn_opcodes_h_l355_c7_ac04 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l355_c7_ac04_cond,
n16_high_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue,
n16_high_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse,
n16_high_MUX_uxn_opcodes_h_l355_c7_ac04_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ac04
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ac04 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ac04_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ac04_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ac04
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ac04 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ac04_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ac04_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ac04
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ac04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ac04_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ac04_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l355_c7_ac04
result_u8_value_MUX_uxn_opcodes_h_l355_c7_ac04 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l355_c7_ac04_cond,
result_u8_value_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l355_c7_ac04_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ac04
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ac04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ac04_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ac04_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l359_c11_5690
BIN_OP_EQ_uxn_opcodes_h_l359_c11_5690 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l359_c11_5690_left,
BIN_OP_EQ_uxn_opcodes_h_l359_c11_5690_right,
BIN_OP_EQ_uxn_opcodes_h_l359_c11_5690_return_output);

-- n16_low_MUX_uxn_opcodes_h_l359_c7_d3ca
n16_low_MUX_uxn_opcodes_h_l359_c7_d3ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_cond,
n16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_iftrue,
n16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_iffalse,
n16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output);

-- t16_low_MUX_uxn_opcodes_h_l359_c7_d3ca
t16_low_MUX_uxn_opcodes_h_l359_c7_d3ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_cond,
t16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_iftrue,
t16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_iffalse,
t16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output);

-- n16_high_MUX_uxn_opcodes_h_l359_c7_d3ca
n16_high_MUX_uxn_opcodes_h_l359_c7_d3ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l359_c7_d3ca_cond,
n16_high_MUX_uxn_opcodes_h_l359_c7_d3ca_iftrue,
n16_high_MUX_uxn_opcodes_h_l359_c7_d3ca_iffalse,
n16_high_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_d3ca
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_d3ca : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_d3ca_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_d3ca_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_d3ca_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_d3ca
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_d3ca : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_d3ca_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_d3ca_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_d3ca_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_d3ca
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_d3ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_d3ca_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_d3ca_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_d3ca_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l359_c7_d3ca
result_u8_value_MUX_uxn_opcodes_h_l359_c7_d3ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l359_c7_d3ca_cond,
result_u8_value_MUX_uxn_opcodes_h_l359_c7_d3ca_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l359_c7_d3ca_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_d3ca
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_d3ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_d3ca_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_d3ca_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_d3ca_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l363_c11_7991
BIN_OP_EQ_uxn_opcodes_h_l363_c11_7991 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l363_c11_7991_left,
BIN_OP_EQ_uxn_opcodes_h_l363_c11_7991_right,
BIN_OP_EQ_uxn_opcodes_h_l363_c11_7991_return_output);

-- n16_low_MUX_uxn_opcodes_h_l363_c7_552f
n16_low_MUX_uxn_opcodes_h_l363_c7_552f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l363_c7_552f_cond,
n16_low_MUX_uxn_opcodes_h_l363_c7_552f_iftrue,
n16_low_MUX_uxn_opcodes_h_l363_c7_552f_iffalse,
n16_low_MUX_uxn_opcodes_h_l363_c7_552f_return_output);

-- n16_high_MUX_uxn_opcodes_h_l363_c7_552f
n16_high_MUX_uxn_opcodes_h_l363_c7_552f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l363_c7_552f_cond,
n16_high_MUX_uxn_opcodes_h_l363_c7_552f_iftrue,
n16_high_MUX_uxn_opcodes_h_l363_c7_552f_iffalse,
n16_high_MUX_uxn_opcodes_h_l363_c7_552f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_552f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_552f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_552f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_552f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_552f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_552f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_552f
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_552f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_552f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_552f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_552f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_552f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_552f
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_552f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_552f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_552f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_552f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_552f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l363_c7_552f
result_u8_value_MUX_uxn_opcodes_h_l363_c7_552f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l363_c7_552f_cond,
result_u8_value_MUX_uxn_opcodes_h_l363_c7_552f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l363_c7_552f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l363_c7_552f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_552f
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_552f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_552f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_552f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_552f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_552f_return_output);

-- sp_relative_shift_uxn_opcodes_h_l365_c30_3700
sp_relative_shift_uxn_opcodes_h_l365_c30_3700 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l365_c30_3700_ins,
sp_relative_shift_uxn_opcodes_h_l365_c30_3700_x,
sp_relative_shift_uxn_opcodes_h_l365_c30_3700_y,
sp_relative_shift_uxn_opcodes_h_l365_c30_3700_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l370_c11_9bfe
BIN_OP_EQ_uxn_opcodes_h_l370_c11_9bfe : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l370_c11_9bfe_left,
BIN_OP_EQ_uxn_opcodes_h_l370_c11_9bfe_right,
BIN_OP_EQ_uxn_opcodes_h_l370_c11_9bfe_return_output);

-- n16_low_MUX_uxn_opcodes_h_l370_c7_ea33
n16_low_MUX_uxn_opcodes_h_l370_c7_ea33 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l370_c7_ea33_cond,
n16_low_MUX_uxn_opcodes_h_l370_c7_ea33_iftrue,
n16_low_MUX_uxn_opcodes_h_l370_c7_ea33_iffalse,
n16_low_MUX_uxn_opcodes_h_l370_c7_ea33_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_ea33
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_ea33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_ea33_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_ea33_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_ea33_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_ea33_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_ea33
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_ea33 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_ea33_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_ea33_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_ea33_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_ea33_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_ea33
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_ea33 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_ea33_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_ea33_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_ea33_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_ea33_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l370_c7_ea33
result_u8_value_MUX_uxn_opcodes_h_l370_c7_ea33 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l370_c7_ea33_cond,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_ea33_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_ea33_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_ea33_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l376_c11_dcfc
BIN_OP_EQ_uxn_opcodes_h_l376_c11_dcfc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l376_c11_dcfc_left,
BIN_OP_EQ_uxn_opcodes_h_l376_c11_dcfc_right,
BIN_OP_EQ_uxn_opcodes_h_l376_c11_dcfc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l376_c7_f5be
result_u8_value_MUX_uxn_opcodes_h_l376_c7_f5be : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l376_c7_f5be_cond,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_f5be_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_f5be_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_f5be_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_f5be
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_f5be : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_f5be_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_f5be_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_f5be_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_f5be_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_f5be
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_f5be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_f5be_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_f5be_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_f5be_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_f5be_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l380_c11_c6da
BIN_OP_EQ_uxn_opcodes_h_l380_c11_c6da : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l380_c11_c6da_left,
BIN_OP_EQ_uxn_opcodes_h_l380_c11_c6da_right,
BIN_OP_EQ_uxn_opcodes_h_l380_c11_c6da_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l380_c7_e042
result_u8_value_MUX_uxn_opcodes_h_l380_c7_e042 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l380_c7_e042_cond,
result_u8_value_MUX_uxn_opcodes_h_l380_c7_e042_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l380_c7_e042_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l380_c7_e042_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e042
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e042 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e042_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e042_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e042_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e042_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e042
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e042 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e042_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e042_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e042_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e042_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l384_c11_82e7
BIN_OP_EQ_uxn_opcodes_h_l384_c11_82e7 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l384_c11_82e7_left,
BIN_OP_EQ_uxn_opcodes_h_l384_c11_82e7_right,
BIN_OP_EQ_uxn_opcodes_h_l384_c11_82e7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l384_c7_8eda
result_u8_value_MUX_uxn_opcodes_h_l384_c7_8eda : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l384_c7_8eda_cond,
result_u8_value_MUX_uxn_opcodes_h_l384_c7_8eda_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l384_c7_8eda_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l384_c7_8eda_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_8eda
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_8eda : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_8eda_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_8eda_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_8eda_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_8eda_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_8eda
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_8eda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_8eda_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_8eda_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_8eda_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_8eda_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l388_c11_87e8
BIN_OP_EQ_uxn_opcodes_h_l388_c11_87e8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l388_c11_87e8_left,
BIN_OP_EQ_uxn_opcodes_h_l388_c11_87e8_right,
BIN_OP_EQ_uxn_opcodes_h_l388_c11_87e8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l388_c7_87ae
result_u8_value_MUX_uxn_opcodes_h_l388_c7_87ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l388_c7_87ae_cond,
result_u8_value_MUX_uxn_opcodes_h_l388_c7_87ae_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l388_c7_87ae_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l388_c7_87ae_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_87ae
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_87ae : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_87ae_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_87ae_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_87ae_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_87ae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_87ae
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_87ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_87ae_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_87ae_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_87ae_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_87ae_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l339_c6_01e8_return_output,
 t16_high_MUX_uxn_opcodes_h_l339_c2_8d56_return_output,
 n16_low_MUX_uxn_opcodes_h_l339_c2_8d56_return_output,
 t16_low_MUX_uxn_opcodes_h_l339_c2_8d56_return_output,
 n16_high_MUX_uxn_opcodes_h_l339_c2_8d56_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8d56_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8d56_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8d56_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l339_c2_8d56_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8d56_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8d56_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8d56_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8d56_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8d56_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l352_c11_0263_return_output,
 t16_high_MUX_uxn_opcodes_h_l352_c7_d66e_return_output,
 n16_low_MUX_uxn_opcodes_h_l352_c7_d66e_return_output,
 t16_low_MUX_uxn_opcodes_h_l352_c7_d66e_return_output,
 n16_high_MUX_uxn_opcodes_h_l352_c7_d66e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d66e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d66e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d66e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l352_c7_d66e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d66e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l355_c11_ada9_return_output,
 t16_high_MUX_uxn_opcodes_h_l355_c7_ac04_return_output,
 n16_low_MUX_uxn_opcodes_h_l355_c7_ac04_return_output,
 t16_low_MUX_uxn_opcodes_h_l355_c7_ac04_return_output,
 n16_high_MUX_uxn_opcodes_h_l355_c7_ac04_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ac04_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ac04_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ac04_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l355_c7_ac04_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ac04_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l359_c11_5690_return_output,
 n16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output,
 t16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output,
 n16_high_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l363_c11_7991_return_output,
 n16_low_MUX_uxn_opcodes_h_l363_c7_552f_return_output,
 n16_high_MUX_uxn_opcodes_h_l363_c7_552f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_552f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_552f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_552f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l363_c7_552f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_552f_return_output,
 sp_relative_shift_uxn_opcodes_h_l365_c30_3700_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l370_c11_9bfe_return_output,
 n16_low_MUX_uxn_opcodes_h_l370_c7_ea33_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_ea33_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_ea33_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_ea33_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l370_c7_ea33_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l376_c11_dcfc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l376_c7_f5be_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_f5be_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_f5be_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l380_c11_c6da_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l380_c7_e042_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e042_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e042_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l384_c11_82e7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l384_c7_8eda_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_8eda_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_8eda_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l388_c11_87e8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l388_c7_87ae_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_87ae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_87ae_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_01e8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_01e8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_01e8_return_output : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_d66e_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_8d56_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_8d56_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_d66e_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_8d56_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_8d56_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_d66e_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_8d56_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_8d56_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_d66e_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_8d56_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_8d56_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d66e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8d56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8d56_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l339_c2_8d56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8d56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8d56_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l339_c2_8d56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8d56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8d56_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_d66e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_8d56_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_8d56_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d66e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8d56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8d56_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l344_c3_799b : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d66e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8d56_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8d56_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l339_c2_8d56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8d56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8d56_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l349_c3_7c08 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d66e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8d56_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8d56_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l339_c2_8d56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8d56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8d56_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0263_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0263_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0263_return_output : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_ac04_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_d66e_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_ac04_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_d66e_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_ac04_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_d66e_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_ac04_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_d66e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l353_c3_8c42 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ac04_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d66e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ac04_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d66e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ac04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d66e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_ac04_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_d66e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ac04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d66e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_ada9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_ada9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_ada9_return_output : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_ac04_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_ac04_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_ac04_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_ac04_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_b6b4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ac04_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ac04_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ac04_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_ac04_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ac04_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_5690_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_5690_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_5690_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_552f_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_d3ca_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_d3ca_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_552f_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_d3ca_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_d3ca_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l361_c3_bb56 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_d3ca_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_552f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_d3ca_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_d3ca_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_d3ca_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_552f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_d3ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_d3ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_d3ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_552f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_d3ca_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_d3ca_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_d3ca_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_552f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_d3ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_d3ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_d3ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_552f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_d3ca_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_7991_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_7991_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_7991_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_552f_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_552f_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_ea33_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_552f_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_552f_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_552f_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_552f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_552f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_3613 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_552f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_ea33_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_552f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_552f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_552f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_ea33_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_552f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_552f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_552f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_552f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_552f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_552f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_ea33_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_552f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_552f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_552f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_ea33_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_552f_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_3700_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_3700_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_3700_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_3700_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_9bfe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_9bfe_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_9bfe_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_ea33_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_ea33_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_ea33_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_ea33_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_ea33_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_f5be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_ea33_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_ea33_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l372_c3_7d6f : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_ea33_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_ea33_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_ea33_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l373_c3_db89 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_ea33_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_f5be_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_ea33_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_ea33_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_ea33_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_f5be_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_ea33_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_dcfc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_dcfc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_dcfc_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_f5be_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_f5be_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_e042_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_f5be_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_f5be_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_01bd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_f5be_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e042_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_f5be_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_f5be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_f5be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e042_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_f5be_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_c6da_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_c6da_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_c6da_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_e042_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_e042_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_8eda_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_e042_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e042_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_8581 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e042_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_8eda_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e042_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e042_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e042_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_8eda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e042_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_82e7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_82e7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_82e7_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_8eda_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_8eda_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_87ae_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_8eda_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_8eda_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_eb0e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_8eda_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_87ae_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_8eda_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_8eda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_8eda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_87ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_8eda_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_87e8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_87e8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_87e8_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_87ae_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_87ae_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_87ae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_87ae_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_4655 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_87ae_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l388_c7_87ae_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_87ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_87ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_87ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_87ae_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_efad_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l355_l370_l359_l352_DUPLICATE_0ba7_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l355_l359_l352_l363_DUPLICATE_0860_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l363_l359_l388_l355_l384_l352_l380_l376_DUPLICATE_cc6a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l394_l335_DUPLICATE_bd3e_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_82e7_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_8581 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e042_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_8581;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_3700_y := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_5690_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_4655 := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_87ae_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_4655;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l349_c3_7c08 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l349_c3_7c08;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_9bfe_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l353_c3_8c42 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l353_c3_8c42;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_01bd := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_f5be_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_01bd;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_3613 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_552f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_3613;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0263_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_c6da_right := to_unsigned(7, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_b6b4 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_b6b4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l373_c3_db89 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_ea33_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l373_c3_db89;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l344_c3_799b := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l344_c3_799b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_dcfc_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_87e8_right := to_unsigned(9, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l372_c3_7d6f := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_ea33_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l372_c3_7d6f;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_87ae_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_552f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_01e8_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l361_c3_bb56 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_d3ca_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l361_c3_bb56;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_ada9_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_eb0e := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_8eda_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_eb0e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_7991_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_3700_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));

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
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_3700_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_d3ca_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_552f_iffalse := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_e042_iftrue := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_87ae_iftrue := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_552f_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_ea33_iffalse := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_f5be_iftrue := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_8eda_iftrue := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_01e8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0263_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_ada9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_5690_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_7991_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_9bfe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_dcfc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_c6da_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_82e7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_87e8_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_552f_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_ea33_iftrue := VAR_previous_stack_read;
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue := VAR_previous_stack_read;
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_ea33_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse := t16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_552f_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_iffalse := t16_low;
     -- BIN_OP_EQ[uxn_opcodes_h_l384_c11_82e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l384_c11_82e7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_82e7_left;
     BIN_OP_EQ_uxn_opcodes_h_l384_c11_82e7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_82e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_82e7_return_output := BIN_OP_EQ_uxn_opcodes_h_l384_c11_82e7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l355_c11_ada9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l355_c11_ada9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_ada9_left;
     BIN_OP_EQ_uxn_opcodes_h_l355_c11_ada9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_ada9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_ada9_return_output := BIN_OP_EQ_uxn_opcodes_h_l355_c11_ada9_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l339_c2_8d56] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l339_c2_8d56_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_efad LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_efad_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l376_c11_dcfc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l376_c11_dcfc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_dcfc_left;
     BIN_OP_EQ_uxn_opcodes_h_l376_c11_dcfc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_dcfc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_dcfc_return_output := BIN_OP_EQ_uxn_opcodes_h_l376_c11_dcfc_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l363_l359_l388_l355_l384_l352_l380_l376_DUPLICATE_cc6a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l363_l359_l388_l355_l384_l352_l380_l376_DUPLICATE_cc6a_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l352_c11_0263] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l352_c11_0263_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0263_left;
     BIN_OP_EQ_uxn_opcodes_h_l352_c11_0263_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0263_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0263_return_output := BIN_OP_EQ_uxn_opcodes_h_l352_c11_0263_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l339_c2_8d56] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l339_c2_8d56_return_output := result.is_ram_write;

     -- sp_relative_shift[uxn_opcodes_h_l365_c30_3700] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l365_c30_3700_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_3700_ins;
     sp_relative_shift_uxn_opcodes_h_l365_c30_3700_x <= VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_3700_x;
     sp_relative_shift_uxn_opcodes_h_l365_c30_3700_y <= VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_3700_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_3700_return_output := sp_relative_shift_uxn_opcodes_h_l365_c30_3700_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l380_c11_c6da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l380_c11_c6da_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_c6da_left;
     BIN_OP_EQ_uxn_opcodes_h_l380_c11_c6da_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_c6da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_c6da_return_output := BIN_OP_EQ_uxn_opcodes_h_l380_c11_c6da_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l359_c11_5690] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l359_c11_5690_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_5690_left;
     BIN_OP_EQ_uxn_opcodes_h_l359_c11_5690_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_5690_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_5690_return_output := BIN_OP_EQ_uxn_opcodes_h_l359_c11_5690_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l363_c11_7991] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l363_c11_7991_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_7991_left;
     BIN_OP_EQ_uxn_opcodes_h_l363_c11_7991_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_7991_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_7991_return_output := BIN_OP_EQ_uxn_opcodes_h_l363_c11_7991_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l388_c7_87ae] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l388_c7_87ae_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l370_c11_9bfe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l370_c11_9bfe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_9bfe_left;
     BIN_OP_EQ_uxn_opcodes_h_l370_c11_9bfe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_9bfe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_9bfe_return_output := BIN_OP_EQ_uxn_opcodes_h_l370_c11_9bfe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l388_c11_87e8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l388_c11_87e8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_87e8_left;
     BIN_OP_EQ_uxn_opcodes_h_l388_c11_87e8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_87e8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_87e8_return_output := BIN_OP_EQ_uxn_opcodes_h_l388_c11_87e8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l355_l359_l352_l363_DUPLICATE_0860 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l355_l359_l352_l363_DUPLICATE_0860_return_output := result.is_stack_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l355_l370_l359_l352_DUPLICATE_0ba7 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l355_l370_l359_l352_DUPLICATE_0ba7_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l339_c6_01e8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l339_c6_01e8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_01e8_left;
     BIN_OP_EQ_uxn_opcodes_h_l339_c6_01e8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_01e8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_01e8_return_output := BIN_OP_EQ_uxn_opcodes_h_l339_c6_01e8_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l339_c2_8d56] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l339_c2_8d56_return_output := result.is_vram_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l339_c2_8d56] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l339_c2_8d56_return_output := result.is_pc_updated;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_8d56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_01e8_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_8d56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_01e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8d56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_01e8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8d56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_01e8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8d56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_01e8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8d56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_01e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8d56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_01e8_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8d56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_01e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8d56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_01e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8d56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_01e8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_8d56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_01e8_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_8d56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_01e8_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_8d56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_01e8_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_d66e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0263_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_d66e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0263_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d66e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0263_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d66e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0263_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d66e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0263_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d66e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0263_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_d66e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0263_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_d66e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0263_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_d66e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0263_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_ac04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_ada9_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_ac04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_ada9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ac04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_ada9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ac04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_ada9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ac04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_ada9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ac04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_ada9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_ac04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_ada9_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_ac04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_ada9_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_ac04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_ada9_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_d3ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_5690_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_5690_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_d3ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_5690_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_d3ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_5690_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_d3ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_5690_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_d3ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_5690_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_d3ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_5690_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_5690_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_552f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_7991_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_552f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_7991_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_552f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_7991_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_552f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_7991_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_552f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_7991_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_552f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_7991_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_552f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_7991_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_ea33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_9bfe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_ea33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_9bfe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_ea33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_9bfe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_ea33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_9bfe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_ea33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_9bfe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_f5be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_dcfc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_f5be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_dcfc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_f5be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_dcfc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e042_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_c6da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e042_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_c6da_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_e042_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_c6da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_8eda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_82e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_8eda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_82e7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_8eda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_82e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_87ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_87e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_87ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_87e8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_87ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_87e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l355_l370_l359_l352_DUPLICATE_0ba7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l355_l370_l359_l352_DUPLICATE_0ba7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_d3ca_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l355_l370_l359_l352_DUPLICATE_0ba7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_ea33_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l355_l370_l359_l352_DUPLICATE_0ba7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l363_l359_l388_l355_l384_l352_l380_l376_DUPLICATE_cc6a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l363_l359_l388_l355_l384_l352_l380_l376_DUPLICATE_cc6a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_d3ca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l363_l359_l388_l355_l384_l352_l380_l376_DUPLICATE_cc6a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_552f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l363_l359_l388_l355_l384_l352_l380_l376_DUPLICATE_cc6a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_ea33_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l363_l359_l388_l355_l384_l352_l380_l376_DUPLICATE_cc6a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_f5be_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l363_l359_l388_l355_l384_l352_l380_l376_DUPLICATE_cc6a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e042_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l363_l359_l388_l355_l384_l352_l380_l376_DUPLICATE_cc6a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_8eda_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l363_l359_l388_l355_l384_l352_l380_l376_DUPLICATE_cc6a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_87ae_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l363_l359_l388_l355_l384_l352_l380_l376_DUPLICATE_cc6a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l355_l359_l352_l363_DUPLICATE_0860_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l355_l359_l352_l363_DUPLICATE_0860_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_d3ca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l355_l359_l352_l363_DUPLICATE_0860_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_552f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l355_l359_l352_l363_DUPLICATE_0860_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_efad_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_efad_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_efad_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_d3ca_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_efad_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_87ae_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_efad_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l339_c2_8d56_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l339_c2_8d56_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l339_c2_8d56_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l339_c2_8d56_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_87ae_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l388_c7_87ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_552f_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_3700_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l339_c2_8d56] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8d56_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8d56_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8d56_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8d56_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l363_c7_552f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_552f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_552f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_552f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_552f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_552f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_552f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_552f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_552f_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l370_c7_ea33] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l370_c7_ea33_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_ea33_cond;
     n16_low_MUX_uxn_opcodes_h_l370_c7_ea33_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_ea33_iftrue;
     n16_low_MUX_uxn_opcodes_h_l370_c7_ea33_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_ea33_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_ea33_return_output := n16_low_MUX_uxn_opcodes_h_l370_c7_ea33_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l363_c7_552f] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l363_c7_552f_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_552f_cond;
     n16_high_MUX_uxn_opcodes_h_l363_c7_552f_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_552f_iftrue;
     n16_high_MUX_uxn_opcodes_h_l363_c7_552f_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_552f_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_552f_return_output := n16_high_MUX_uxn_opcodes_h_l363_c7_552f_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l339_c2_8d56] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8d56_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8d56_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8d56_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8d56_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l388_c7_87ae] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_87ae_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_87ae_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_87ae_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_87ae_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_87ae_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_87ae_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_87ae_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_87ae_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l359_c7_d3ca] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_cond;
     t16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_iftrue;
     t16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output := t16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l388_c7_87ae] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l388_c7_87ae_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_87ae_cond;
     result_u8_value_MUX_uxn_opcodes_h_l388_c7_87ae_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_87ae_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l388_c7_87ae_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_87ae_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_87ae_return_output := result_u8_value_MUX_uxn_opcodes_h_l388_c7_87ae_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l339_c2_8d56] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8d56_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8d56_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8d56_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8d56_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l355_c7_ac04] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l355_c7_ac04_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_ac04_cond;
     t16_high_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue;
     t16_high_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_ac04_return_output := t16_high_MUX_uxn_opcodes_h_l355_c7_ac04_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l388_c7_87ae] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_87ae_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_87ae_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_87ae_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_87ae_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_87ae_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_87ae_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_87ae_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_87ae_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l370_c7_ea33] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_ea33_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_ea33_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_ea33_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_ea33_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_ea33_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_ea33_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_ea33_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_ea33_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l339_c2_8d56] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8d56_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8d56_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8d56_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8d56_return_output;

     -- Submodule level 2
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_d3ca_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_552f_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_552f_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_ea33_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_8eda_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_87ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_d3ca_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_552f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_552f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_ea33_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_8eda_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_87ae_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_8eda_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_87ae_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_ac04_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l384_c7_8eda] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_8eda_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_8eda_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_8eda_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_8eda_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_8eda_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_8eda_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_8eda_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_8eda_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l359_c7_d3ca] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_d3ca_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_d3ca_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_d3ca_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_d3ca_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_d3ca_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_d3ca_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l359_c7_d3ca] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l359_c7_d3ca_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_d3ca_cond;
     n16_high_MUX_uxn_opcodes_h_l359_c7_d3ca_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_d3ca_iftrue;
     n16_high_MUX_uxn_opcodes_h_l359_c7_d3ca_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_d3ca_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output := n16_high_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l363_c7_552f] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l363_c7_552f_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_552f_cond;
     n16_low_MUX_uxn_opcodes_h_l363_c7_552f_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_552f_iftrue;
     n16_low_MUX_uxn_opcodes_h_l363_c7_552f_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_552f_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_552f_return_output := n16_low_MUX_uxn_opcodes_h_l363_c7_552f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l384_c7_8eda] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l384_c7_8eda_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_8eda_cond;
     result_u8_value_MUX_uxn_opcodes_h_l384_c7_8eda_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_8eda_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l384_c7_8eda_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_8eda_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_8eda_return_output := result_u8_value_MUX_uxn_opcodes_h_l384_c7_8eda_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l355_c7_ac04] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l355_c7_ac04_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_ac04_cond;
     t16_low_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue;
     t16_low_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_ac04_return_output := t16_low_MUX_uxn_opcodes_h_l355_c7_ac04_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l352_c7_d66e] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l352_c7_d66e_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_d66e_cond;
     t16_high_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue;
     t16_high_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_d66e_return_output := t16_high_MUX_uxn_opcodes_h_l352_c7_d66e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l363_c7_552f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_552f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_552f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_552f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_552f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_552f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_552f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_552f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_552f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l384_c7_8eda] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_8eda_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_8eda_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_8eda_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_8eda_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_8eda_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_8eda_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_8eda_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_8eda_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_552f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e042_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_8eda_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_d3ca_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_552f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e042_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_8eda_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_e042_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_8eda_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_d66e_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_ac04_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l359_c7_d3ca] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_cond;
     n16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_iftrue;
     n16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output := n16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l359_c7_d3ca] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_d3ca_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_d3ca_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_d3ca_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_d3ca_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_d3ca_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_d3ca_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l339_c2_8d56] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l339_c2_8d56_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_8d56_cond;
     t16_high_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue;
     t16_high_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_8d56_return_output := t16_high_MUX_uxn_opcodes_h_l339_c2_8d56_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l380_c7_e042] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e042_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e042_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e042_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e042_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e042_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e042_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e042_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e042_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l355_c7_ac04] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l355_c7_ac04_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_ac04_cond;
     n16_high_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue;
     n16_high_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_ac04_return_output := n16_high_MUX_uxn_opcodes_h_l355_c7_ac04_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l352_c7_d66e] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l352_c7_d66e_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_d66e_cond;
     t16_low_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue;
     t16_low_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_d66e_return_output := t16_low_MUX_uxn_opcodes_h_l352_c7_d66e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l355_c7_ac04] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ac04_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ac04_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ac04_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ac04_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l380_c7_e042] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l380_c7_e042_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_e042_cond;
     result_u8_value_MUX_uxn_opcodes_h_l380_c7_e042_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_e042_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l380_c7_e042_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_e042_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_e042_return_output := result_u8_value_MUX_uxn_opcodes_h_l380_c7_e042_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l380_c7_e042] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e042_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e042_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e042_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e042_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e042_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e042_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e042_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e042_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_ac04_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_f5be_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e042_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ac04_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_f5be_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e042_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_f5be_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_e042_return_output;
     REG_VAR_t16_high := VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_8d56_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_d66e_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l376_c7_f5be] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_f5be_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_f5be_cond;
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_f5be_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_f5be_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_f5be_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_f5be_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_f5be_return_output := result_u8_value_MUX_uxn_opcodes_h_l376_c7_f5be_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l376_c7_f5be] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_f5be_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_f5be_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_f5be_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_f5be_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_f5be_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_f5be_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_f5be_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_f5be_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l355_c7_ac04] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ac04_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ac04_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ac04_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ac04_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l376_c7_f5be] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_f5be_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_f5be_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_f5be_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_f5be_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_f5be_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_f5be_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_f5be_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_f5be_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l352_c7_d66e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d66e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d66e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d66e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d66e_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l355_c7_ac04] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l355_c7_ac04_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_ac04_cond;
     n16_low_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue;
     n16_low_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_ac04_return_output := n16_low_MUX_uxn_opcodes_h_l355_c7_ac04_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l352_c7_d66e] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l352_c7_d66e_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_d66e_cond;
     n16_high_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue;
     n16_high_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_d66e_return_output := n16_high_MUX_uxn_opcodes_h_l352_c7_d66e_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l339_c2_8d56] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l339_c2_8d56_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_8d56_cond;
     t16_low_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue;
     t16_low_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_8d56_return_output := t16_low_MUX_uxn_opcodes_h_l339_c2_8d56_return_output;

     -- Submodule level 5
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_d66e_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_ac04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_ea33_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_f5be_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d66e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ac04_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_ea33_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_f5be_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_ea33_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_f5be_return_output;
     REG_VAR_t16_low := VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_8d56_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l370_c7_ea33] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_ea33_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_ea33_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_ea33_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_ea33_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_ea33_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_ea33_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_ea33_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_ea33_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l339_c2_8d56] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8d56_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8d56_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8d56_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8d56_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l370_c7_ea33] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_ea33_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_ea33_cond;
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_ea33_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_ea33_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_ea33_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_ea33_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_ea33_return_output := result_u8_value_MUX_uxn_opcodes_h_l370_c7_ea33_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l339_c2_8d56] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l339_c2_8d56_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_8d56_cond;
     n16_high_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue;
     n16_high_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_8d56_return_output := n16_high_MUX_uxn_opcodes_h_l339_c2_8d56_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l352_c7_d66e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d66e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d66e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d66e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d66e_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l352_c7_d66e] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l352_c7_d66e_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_d66e_cond;
     n16_low_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue;
     n16_low_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_d66e_return_output := n16_low_MUX_uxn_opcodes_h_l352_c7_d66e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l370_c7_ea33] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_ea33_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_ea33_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_ea33_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_ea33_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_ea33_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_ea33_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_ea33_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_ea33_return_output;

     -- Submodule level 6
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_8d56_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_d66e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_552f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_ea33_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d66e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_552f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_ea33_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_552f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_ea33_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l363_c7_552f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l363_c7_552f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_552f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l363_c7_552f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_552f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l363_c7_552f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_552f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_552f_return_output := result_u8_value_MUX_uxn_opcodes_h_l363_c7_552f_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l339_c2_8d56] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l339_c2_8d56_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_8d56_cond;
     n16_low_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue;
     n16_low_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_8d56_return_output := n16_low_MUX_uxn_opcodes_h_l339_c2_8d56_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l363_c7_552f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_552f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_552f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_552f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_552f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_552f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_552f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_552f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_552f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l339_c2_8d56] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8d56_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8d56_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8d56_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8d56_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l363_c7_552f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_552f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_552f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_552f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_552f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_552f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_552f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_552f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_552f_return_output;

     -- Submodule level 7
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_8d56_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_d3ca_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_552f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_d3ca_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_552f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_d3ca_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_552f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l359_c7_d3ca] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_d3ca_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_d3ca_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_d3ca_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_d3ca_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_d3ca_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_d3ca_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l359_c7_d3ca] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l359_c7_d3ca_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_d3ca_cond;
     result_u8_value_MUX_uxn_opcodes_h_l359_c7_d3ca_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_d3ca_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l359_c7_d3ca_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_d3ca_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output := result_u8_value_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l359_c7_d3ca] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_d3ca_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_d3ca_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_d3ca_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_d3ca_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_d3ca_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_d3ca_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_d3ca_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l355_c7_ac04] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l355_c7_ac04_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_ac04_cond;
     result_u8_value_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_ac04_return_output := result_u8_value_MUX_uxn_opcodes_h_l355_c7_ac04_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l355_c7_ac04] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ac04_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ac04_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ac04_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ac04_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l355_c7_ac04] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ac04_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ac04_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ac04_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ac04_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ac04_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ac04_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ac04_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ac04_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_ac04_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l352_c7_d66e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d66e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d66e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d66e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d66e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l352_c7_d66e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l352_c7_d66e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_d66e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_d66e_return_output := result_u8_value_MUX_uxn_opcodes_h_l352_c7_d66e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l352_c7_d66e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d66e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d66e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d66e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d66e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d66e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d66e_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d66e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d66e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_d66e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l339_c2_8d56] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8d56_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8d56_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8d56_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8d56_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l339_c2_8d56] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l339_c2_8d56_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_8d56_cond;
     result_u8_value_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_8d56_return_output := result_u8_value_MUX_uxn_opcodes_h_l339_c2_8d56_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l339_c2_8d56] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8d56_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8d56_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8d56_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8d56_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8d56_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8d56_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l394_l335_DUPLICATE_bd3e LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l394_l335_DUPLICATE_bd3e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_188e(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8d56_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8d56_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8d56_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_8d56_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8d56_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8d56_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8d56_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8d56_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8d56_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l394_l335_DUPLICATE_bd3e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l394_l335_DUPLICATE_bd3e_return_output;
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
