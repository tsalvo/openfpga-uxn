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
-- BIN_OP_EQ[uxn_opcodes_h_l339_c6_1367]
signal BIN_OP_EQ_uxn_opcodes_h_l339_c6_1367_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l339_c6_1367_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l339_c6_1367_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l339_c2_5be8]
signal n16_low_MUX_uxn_opcodes_h_l339_c2_5be8_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l339_c2_5be8_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l339_c2_5be8]
signal n16_high_MUX_uxn_opcodes_h_l339_c2_5be8_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l339_c2_5be8_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l339_c2_5be8]
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_5be8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_5be8_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l339_c2_5be8]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5be8_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5be8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l339_c2_5be8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5be8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5be8_return_output : unsigned(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l339_c2_5be8]
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5be8_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5be8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l339_c2_5be8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5be8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5be8_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l339_c2_5be8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5be8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5be8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l339_c2_5be8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5be8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5be8_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l339_c2_5be8]
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5be8_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5be8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l339_c2_5be8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5be8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5be8_return_output : unsigned(0 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l339_c2_5be8]
signal t16_high_MUX_uxn_opcodes_h_l339_c2_5be8_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l339_c2_5be8_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l339_c2_5be8]
signal t16_low_MUX_uxn_opcodes_h_l339_c2_5be8_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l339_c2_5be8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l352_c11_a5fc]
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_a5fc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_a5fc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_a5fc_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l352_c7_008d]
signal n16_low_MUX_uxn_opcodes_h_l352_c7_008d_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l352_c7_008d_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l352_c7_008d_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l352_c7_008d_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l352_c7_008d]
signal n16_high_MUX_uxn_opcodes_h_l352_c7_008d_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l352_c7_008d_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l352_c7_008d_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l352_c7_008d_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l352_c7_008d]
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_008d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_008d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_008d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_008d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l352_c7_008d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_008d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_008d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_008d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_008d_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l352_c7_008d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_008d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_008d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_008d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_008d_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l352_c7_008d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_008d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_008d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_008d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_008d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l352_c7_008d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_008d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_008d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_008d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_008d_return_output : unsigned(0 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l352_c7_008d]
signal t16_high_MUX_uxn_opcodes_h_l352_c7_008d_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l352_c7_008d_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l352_c7_008d_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l352_c7_008d_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l352_c7_008d]
signal t16_low_MUX_uxn_opcodes_h_l352_c7_008d_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l352_c7_008d_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l352_c7_008d_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l352_c7_008d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l355_c11_a75f]
signal BIN_OP_EQ_uxn_opcodes_h_l355_c11_a75f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l355_c11_a75f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l355_c11_a75f_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l355_c7_4d9e]
signal n16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l355_c7_4d9e]
signal n16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l355_c7_4d9e]
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_4d9e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l355_c7_4d9e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4d9e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l355_c7_4d9e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4d9e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l355_c7_4d9e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4d9e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l355_c7_4d9e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4d9e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output : unsigned(0 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l355_c7_4d9e]
signal t16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l355_c7_4d9e]
signal t16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l359_c11_b3ca]
signal BIN_OP_EQ_uxn_opcodes_h_l359_c11_b3ca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l359_c11_b3ca_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l359_c11_b3ca_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l359_c7_2d2e]
signal n16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l359_c7_2d2e]
signal n16_high_MUX_uxn_opcodes_h_l359_c7_2d2e_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l359_c7_2d2e_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l359_c7_2d2e_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l359_c7_2d2e]
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d2e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d2e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d2e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l359_c7_2d2e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d2e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d2e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d2e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l359_c7_2d2e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d2e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d2e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d2e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l359_c7_2d2e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d2e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d2e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d2e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l359_c7_2d2e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d2e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d2e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d2e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l359_c7_2d2e]
signal t16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l363_c11_4a8c]
signal BIN_OP_EQ_uxn_opcodes_h_l363_c11_4a8c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l363_c11_4a8c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l363_c11_4a8c_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l363_c7_756c]
signal n16_low_MUX_uxn_opcodes_h_l363_c7_756c_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l363_c7_756c_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l363_c7_756c_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l363_c7_756c_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l363_c7_756c]
signal n16_high_MUX_uxn_opcodes_h_l363_c7_756c_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l363_c7_756c_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l363_c7_756c_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l363_c7_756c_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l363_c7_756c]
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_756c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_756c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_756c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_756c_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l363_c7_756c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_756c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_756c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_756c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_756c_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l363_c7_756c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_756c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_756c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_756c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_756c_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l363_c7_756c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_756c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_756c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_756c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_756c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l363_c7_756c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_756c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_756c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_756c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_756c_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l365_c30_e13c]
signal sp_relative_shift_uxn_opcodes_h_l365_c30_e13c_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l365_c30_e13c_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l365_c30_e13c_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l365_c30_e13c_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l370_c11_2ca2]
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_2ca2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_2ca2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_2ca2_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l370_c7_83d5]
signal n16_low_MUX_uxn_opcodes_h_l370_c7_83d5_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l370_c7_83d5_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l370_c7_83d5_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l370_c7_83d5_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l370_c7_83d5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_83d5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_83d5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_83d5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_83d5_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l370_c7_83d5]
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_83d5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_83d5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_83d5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_83d5_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l370_c7_83d5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_83d5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_83d5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_83d5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_83d5_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l370_c7_83d5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_83d5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_83d5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_83d5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_83d5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l376_c11_1c76]
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_1c76_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_1c76_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_1c76_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l376_c7_77de]
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_77de_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_77de_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_77de_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_77de_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l376_c7_77de]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_77de_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_77de_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_77de_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_77de_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l376_c7_77de]
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_77de_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_77de_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_77de_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_77de_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l380_c11_3781]
signal BIN_OP_EQ_uxn_opcodes_h_l380_c11_3781_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l380_c11_3781_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l380_c11_3781_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l380_c7_f659]
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_f659_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_f659_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_f659_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_f659_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l380_c7_f659]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f659_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f659_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f659_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f659_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l380_c7_f659]
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f659_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f659_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f659_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f659_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l384_c11_a867]
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_a867_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_a867_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_a867_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l384_c7_06c7]
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_06c7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_06c7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_06c7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_06c7_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l384_c7_06c7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_06c7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_06c7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_06c7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_06c7_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l384_c7_06c7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_06c7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_06c7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_06c7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_06c7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l388_c11_e31f]
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_e31f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_e31f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_e31f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l388_c7_58ec]
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_58ec_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_58ec_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_58ec_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_58ec_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l388_c7_58ec]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_58ec_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_58ec_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_58ec_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_58ec_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l388_c7_58ec]
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_58ec_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_58ec_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_58ec_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_58ec_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l339_c6_1367
BIN_OP_EQ_uxn_opcodes_h_l339_c6_1367 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l339_c6_1367_left,
BIN_OP_EQ_uxn_opcodes_h_l339_c6_1367_right,
BIN_OP_EQ_uxn_opcodes_h_l339_c6_1367_return_output);

-- n16_low_MUX_uxn_opcodes_h_l339_c2_5be8
n16_low_MUX_uxn_opcodes_h_l339_c2_5be8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l339_c2_5be8_cond,
n16_low_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue,
n16_low_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse,
n16_low_MUX_uxn_opcodes_h_l339_c2_5be8_return_output);

-- n16_high_MUX_uxn_opcodes_h_l339_c2_5be8
n16_high_MUX_uxn_opcodes_h_l339_c2_5be8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l339_c2_5be8_cond,
n16_high_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue,
n16_high_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse,
n16_high_MUX_uxn_opcodes_h_l339_c2_5be8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l339_c2_5be8
result_u8_value_MUX_uxn_opcodes_h_l339_c2_5be8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l339_c2_5be8_cond,
result_u8_value_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l339_c2_5be8_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5be8
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5be8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5be8_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5be8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5be8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5be8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5be8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5be8_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5be8
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5be8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5be8_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5be8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5be8
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5be8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5be8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5be8_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5be8
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5be8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5be8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5be8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5be8
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5be8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5be8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5be8_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5be8
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5be8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5be8_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5be8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5be8
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5be8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5be8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5be8_return_output);

-- t16_high_MUX_uxn_opcodes_h_l339_c2_5be8
t16_high_MUX_uxn_opcodes_h_l339_c2_5be8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l339_c2_5be8_cond,
t16_high_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue,
t16_high_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse,
t16_high_MUX_uxn_opcodes_h_l339_c2_5be8_return_output);

-- t16_low_MUX_uxn_opcodes_h_l339_c2_5be8
t16_low_MUX_uxn_opcodes_h_l339_c2_5be8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l339_c2_5be8_cond,
t16_low_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue,
t16_low_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse,
t16_low_MUX_uxn_opcodes_h_l339_c2_5be8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l352_c11_a5fc
BIN_OP_EQ_uxn_opcodes_h_l352_c11_a5fc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l352_c11_a5fc_left,
BIN_OP_EQ_uxn_opcodes_h_l352_c11_a5fc_right,
BIN_OP_EQ_uxn_opcodes_h_l352_c11_a5fc_return_output);

-- n16_low_MUX_uxn_opcodes_h_l352_c7_008d
n16_low_MUX_uxn_opcodes_h_l352_c7_008d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l352_c7_008d_cond,
n16_low_MUX_uxn_opcodes_h_l352_c7_008d_iftrue,
n16_low_MUX_uxn_opcodes_h_l352_c7_008d_iffalse,
n16_low_MUX_uxn_opcodes_h_l352_c7_008d_return_output);

-- n16_high_MUX_uxn_opcodes_h_l352_c7_008d
n16_high_MUX_uxn_opcodes_h_l352_c7_008d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l352_c7_008d_cond,
n16_high_MUX_uxn_opcodes_h_l352_c7_008d_iftrue,
n16_high_MUX_uxn_opcodes_h_l352_c7_008d_iffalse,
n16_high_MUX_uxn_opcodes_h_l352_c7_008d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l352_c7_008d
result_u8_value_MUX_uxn_opcodes_h_l352_c7_008d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l352_c7_008d_cond,
result_u8_value_MUX_uxn_opcodes_h_l352_c7_008d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l352_c7_008d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l352_c7_008d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_008d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_008d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_008d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_008d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_008d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_008d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_008d
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_008d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_008d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_008d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_008d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_008d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_008d
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_008d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_008d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_008d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_008d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_008d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_008d
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_008d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_008d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_008d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_008d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_008d_return_output);

-- t16_high_MUX_uxn_opcodes_h_l352_c7_008d
t16_high_MUX_uxn_opcodes_h_l352_c7_008d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l352_c7_008d_cond,
t16_high_MUX_uxn_opcodes_h_l352_c7_008d_iftrue,
t16_high_MUX_uxn_opcodes_h_l352_c7_008d_iffalse,
t16_high_MUX_uxn_opcodes_h_l352_c7_008d_return_output);

-- t16_low_MUX_uxn_opcodes_h_l352_c7_008d
t16_low_MUX_uxn_opcodes_h_l352_c7_008d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l352_c7_008d_cond,
t16_low_MUX_uxn_opcodes_h_l352_c7_008d_iftrue,
t16_low_MUX_uxn_opcodes_h_l352_c7_008d_iffalse,
t16_low_MUX_uxn_opcodes_h_l352_c7_008d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l355_c11_a75f
BIN_OP_EQ_uxn_opcodes_h_l355_c11_a75f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l355_c11_a75f_left,
BIN_OP_EQ_uxn_opcodes_h_l355_c11_a75f_right,
BIN_OP_EQ_uxn_opcodes_h_l355_c11_a75f_return_output);

-- n16_low_MUX_uxn_opcodes_h_l355_c7_4d9e
n16_low_MUX_uxn_opcodes_h_l355_c7_4d9e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_cond,
n16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue,
n16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse,
n16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output);

-- n16_high_MUX_uxn_opcodes_h_l355_c7_4d9e
n16_high_MUX_uxn_opcodes_h_l355_c7_4d9e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_cond,
n16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue,
n16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse,
n16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l355_c7_4d9e
result_u8_value_MUX_uxn_opcodes_h_l355_c7_4d9e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l355_c7_4d9e_cond,
result_u8_value_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4d9e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4d9e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4d9e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4d9e
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4d9e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4d9e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4d9e
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4d9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4d9e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4d9e
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4d9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4d9e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output);

-- t16_high_MUX_uxn_opcodes_h_l355_c7_4d9e
t16_high_MUX_uxn_opcodes_h_l355_c7_4d9e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_cond,
t16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue,
t16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse,
t16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output);

-- t16_low_MUX_uxn_opcodes_h_l355_c7_4d9e
t16_low_MUX_uxn_opcodes_h_l355_c7_4d9e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_cond,
t16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue,
t16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse,
t16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l359_c11_b3ca
BIN_OP_EQ_uxn_opcodes_h_l359_c11_b3ca : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l359_c11_b3ca_left,
BIN_OP_EQ_uxn_opcodes_h_l359_c11_b3ca_right,
BIN_OP_EQ_uxn_opcodes_h_l359_c11_b3ca_return_output);

-- n16_low_MUX_uxn_opcodes_h_l359_c7_2d2e
n16_low_MUX_uxn_opcodes_h_l359_c7_2d2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_cond,
n16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_iftrue,
n16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_iffalse,
n16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output);

-- n16_high_MUX_uxn_opcodes_h_l359_c7_2d2e
n16_high_MUX_uxn_opcodes_h_l359_c7_2d2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l359_c7_2d2e_cond,
n16_high_MUX_uxn_opcodes_h_l359_c7_2d2e_iftrue,
n16_high_MUX_uxn_opcodes_h_l359_c7_2d2e_iffalse,
n16_high_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d2e
result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d2e_cond,
result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d2e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d2e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d2e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d2e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d2e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d2e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d2e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d2e
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d2e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d2e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d2e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d2e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d2e
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d2e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d2e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d2e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d2e
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d2e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d2e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d2e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output);

-- t16_low_MUX_uxn_opcodes_h_l359_c7_2d2e
t16_low_MUX_uxn_opcodes_h_l359_c7_2d2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_cond,
t16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_iftrue,
t16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_iffalse,
t16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l363_c11_4a8c
BIN_OP_EQ_uxn_opcodes_h_l363_c11_4a8c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l363_c11_4a8c_left,
BIN_OP_EQ_uxn_opcodes_h_l363_c11_4a8c_right,
BIN_OP_EQ_uxn_opcodes_h_l363_c11_4a8c_return_output);

-- n16_low_MUX_uxn_opcodes_h_l363_c7_756c
n16_low_MUX_uxn_opcodes_h_l363_c7_756c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l363_c7_756c_cond,
n16_low_MUX_uxn_opcodes_h_l363_c7_756c_iftrue,
n16_low_MUX_uxn_opcodes_h_l363_c7_756c_iffalse,
n16_low_MUX_uxn_opcodes_h_l363_c7_756c_return_output);

-- n16_high_MUX_uxn_opcodes_h_l363_c7_756c
n16_high_MUX_uxn_opcodes_h_l363_c7_756c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l363_c7_756c_cond,
n16_high_MUX_uxn_opcodes_h_l363_c7_756c_iftrue,
n16_high_MUX_uxn_opcodes_h_l363_c7_756c_iffalse,
n16_high_MUX_uxn_opcodes_h_l363_c7_756c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l363_c7_756c
result_u8_value_MUX_uxn_opcodes_h_l363_c7_756c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l363_c7_756c_cond,
result_u8_value_MUX_uxn_opcodes_h_l363_c7_756c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l363_c7_756c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l363_c7_756c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_756c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_756c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_756c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_756c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_756c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_756c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_756c
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_756c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_756c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_756c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_756c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_756c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_756c
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_756c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_756c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_756c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_756c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_756c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_756c
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_756c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_756c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_756c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_756c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_756c_return_output);

-- sp_relative_shift_uxn_opcodes_h_l365_c30_e13c
sp_relative_shift_uxn_opcodes_h_l365_c30_e13c : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l365_c30_e13c_ins,
sp_relative_shift_uxn_opcodes_h_l365_c30_e13c_x,
sp_relative_shift_uxn_opcodes_h_l365_c30_e13c_y,
sp_relative_shift_uxn_opcodes_h_l365_c30_e13c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l370_c11_2ca2
BIN_OP_EQ_uxn_opcodes_h_l370_c11_2ca2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l370_c11_2ca2_left,
BIN_OP_EQ_uxn_opcodes_h_l370_c11_2ca2_right,
BIN_OP_EQ_uxn_opcodes_h_l370_c11_2ca2_return_output);

-- n16_low_MUX_uxn_opcodes_h_l370_c7_83d5
n16_low_MUX_uxn_opcodes_h_l370_c7_83d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l370_c7_83d5_cond,
n16_low_MUX_uxn_opcodes_h_l370_c7_83d5_iftrue,
n16_low_MUX_uxn_opcodes_h_l370_c7_83d5_iffalse,
n16_low_MUX_uxn_opcodes_h_l370_c7_83d5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_83d5
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_83d5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_83d5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_83d5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_83d5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_83d5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l370_c7_83d5
result_u8_value_MUX_uxn_opcodes_h_l370_c7_83d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l370_c7_83d5_cond,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_83d5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_83d5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_83d5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_83d5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_83d5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_83d5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_83d5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_83d5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_83d5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_83d5
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_83d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_83d5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_83d5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_83d5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_83d5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l376_c11_1c76
BIN_OP_EQ_uxn_opcodes_h_l376_c11_1c76 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l376_c11_1c76_left,
BIN_OP_EQ_uxn_opcodes_h_l376_c11_1c76_right,
BIN_OP_EQ_uxn_opcodes_h_l376_c11_1c76_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l376_c7_77de
result_u8_value_MUX_uxn_opcodes_h_l376_c7_77de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l376_c7_77de_cond,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_77de_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_77de_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_77de_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_77de
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_77de : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_77de_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_77de_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_77de_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_77de_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_77de
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_77de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_77de_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_77de_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_77de_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_77de_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l380_c11_3781
BIN_OP_EQ_uxn_opcodes_h_l380_c11_3781 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l380_c11_3781_left,
BIN_OP_EQ_uxn_opcodes_h_l380_c11_3781_right,
BIN_OP_EQ_uxn_opcodes_h_l380_c11_3781_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l380_c7_f659
result_u8_value_MUX_uxn_opcodes_h_l380_c7_f659 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l380_c7_f659_cond,
result_u8_value_MUX_uxn_opcodes_h_l380_c7_f659_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l380_c7_f659_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l380_c7_f659_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f659
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f659 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f659_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f659_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f659_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f659_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f659
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f659 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f659_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f659_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f659_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f659_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l384_c11_a867
BIN_OP_EQ_uxn_opcodes_h_l384_c11_a867 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l384_c11_a867_left,
BIN_OP_EQ_uxn_opcodes_h_l384_c11_a867_right,
BIN_OP_EQ_uxn_opcodes_h_l384_c11_a867_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l384_c7_06c7
result_u8_value_MUX_uxn_opcodes_h_l384_c7_06c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l384_c7_06c7_cond,
result_u8_value_MUX_uxn_opcodes_h_l384_c7_06c7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l384_c7_06c7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l384_c7_06c7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_06c7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_06c7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_06c7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_06c7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_06c7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_06c7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_06c7
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_06c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_06c7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_06c7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_06c7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_06c7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l388_c11_e31f
BIN_OP_EQ_uxn_opcodes_h_l388_c11_e31f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l388_c11_e31f_left,
BIN_OP_EQ_uxn_opcodes_h_l388_c11_e31f_right,
BIN_OP_EQ_uxn_opcodes_h_l388_c11_e31f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l388_c7_58ec
result_u8_value_MUX_uxn_opcodes_h_l388_c7_58ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l388_c7_58ec_cond,
result_u8_value_MUX_uxn_opcodes_h_l388_c7_58ec_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l388_c7_58ec_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l388_c7_58ec_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_58ec
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_58ec : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_58ec_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_58ec_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_58ec_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_58ec_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_58ec
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_58ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_58ec_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_58ec_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_58ec_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_58ec_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l339_c6_1367_return_output,
 n16_low_MUX_uxn_opcodes_h_l339_c2_5be8_return_output,
 n16_high_MUX_uxn_opcodes_h_l339_c2_5be8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l339_c2_5be8_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5be8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5be8_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5be8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5be8_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5be8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5be8_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5be8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5be8_return_output,
 t16_high_MUX_uxn_opcodes_h_l339_c2_5be8_return_output,
 t16_low_MUX_uxn_opcodes_h_l339_c2_5be8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l352_c11_a5fc_return_output,
 n16_low_MUX_uxn_opcodes_h_l352_c7_008d_return_output,
 n16_high_MUX_uxn_opcodes_h_l352_c7_008d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l352_c7_008d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_008d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_008d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_008d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_008d_return_output,
 t16_high_MUX_uxn_opcodes_h_l352_c7_008d_return_output,
 t16_low_MUX_uxn_opcodes_h_l352_c7_008d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l355_c11_a75f_return_output,
 n16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output,
 n16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output,
 t16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output,
 t16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l359_c11_b3ca_return_output,
 n16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output,
 n16_high_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output,
 t16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l363_c11_4a8c_return_output,
 n16_low_MUX_uxn_opcodes_h_l363_c7_756c_return_output,
 n16_high_MUX_uxn_opcodes_h_l363_c7_756c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l363_c7_756c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_756c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_756c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_756c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_756c_return_output,
 sp_relative_shift_uxn_opcodes_h_l365_c30_e13c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l370_c11_2ca2_return_output,
 n16_low_MUX_uxn_opcodes_h_l370_c7_83d5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_83d5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l370_c7_83d5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_83d5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_83d5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l376_c11_1c76_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l376_c7_77de_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_77de_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_77de_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l380_c11_3781_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l380_c7_f659_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f659_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f659_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l384_c11_a867_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l384_c7_06c7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_06c7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_06c7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l388_c11_e31f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l388_c7_58ec_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_58ec_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_58ec_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_1367_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_1367_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_1367_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_008d_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_5be8_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_5be8_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_008d_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_5be8_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_5be8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_008d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_5be8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_5be8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l339_c2_5be8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5be8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5be8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l349_c3_aeec : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_008d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5be8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5be8_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l339_c2_5be8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5be8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5be8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l344_c3_efbf : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_008d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5be8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5be8_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l339_c2_5be8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5be8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5be8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_008d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5be8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5be8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l339_c2_5be8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5be8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5be8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_008d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5be8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5be8_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_008d_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_5be8_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_5be8_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_008d_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_5be8_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_5be8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_a5fc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_a5fc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_a5fc_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_008d_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_008d_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_008d_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_008d_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_008d_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_008d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_008d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_008d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_008d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_008d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l353_c3_03fd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_008d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_008d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_008d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_008d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_008d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_008d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_008d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_008d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_008d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_008d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_008d_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_008d_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_008d_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_008d_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_008d_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_008d_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_008d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_a75f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_a75f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_a75f_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_4d9e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_a300 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4d9e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4d9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4d9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4d9e_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_b3ca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_b3ca_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_b3ca_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_756c_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_2d2e_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_2d2e_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_756c_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_2d2e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d2e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d2e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_756c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d2e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d2e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l361_c3_1cab : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d2e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_756c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d2e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d2e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d2e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_756c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_756c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_756c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d2e_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_4a8c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_4a8c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_4a8c_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_756c_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_756c_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_83d5_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_756c_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_756c_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_756c_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_756c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_756c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_756c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_83d5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_756c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_756c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_895a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_756c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_83d5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_756c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_756c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_756c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_83d5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_756c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_756c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_756c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_83d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_756c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_756c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_756c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_756c_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_e13c_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_e13c_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_e13c_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_e13c_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_2ca2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_2ca2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_2ca2_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_83d5_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_83d5_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_83d5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_83d5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l372_c3_766f : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_83d5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_83d5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_83d5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_83d5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_77de_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_83d5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_83d5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l373_c3_e8f7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_83d5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_77de_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_83d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_83d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_83d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_77de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_83d5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_1c76_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_1c76_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_1c76_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_77de_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_77de_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_f659_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_77de_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_77de_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_81f9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_77de_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f659_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_77de_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_77de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_77de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f659_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_77de_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_3781_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_3781_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_3781_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_f659_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_f659_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_06c7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_f659_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f659_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_de69 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f659_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_06c7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f659_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f659_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f659_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_06c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f659_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_a867_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_a867_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_a867_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_06c7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_06c7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_58ec_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_06c7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_06c7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_2200 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_06c7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_58ec_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_06c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_06c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_06c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_58ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_06c7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_e31f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_e31f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_e31f_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_58ec_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_58ec_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_58ec_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_58ec_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_d30b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_58ec_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l388_c7_58ec_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_58ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_58ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_58ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_58ec_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_47ea_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l352_l355_l370_l359_DUPLICATE_110c_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l370_l363_l359_l388_l355_l384_l352_l380_DUPLICATE_e895_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l363_l355_l359_DUPLICATE_8755_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l394_l335_DUPLICATE_18a6_return_output : opcode_result_t;
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
     VAR_result_sp_relative_shift_uxn_opcodes_h_l344_c3_efbf := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l344_c3_efbf;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_895a := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_756c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_895a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_2200 := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_06c7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_2200;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_d30b := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_58ec_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_d30b;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l372_c3_766f := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_83d5_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l372_c3_766f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_de69 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f659_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_de69;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_81f9 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_77de_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_81f9;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_2ca2_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_b3ca_right := to_unsigned(3, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_4a8c_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_58ec_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_e31f_right := to_unsigned(9, 4);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_a867_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l373_c3_e8f7 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_83d5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l373_c3_e8f7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_a75f_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_1c76_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l349_c3_aeec := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l349_c3_aeec;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_756c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_3781_right := to_unsigned(7, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_e13c_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_a5fc_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_a300 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_a300;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l353_c3_03fd := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_008d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l353_c3_03fd;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l361_c3_1cab := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d2e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l361_c3_1cab;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_1367_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_e13c_y := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));

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
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_e13c_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_008d_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_2d2e_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_756c_iffalse := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_f659_iftrue := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_58ec_iftrue := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_008d_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_756c_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_83d5_iffalse := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_77de_iftrue := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_06c7_iftrue := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_1367_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_a5fc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_a75f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_b3ca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_4a8c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_2ca2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_1c76_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_3781_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_a867_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_e31f_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_756c_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_83d5_iftrue := VAR_previous_stack_read;
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue := VAR_previous_stack_read;
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_83d5_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_008d_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse := t16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_756c_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_008d_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_iffalse := t16_low;
     -- BIN_OP_EQ[uxn_opcodes_h_l384_c11_a867] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l384_c11_a867_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_a867_left;
     BIN_OP_EQ_uxn_opcodes_h_l384_c11_a867_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_a867_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_a867_return_output := BIN_OP_EQ_uxn_opcodes_h_l384_c11_a867_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l339_c2_5be8] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l339_c2_5be8_return_output := result.is_vram_write;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l339_c2_5be8] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l339_c2_5be8_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l376_c11_1c76] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l376_c11_1c76_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_1c76_left;
     BIN_OP_EQ_uxn_opcodes_h_l376_c11_1c76_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_1c76_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_1c76_return_output := BIN_OP_EQ_uxn_opcodes_h_l376_c11_1c76_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l388_c11_e31f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l388_c11_e31f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_e31f_left;
     BIN_OP_EQ_uxn_opcodes_h_l388_c11_e31f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_e31f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_e31f_return_output := BIN_OP_EQ_uxn_opcodes_h_l388_c11_e31f_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l339_c2_5be8] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l339_c2_5be8_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l370_c11_2ca2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l370_c11_2ca2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_2ca2_left;
     BIN_OP_EQ_uxn_opcodes_h_l370_c11_2ca2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_2ca2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_2ca2_return_output := BIN_OP_EQ_uxn_opcodes_h_l370_c11_2ca2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l359_c11_b3ca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l359_c11_b3ca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_b3ca_left;
     BIN_OP_EQ_uxn_opcodes_h_l359_c11_b3ca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_b3ca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_b3ca_return_output := BIN_OP_EQ_uxn_opcodes_h_l359_c11_b3ca_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l370_l363_l359_l388_l355_l384_l352_l380_DUPLICATE_e895 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l370_l363_l359_l388_l355_l384_l352_l380_DUPLICATE_e895_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l363_c11_4a8c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l363_c11_4a8c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_4a8c_left;
     BIN_OP_EQ_uxn_opcodes_h_l363_c11_4a8c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_4a8c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_4a8c_return_output := BIN_OP_EQ_uxn_opcodes_h_l363_c11_4a8c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l380_c11_3781] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l380_c11_3781_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_3781_left;
     BIN_OP_EQ_uxn_opcodes_h_l380_c11_3781_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_3781_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_3781_return_output := BIN_OP_EQ_uxn_opcodes_h_l380_c11_3781_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l365_c30_e13c] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l365_c30_e13c_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_e13c_ins;
     sp_relative_shift_uxn_opcodes_h_l365_c30_e13c_x <= VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_e13c_x;
     sp_relative_shift_uxn_opcodes_h_l365_c30_e13c_y <= VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_e13c_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_e13c_return_output := sp_relative_shift_uxn_opcodes_h_l365_c30_e13c_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l339_c2_5be8] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l339_c2_5be8_return_output := result.is_pc_updated;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l388_c7_58ec] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l388_c7_58ec_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l355_c11_a75f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l355_c11_a75f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_a75f_left;
     BIN_OP_EQ_uxn_opcodes_h_l355_c11_a75f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_a75f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_a75f_return_output := BIN_OP_EQ_uxn_opcodes_h_l355_c11_a75f_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_47ea LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_47ea_return_output := result.u8_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l352_l355_l370_l359_DUPLICATE_110c LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l352_l355_l370_l359_DUPLICATE_110c_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l352_c11_a5fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l352_c11_a5fc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_a5fc_left;
     BIN_OP_EQ_uxn_opcodes_h_l352_c11_a5fc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_a5fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_a5fc_return_output := BIN_OP_EQ_uxn_opcodes_h_l352_c11_a5fc_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l363_l355_l359_DUPLICATE_8755 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l363_l355_l359_DUPLICATE_8755_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l339_c6_1367] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l339_c6_1367_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_1367_left;
     BIN_OP_EQ_uxn_opcodes_h_l339_c6_1367_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_1367_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_1367_return_output := BIN_OP_EQ_uxn_opcodes_h_l339_c6_1367_return_output;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_5be8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_1367_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_5be8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_1367_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5be8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_1367_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5be8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_1367_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5be8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_1367_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5be8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_1367_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5be8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_1367_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5be8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_1367_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5be8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_1367_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5be8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_1367_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_5be8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_1367_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_5be8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_1367_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_5be8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_1367_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_008d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_a5fc_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_008d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_a5fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_008d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_a5fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_008d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_a5fc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_008d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_a5fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_008d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_a5fc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_008d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_a5fc_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_008d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_a5fc_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_008d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_a5fc_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_a75f_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_a75f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4d9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_a75f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4d9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_a75f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4d9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_a75f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4d9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_a75f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_4d9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_a75f_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_a75f_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_a75f_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_2d2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_b3ca_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_b3ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_b3ca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_b3ca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_b3ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_b3ca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_b3ca_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_b3ca_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_756c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_4a8c_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_756c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_4a8c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_756c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_4a8c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_756c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_4a8c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_756c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_4a8c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_756c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_4a8c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_756c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_4a8c_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_83d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_2ca2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_83d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_2ca2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_83d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_2ca2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_83d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_2ca2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_83d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_2ca2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_77de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_1c76_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_77de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_1c76_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_77de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_1c76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f659_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_3781_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f659_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_3781_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_f659_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_3781_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_06c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_a867_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_06c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_a867_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_06c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_a867_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_58ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_e31f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_58ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_e31f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_58ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_e31f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_008d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l352_l355_l370_l359_DUPLICATE_110c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l352_l355_l370_l359_DUPLICATE_110c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d2e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l352_l355_l370_l359_DUPLICATE_110c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_83d5_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l352_l355_l370_l359_DUPLICATE_110c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_008d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l370_l363_l359_l388_l355_l384_l352_l380_DUPLICATE_e895_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l370_l363_l359_l388_l355_l384_l352_l380_DUPLICATE_e895_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l370_l363_l359_l388_l355_l384_l352_l380_DUPLICATE_e895_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_756c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l370_l363_l359_l388_l355_l384_l352_l380_DUPLICATE_e895_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_83d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l370_l363_l359_l388_l355_l384_l352_l380_DUPLICATE_e895_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_77de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l370_l363_l359_l388_l355_l384_l352_l380_DUPLICATE_e895_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f659_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l370_l363_l359_l388_l355_l384_l352_l380_DUPLICATE_e895_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_06c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l370_l363_l359_l388_l355_l384_l352_l380_DUPLICATE_e895_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_58ec_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l370_l363_l359_l388_l355_l384_l352_l380_DUPLICATE_e895_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_008d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l363_l355_l359_DUPLICATE_8755_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l363_l355_l359_DUPLICATE_8755_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l363_l355_l359_DUPLICATE_8755_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_756c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l363_l355_l359_DUPLICATE_8755_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_47ea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_008d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_47ea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_47ea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d2e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_47ea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_58ec_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_47ea_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l339_c2_5be8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l339_c2_5be8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l339_c2_5be8_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l339_c2_5be8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_58ec_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l388_c7_58ec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_756c_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_e13c_return_output;
     -- t16_low_MUX[uxn_opcodes_h_l359_c7_2d2e] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_cond;
     t16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_iftrue;
     t16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output := t16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l339_c2_5be8] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5be8_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5be8_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5be8_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5be8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l363_c7_756c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_756c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_756c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_756c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_756c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_756c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_756c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_756c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_756c_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l355_c7_4d9e] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_cond;
     t16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue;
     t16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output := t16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l388_c7_58ec] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_58ec_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_58ec_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_58ec_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_58ec_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_58ec_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_58ec_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_58ec_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_58ec_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l370_c7_83d5] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l370_c7_83d5_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_83d5_cond;
     n16_low_MUX_uxn_opcodes_h_l370_c7_83d5_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_83d5_iftrue;
     n16_low_MUX_uxn_opcodes_h_l370_c7_83d5_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_83d5_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_83d5_return_output := n16_low_MUX_uxn_opcodes_h_l370_c7_83d5_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l339_c2_5be8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5be8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5be8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5be8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5be8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l388_c7_58ec] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l388_c7_58ec_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_58ec_cond;
     result_u8_value_MUX_uxn_opcodes_h_l388_c7_58ec_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_58ec_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l388_c7_58ec_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_58ec_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_58ec_return_output := result_u8_value_MUX_uxn_opcodes_h_l388_c7_58ec_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l388_c7_58ec] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_58ec_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_58ec_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_58ec_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_58ec_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_58ec_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_58ec_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_58ec_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_58ec_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l339_c2_5be8] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5be8_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5be8_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5be8_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5be8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l370_c7_83d5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_83d5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_83d5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_83d5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_83d5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_83d5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_83d5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_83d5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_83d5_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l339_c2_5be8] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5be8_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5be8_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5be8_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5be8_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l363_c7_756c] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l363_c7_756c_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_756c_cond;
     n16_high_MUX_uxn_opcodes_h_l363_c7_756c_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_756c_iftrue;
     n16_high_MUX_uxn_opcodes_h_l363_c7_756c_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_756c_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_756c_return_output := n16_high_MUX_uxn_opcodes_h_l363_c7_756c_return_output;

     -- Submodule level 2
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_2d2e_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_756c_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_756c_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_83d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_06c7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_58ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d2e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_756c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_756c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_83d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_06c7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_58ec_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_06c7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_58ec_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_008d_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output;
     -- t16_low_MUX[uxn_opcodes_h_l355_c7_4d9e] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_cond;
     t16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue;
     t16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output := t16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l384_c7_06c7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_06c7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_06c7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_06c7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_06c7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_06c7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_06c7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_06c7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_06c7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l359_c7_2d2e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d2e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d2e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d2e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d2e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d2e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d2e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l352_c7_008d] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l352_c7_008d_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_008d_cond;
     t16_high_MUX_uxn_opcodes_h_l352_c7_008d_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_008d_iftrue;
     t16_high_MUX_uxn_opcodes_h_l352_c7_008d_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_008d_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_008d_return_output := t16_high_MUX_uxn_opcodes_h_l352_c7_008d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l384_c7_06c7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l384_c7_06c7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_06c7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l384_c7_06c7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_06c7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l384_c7_06c7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_06c7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_06c7_return_output := result_u8_value_MUX_uxn_opcodes_h_l384_c7_06c7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l363_c7_756c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_756c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_756c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_756c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_756c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_756c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_756c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_756c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_756c_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l363_c7_756c] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l363_c7_756c_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_756c_cond;
     n16_low_MUX_uxn_opcodes_h_l363_c7_756c_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_756c_iftrue;
     n16_low_MUX_uxn_opcodes_h_l363_c7_756c_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_756c_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_756c_return_output := n16_low_MUX_uxn_opcodes_h_l363_c7_756c_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l359_c7_2d2e] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l359_c7_2d2e_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_2d2e_cond;
     n16_high_MUX_uxn_opcodes_h_l359_c7_2d2e_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_2d2e_iftrue;
     n16_high_MUX_uxn_opcodes_h_l359_c7_2d2e_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_2d2e_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output := n16_high_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l384_c7_06c7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_06c7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_06c7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_06c7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_06c7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_06c7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_06c7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_06c7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_06c7_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_756c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f659_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_06c7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d2e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_756c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f659_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_06c7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_f659_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_06c7_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_008d_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_008d_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output;
     -- t16_high_MUX[uxn_opcodes_h_l339_c2_5be8] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l339_c2_5be8_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_5be8_cond;
     t16_high_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue;
     t16_high_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_5be8_return_output := t16_high_MUX_uxn_opcodes_h_l339_c2_5be8_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l359_c7_2d2e] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_cond;
     n16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_iftrue;
     n16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output := n16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l355_c7_4d9e] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_cond;
     n16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue;
     n16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output := n16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l380_c7_f659] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f659_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f659_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f659_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f659_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f659_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f659_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f659_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f659_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l355_c7_4d9e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4d9e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4d9e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l380_c7_f659] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l380_c7_f659_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_f659_cond;
     result_u8_value_MUX_uxn_opcodes_h_l380_c7_f659_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_f659_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l380_c7_f659_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_f659_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_f659_return_output := result_u8_value_MUX_uxn_opcodes_h_l380_c7_f659_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l359_c7_2d2e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d2e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d2e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d2e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d2e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d2e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d2e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l380_c7_f659] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f659_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f659_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f659_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f659_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f659_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f659_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f659_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f659_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l352_c7_008d] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l352_c7_008d_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_008d_cond;
     t16_low_MUX_uxn_opcodes_h_l352_c7_008d_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_008d_iftrue;
     t16_low_MUX_uxn_opcodes_h_l352_c7_008d_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_008d_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_008d_return_output := t16_low_MUX_uxn_opcodes_h_l352_c7_008d_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_008d_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_77de_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f659_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_008d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_77de_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f659_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_77de_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_f659_return_output;
     REG_VAR_t16_high := VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_5be8_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_008d_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l355_c7_4d9e] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_cond;
     n16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue;
     n16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output := n16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l376_c7_77de] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_77de_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_77de_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_77de_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_77de_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_77de_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_77de_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_77de_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_77de_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l352_c7_008d] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l352_c7_008d_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_008d_cond;
     n16_high_MUX_uxn_opcodes_h_l352_c7_008d_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_008d_iftrue;
     n16_high_MUX_uxn_opcodes_h_l352_c7_008d_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_008d_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_008d_return_output := n16_high_MUX_uxn_opcodes_h_l352_c7_008d_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l339_c2_5be8] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l339_c2_5be8_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_5be8_cond;
     t16_low_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue;
     t16_low_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_5be8_return_output := t16_low_MUX_uxn_opcodes_h_l339_c2_5be8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l352_c7_008d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_008d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_008d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_008d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_008d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_008d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_008d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_008d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_008d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l376_c7_77de] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_77de_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_77de_cond;
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_77de_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_77de_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_77de_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_77de_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_77de_return_output := result_u8_value_MUX_uxn_opcodes_h_l376_c7_77de_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l376_c7_77de] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_77de_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_77de_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_77de_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_77de_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_77de_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_77de_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_77de_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_77de_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l355_c7_4d9e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4d9e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4d9e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output;

     -- Submodule level 5
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_008d_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_008d_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_83d5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_77de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_008d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_008d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_83d5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_77de_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_83d5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_77de_return_output;
     REG_VAR_t16_low := VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_5be8_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l352_c7_008d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_008d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_008d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_008d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_008d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_008d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_008d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_008d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_008d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l370_c7_83d5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_83d5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_83d5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_83d5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_83d5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_83d5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_83d5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_83d5_return_output := result_u8_value_MUX_uxn_opcodes_h_l370_c7_83d5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l370_c7_83d5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_83d5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_83d5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_83d5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_83d5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_83d5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_83d5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_83d5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_83d5_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l339_c2_5be8] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l339_c2_5be8_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_5be8_cond;
     n16_high_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue;
     n16_high_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_5be8_return_output := n16_high_MUX_uxn_opcodes_h_l339_c2_5be8_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l352_c7_008d] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l352_c7_008d_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_008d_cond;
     n16_low_MUX_uxn_opcodes_h_l352_c7_008d_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_008d_iftrue;
     n16_low_MUX_uxn_opcodes_h_l352_c7_008d_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_008d_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_008d_return_output := n16_low_MUX_uxn_opcodes_h_l352_c7_008d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l370_c7_83d5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_83d5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_83d5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_83d5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_83d5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_83d5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_83d5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_83d5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_83d5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l339_c2_5be8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5be8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5be8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5be8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5be8_return_output;

     -- Submodule level 6
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_5be8_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_008d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_756c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_83d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_008d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_756c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_83d5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_756c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_83d5_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l339_c2_5be8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5be8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5be8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5be8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5be8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l363_c7_756c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_756c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_756c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_756c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_756c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_756c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_756c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_756c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_756c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l363_c7_756c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l363_c7_756c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_756c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l363_c7_756c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_756c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l363_c7_756c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_756c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_756c_return_output := result_u8_value_MUX_uxn_opcodes_h_l363_c7_756c_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l339_c2_5be8] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l339_c2_5be8_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_5be8_cond;
     n16_low_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue;
     n16_low_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_5be8_return_output := n16_low_MUX_uxn_opcodes_h_l339_c2_5be8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l363_c7_756c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_756c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_756c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_756c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_756c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_756c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_756c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_756c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_756c_return_output;

     -- Submodule level 7
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_5be8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d2e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_756c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d2e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_756c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d2e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_756c_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l359_c7_2d2e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d2e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d2e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d2e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d2e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d2e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d2e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l359_c7_2d2e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d2e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d2e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d2e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d2e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d2e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d2e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output := result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l359_c7_2d2e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d2e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d2e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d2e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d2e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d2e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d2e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d2e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l355_c7_4d9e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4d9e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4d9e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l355_c7_4d9e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4d9e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4d9e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l355_c7_4d9e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l355_c7_4d9e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_4d9e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_4d9e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_4d9e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output := result_u8_value_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_008d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_008d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_008d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_4d9e_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l352_c7_008d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l352_c7_008d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_008d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l352_c7_008d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_008d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l352_c7_008d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_008d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_008d_return_output := result_u8_value_MUX_uxn_opcodes_h_l352_c7_008d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l352_c7_008d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_008d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_008d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_008d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_008d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_008d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_008d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_008d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_008d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l352_c7_008d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_008d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_008d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_008d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_008d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_008d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_008d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_008d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_008d_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_008d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_008d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_008d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l339_c2_5be8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5be8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5be8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5be8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5be8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l339_c2_5be8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l339_c2_5be8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_5be8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_5be8_return_output := result_u8_value_MUX_uxn_opcodes_h_l339_c2_5be8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l339_c2_5be8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5be8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5be8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5be8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5be8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5be8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5be8_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l394_l335_DUPLICATE_18a6 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l394_l335_DUPLICATE_18a6_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_922a(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_5be8_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_5be8_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_5be8_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_5be8_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_5be8_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_5be8_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_5be8_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_5be8_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_5be8_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l394_l335_DUPLICATE_18a6_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l394_l335_DUPLICATE_18a6_return_output;
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
