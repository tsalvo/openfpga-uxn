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
-- BIN_OP_EQ[uxn_opcodes_h_l339_c6_59bb]
signal BIN_OP_EQ_uxn_opcodes_h_l339_c6_59bb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l339_c6_59bb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l339_c6_59bb_return_output : unsigned(0 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l339_c2_ec9d]
signal t16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l339_c2_ec9d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_ec9d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l339_c2_ec9d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l339_c2_ec9d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_ec9d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l339_c2_ec9d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_ec9d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l339_c2_ec9d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_ec9d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l339_c2_ec9d]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_ec9d_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l339_c2_ec9d]
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_ec9d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l339_c2_ec9d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_ec9d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l339_c2_ec9d]
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l339_c2_ec9d]
signal n16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l339_c2_ec9d]
signal t16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l339_c2_ec9d]
signal n16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l352_c11_9341]
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_9341_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_9341_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_9341_return_output : unsigned(0 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l352_c7_dc04]
signal t16_high_MUX_uxn_opcodes_h_l352_c7_dc04_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l352_c7_dc04_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l352_c7_dc04]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_dc04_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_dc04_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l352_c7_dc04]
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_dc04_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_dc04_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l352_c7_dc04]
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_dc04_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_dc04_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l352_c7_dc04]
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_dc04_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_dc04_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l352_c7_dc04]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_dc04_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_dc04_return_output : unsigned(3 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l352_c7_dc04]
signal n16_high_MUX_uxn_opcodes_h_l352_c7_dc04_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l352_c7_dc04_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l352_c7_dc04]
signal t16_low_MUX_uxn_opcodes_h_l352_c7_dc04_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l352_c7_dc04_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l352_c7_dc04]
signal n16_low_MUX_uxn_opcodes_h_l352_c7_dc04_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l352_c7_dc04_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l355_c11_08ea]
signal BIN_OP_EQ_uxn_opcodes_h_l355_c11_08ea_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l355_c11_08ea_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l355_c11_08ea_return_output : unsigned(0 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l355_c7_788f]
signal t16_high_MUX_uxn_opcodes_h_l355_c7_788f_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l355_c7_788f_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l355_c7_788f_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l355_c7_788f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l355_c7_788f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_788f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_788f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_788f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_788f_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l355_c7_788f]
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_788f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_788f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_788f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_788f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l355_c7_788f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_788f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_788f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_788f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_788f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l355_c7_788f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_788f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_788f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_788f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_788f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l355_c7_788f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_788f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_788f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_788f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_788f_return_output : unsigned(3 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l355_c7_788f]
signal n16_high_MUX_uxn_opcodes_h_l355_c7_788f_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l355_c7_788f_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l355_c7_788f_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l355_c7_788f_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l355_c7_788f]
signal t16_low_MUX_uxn_opcodes_h_l355_c7_788f_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l355_c7_788f_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l355_c7_788f_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l355_c7_788f_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l355_c7_788f]
signal n16_low_MUX_uxn_opcodes_h_l355_c7_788f_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l355_c7_788f_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l355_c7_788f_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l355_c7_788f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l359_c11_0f81]
signal BIN_OP_EQ_uxn_opcodes_h_l359_c11_0f81_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l359_c11_0f81_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l359_c11_0f81_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l359_c7_a392]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_a392_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_a392_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_a392_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_a392_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l359_c7_a392]
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_a392_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_a392_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_a392_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_a392_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l359_c7_a392]
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_a392_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_a392_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_a392_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_a392_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l359_c7_a392]
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_a392_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_a392_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_a392_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_a392_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l359_c7_a392]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_a392_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_a392_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_a392_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_a392_return_output : unsigned(3 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l359_c7_a392]
signal n16_high_MUX_uxn_opcodes_h_l359_c7_a392_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l359_c7_a392_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l359_c7_a392_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l359_c7_a392_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l359_c7_a392]
signal t16_low_MUX_uxn_opcodes_h_l359_c7_a392_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l359_c7_a392_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l359_c7_a392_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l359_c7_a392_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l359_c7_a392]
signal n16_low_MUX_uxn_opcodes_h_l359_c7_a392_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l359_c7_a392_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l359_c7_a392_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l359_c7_a392_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l363_c11_5ff5]
signal BIN_OP_EQ_uxn_opcodes_h_l363_c11_5ff5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l363_c11_5ff5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l363_c11_5ff5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l363_c7_34db]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_34db_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_34db_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_34db_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_34db_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l363_c7_34db]
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_34db_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_34db_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_34db_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_34db_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l363_c7_34db]
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_34db_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_34db_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_34db_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_34db_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l363_c7_34db]
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_34db_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_34db_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_34db_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_34db_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l363_c7_34db]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_34db_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_34db_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_34db_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_34db_return_output : unsigned(3 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l363_c7_34db]
signal n16_high_MUX_uxn_opcodes_h_l363_c7_34db_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l363_c7_34db_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l363_c7_34db_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l363_c7_34db_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l363_c7_34db]
signal n16_low_MUX_uxn_opcodes_h_l363_c7_34db_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l363_c7_34db_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l363_c7_34db_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l363_c7_34db_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l365_c30_76db]
signal sp_relative_shift_uxn_opcodes_h_l365_c30_76db_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l365_c30_76db_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l365_c30_76db_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l365_c30_76db_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l370_c11_7f2d]
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_7f2d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_7f2d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_7f2d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l370_c7_f06a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_f06a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_f06a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_f06a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_f06a_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l370_c7_f06a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_f06a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_f06a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_f06a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_f06a_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l370_c7_f06a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_f06a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_f06a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_f06a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_f06a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l370_c7_f06a]
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_f06a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_f06a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_f06a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_f06a_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l370_c7_f06a]
signal n16_low_MUX_uxn_opcodes_h_l370_c7_f06a_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l370_c7_f06a_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l370_c7_f06a_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l370_c7_f06a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l376_c11_a866]
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_a866_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_a866_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_a866_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l376_c7_e6fb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e6fb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e6fb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e6fb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e6fb_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l376_c7_e6fb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e6fb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e6fb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e6fb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e6fb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l376_c7_e6fb]
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_e6fb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_e6fb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_e6fb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_e6fb_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l380_c11_d526]
signal BIN_OP_EQ_uxn_opcodes_h_l380_c11_d526_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l380_c11_d526_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l380_c11_d526_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l380_c7_4e36]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_4e36_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_4e36_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_4e36_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_4e36_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l380_c7_4e36]
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_4e36_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_4e36_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_4e36_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_4e36_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l380_c7_4e36]
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_4e36_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_4e36_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_4e36_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_4e36_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l384_c11_ea33]
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_ea33_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_ea33_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_ea33_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l384_c7_d9b7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_d9b7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_d9b7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_d9b7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_d9b7_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l384_c7_d9b7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_d9b7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_d9b7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_d9b7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_d9b7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l384_c7_d9b7]
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_d9b7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_d9b7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_d9b7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_d9b7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l388_c11_5bb6]
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_5bb6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_5bb6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_5bb6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l388_c7_4983]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4983_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4983_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4983_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4983_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l388_c7_4983]
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4983_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4983_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4983_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4983_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l388_c7_4983]
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_4983_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_4983_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_4983_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_4983_return_output : unsigned(7 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_ee25( ref_toks_0 : opcode_result_t;
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
      base.is_ram_write := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.u8_value := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_vram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l339_c6_59bb
BIN_OP_EQ_uxn_opcodes_h_l339_c6_59bb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l339_c6_59bb_left,
BIN_OP_EQ_uxn_opcodes_h_l339_c6_59bb_right,
BIN_OP_EQ_uxn_opcodes_h_l339_c6_59bb_return_output);

-- t16_high_MUX_uxn_opcodes_h_l339_c2_ec9d
t16_high_MUX_uxn_opcodes_h_l339_c2_ec9d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_cond,
t16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue,
t16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse,
t16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_ec9d
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_ec9d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_ec9d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_ec9d
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_ec9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_ec9d
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_ec9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_ec9d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_ec9d
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_ec9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_ec9d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_ec9d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_ec9d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_ec9d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_ec9d
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_ec9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_ec9d_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l339_c2_ec9d
result_u8_value_MUX_uxn_opcodes_h_l339_c2_ec9d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l339_c2_ec9d_cond,
result_u8_value_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_ec9d
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_ec9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_ec9d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_ec9d
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_ec9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output);

-- n16_high_MUX_uxn_opcodes_h_l339_c2_ec9d
n16_high_MUX_uxn_opcodes_h_l339_c2_ec9d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_cond,
n16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue,
n16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse,
n16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output);

-- t16_low_MUX_uxn_opcodes_h_l339_c2_ec9d
t16_low_MUX_uxn_opcodes_h_l339_c2_ec9d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_cond,
t16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue,
t16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse,
t16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output);

-- n16_low_MUX_uxn_opcodes_h_l339_c2_ec9d
n16_low_MUX_uxn_opcodes_h_l339_c2_ec9d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_cond,
n16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue,
n16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse,
n16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l352_c11_9341
BIN_OP_EQ_uxn_opcodes_h_l352_c11_9341 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l352_c11_9341_left,
BIN_OP_EQ_uxn_opcodes_h_l352_c11_9341_right,
BIN_OP_EQ_uxn_opcodes_h_l352_c11_9341_return_output);

-- t16_high_MUX_uxn_opcodes_h_l352_c7_dc04
t16_high_MUX_uxn_opcodes_h_l352_c7_dc04 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l352_c7_dc04_cond,
t16_high_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue,
t16_high_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse,
t16_high_MUX_uxn_opcodes_h_l352_c7_dc04_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_dc04
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_dc04 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_dc04_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_dc04_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l352_c7_dc04
result_u8_value_MUX_uxn_opcodes_h_l352_c7_dc04 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l352_c7_dc04_cond,
result_u8_value_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l352_c7_dc04_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_dc04
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_dc04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_dc04_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_dc04_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_dc04
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_dc04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_dc04_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_dc04_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_dc04
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_dc04 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_dc04_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_dc04_return_output);

-- n16_high_MUX_uxn_opcodes_h_l352_c7_dc04
n16_high_MUX_uxn_opcodes_h_l352_c7_dc04 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l352_c7_dc04_cond,
n16_high_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue,
n16_high_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse,
n16_high_MUX_uxn_opcodes_h_l352_c7_dc04_return_output);

-- t16_low_MUX_uxn_opcodes_h_l352_c7_dc04
t16_low_MUX_uxn_opcodes_h_l352_c7_dc04 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l352_c7_dc04_cond,
t16_low_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue,
t16_low_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse,
t16_low_MUX_uxn_opcodes_h_l352_c7_dc04_return_output);

-- n16_low_MUX_uxn_opcodes_h_l352_c7_dc04
n16_low_MUX_uxn_opcodes_h_l352_c7_dc04 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l352_c7_dc04_cond,
n16_low_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue,
n16_low_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse,
n16_low_MUX_uxn_opcodes_h_l352_c7_dc04_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l355_c11_08ea
BIN_OP_EQ_uxn_opcodes_h_l355_c11_08ea : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l355_c11_08ea_left,
BIN_OP_EQ_uxn_opcodes_h_l355_c11_08ea_right,
BIN_OP_EQ_uxn_opcodes_h_l355_c11_08ea_return_output);

-- t16_high_MUX_uxn_opcodes_h_l355_c7_788f
t16_high_MUX_uxn_opcodes_h_l355_c7_788f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l355_c7_788f_cond,
t16_high_MUX_uxn_opcodes_h_l355_c7_788f_iftrue,
t16_high_MUX_uxn_opcodes_h_l355_c7_788f_iffalse,
t16_high_MUX_uxn_opcodes_h_l355_c7_788f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_788f
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_788f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_788f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_788f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_788f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_788f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l355_c7_788f
result_u8_value_MUX_uxn_opcodes_h_l355_c7_788f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l355_c7_788f_cond,
result_u8_value_MUX_uxn_opcodes_h_l355_c7_788f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l355_c7_788f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l355_c7_788f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_788f
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_788f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_788f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_788f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_788f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_788f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_788f
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_788f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_788f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_788f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_788f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_788f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_788f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_788f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_788f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_788f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_788f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_788f_return_output);

-- n16_high_MUX_uxn_opcodes_h_l355_c7_788f
n16_high_MUX_uxn_opcodes_h_l355_c7_788f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l355_c7_788f_cond,
n16_high_MUX_uxn_opcodes_h_l355_c7_788f_iftrue,
n16_high_MUX_uxn_opcodes_h_l355_c7_788f_iffalse,
n16_high_MUX_uxn_opcodes_h_l355_c7_788f_return_output);

-- t16_low_MUX_uxn_opcodes_h_l355_c7_788f
t16_low_MUX_uxn_opcodes_h_l355_c7_788f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l355_c7_788f_cond,
t16_low_MUX_uxn_opcodes_h_l355_c7_788f_iftrue,
t16_low_MUX_uxn_opcodes_h_l355_c7_788f_iffalse,
t16_low_MUX_uxn_opcodes_h_l355_c7_788f_return_output);

-- n16_low_MUX_uxn_opcodes_h_l355_c7_788f
n16_low_MUX_uxn_opcodes_h_l355_c7_788f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l355_c7_788f_cond,
n16_low_MUX_uxn_opcodes_h_l355_c7_788f_iftrue,
n16_low_MUX_uxn_opcodes_h_l355_c7_788f_iffalse,
n16_low_MUX_uxn_opcodes_h_l355_c7_788f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l359_c11_0f81
BIN_OP_EQ_uxn_opcodes_h_l359_c11_0f81 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l359_c11_0f81_left,
BIN_OP_EQ_uxn_opcodes_h_l359_c11_0f81_right,
BIN_OP_EQ_uxn_opcodes_h_l359_c11_0f81_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_a392
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_a392 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_a392_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_a392_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_a392_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_a392_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l359_c7_a392
result_u8_value_MUX_uxn_opcodes_h_l359_c7_a392 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l359_c7_a392_cond,
result_u8_value_MUX_uxn_opcodes_h_l359_c7_a392_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l359_c7_a392_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l359_c7_a392_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_a392
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_a392 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_a392_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_a392_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_a392_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_a392_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_a392
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_a392 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_a392_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_a392_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_a392_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_a392_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_a392
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_a392 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_a392_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_a392_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_a392_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_a392_return_output);

-- n16_high_MUX_uxn_opcodes_h_l359_c7_a392
n16_high_MUX_uxn_opcodes_h_l359_c7_a392 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l359_c7_a392_cond,
n16_high_MUX_uxn_opcodes_h_l359_c7_a392_iftrue,
n16_high_MUX_uxn_opcodes_h_l359_c7_a392_iffalse,
n16_high_MUX_uxn_opcodes_h_l359_c7_a392_return_output);

-- t16_low_MUX_uxn_opcodes_h_l359_c7_a392
t16_low_MUX_uxn_opcodes_h_l359_c7_a392 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l359_c7_a392_cond,
t16_low_MUX_uxn_opcodes_h_l359_c7_a392_iftrue,
t16_low_MUX_uxn_opcodes_h_l359_c7_a392_iffalse,
t16_low_MUX_uxn_opcodes_h_l359_c7_a392_return_output);

-- n16_low_MUX_uxn_opcodes_h_l359_c7_a392
n16_low_MUX_uxn_opcodes_h_l359_c7_a392 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l359_c7_a392_cond,
n16_low_MUX_uxn_opcodes_h_l359_c7_a392_iftrue,
n16_low_MUX_uxn_opcodes_h_l359_c7_a392_iffalse,
n16_low_MUX_uxn_opcodes_h_l359_c7_a392_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l363_c11_5ff5
BIN_OP_EQ_uxn_opcodes_h_l363_c11_5ff5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l363_c11_5ff5_left,
BIN_OP_EQ_uxn_opcodes_h_l363_c11_5ff5_right,
BIN_OP_EQ_uxn_opcodes_h_l363_c11_5ff5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_34db
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_34db : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_34db_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_34db_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_34db_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_34db_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l363_c7_34db
result_u8_value_MUX_uxn_opcodes_h_l363_c7_34db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l363_c7_34db_cond,
result_u8_value_MUX_uxn_opcodes_h_l363_c7_34db_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l363_c7_34db_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l363_c7_34db_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_34db
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_34db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_34db_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_34db_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_34db_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_34db_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_34db
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_34db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_34db_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_34db_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_34db_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_34db_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_34db
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_34db : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_34db_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_34db_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_34db_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_34db_return_output);

-- n16_high_MUX_uxn_opcodes_h_l363_c7_34db
n16_high_MUX_uxn_opcodes_h_l363_c7_34db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l363_c7_34db_cond,
n16_high_MUX_uxn_opcodes_h_l363_c7_34db_iftrue,
n16_high_MUX_uxn_opcodes_h_l363_c7_34db_iffalse,
n16_high_MUX_uxn_opcodes_h_l363_c7_34db_return_output);

-- n16_low_MUX_uxn_opcodes_h_l363_c7_34db
n16_low_MUX_uxn_opcodes_h_l363_c7_34db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l363_c7_34db_cond,
n16_low_MUX_uxn_opcodes_h_l363_c7_34db_iftrue,
n16_low_MUX_uxn_opcodes_h_l363_c7_34db_iffalse,
n16_low_MUX_uxn_opcodes_h_l363_c7_34db_return_output);

-- sp_relative_shift_uxn_opcodes_h_l365_c30_76db
sp_relative_shift_uxn_opcodes_h_l365_c30_76db : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l365_c30_76db_ins,
sp_relative_shift_uxn_opcodes_h_l365_c30_76db_x,
sp_relative_shift_uxn_opcodes_h_l365_c30_76db_y,
sp_relative_shift_uxn_opcodes_h_l365_c30_76db_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l370_c11_7f2d
BIN_OP_EQ_uxn_opcodes_h_l370_c11_7f2d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l370_c11_7f2d_left,
BIN_OP_EQ_uxn_opcodes_h_l370_c11_7f2d_right,
BIN_OP_EQ_uxn_opcodes_h_l370_c11_7f2d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_f06a
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_f06a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_f06a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_f06a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_f06a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_f06a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_f06a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_f06a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_f06a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_f06a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_f06a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_f06a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_f06a
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_f06a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_f06a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_f06a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_f06a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_f06a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l370_c7_f06a
result_u8_value_MUX_uxn_opcodes_h_l370_c7_f06a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l370_c7_f06a_cond,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_f06a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_f06a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_f06a_return_output);

-- n16_low_MUX_uxn_opcodes_h_l370_c7_f06a
n16_low_MUX_uxn_opcodes_h_l370_c7_f06a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l370_c7_f06a_cond,
n16_low_MUX_uxn_opcodes_h_l370_c7_f06a_iftrue,
n16_low_MUX_uxn_opcodes_h_l370_c7_f06a_iffalse,
n16_low_MUX_uxn_opcodes_h_l370_c7_f06a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l376_c11_a866
BIN_OP_EQ_uxn_opcodes_h_l376_c11_a866 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l376_c11_a866_left,
BIN_OP_EQ_uxn_opcodes_h_l376_c11_a866_right,
BIN_OP_EQ_uxn_opcodes_h_l376_c11_a866_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e6fb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e6fb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e6fb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e6fb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e6fb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e6fb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e6fb
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e6fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e6fb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e6fb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e6fb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e6fb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l376_c7_e6fb
result_u8_value_MUX_uxn_opcodes_h_l376_c7_e6fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l376_c7_e6fb_cond,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_e6fb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_e6fb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_e6fb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l380_c11_d526
BIN_OP_EQ_uxn_opcodes_h_l380_c11_d526 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l380_c11_d526_left,
BIN_OP_EQ_uxn_opcodes_h_l380_c11_d526_right,
BIN_OP_EQ_uxn_opcodes_h_l380_c11_d526_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_4e36
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_4e36 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_4e36_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_4e36_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_4e36_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_4e36_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_4e36
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_4e36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_4e36_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_4e36_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_4e36_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_4e36_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l380_c7_4e36
result_u8_value_MUX_uxn_opcodes_h_l380_c7_4e36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l380_c7_4e36_cond,
result_u8_value_MUX_uxn_opcodes_h_l380_c7_4e36_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l380_c7_4e36_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l380_c7_4e36_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l384_c11_ea33
BIN_OP_EQ_uxn_opcodes_h_l384_c11_ea33 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l384_c11_ea33_left,
BIN_OP_EQ_uxn_opcodes_h_l384_c11_ea33_right,
BIN_OP_EQ_uxn_opcodes_h_l384_c11_ea33_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_d9b7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_d9b7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_d9b7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_d9b7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_d9b7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_d9b7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_d9b7
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_d9b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_d9b7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_d9b7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_d9b7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_d9b7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l384_c7_d9b7
result_u8_value_MUX_uxn_opcodes_h_l384_c7_d9b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l384_c7_d9b7_cond,
result_u8_value_MUX_uxn_opcodes_h_l384_c7_d9b7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l384_c7_d9b7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l384_c7_d9b7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l388_c11_5bb6
BIN_OP_EQ_uxn_opcodes_h_l388_c11_5bb6 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l388_c11_5bb6_left,
BIN_OP_EQ_uxn_opcodes_h_l388_c11_5bb6_right,
BIN_OP_EQ_uxn_opcodes_h_l388_c11_5bb6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4983
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4983 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4983_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4983_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4983_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4983_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4983
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4983 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4983_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4983_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4983_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4983_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l388_c7_4983
result_u8_value_MUX_uxn_opcodes_h_l388_c7_4983 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l388_c7_4983_cond,
result_u8_value_MUX_uxn_opcodes_h_l388_c7_4983_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l388_c7_4983_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l388_c7_4983_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l339_c6_59bb_return_output,
 t16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output,
 n16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output,
 t16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output,
 n16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l352_c11_9341_return_output,
 t16_high_MUX_uxn_opcodes_h_l352_c7_dc04_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_dc04_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l352_c7_dc04_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_dc04_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_dc04_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_dc04_return_output,
 n16_high_MUX_uxn_opcodes_h_l352_c7_dc04_return_output,
 t16_low_MUX_uxn_opcodes_h_l352_c7_dc04_return_output,
 n16_low_MUX_uxn_opcodes_h_l352_c7_dc04_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l355_c11_08ea_return_output,
 t16_high_MUX_uxn_opcodes_h_l355_c7_788f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_788f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l355_c7_788f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_788f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_788f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_788f_return_output,
 n16_high_MUX_uxn_opcodes_h_l355_c7_788f_return_output,
 t16_low_MUX_uxn_opcodes_h_l355_c7_788f_return_output,
 n16_low_MUX_uxn_opcodes_h_l355_c7_788f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l359_c11_0f81_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_a392_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l359_c7_a392_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_a392_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_a392_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_a392_return_output,
 n16_high_MUX_uxn_opcodes_h_l359_c7_a392_return_output,
 t16_low_MUX_uxn_opcodes_h_l359_c7_a392_return_output,
 n16_low_MUX_uxn_opcodes_h_l359_c7_a392_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l363_c11_5ff5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_34db_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l363_c7_34db_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_34db_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_34db_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_34db_return_output,
 n16_high_MUX_uxn_opcodes_h_l363_c7_34db_return_output,
 n16_low_MUX_uxn_opcodes_h_l363_c7_34db_return_output,
 sp_relative_shift_uxn_opcodes_h_l365_c30_76db_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l370_c11_7f2d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_f06a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_f06a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_f06a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l370_c7_f06a_return_output,
 n16_low_MUX_uxn_opcodes_h_l370_c7_f06a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l376_c11_a866_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e6fb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e6fb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l376_c7_e6fb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l380_c11_d526_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_4e36_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_4e36_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l380_c7_4e36_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l384_c11_ea33_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_d9b7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_d9b7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l384_c7_d9b7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l388_c11_5bb6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4983_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4983_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l388_c7_4983_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_59bb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_59bb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_59bb_return_output : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_dc04_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l344_c3_451f : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_dc04_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_ec9d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l339_c2_ec9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_dc04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_ec9d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_dc04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_ec9d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l349_c3_fc03 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_dc04_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_ec9d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l339_c2_ec9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_ec9d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_dc04_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_ec9d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l339_c2_ec9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_ec9d_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l339_c2_ec9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_dc04_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_dc04_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_dc04_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_9341_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_9341_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_9341_return_output : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_788f_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_dc04_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_788f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_dc04_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_788f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_dc04_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_788f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_dc04_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_788f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_dc04_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l353_c3_5db2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_788f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_dc04_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_788f_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_dc04_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_788f_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_dc04_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_788f_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_dc04_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_08ea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_08ea_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_08ea_return_output : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_788f_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_788f_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_788f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_788f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_788f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_a392_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_788f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_788f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_788f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_a392_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_788f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_788f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_788f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_a392_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_788f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_788f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_788f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_a392_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_788f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_788f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_2571 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_788f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_a392_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_788f_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_788f_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_788f_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_a392_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_788f_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_788f_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_788f_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_a392_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_788f_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_788f_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_788f_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_a392_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_788f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0f81_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0f81_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0f81_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_a392_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_a392_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_34db_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_a392_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_a392_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_a392_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_34db_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_a392_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_a392_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_a392_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_34db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_a392_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_a392_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_a392_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_34db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_a392_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_a392_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l361_c3_7af0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_a392_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_34db_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_a392_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_a392_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_a392_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_34db_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_a392_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_a392_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_a392_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_a392_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_a392_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_a392_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_34db_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_a392_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_5ff5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_5ff5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_5ff5_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_34db_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_34db_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_f06a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_34db_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_34db_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_34db_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_f06a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_34db_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_34db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_34db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_34db_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_34db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_34db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_f06a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_34db_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_34db_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_13e3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_34db_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_f06a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_34db_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_34db_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_34db_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_34db_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_34db_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_34db_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_f06a_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_34db_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_76db_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_76db_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_76db_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_76db_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_7f2d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_7f2d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_7f2d_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_f06a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l372_c3_b667 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_f06a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_f06a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_f06a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l373_c3_d1e6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_f06a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e6fb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_f06a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_f06a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_f06a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e6fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_f06a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_f06a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_f06a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_e6fb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_f06a_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_f06a_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_f06a_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_f06a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_a866_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_a866_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_a866_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e6fb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_0994 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e6fb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_4e36_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e6fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e6fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e6fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_4e36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e6fb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_e6fb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_e6fb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_4e36_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_e6fb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_d526_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_d526_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_d526_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_4e36_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_6ca5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_4e36_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_d9b7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_4e36_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_4e36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_4e36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_d9b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_4e36_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_4e36_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_4e36_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_d9b7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_4e36_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_ea33_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_ea33_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_ea33_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_d9b7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_0aea : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_d9b7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4983_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_d9b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_d9b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_d9b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4983_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_d9b7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_d9b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_d9b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_4983_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_d9b7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_5bb6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_5bb6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_5bb6_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4983_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_4bbc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4983_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l388_c7_4983_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4983_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4983_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4983_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4983_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_4983_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_4983_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_4983_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_cf54_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l370_l359_l352_l355_DUPLICATE_d688_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l359_l352_l363_l355_DUPLICATE_1c55_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l359_l388_l355_l384_l352_l380_l376_l370_l363_DUPLICATE_3144_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l394_l335_DUPLICATE_8758_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_59bb_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_4bbc := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4983_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_4bbc;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_2571 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_788f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_2571;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_34db_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_0aea := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_d9b7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_0aea;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_13e3 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_34db_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_13e3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_d526_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_5bb6_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l349_c3_fc03 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l349_c3_fc03;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_9341_right := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_76db_y := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_5ff5_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_0994 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e6fb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_0994;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l353_c3_5db2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l353_c3_5db2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_ea33_right := to_unsigned(8, 4);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4983_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l373_c3_d1e6 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_f06a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l373_c3_d1e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_a866_right := to_unsigned(6, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_76db_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_08ea_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0f81_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l361_c3_7af0 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_a392_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l361_c3_7af0;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l344_c3_451f := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l344_c3_451f;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l372_c3_b667 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_f06a_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l372_c3_b667;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_6ca5 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_4e36_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_6ca5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_7f2d_right := to_unsigned(5, 3);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_76db_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_788f_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_a392_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_34db_iffalse := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_4e36_iftrue := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_4983_iftrue := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_788f_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_a392_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_34db_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_f06a_iffalse := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_e6fb_iftrue := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_d9b7_iftrue := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_59bb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_9341_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_08ea_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0f81_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_5ff5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_7f2d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_a866_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_d526_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_ea33_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_5bb6_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_34db_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_f06a_iftrue := VAR_previous_stack_read;
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_788f_iftrue := VAR_previous_stack_read;
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_a392_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_f06a_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_788f_iffalse := t16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_34db_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_788f_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_a392_iffalse := t16_low;
     -- BIN_OP_EQ[uxn_opcodes_h_l376_c11_a866] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l376_c11_a866_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_a866_left;
     BIN_OP_EQ_uxn_opcodes_h_l376_c11_a866_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_a866_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_a866_return_output := BIN_OP_EQ_uxn_opcodes_h_l376_c11_a866_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l388_c7_4983] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l388_c7_4983_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l359_c11_0f81] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l359_c11_0f81_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0f81_left;
     BIN_OP_EQ_uxn_opcodes_h_l359_c11_0f81_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0f81_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0f81_return_output := BIN_OP_EQ_uxn_opcodes_h_l359_c11_0f81_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l363_c11_5ff5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l363_c11_5ff5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_5ff5_left;
     BIN_OP_EQ_uxn_opcodes_h_l363_c11_5ff5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_5ff5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_5ff5_return_output := BIN_OP_EQ_uxn_opcodes_h_l363_c11_5ff5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l388_c11_5bb6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l388_c11_5bb6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_5bb6_left;
     BIN_OP_EQ_uxn_opcodes_h_l388_c11_5bb6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_5bb6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_5bb6_return_output := BIN_OP_EQ_uxn_opcodes_h_l388_c11_5bb6_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l370_l359_l352_l355_DUPLICATE_d688 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l370_l359_l352_l355_DUPLICATE_d688_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l384_c11_ea33] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l384_c11_ea33_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_ea33_left;
     BIN_OP_EQ_uxn_opcodes_h_l384_c11_ea33_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_ea33_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_ea33_return_output := BIN_OP_EQ_uxn_opcodes_h_l384_c11_ea33_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l355_c11_08ea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l355_c11_08ea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_08ea_left;
     BIN_OP_EQ_uxn_opcodes_h_l355_c11_08ea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_08ea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_08ea_return_output := BIN_OP_EQ_uxn_opcodes_h_l355_c11_08ea_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l339_c6_59bb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l339_c6_59bb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_59bb_left;
     BIN_OP_EQ_uxn_opcodes_h_l339_c6_59bb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_59bb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_59bb_return_output := BIN_OP_EQ_uxn_opcodes_h_l339_c6_59bb_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l339_c2_ec9d] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l339_c2_ec9d_return_output := result.is_pc_updated;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l339_c2_ec9d] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l339_c2_ec9d_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l359_l388_l355_l384_l352_l380_l376_l370_l363_DUPLICATE_3144 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l359_l388_l355_l384_l352_l380_l376_l370_l363_DUPLICATE_3144_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_cf54 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_cf54_return_output := result.u8_value;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l339_c2_ec9d] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l339_c2_ec9d_return_output := result.is_ram_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l339_c2_ec9d] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l339_c2_ec9d_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l359_l352_l363_l355_DUPLICATE_1c55 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l359_l352_l363_l355_DUPLICATE_1c55_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l370_c11_7f2d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l370_c11_7f2d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_7f2d_left;
     BIN_OP_EQ_uxn_opcodes_h_l370_c11_7f2d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_7f2d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_7f2d_return_output := BIN_OP_EQ_uxn_opcodes_h_l370_c11_7f2d_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l365_c30_76db] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l365_c30_76db_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_76db_ins;
     sp_relative_shift_uxn_opcodes_h_l365_c30_76db_x <= VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_76db_x;
     sp_relative_shift_uxn_opcodes_h_l365_c30_76db_y <= VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_76db_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_76db_return_output := sp_relative_shift_uxn_opcodes_h_l365_c30_76db_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l380_c11_d526] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l380_c11_d526_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_d526_left;
     BIN_OP_EQ_uxn_opcodes_h_l380_c11_d526_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_d526_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_d526_return_output := BIN_OP_EQ_uxn_opcodes_h_l380_c11_d526_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l352_c11_9341] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l352_c11_9341_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_9341_left;
     BIN_OP_EQ_uxn_opcodes_h_l352_c11_9341_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_9341_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_9341_return_output := BIN_OP_EQ_uxn_opcodes_h_l352_c11_9341_return_output;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_59bb_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_59bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_ec9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_59bb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_ec9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_59bb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_59bb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_ec9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_59bb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_ec9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_59bb_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_59bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_ec9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_59bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_ec9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_59bb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_ec9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_59bb_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_59bb_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_59bb_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_dc04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_9341_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_dc04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_9341_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_dc04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_9341_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_dc04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_9341_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_dc04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_9341_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_dc04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_9341_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_dc04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_9341_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_dc04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_9341_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_dc04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_9341_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_788f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_08ea_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_788f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_08ea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_788f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_08ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_788f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_08ea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_788f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_08ea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_788f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_08ea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_788f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_08ea_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_788f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_08ea_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_788f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_08ea_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_a392_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0f81_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_a392_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0f81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_a392_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0f81_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_a392_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0f81_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_a392_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0f81_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_a392_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0f81_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_a392_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0f81_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_a392_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0f81_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_34db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_5ff5_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_34db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_5ff5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_34db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_5ff5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_34db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_5ff5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_34db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_5ff5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_34db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_5ff5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_34db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_5ff5_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_f06a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_7f2d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_f06a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_7f2d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_f06a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_7f2d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_f06a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_7f2d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_f06a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_7f2d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e6fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_a866_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e6fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_a866_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_e6fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_a866_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_4e36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_d526_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_4e36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_d526_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_4e36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_d526_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_d9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_ea33_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_d9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_ea33_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_d9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_ea33_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4983_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_5bb6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4983_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_5bb6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_4983_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_5bb6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l370_l359_l352_l355_DUPLICATE_d688_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_788f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l370_l359_l352_l355_DUPLICATE_d688_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_a392_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l370_l359_l352_l355_DUPLICATE_d688_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_f06a_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l370_l359_l352_l355_DUPLICATE_d688_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l359_l388_l355_l384_l352_l380_l376_l370_l363_DUPLICATE_3144_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_788f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l359_l388_l355_l384_l352_l380_l376_l370_l363_DUPLICATE_3144_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_a392_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l359_l388_l355_l384_l352_l380_l376_l370_l363_DUPLICATE_3144_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_34db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l359_l388_l355_l384_l352_l380_l376_l370_l363_DUPLICATE_3144_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_f06a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l359_l388_l355_l384_l352_l380_l376_l370_l363_DUPLICATE_3144_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e6fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l359_l388_l355_l384_l352_l380_l376_l370_l363_DUPLICATE_3144_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_4e36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l359_l388_l355_l384_l352_l380_l376_l370_l363_DUPLICATE_3144_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_d9b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l359_l388_l355_l384_l352_l380_l376_l370_l363_DUPLICATE_3144_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4983_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l359_l388_l355_l384_l352_l380_l376_l370_l363_DUPLICATE_3144_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l359_l352_l363_l355_DUPLICATE_1c55_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_788f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l359_l352_l363_l355_DUPLICATE_1c55_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_a392_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l359_l352_l363_l355_DUPLICATE_1c55_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_34db_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l359_l352_l363_l355_DUPLICATE_1c55_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_cf54_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_cf54_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_788f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_cf54_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_a392_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_cf54_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_4983_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_cf54_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l339_c2_ec9d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l339_c2_ec9d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l339_c2_ec9d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l339_c2_ec9d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4983_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l388_c7_4983_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_34db_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_76db_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l339_c2_ec9d] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_ec9d_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_ec9d_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l388_c7_4983] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4983_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4983_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4983_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4983_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4983_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4983_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4983_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4983_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l363_c7_34db] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l363_c7_34db_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_34db_cond;
     n16_high_MUX_uxn_opcodes_h_l363_c7_34db_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_34db_iftrue;
     n16_high_MUX_uxn_opcodes_h_l363_c7_34db_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_34db_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_34db_return_output := n16_high_MUX_uxn_opcodes_h_l363_c7_34db_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l355_c7_788f] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l355_c7_788f_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_788f_cond;
     t16_high_MUX_uxn_opcodes_h_l355_c7_788f_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_788f_iftrue;
     t16_high_MUX_uxn_opcodes_h_l355_c7_788f_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_788f_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_788f_return_output := t16_high_MUX_uxn_opcodes_h_l355_c7_788f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l370_c7_f06a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_f06a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_f06a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_f06a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_f06a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_f06a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_f06a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_f06a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_f06a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l363_c7_34db] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_34db_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_34db_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_34db_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_34db_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_34db_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_34db_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_34db_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_34db_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l370_c7_f06a] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l370_c7_f06a_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_f06a_cond;
     n16_low_MUX_uxn_opcodes_h_l370_c7_f06a_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_f06a_iftrue;
     n16_low_MUX_uxn_opcodes_h_l370_c7_f06a_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_f06a_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_f06a_return_output := n16_low_MUX_uxn_opcodes_h_l370_c7_f06a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l339_c2_ec9d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_ec9d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_ec9d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l339_c2_ec9d] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l339_c2_ec9d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l359_c7_a392] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l359_c7_a392_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_a392_cond;
     t16_low_MUX_uxn_opcodes_h_l359_c7_a392_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_a392_iftrue;
     t16_low_MUX_uxn_opcodes_h_l359_c7_a392_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_a392_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_a392_return_output := t16_low_MUX_uxn_opcodes_h_l359_c7_a392_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l388_c7_4983] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4983_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4983_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4983_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4983_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4983_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4983_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4983_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4983_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l388_c7_4983] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l388_c7_4983_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_4983_cond;
     result_u8_value_MUX_uxn_opcodes_h_l388_c7_4983_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_4983_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l388_c7_4983_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_4983_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_4983_return_output := result_u8_value_MUX_uxn_opcodes_h_l388_c7_4983_return_output;

     -- Submodule level 2
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_a392_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_34db_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_34db_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_f06a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_d9b7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4983_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_a392_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_34db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_34db_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_f06a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_d9b7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4983_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_d9b7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_4983_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_788f_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_788f_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_a392_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l359_c7_a392] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_a392_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_a392_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_a392_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_a392_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_a392_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_a392_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_a392_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_a392_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l352_c7_dc04] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l352_c7_dc04_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_dc04_cond;
     t16_high_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue;
     t16_high_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_dc04_return_output := t16_high_MUX_uxn_opcodes_h_l352_c7_dc04_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l384_c7_d9b7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l384_c7_d9b7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_d9b7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l384_c7_d9b7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_d9b7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l384_c7_d9b7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_d9b7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_d9b7_return_output := result_u8_value_MUX_uxn_opcodes_h_l384_c7_d9b7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l363_c7_34db] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_34db_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_34db_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_34db_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_34db_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_34db_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_34db_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_34db_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_34db_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l359_c7_a392] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l359_c7_a392_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_a392_cond;
     n16_high_MUX_uxn_opcodes_h_l359_c7_a392_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_a392_iftrue;
     n16_high_MUX_uxn_opcodes_h_l359_c7_a392_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_a392_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_a392_return_output := n16_high_MUX_uxn_opcodes_h_l359_c7_a392_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l355_c7_788f] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l355_c7_788f_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_788f_cond;
     t16_low_MUX_uxn_opcodes_h_l355_c7_788f_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_788f_iftrue;
     t16_low_MUX_uxn_opcodes_h_l355_c7_788f_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_788f_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_788f_return_output := t16_low_MUX_uxn_opcodes_h_l355_c7_788f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l384_c7_d9b7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_d9b7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_d9b7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_d9b7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_d9b7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_d9b7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_d9b7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_d9b7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_d9b7_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l363_c7_34db] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l363_c7_34db_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_34db_cond;
     n16_low_MUX_uxn_opcodes_h_l363_c7_34db_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_34db_iftrue;
     n16_low_MUX_uxn_opcodes_h_l363_c7_34db_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_34db_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_34db_return_output := n16_low_MUX_uxn_opcodes_h_l363_c7_34db_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l384_c7_d9b7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_d9b7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_d9b7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_d9b7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_d9b7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_d9b7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_d9b7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_d9b7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_d9b7_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_788f_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_a392_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_a392_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_34db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_4e36_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_d9b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_788f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_a392_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_a392_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_34db_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_4e36_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_d9b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_4e36_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_d9b7_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_dc04_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_788f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l380_c7_4e36] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_4e36_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_4e36_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_4e36_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_4e36_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_4e36_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_4e36_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_4e36_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_4e36_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l339_c2_ec9d] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_cond;
     t16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue;
     t16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output := t16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l380_c7_4e36] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_4e36_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_4e36_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_4e36_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_4e36_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_4e36_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_4e36_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_4e36_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_4e36_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l352_c7_dc04] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l352_c7_dc04_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_dc04_cond;
     t16_low_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue;
     t16_low_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_dc04_return_output := t16_low_MUX_uxn_opcodes_h_l352_c7_dc04_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l380_c7_4e36] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l380_c7_4e36_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_4e36_cond;
     result_u8_value_MUX_uxn_opcodes_h_l380_c7_4e36_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_4e36_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l380_c7_4e36_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_4e36_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_4e36_return_output := result_u8_value_MUX_uxn_opcodes_h_l380_c7_4e36_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l359_c7_a392] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l359_c7_a392_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_a392_cond;
     n16_low_MUX_uxn_opcodes_h_l359_c7_a392_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_a392_iftrue;
     n16_low_MUX_uxn_opcodes_h_l359_c7_a392_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_a392_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_a392_return_output := n16_low_MUX_uxn_opcodes_h_l359_c7_a392_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l355_c7_788f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_788f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_788f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_788f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_788f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_788f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_788f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_788f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_788f_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l355_c7_788f] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l355_c7_788f_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_788f_cond;
     n16_high_MUX_uxn_opcodes_h_l355_c7_788f_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_788f_iftrue;
     n16_high_MUX_uxn_opcodes_h_l355_c7_788f_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_788f_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_788f_return_output := n16_high_MUX_uxn_opcodes_h_l355_c7_788f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l359_c7_a392] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_a392_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_a392_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_a392_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_a392_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_a392_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_a392_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_a392_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_a392_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_788f_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_788f_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_a392_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e6fb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_4e36_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_788f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_788f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_a392_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e6fb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_4e36_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_e6fb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_4e36_return_output;
     REG_VAR_t16_high := VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_dc04_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l376_c7_e6fb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_e6fb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_e6fb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_e6fb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_e6fb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_e6fb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_e6fb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_e6fb_return_output := result_u8_value_MUX_uxn_opcodes_h_l376_c7_e6fb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l355_c7_788f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_788f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_788f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_788f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_788f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_788f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_788f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_788f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_788f_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l352_c7_dc04] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l352_c7_dc04_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_dc04_cond;
     n16_high_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue;
     n16_high_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_dc04_return_output := n16_high_MUX_uxn_opcodes_h_l352_c7_dc04_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l352_c7_dc04] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_dc04_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_dc04_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_dc04_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_dc04_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l355_c7_788f] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l355_c7_788f_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_788f_cond;
     n16_low_MUX_uxn_opcodes_h_l355_c7_788f_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_788f_iftrue;
     n16_low_MUX_uxn_opcodes_h_l355_c7_788f_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_788f_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_788f_return_output := n16_low_MUX_uxn_opcodes_h_l355_c7_788f_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l339_c2_ec9d] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_cond;
     t16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue;
     t16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output := t16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l376_c7_e6fb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e6fb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e6fb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e6fb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e6fb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e6fb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e6fb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e6fb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e6fb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l376_c7_e6fb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e6fb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e6fb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e6fb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e6fb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e6fb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e6fb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e6fb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e6fb_return_output;

     -- Submodule level 5
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_dc04_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_788f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_f06a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e6fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_dc04_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_788f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_f06a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e6fb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_f06a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_e6fb_return_output;
     REG_VAR_t16_low := VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l352_c7_dc04] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_dc04_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_dc04_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_dc04_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_dc04_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l339_c2_ec9d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_ec9d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_ec9d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l370_c7_f06a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_f06a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_f06a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_f06a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_f06a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_f06a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_f06a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_f06a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_f06a_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l339_c2_ec9d] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_cond;
     n16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue;
     n16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output := n16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l370_c7_f06a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_f06a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_f06a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_f06a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_f06a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_f06a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_f06a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_f06a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_f06a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l370_c7_f06a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_f06a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_f06a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_f06a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_f06a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_f06a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_f06a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_f06a_return_output := result_u8_value_MUX_uxn_opcodes_h_l370_c7_f06a_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l352_c7_dc04] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l352_c7_dc04_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_dc04_cond;
     n16_low_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue;
     n16_low_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_dc04_return_output := n16_low_MUX_uxn_opcodes_h_l352_c7_dc04_return_output;

     -- Submodule level 6
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_dc04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_34db_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_f06a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_dc04_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_34db_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_f06a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_34db_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_f06a_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l339_c2_ec9d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_ec9d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_ec9d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l363_c7_34db] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_34db_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_34db_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_34db_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_34db_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_34db_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_34db_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_34db_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_34db_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l363_c7_34db] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l363_c7_34db_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_34db_cond;
     result_u8_value_MUX_uxn_opcodes_h_l363_c7_34db_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_34db_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l363_c7_34db_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_34db_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_34db_return_output := result_u8_value_MUX_uxn_opcodes_h_l363_c7_34db_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l363_c7_34db] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_34db_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_34db_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_34db_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_34db_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_34db_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_34db_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_34db_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_34db_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l339_c2_ec9d] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_cond;
     n16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue;
     n16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output := n16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output;

     -- Submodule level 7
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_a392_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_34db_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_a392_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_34db_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_a392_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_34db_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l359_c7_a392] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_a392_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_a392_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_a392_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_a392_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_a392_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_a392_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_a392_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_a392_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l359_c7_a392] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l359_c7_a392_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_a392_cond;
     result_u8_value_MUX_uxn_opcodes_h_l359_c7_a392_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_a392_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l359_c7_a392_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_a392_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_a392_return_output := result_u8_value_MUX_uxn_opcodes_h_l359_c7_a392_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l359_c7_a392] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_a392_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_a392_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_a392_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_a392_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_a392_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_a392_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_a392_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_a392_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_788f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_a392_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_788f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_a392_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_788f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_a392_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l355_c7_788f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_788f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_788f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_788f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_788f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_788f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_788f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_788f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_788f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l355_c7_788f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l355_c7_788f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_788f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l355_c7_788f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_788f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l355_c7_788f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_788f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_788f_return_output := result_u8_value_MUX_uxn_opcodes_h_l355_c7_788f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l355_c7_788f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_788f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_788f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_788f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_788f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_788f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_788f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_788f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_788f_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_788f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_788f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_788f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l352_c7_dc04] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_dc04_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_dc04_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_dc04_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_dc04_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l352_c7_dc04] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_dc04_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_dc04_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_dc04_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_dc04_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l352_c7_dc04] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l352_c7_dc04_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_dc04_cond;
     result_u8_value_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_dc04_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_dc04_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_dc04_return_output := result_u8_value_MUX_uxn_opcodes_h_l352_c7_dc04_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_dc04_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_dc04_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_dc04_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l339_c2_ec9d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l339_c2_ec9d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_ec9d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output := result_u8_value_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l339_c2_ec9d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_ec9d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_ec9d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l339_c2_ec9d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_ec9d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_ec9d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_ec9d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_ec9d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l394_l335_DUPLICATE_8758 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l394_l335_DUPLICATE_8758_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_ee25(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_ec9d_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l394_l335_DUPLICATE_8758_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l394_l335_DUPLICATE_8758_return_output;
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
