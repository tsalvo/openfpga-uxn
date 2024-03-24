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
-- BIN_OP_EQ[uxn_opcodes_h_l339_c6_5653]
signal BIN_OP_EQ_uxn_opcodes_h_l339_c6_5653_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l339_c6_5653_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l339_c6_5653_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l339_c2_66d7]
signal t16_low_MUX_uxn_opcodes_h_l339_c2_66d7_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l339_c2_66d7_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l339_c2_66d7]
signal n16_low_MUX_uxn_opcodes_h_l339_c2_66d7_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l339_c2_66d7_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l339_c2_66d7]
signal n16_high_MUX_uxn_opcodes_h_l339_c2_66d7_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l339_c2_66d7_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l339_c2_66d7]
signal t16_high_MUX_uxn_opcodes_h_l339_c2_66d7_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l339_c2_66d7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l339_c2_66d7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_66d7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_66d7_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l339_c2_66d7]
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_66d7_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_66d7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l339_c2_66d7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_66d7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_66d7_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l339_c2_66d7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_66d7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_66d7_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l339_c2_66d7]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_66d7_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_66d7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l339_c2_66d7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_66d7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_66d7_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l339_c2_66d7]
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_66d7_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_66d7_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l339_c2_66d7]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_66d7_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_66d7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l339_c2_66d7]
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_66d7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_66d7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l352_c11_0332]
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_0332_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_0332_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_0332_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l352_c7_188a]
signal t16_low_MUX_uxn_opcodes_h_l352_c7_188a_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l352_c7_188a_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l352_c7_188a_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l352_c7_188a_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l352_c7_188a]
signal n16_low_MUX_uxn_opcodes_h_l352_c7_188a_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l352_c7_188a_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l352_c7_188a_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l352_c7_188a_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l352_c7_188a]
signal n16_high_MUX_uxn_opcodes_h_l352_c7_188a_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l352_c7_188a_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l352_c7_188a_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l352_c7_188a_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l352_c7_188a]
signal t16_high_MUX_uxn_opcodes_h_l352_c7_188a_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l352_c7_188a_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l352_c7_188a_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l352_c7_188a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l352_c7_188a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_188a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_188a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_188a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_188a_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l352_c7_188a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_188a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_188a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_188a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_188a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l352_c7_188a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_188a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_188a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_188a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_188a_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l352_c7_188a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_188a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_188a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_188a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_188a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l352_c7_188a]
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_188a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_188a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_188a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_188a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l355_c11_538b]
signal BIN_OP_EQ_uxn_opcodes_h_l355_c11_538b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l355_c11_538b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l355_c11_538b_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l355_c7_7c7b]
signal t16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l355_c7_7c7b]
signal n16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l355_c7_7c7b]
signal n16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l355_c7_7c7b]
signal t16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l355_c7_7c7b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_7c7b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l355_c7_7c7b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_7c7b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l355_c7_7c7b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_7c7b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l355_c7_7c7b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_7c7b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l355_c7_7c7b]
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_7c7b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l359_c11_71e2]
signal BIN_OP_EQ_uxn_opcodes_h_l359_c11_71e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l359_c11_71e2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l359_c11_71e2_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l359_c7_0106]
signal t16_low_MUX_uxn_opcodes_h_l359_c7_0106_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l359_c7_0106_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l359_c7_0106_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l359_c7_0106_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l359_c7_0106]
signal n16_low_MUX_uxn_opcodes_h_l359_c7_0106_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l359_c7_0106_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l359_c7_0106_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l359_c7_0106_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l359_c7_0106]
signal n16_high_MUX_uxn_opcodes_h_l359_c7_0106_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l359_c7_0106_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l359_c7_0106_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l359_c7_0106_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l359_c7_0106]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0106_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0106_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0106_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0106_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l359_c7_0106]
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0106_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0106_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0106_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0106_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l359_c7_0106]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0106_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0106_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0106_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0106_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l359_c7_0106]
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0106_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0106_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0106_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0106_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l359_c7_0106]
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_0106_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_0106_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_0106_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_0106_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l363_c11_575b]
signal BIN_OP_EQ_uxn_opcodes_h_l363_c11_575b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l363_c11_575b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l363_c11_575b_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l363_c7_94f8]
signal n16_low_MUX_uxn_opcodes_h_l363_c7_94f8_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l363_c7_94f8_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l363_c7_94f8_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l363_c7_94f8_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l363_c7_94f8]
signal n16_high_MUX_uxn_opcodes_h_l363_c7_94f8_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l363_c7_94f8_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l363_c7_94f8_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l363_c7_94f8_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l363_c7_94f8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_94f8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_94f8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_94f8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_94f8_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l363_c7_94f8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_94f8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_94f8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_94f8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_94f8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l363_c7_94f8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_94f8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_94f8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_94f8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_94f8_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l363_c7_94f8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_94f8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_94f8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_94f8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_94f8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l363_c7_94f8]
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_94f8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_94f8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_94f8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_94f8_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l365_c30_d9ff]
signal sp_relative_shift_uxn_opcodes_h_l365_c30_d9ff_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l365_c30_d9ff_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l365_c30_d9ff_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l365_c30_d9ff_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l370_c11_c774]
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_c774_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_c774_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_c774_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l370_c7_202f]
signal n16_low_MUX_uxn_opcodes_h_l370_c7_202f_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l370_c7_202f_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l370_c7_202f_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l370_c7_202f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l370_c7_202f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_202f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_202f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_202f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_202f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l370_c7_202f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_202f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_202f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_202f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_202f_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l370_c7_202f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_202f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_202f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_202f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_202f_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l370_c7_202f]
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_202f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_202f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_202f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_202f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l376_c11_f443]
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_f443_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_f443_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_f443_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l376_c7_2f96]
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_2f96_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_2f96_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_2f96_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_2f96_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l376_c7_2f96]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_2f96_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_2f96_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_2f96_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_2f96_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l376_c7_2f96]
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_2f96_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_2f96_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_2f96_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_2f96_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l380_c11_82c0]
signal BIN_OP_EQ_uxn_opcodes_h_l380_c11_82c0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l380_c11_82c0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l380_c11_82c0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l380_c7_f289]
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f289_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f289_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f289_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f289_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l380_c7_f289]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f289_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f289_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f289_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f289_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l380_c7_f289]
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_f289_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_f289_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_f289_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_f289_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l384_c11_4c58]
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_4c58_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_4c58_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_4c58_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l384_c7_fe3d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_fe3d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_fe3d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_fe3d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_fe3d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l384_c7_fe3d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_fe3d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_fe3d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_fe3d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_fe3d_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l384_c7_fe3d]
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_fe3d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_fe3d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_fe3d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_fe3d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l388_c11_bc6a]
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_bc6a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_bc6a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_bc6a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l388_c7_2532]
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_2532_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_2532_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_2532_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_2532_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l388_c7_2532]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_2532_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_2532_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_2532_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_2532_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l388_c7_2532]
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_2532_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_2532_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_2532_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_2532_return_output : unsigned(7 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_04b4( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_stack_index_flipped := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.u8_value := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l339_c6_5653
BIN_OP_EQ_uxn_opcodes_h_l339_c6_5653 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l339_c6_5653_left,
BIN_OP_EQ_uxn_opcodes_h_l339_c6_5653_right,
BIN_OP_EQ_uxn_opcodes_h_l339_c6_5653_return_output);

-- t16_low_MUX_uxn_opcodes_h_l339_c2_66d7
t16_low_MUX_uxn_opcodes_h_l339_c2_66d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l339_c2_66d7_cond,
t16_low_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue,
t16_low_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse,
t16_low_MUX_uxn_opcodes_h_l339_c2_66d7_return_output);

-- n16_low_MUX_uxn_opcodes_h_l339_c2_66d7
n16_low_MUX_uxn_opcodes_h_l339_c2_66d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l339_c2_66d7_cond,
n16_low_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue,
n16_low_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse,
n16_low_MUX_uxn_opcodes_h_l339_c2_66d7_return_output);

-- n16_high_MUX_uxn_opcodes_h_l339_c2_66d7
n16_high_MUX_uxn_opcodes_h_l339_c2_66d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l339_c2_66d7_cond,
n16_high_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue,
n16_high_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse,
n16_high_MUX_uxn_opcodes_h_l339_c2_66d7_return_output);

-- t16_high_MUX_uxn_opcodes_h_l339_c2_66d7
t16_high_MUX_uxn_opcodes_h_l339_c2_66d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l339_c2_66d7_cond,
t16_high_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue,
t16_high_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse,
t16_high_MUX_uxn_opcodes_h_l339_c2_66d7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_66d7
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_66d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_66d7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_66d7_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_66d7
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_66d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_66d7_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_66d7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_66d7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_66d7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_66d7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_66d7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_66d7
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_66d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_66d7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_66d7_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_66d7
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_66d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_66d7_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_66d7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_66d7
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_66d7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_66d7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_66d7_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_66d7
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_66d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_66d7_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_66d7_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_66d7
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_66d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_66d7_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_66d7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l339_c2_66d7
result_u8_value_MUX_uxn_opcodes_h_l339_c2_66d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l339_c2_66d7_cond,
result_u8_value_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l339_c2_66d7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l352_c11_0332
BIN_OP_EQ_uxn_opcodes_h_l352_c11_0332 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l352_c11_0332_left,
BIN_OP_EQ_uxn_opcodes_h_l352_c11_0332_right,
BIN_OP_EQ_uxn_opcodes_h_l352_c11_0332_return_output);

-- t16_low_MUX_uxn_opcodes_h_l352_c7_188a
t16_low_MUX_uxn_opcodes_h_l352_c7_188a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l352_c7_188a_cond,
t16_low_MUX_uxn_opcodes_h_l352_c7_188a_iftrue,
t16_low_MUX_uxn_opcodes_h_l352_c7_188a_iffalse,
t16_low_MUX_uxn_opcodes_h_l352_c7_188a_return_output);

-- n16_low_MUX_uxn_opcodes_h_l352_c7_188a
n16_low_MUX_uxn_opcodes_h_l352_c7_188a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l352_c7_188a_cond,
n16_low_MUX_uxn_opcodes_h_l352_c7_188a_iftrue,
n16_low_MUX_uxn_opcodes_h_l352_c7_188a_iffalse,
n16_low_MUX_uxn_opcodes_h_l352_c7_188a_return_output);

-- n16_high_MUX_uxn_opcodes_h_l352_c7_188a
n16_high_MUX_uxn_opcodes_h_l352_c7_188a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l352_c7_188a_cond,
n16_high_MUX_uxn_opcodes_h_l352_c7_188a_iftrue,
n16_high_MUX_uxn_opcodes_h_l352_c7_188a_iffalse,
n16_high_MUX_uxn_opcodes_h_l352_c7_188a_return_output);

-- t16_high_MUX_uxn_opcodes_h_l352_c7_188a
t16_high_MUX_uxn_opcodes_h_l352_c7_188a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l352_c7_188a_cond,
t16_high_MUX_uxn_opcodes_h_l352_c7_188a_iftrue,
t16_high_MUX_uxn_opcodes_h_l352_c7_188a_iffalse,
t16_high_MUX_uxn_opcodes_h_l352_c7_188a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_188a
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_188a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_188a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_188a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_188a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_188a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_188a
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_188a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_188a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_188a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_188a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_188a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_188a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_188a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_188a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_188a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_188a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_188a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_188a
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_188a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_188a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_188a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_188a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_188a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l352_c7_188a
result_u8_value_MUX_uxn_opcodes_h_l352_c7_188a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l352_c7_188a_cond,
result_u8_value_MUX_uxn_opcodes_h_l352_c7_188a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l352_c7_188a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l352_c7_188a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l355_c11_538b
BIN_OP_EQ_uxn_opcodes_h_l355_c11_538b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l355_c11_538b_left,
BIN_OP_EQ_uxn_opcodes_h_l355_c11_538b_right,
BIN_OP_EQ_uxn_opcodes_h_l355_c11_538b_return_output);

-- t16_low_MUX_uxn_opcodes_h_l355_c7_7c7b
t16_low_MUX_uxn_opcodes_h_l355_c7_7c7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_cond,
t16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue,
t16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse,
t16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output);

-- n16_low_MUX_uxn_opcodes_h_l355_c7_7c7b
n16_low_MUX_uxn_opcodes_h_l355_c7_7c7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_cond,
n16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue,
n16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse,
n16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output);

-- n16_high_MUX_uxn_opcodes_h_l355_c7_7c7b
n16_high_MUX_uxn_opcodes_h_l355_c7_7c7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_cond,
n16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue,
n16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse,
n16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output);

-- t16_high_MUX_uxn_opcodes_h_l355_c7_7c7b
t16_high_MUX_uxn_opcodes_h_l355_c7_7c7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_cond,
t16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue,
t16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse,
t16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_7c7b
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_7c7b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_7c7b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_7c7b
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_7c7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_7c7b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_7c7b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_7c7b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_7c7b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_7c7b
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_7c7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_7c7b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l355_c7_7c7b
result_u8_value_MUX_uxn_opcodes_h_l355_c7_7c7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l355_c7_7c7b_cond,
result_u8_value_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l359_c11_71e2
BIN_OP_EQ_uxn_opcodes_h_l359_c11_71e2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l359_c11_71e2_left,
BIN_OP_EQ_uxn_opcodes_h_l359_c11_71e2_right,
BIN_OP_EQ_uxn_opcodes_h_l359_c11_71e2_return_output);

-- t16_low_MUX_uxn_opcodes_h_l359_c7_0106
t16_low_MUX_uxn_opcodes_h_l359_c7_0106 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l359_c7_0106_cond,
t16_low_MUX_uxn_opcodes_h_l359_c7_0106_iftrue,
t16_low_MUX_uxn_opcodes_h_l359_c7_0106_iffalse,
t16_low_MUX_uxn_opcodes_h_l359_c7_0106_return_output);

-- n16_low_MUX_uxn_opcodes_h_l359_c7_0106
n16_low_MUX_uxn_opcodes_h_l359_c7_0106 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l359_c7_0106_cond,
n16_low_MUX_uxn_opcodes_h_l359_c7_0106_iftrue,
n16_low_MUX_uxn_opcodes_h_l359_c7_0106_iffalse,
n16_low_MUX_uxn_opcodes_h_l359_c7_0106_return_output);

-- n16_high_MUX_uxn_opcodes_h_l359_c7_0106
n16_high_MUX_uxn_opcodes_h_l359_c7_0106 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l359_c7_0106_cond,
n16_high_MUX_uxn_opcodes_h_l359_c7_0106_iftrue,
n16_high_MUX_uxn_opcodes_h_l359_c7_0106_iffalse,
n16_high_MUX_uxn_opcodes_h_l359_c7_0106_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0106
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0106 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0106_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0106_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0106_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0106_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0106
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0106 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0106_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0106_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0106_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0106_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0106
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0106 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0106_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0106_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0106_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0106_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0106
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0106 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0106_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0106_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0106_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0106_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l359_c7_0106
result_u8_value_MUX_uxn_opcodes_h_l359_c7_0106 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l359_c7_0106_cond,
result_u8_value_MUX_uxn_opcodes_h_l359_c7_0106_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l359_c7_0106_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l359_c7_0106_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l363_c11_575b
BIN_OP_EQ_uxn_opcodes_h_l363_c11_575b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l363_c11_575b_left,
BIN_OP_EQ_uxn_opcodes_h_l363_c11_575b_right,
BIN_OP_EQ_uxn_opcodes_h_l363_c11_575b_return_output);

-- n16_low_MUX_uxn_opcodes_h_l363_c7_94f8
n16_low_MUX_uxn_opcodes_h_l363_c7_94f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l363_c7_94f8_cond,
n16_low_MUX_uxn_opcodes_h_l363_c7_94f8_iftrue,
n16_low_MUX_uxn_opcodes_h_l363_c7_94f8_iffalse,
n16_low_MUX_uxn_opcodes_h_l363_c7_94f8_return_output);

-- n16_high_MUX_uxn_opcodes_h_l363_c7_94f8
n16_high_MUX_uxn_opcodes_h_l363_c7_94f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l363_c7_94f8_cond,
n16_high_MUX_uxn_opcodes_h_l363_c7_94f8_iftrue,
n16_high_MUX_uxn_opcodes_h_l363_c7_94f8_iffalse,
n16_high_MUX_uxn_opcodes_h_l363_c7_94f8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_94f8
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_94f8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_94f8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_94f8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_94f8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_94f8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_94f8
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_94f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_94f8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_94f8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_94f8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_94f8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_94f8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_94f8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_94f8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_94f8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_94f8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_94f8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_94f8
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_94f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_94f8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_94f8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_94f8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_94f8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l363_c7_94f8
result_u8_value_MUX_uxn_opcodes_h_l363_c7_94f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l363_c7_94f8_cond,
result_u8_value_MUX_uxn_opcodes_h_l363_c7_94f8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l363_c7_94f8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l363_c7_94f8_return_output);

-- sp_relative_shift_uxn_opcodes_h_l365_c30_d9ff
sp_relative_shift_uxn_opcodes_h_l365_c30_d9ff : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l365_c30_d9ff_ins,
sp_relative_shift_uxn_opcodes_h_l365_c30_d9ff_x,
sp_relative_shift_uxn_opcodes_h_l365_c30_d9ff_y,
sp_relative_shift_uxn_opcodes_h_l365_c30_d9ff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l370_c11_c774
BIN_OP_EQ_uxn_opcodes_h_l370_c11_c774 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l370_c11_c774_left,
BIN_OP_EQ_uxn_opcodes_h_l370_c11_c774_right,
BIN_OP_EQ_uxn_opcodes_h_l370_c11_c774_return_output);

-- n16_low_MUX_uxn_opcodes_h_l370_c7_202f
n16_low_MUX_uxn_opcodes_h_l370_c7_202f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l370_c7_202f_cond,
n16_low_MUX_uxn_opcodes_h_l370_c7_202f_iftrue,
n16_low_MUX_uxn_opcodes_h_l370_c7_202f_iffalse,
n16_low_MUX_uxn_opcodes_h_l370_c7_202f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_202f
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_202f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_202f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_202f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_202f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_202f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_202f
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_202f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_202f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_202f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_202f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_202f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_202f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_202f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_202f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_202f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_202f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_202f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l370_c7_202f
result_u8_value_MUX_uxn_opcodes_h_l370_c7_202f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l370_c7_202f_cond,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_202f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_202f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_202f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l376_c11_f443
BIN_OP_EQ_uxn_opcodes_h_l376_c11_f443 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l376_c11_f443_left,
BIN_OP_EQ_uxn_opcodes_h_l376_c11_f443_right,
BIN_OP_EQ_uxn_opcodes_h_l376_c11_f443_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_2f96
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_2f96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_2f96_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_2f96_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_2f96_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_2f96_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_2f96
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_2f96 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_2f96_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_2f96_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_2f96_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_2f96_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l376_c7_2f96
result_u8_value_MUX_uxn_opcodes_h_l376_c7_2f96 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l376_c7_2f96_cond,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_2f96_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_2f96_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_2f96_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l380_c11_82c0
BIN_OP_EQ_uxn_opcodes_h_l380_c11_82c0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l380_c11_82c0_left,
BIN_OP_EQ_uxn_opcodes_h_l380_c11_82c0_right,
BIN_OP_EQ_uxn_opcodes_h_l380_c11_82c0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f289
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f289 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f289_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f289_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f289_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f289_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f289
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f289 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f289_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f289_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f289_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f289_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l380_c7_f289
result_u8_value_MUX_uxn_opcodes_h_l380_c7_f289 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l380_c7_f289_cond,
result_u8_value_MUX_uxn_opcodes_h_l380_c7_f289_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l380_c7_f289_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l380_c7_f289_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l384_c11_4c58
BIN_OP_EQ_uxn_opcodes_h_l384_c11_4c58 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l384_c11_4c58_left,
BIN_OP_EQ_uxn_opcodes_h_l384_c11_4c58_right,
BIN_OP_EQ_uxn_opcodes_h_l384_c11_4c58_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_fe3d
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_fe3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_fe3d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_fe3d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_fe3d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_fe3d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_fe3d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_fe3d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_fe3d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_fe3d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_fe3d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_fe3d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l384_c7_fe3d
result_u8_value_MUX_uxn_opcodes_h_l384_c7_fe3d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l384_c7_fe3d_cond,
result_u8_value_MUX_uxn_opcodes_h_l384_c7_fe3d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l384_c7_fe3d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l384_c7_fe3d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l388_c11_bc6a
BIN_OP_EQ_uxn_opcodes_h_l388_c11_bc6a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l388_c11_bc6a_left,
BIN_OP_EQ_uxn_opcodes_h_l388_c11_bc6a_right,
BIN_OP_EQ_uxn_opcodes_h_l388_c11_bc6a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_2532
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_2532 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_2532_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_2532_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_2532_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_2532_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_2532
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_2532 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_2532_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_2532_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_2532_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_2532_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l388_c7_2532
result_u8_value_MUX_uxn_opcodes_h_l388_c7_2532 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l388_c7_2532_cond,
result_u8_value_MUX_uxn_opcodes_h_l388_c7_2532_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l388_c7_2532_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l388_c7_2532_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l339_c6_5653_return_output,
 t16_low_MUX_uxn_opcodes_h_l339_c2_66d7_return_output,
 n16_low_MUX_uxn_opcodes_h_l339_c2_66d7_return_output,
 n16_high_MUX_uxn_opcodes_h_l339_c2_66d7_return_output,
 t16_high_MUX_uxn_opcodes_h_l339_c2_66d7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_66d7_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_66d7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_66d7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_66d7_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_66d7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_66d7_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_66d7_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_66d7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l339_c2_66d7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l352_c11_0332_return_output,
 t16_low_MUX_uxn_opcodes_h_l352_c7_188a_return_output,
 n16_low_MUX_uxn_opcodes_h_l352_c7_188a_return_output,
 n16_high_MUX_uxn_opcodes_h_l352_c7_188a_return_output,
 t16_high_MUX_uxn_opcodes_h_l352_c7_188a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_188a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_188a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_188a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_188a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l352_c7_188a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l355_c11_538b_return_output,
 t16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output,
 n16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output,
 n16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output,
 t16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l359_c11_71e2_return_output,
 t16_low_MUX_uxn_opcodes_h_l359_c7_0106_return_output,
 n16_low_MUX_uxn_opcodes_h_l359_c7_0106_return_output,
 n16_high_MUX_uxn_opcodes_h_l359_c7_0106_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0106_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0106_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0106_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0106_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l359_c7_0106_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l363_c11_575b_return_output,
 n16_low_MUX_uxn_opcodes_h_l363_c7_94f8_return_output,
 n16_high_MUX_uxn_opcodes_h_l363_c7_94f8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_94f8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_94f8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_94f8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_94f8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l363_c7_94f8_return_output,
 sp_relative_shift_uxn_opcodes_h_l365_c30_d9ff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l370_c11_c774_return_output,
 n16_low_MUX_uxn_opcodes_h_l370_c7_202f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_202f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_202f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_202f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l370_c7_202f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l376_c11_f443_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_2f96_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_2f96_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l376_c7_2f96_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l380_c11_82c0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f289_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f289_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l380_c7_f289_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l384_c11_4c58_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_fe3d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_fe3d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l384_c7_fe3d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l388_c11_bc6a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_2532_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_2532_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l388_c7_2532_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_5653_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_5653_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_5653_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_188a_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_66d7_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_66d7_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_188a_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_66d7_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_66d7_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_188a_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_66d7_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_66d7_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_188a_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_66d7_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_66d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_188a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_66d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_66d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l339_c2_66d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_66d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_66d7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l349_c3_bbdf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_188a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_66d7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_66d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_188a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_66d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_66d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l339_c2_66d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_66d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_66d7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l344_c3_7253 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_188a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_66d7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_66d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l339_c2_66d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_66d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_66d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l339_c2_66d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_66d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_66d7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_188a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_66d7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_66d7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0332_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0332_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0332_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_188a_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_188a_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_188a_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_188a_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_188a_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_188a_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_188a_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_188a_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_188a_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_188a_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_188a_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_188a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_188a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_188a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_188a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_188a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_188a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_188a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_188a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l353_c3_9cbb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_188a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_188a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_188a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_188a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_188a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_188a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_188a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_188a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_538b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_538b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_538b_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_0106_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_0106_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_0106_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0106_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_7c7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0106_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_7c7b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_896e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0106_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_7c7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0106_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_7c7b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_0106_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_7c7b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_71e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_71e2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_71e2_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_0106_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_0106_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_0106_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_0106_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_0106_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_94f8_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_0106_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_0106_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_0106_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_94f8_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_0106_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0106_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0106_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_94f8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0106_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0106_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0106_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_94f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0106_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0106_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l361_c3_2be1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0106_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_94f8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0106_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0106_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0106_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_94f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0106_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_0106_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_0106_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_94f8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_0106_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_575b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_575b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_575b_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_94f8_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_94f8_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_202f_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_94f8_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_94f8_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_94f8_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_94f8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_94f8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_94f8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_202f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_94f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_94f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_94f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_202f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_94f8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_94f8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_c97d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_94f8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_202f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_94f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_94f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_94f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_94f8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_94f8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_94f8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_202f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_94f8_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_d9ff_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_d9ff_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_d9ff_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_d9ff_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_c774_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_c774_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_c774_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_202f_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_202f_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_202f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_202f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_202f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_2f96_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_202f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_202f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l372_c3_abc6 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_202f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_202f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_202f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l373_c3_a6a2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_202f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_2f96_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_202f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_202f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_202f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_2f96_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_202f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_f443_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_f443_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_f443_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_2f96_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_2f96_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f289_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_2f96_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_2f96_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_08ad : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_2f96_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f289_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_2f96_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_2f96_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_2f96_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_f289_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_2f96_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_82c0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_82c0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_82c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f289_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f289_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_fe3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f289_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f289_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_e025 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f289_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_fe3d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f289_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_f289_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_f289_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_fe3d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_f289_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_4c58_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_4c58_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_4c58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_fe3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_fe3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_2532_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_fe3d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_fe3d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_8443 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_fe3d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_2532_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_fe3d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_fe3d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_fe3d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_2532_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_fe3d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_bc6a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_bc6a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_bc6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_2532_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_2532_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_2532_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_2532_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_4d10 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_2532_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l388_c7_2532_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_2532_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_2532_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_2532_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_2532_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l388_l359_l355_l352_l339_DUPLICATE_7eac_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l352_l355_l370_l359_DUPLICATE_4cb5_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l363_l388_l359_l384_l355_l380_l352_l376_DUPLICATE_f7cb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l363_l355_l359_DUPLICATE_339b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l394_l335_DUPLICATE_cefa_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_575b_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_8443 := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_fe3d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_8443;
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_d9ff_y := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_94f8_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l353_c3_9cbb := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_188a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l353_c3_9cbb;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l372_c3_abc6 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_202f_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l372_c3_abc6;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_82c0_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_4d10 := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_2532_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_4d10;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_bc6a_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_c97d := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_94f8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_c97d;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_d9ff_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_71e2_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l344_c3_7253 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l344_c3_7253;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l373_c3_a6a2 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_202f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l373_c3_a6a2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0332_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_538b_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_5653_right := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_f443_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_896e := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_896e;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_e025 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f289_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_e025;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_2532_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_c774_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_4c58_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l349_c3_bbdf := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l349_c3_bbdf;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_08ad := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_2f96_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_08ad;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l361_c3_2be1 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0106_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l361_c3_2be1;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_d9ff_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_188a_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_0106_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_94f8_iffalse := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_f289_iftrue := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_2532_iftrue := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_188a_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_0106_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_94f8_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_202f_iffalse := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_2f96_iftrue := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_fe3d_iftrue := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_5653_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0332_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_538b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_71e2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_575b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_c774_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_f443_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_82c0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_4c58_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_bc6a_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_94f8_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_202f_iftrue := VAR_previous_stack_read;
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue := VAR_previous_stack_read;
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_0106_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_202f_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_188a_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse := t16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_94f8_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_188a_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_0106_iffalse := t16_low;
     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l339_c2_66d7] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l339_c2_66d7_return_output := result.is_vram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l352_l355_l370_l359_DUPLICATE_4cb5 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l352_l355_l370_l359_DUPLICATE_4cb5_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l359_c11_71e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l359_c11_71e2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_71e2_left;
     BIN_OP_EQ_uxn_opcodes_h_l359_c11_71e2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_71e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_71e2_return_output := BIN_OP_EQ_uxn_opcodes_h_l359_c11_71e2_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l339_c2_66d7] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l339_c2_66d7_return_output := result.is_pc_updated;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l339_c2_66d7] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l339_c2_66d7_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l363_c11_575b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l363_c11_575b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_575b_left;
     BIN_OP_EQ_uxn_opcodes_h_l363_c11_575b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_575b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_575b_return_output := BIN_OP_EQ_uxn_opcodes_h_l363_c11_575b_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l365_c30_d9ff] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l365_c30_d9ff_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_d9ff_ins;
     sp_relative_shift_uxn_opcodes_h_l365_c30_d9ff_x <= VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_d9ff_x;
     sp_relative_shift_uxn_opcodes_h_l365_c30_d9ff_y <= VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_d9ff_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_d9ff_return_output := sp_relative_shift_uxn_opcodes_h_l365_c30_d9ff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l352_c11_0332] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l352_c11_0332_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0332_left;
     BIN_OP_EQ_uxn_opcodes_h_l352_c11_0332_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0332_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0332_return_output := BIN_OP_EQ_uxn_opcodes_h_l352_c11_0332_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l388_c11_bc6a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l388_c11_bc6a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_bc6a_left;
     BIN_OP_EQ_uxn_opcodes_h_l388_c11_bc6a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_bc6a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_bc6a_return_output := BIN_OP_EQ_uxn_opcodes_h_l388_c11_bc6a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l339_c6_5653] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l339_c6_5653_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_5653_left;
     BIN_OP_EQ_uxn_opcodes_h_l339_c6_5653_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_5653_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_5653_return_output := BIN_OP_EQ_uxn_opcodes_h_l339_c6_5653_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l363_l355_l359_DUPLICATE_339b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l363_l355_l359_DUPLICATE_339b_return_output := result.is_stack_write;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l388_c7_2532] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l388_c7_2532_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l384_c11_4c58] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l384_c11_4c58_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_4c58_left;
     BIN_OP_EQ_uxn_opcodes_h_l384_c11_4c58_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_4c58_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_4c58_return_output := BIN_OP_EQ_uxn_opcodes_h_l384_c11_4c58_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l388_l359_l355_l352_l339_DUPLICATE_7eac LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l388_l359_l355_l352_l339_DUPLICATE_7eac_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l376_c11_f443] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l376_c11_f443_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_f443_left;
     BIN_OP_EQ_uxn_opcodes_h_l376_c11_f443_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_f443_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_f443_return_output := BIN_OP_EQ_uxn_opcodes_h_l376_c11_f443_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l380_c11_82c0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l380_c11_82c0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_82c0_left;
     BIN_OP_EQ_uxn_opcodes_h_l380_c11_82c0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_82c0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_82c0_return_output := BIN_OP_EQ_uxn_opcodes_h_l380_c11_82c0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l363_l388_l359_l384_l355_l380_l352_l376_DUPLICATE_f7cb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l363_l388_l359_l384_l355_l380_l352_l376_DUPLICATE_f7cb_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l355_c11_538b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l355_c11_538b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_538b_left;
     BIN_OP_EQ_uxn_opcodes_h_l355_c11_538b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_538b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_538b_return_output := BIN_OP_EQ_uxn_opcodes_h_l355_c11_538b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l370_c11_c774] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l370_c11_c774_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_c774_left;
     BIN_OP_EQ_uxn_opcodes_h_l370_c11_c774_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_c774_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_c774_return_output := BIN_OP_EQ_uxn_opcodes_h_l370_c11_c774_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l339_c2_66d7] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l339_c2_66d7_return_output := result.is_ram_write;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_66d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_5653_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_66d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_5653_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_66d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_5653_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_66d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_5653_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_66d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_5653_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_66d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_5653_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_66d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_5653_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_66d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_5653_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_66d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_5653_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_66d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_5653_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_66d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_5653_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_66d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_5653_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_66d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_5653_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_188a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0332_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_188a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0332_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_188a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0332_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_188a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0332_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_188a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0332_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_188a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0332_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_188a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0332_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_188a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0332_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_188a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0332_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_538b_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_538b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_7c7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_538b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_7c7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_538b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_7c7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_538b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_7c7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_538b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_7c7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_538b_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_538b_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_538b_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_0106_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_71e2_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_0106_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_71e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0106_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_71e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0106_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_71e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0106_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_71e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0106_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_71e2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_0106_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_71e2_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_0106_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_71e2_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_94f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_575b_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_94f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_575b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_94f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_575b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_94f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_575b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_94f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_575b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_94f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_575b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_94f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_575b_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_202f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_c774_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_202f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_c774_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_202f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_c774_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_202f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_c774_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_202f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_c774_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_2f96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_f443_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_2f96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_f443_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_2f96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_f443_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f289_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_82c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f289_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_82c0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_f289_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_82c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_fe3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_4c58_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_fe3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_4c58_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_fe3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_4c58_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_2532_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_bc6a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_2532_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_bc6a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_2532_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_bc6a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_188a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l352_l355_l370_l359_DUPLICATE_4cb5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l352_l355_l370_l359_DUPLICATE_4cb5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0106_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l352_l355_l370_l359_DUPLICATE_4cb5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_202f_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l352_l355_l370_l359_DUPLICATE_4cb5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_188a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l363_l388_l359_l384_l355_l380_l352_l376_DUPLICATE_f7cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l363_l388_l359_l384_l355_l380_l352_l376_DUPLICATE_f7cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0106_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l363_l388_l359_l384_l355_l380_l352_l376_DUPLICATE_f7cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_94f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l363_l388_l359_l384_l355_l380_l352_l376_DUPLICATE_f7cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_202f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l363_l388_l359_l384_l355_l380_l352_l376_DUPLICATE_f7cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_2f96_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l363_l388_l359_l384_l355_l380_l352_l376_DUPLICATE_f7cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f289_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l363_l388_l359_l384_l355_l380_l352_l376_DUPLICATE_f7cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_fe3d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l363_l388_l359_l384_l355_l380_l352_l376_DUPLICATE_f7cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_2532_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l363_l388_l359_l384_l355_l380_l352_l376_DUPLICATE_f7cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_188a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l363_l355_l359_DUPLICATE_339b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l363_l355_l359_DUPLICATE_339b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0106_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l363_l355_l359_DUPLICATE_339b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_94f8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l363_l355_l359_DUPLICATE_339b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l388_l359_l355_l352_l339_DUPLICATE_7eac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_188a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l388_l359_l355_l352_l339_DUPLICATE_7eac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l388_l359_l355_l352_l339_DUPLICATE_7eac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_0106_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l388_l359_l355_l352_l339_DUPLICATE_7eac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_2532_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l388_l359_l355_l352_l339_DUPLICATE_7eac_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l339_c2_66d7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l339_c2_66d7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l339_c2_66d7_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l339_c2_66d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_2532_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l388_c7_2532_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_94f8_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_d9ff_return_output;
     -- n16_high_MUX[uxn_opcodes_h_l363_c7_94f8] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l363_c7_94f8_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_94f8_cond;
     n16_high_MUX_uxn_opcodes_h_l363_c7_94f8_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_94f8_iftrue;
     n16_high_MUX_uxn_opcodes_h_l363_c7_94f8_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_94f8_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_94f8_return_output := n16_high_MUX_uxn_opcodes_h_l363_c7_94f8_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l339_c2_66d7] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_66d7_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_66d7_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_66d7_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_66d7_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l339_c2_66d7] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_66d7_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_66d7_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_66d7_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_66d7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l388_c7_2532] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_2532_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_2532_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_2532_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_2532_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_2532_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_2532_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_2532_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_2532_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l388_c7_2532] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_2532_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_2532_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_2532_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_2532_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_2532_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_2532_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_2532_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_2532_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l370_c7_202f] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l370_c7_202f_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_202f_cond;
     n16_low_MUX_uxn_opcodes_h_l370_c7_202f_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_202f_iftrue;
     n16_low_MUX_uxn_opcodes_h_l370_c7_202f_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_202f_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_202f_return_output := n16_low_MUX_uxn_opcodes_h_l370_c7_202f_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l339_c2_66d7] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_66d7_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_66d7_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_66d7_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_66d7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l388_c7_2532] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l388_c7_2532_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_2532_cond;
     result_u8_value_MUX_uxn_opcodes_h_l388_c7_2532_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_2532_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l388_c7_2532_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_2532_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_2532_return_output := result_u8_value_MUX_uxn_opcodes_h_l388_c7_2532_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l363_c7_94f8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_94f8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_94f8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_94f8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_94f8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_94f8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_94f8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_94f8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_94f8_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l339_c2_66d7] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_66d7_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_66d7_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_66d7_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_66d7_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l355_c7_7c7b] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_cond;
     t16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue;
     t16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output := t16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l359_c7_0106] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l359_c7_0106_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_0106_cond;
     t16_low_MUX_uxn_opcodes_h_l359_c7_0106_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_0106_iftrue;
     t16_low_MUX_uxn_opcodes_h_l359_c7_0106_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_0106_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_0106_return_output := t16_low_MUX_uxn_opcodes_h_l359_c7_0106_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l370_c7_202f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_202f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_202f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_202f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_202f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_202f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_202f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_202f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_202f_return_output;

     -- Submodule level 2
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_0106_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_94f8_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_94f8_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_202f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_fe3d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_2532_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0106_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_94f8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_94f8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_202f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_fe3d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_2532_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_fe3d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_2532_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_188a_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_0106_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l384_c7_fe3d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l384_c7_fe3d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_fe3d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l384_c7_fe3d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_fe3d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l384_c7_fe3d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_fe3d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_fe3d_return_output := result_u8_value_MUX_uxn_opcodes_h_l384_c7_fe3d_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l359_c7_0106] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l359_c7_0106_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_0106_cond;
     n16_high_MUX_uxn_opcodes_h_l359_c7_0106_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_0106_iftrue;
     n16_high_MUX_uxn_opcodes_h_l359_c7_0106_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_0106_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_0106_return_output := n16_high_MUX_uxn_opcodes_h_l359_c7_0106_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l359_c7_0106] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0106_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0106_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0106_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0106_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0106_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0106_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0106_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0106_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l355_c7_7c7b] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_cond;
     t16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue;
     t16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output := t16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l363_c7_94f8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_94f8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_94f8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_94f8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_94f8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_94f8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_94f8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_94f8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_94f8_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l363_c7_94f8] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l363_c7_94f8_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_94f8_cond;
     n16_low_MUX_uxn_opcodes_h_l363_c7_94f8_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_94f8_iftrue;
     n16_low_MUX_uxn_opcodes_h_l363_c7_94f8_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_94f8_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_94f8_return_output := n16_low_MUX_uxn_opcodes_h_l363_c7_94f8_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l352_c7_188a] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l352_c7_188a_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_188a_cond;
     t16_high_MUX_uxn_opcodes_h_l352_c7_188a_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_188a_iftrue;
     t16_high_MUX_uxn_opcodes_h_l352_c7_188a_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_188a_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_188a_return_output := t16_high_MUX_uxn_opcodes_h_l352_c7_188a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l384_c7_fe3d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_fe3d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_fe3d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_fe3d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_fe3d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_fe3d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_fe3d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_fe3d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_fe3d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l384_c7_fe3d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_fe3d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_fe3d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_fe3d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_fe3d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_fe3d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_fe3d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_fe3d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_fe3d_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_0106_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_0106_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_94f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f289_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_fe3d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0106_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0106_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_94f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f289_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_fe3d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_f289_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_fe3d_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_188a_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_188a_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l359_c7_0106] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0106_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0106_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0106_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0106_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0106_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0106_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0106_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0106_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l352_c7_188a] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l352_c7_188a_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_188a_cond;
     t16_low_MUX_uxn_opcodes_h_l352_c7_188a_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_188a_iftrue;
     t16_low_MUX_uxn_opcodes_h_l352_c7_188a_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_188a_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_188a_return_output := t16_low_MUX_uxn_opcodes_h_l352_c7_188a_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l355_c7_7c7b] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_cond;
     n16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue;
     n16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output := n16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l380_c7_f289] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f289_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f289_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f289_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f289_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f289_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f289_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f289_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f289_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l359_c7_0106] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l359_c7_0106_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_0106_cond;
     n16_low_MUX_uxn_opcodes_h_l359_c7_0106_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_0106_iftrue;
     n16_low_MUX_uxn_opcodes_h_l359_c7_0106_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_0106_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_0106_return_output := n16_low_MUX_uxn_opcodes_h_l359_c7_0106_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l380_c7_f289] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f289_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f289_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f289_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f289_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f289_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f289_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f289_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f289_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l380_c7_f289] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l380_c7_f289_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_f289_cond;
     result_u8_value_MUX_uxn_opcodes_h_l380_c7_f289_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_f289_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l380_c7_f289_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_f289_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_f289_return_output := result_u8_value_MUX_uxn_opcodes_h_l380_c7_f289_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l339_c2_66d7] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l339_c2_66d7_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_66d7_cond;
     t16_high_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue;
     t16_high_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_66d7_return_output := t16_high_MUX_uxn_opcodes_h_l339_c2_66d7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l355_c7_7c7b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_7c7b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_7c7b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_188a_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_0106_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_2f96_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_f289_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_188a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0106_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_2f96_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_f289_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_2f96_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_f289_return_output;
     REG_VAR_t16_high := VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_66d7_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_188a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l352_c7_188a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_188a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_188a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_188a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_188a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_188a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_188a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_188a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_188a_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l355_c7_7c7b] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_cond;
     n16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue;
     n16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output := n16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l376_c7_2f96] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_2f96_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_2f96_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_2f96_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_2f96_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_2f96_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_2f96_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_2f96_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_2f96_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l339_c2_66d7] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l339_c2_66d7_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_66d7_cond;
     t16_low_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue;
     t16_low_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_66d7_return_output := t16_low_MUX_uxn_opcodes_h_l339_c2_66d7_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l352_c7_188a] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l352_c7_188a_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_188a_cond;
     n16_high_MUX_uxn_opcodes_h_l352_c7_188a_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_188a_iftrue;
     n16_high_MUX_uxn_opcodes_h_l352_c7_188a_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_188a_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_188a_return_output := n16_high_MUX_uxn_opcodes_h_l352_c7_188a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l376_c7_2f96] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_2f96_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_2f96_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_2f96_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_2f96_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_2f96_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_2f96_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_2f96_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_2f96_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l376_c7_2f96] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_2f96_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_2f96_cond;
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_2f96_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_2f96_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_2f96_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_2f96_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_2f96_return_output := result_u8_value_MUX_uxn_opcodes_h_l376_c7_2f96_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l355_c7_7c7b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_7c7b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_7c7b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output;

     -- Submodule level 5
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_188a_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_188a_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_202f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_2f96_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_188a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_188a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_202f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_2f96_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_202f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_2f96_return_output;
     REG_VAR_t16_low := VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_66d7_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l370_c7_202f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_202f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_202f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_202f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_202f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_202f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_202f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_202f_return_output := result_u8_value_MUX_uxn_opcodes_h_l370_c7_202f_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l339_c2_66d7] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l339_c2_66d7_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_66d7_cond;
     n16_high_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue;
     n16_high_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_66d7_return_output := n16_high_MUX_uxn_opcodes_h_l339_c2_66d7_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l352_c7_188a] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l352_c7_188a_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_188a_cond;
     n16_low_MUX_uxn_opcodes_h_l352_c7_188a_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_188a_iftrue;
     n16_low_MUX_uxn_opcodes_h_l352_c7_188a_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_188a_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_188a_return_output := n16_low_MUX_uxn_opcodes_h_l352_c7_188a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l339_c2_66d7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_66d7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_66d7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_66d7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_66d7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l352_c7_188a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_188a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_188a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_188a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_188a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_188a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_188a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_188a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_188a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l370_c7_202f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_202f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_202f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_202f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_202f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_202f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_202f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_202f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_202f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l370_c7_202f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_202f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_202f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_202f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_202f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_202f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_202f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_202f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_202f_return_output;

     -- Submodule level 6
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_66d7_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_188a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_94f8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_202f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_188a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_94f8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_202f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_94f8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_202f_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l339_c2_66d7] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l339_c2_66d7_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_66d7_cond;
     n16_low_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue;
     n16_low_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_66d7_return_output := n16_low_MUX_uxn_opcodes_h_l339_c2_66d7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l363_c7_94f8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_94f8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_94f8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_94f8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_94f8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_94f8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_94f8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_94f8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_94f8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l339_c2_66d7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_66d7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_66d7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_66d7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_66d7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l363_c7_94f8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l363_c7_94f8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_94f8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l363_c7_94f8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_94f8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l363_c7_94f8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_94f8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_94f8_return_output := result_u8_value_MUX_uxn_opcodes_h_l363_c7_94f8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l363_c7_94f8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_94f8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_94f8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_94f8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_94f8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_94f8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_94f8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_94f8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_94f8_return_output;

     -- Submodule level 7
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_66d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0106_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_94f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0106_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_94f8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_0106_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_94f8_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l359_c7_0106] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0106_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0106_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0106_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0106_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0106_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0106_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0106_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0106_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l359_c7_0106] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0106_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0106_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0106_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0106_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0106_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0106_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0106_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0106_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l359_c7_0106] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l359_c7_0106_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_0106_cond;
     result_u8_value_MUX_uxn_opcodes_h_l359_c7_0106_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_0106_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l359_c7_0106_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_0106_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_0106_return_output := result_u8_value_MUX_uxn_opcodes_h_l359_c7_0106_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0106_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0106_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_0106_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l355_c7_7c7b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l355_c7_7c7b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_7c7b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output := result_u8_value_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l355_c7_7c7b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_7c7b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_7c7b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l355_c7_7c7b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_7c7b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_7c7b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_7c7b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_7c7b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_188a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_188a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_188a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_7c7b_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l352_c7_188a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l352_c7_188a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_188a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l352_c7_188a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_188a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l352_c7_188a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_188a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_188a_return_output := result_u8_value_MUX_uxn_opcodes_h_l352_c7_188a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l352_c7_188a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_188a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_188a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_188a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_188a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_188a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_188a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_188a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_188a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l352_c7_188a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_188a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_188a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_188a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_188a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_188a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_188a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_188a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_188a_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_188a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_188a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_188a_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l339_c2_66d7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l339_c2_66d7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_66d7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_66d7_return_output := result_u8_value_MUX_uxn_opcodes_h_l339_c2_66d7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l339_c2_66d7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_66d7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_66d7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_66d7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_66d7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l339_c2_66d7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_66d7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_66d7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_66d7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_66d7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_66d7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_66d7_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l394_l335_DUPLICATE_cefa LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l394_l335_DUPLICATE_cefa_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_04b4(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_66d7_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_66d7_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_66d7_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_66d7_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_66d7_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_66d7_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_66d7_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_66d7_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_66d7_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l394_l335_DUPLICATE_cefa_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l394_l335_DUPLICATE_cefa_return_output;
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
