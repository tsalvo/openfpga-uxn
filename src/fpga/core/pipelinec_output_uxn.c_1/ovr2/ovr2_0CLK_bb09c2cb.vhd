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
-- BIN_OP_EQ[uxn_opcodes_h_l339_c6_ec50]
signal BIN_OP_EQ_uxn_opcodes_h_l339_c6_ec50_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l339_c6_ec50_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l339_c6_ec50_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l339_c2_d5f7]
signal n16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l339_c2_d5f7]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_d5f7_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l339_c2_d5f7]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_d5f7_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l339_c2_d5f7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_d5f7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l339_c2_d5f7]
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_d5f7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l339_c2_d5f7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_d5f7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l339_c2_d5f7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_d5f7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l339_c2_d5f7]
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l339_c2_d5f7]
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l339_c2_d5f7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_d5f7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output : unsigned(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l339_c2_d5f7]
signal n16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l339_c2_d5f7]
signal t16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l339_c2_d5f7]
signal t16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l352_c11_32f9]
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_32f9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_32f9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_32f9_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l352_c7_406d]
signal n16_high_MUX_uxn_opcodes_h_l352_c7_406d_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l352_c7_406d_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l352_c7_406d_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l352_c7_406d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l352_c7_406d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_406d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_406d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_406d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_406d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l352_c7_406d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_406d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_406d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_406d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_406d_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l352_c7_406d]
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_406d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_406d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_406d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_406d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l352_c7_406d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_406d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_406d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_406d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_406d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l352_c7_406d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_406d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_406d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_406d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_406d_return_output : unsigned(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l352_c7_406d]
signal n16_low_MUX_uxn_opcodes_h_l352_c7_406d_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l352_c7_406d_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l352_c7_406d_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l352_c7_406d_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l352_c7_406d]
signal t16_high_MUX_uxn_opcodes_h_l352_c7_406d_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l352_c7_406d_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l352_c7_406d_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l352_c7_406d_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l352_c7_406d]
signal t16_low_MUX_uxn_opcodes_h_l352_c7_406d_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l352_c7_406d_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l352_c7_406d_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l352_c7_406d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l355_c11_3501]
signal BIN_OP_EQ_uxn_opcodes_h_l355_c11_3501_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l355_c11_3501_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l355_c11_3501_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l355_c7_a819]
signal n16_high_MUX_uxn_opcodes_h_l355_c7_a819_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l355_c7_a819_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l355_c7_a819_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l355_c7_a819_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l355_c7_a819]
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_a819_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_a819_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_a819_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_a819_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l355_c7_a819]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_a819_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_a819_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_a819_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_a819_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l355_c7_a819]
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_a819_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_a819_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_a819_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_a819_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l355_c7_a819]
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_a819_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_a819_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_a819_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_a819_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l355_c7_a819]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_a819_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_a819_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_a819_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_a819_return_output : unsigned(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l355_c7_a819]
signal n16_low_MUX_uxn_opcodes_h_l355_c7_a819_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l355_c7_a819_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l355_c7_a819_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l355_c7_a819_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l355_c7_a819]
signal t16_high_MUX_uxn_opcodes_h_l355_c7_a819_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l355_c7_a819_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l355_c7_a819_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l355_c7_a819_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l355_c7_a819]
signal t16_low_MUX_uxn_opcodes_h_l355_c7_a819_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l355_c7_a819_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l355_c7_a819_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l355_c7_a819_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l359_c11_9df8]
signal BIN_OP_EQ_uxn_opcodes_h_l359_c11_9df8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l359_c11_9df8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l359_c11_9df8_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l359_c7_0be5]
signal n16_high_MUX_uxn_opcodes_h_l359_c7_0be5_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l359_c7_0be5_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l359_c7_0be5_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l359_c7_0be5_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l359_c7_0be5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0be5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0be5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0be5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0be5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l359_c7_0be5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0be5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0be5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0be5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0be5_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l359_c7_0be5]
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_0be5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_0be5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_0be5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_0be5_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l359_c7_0be5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0be5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0be5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0be5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0be5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l359_c7_0be5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0be5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0be5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0be5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0be5_return_output : unsigned(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l359_c7_0be5]
signal n16_low_MUX_uxn_opcodes_h_l359_c7_0be5_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l359_c7_0be5_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l359_c7_0be5_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l359_c7_0be5_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l359_c7_0be5]
signal t16_low_MUX_uxn_opcodes_h_l359_c7_0be5_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l359_c7_0be5_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l359_c7_0be5_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l359_c7_0be5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l363_c11_7cdf]
signal BIN_OP_EQ_uxn_opcodes_h_l363_c11_7cdf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l363_c11_7cdf_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l363_c11_7cdf_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l363_c7_7a83]
signal n16_high_MUX_uxn_opcodes_h_l363_c7_7a83_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l363_c7_7a83_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l363_c7_7a83_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l363_c7_7a83_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l363_c7_7a83]
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7a83_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7a83_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7a83_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7a83_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l363_c7_7a83]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7a83_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7a83_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7a83_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7a83_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l363_c7_7a83]
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_7a83_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_7a83_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_7a83_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_7a83_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l363_c7_7a83]
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7a83_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7a83_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7a83_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7a83_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l363_c7_7a83]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7a83_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7a83_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7a83_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7a83_return_output : unsigned(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l363_c7_7a83]
signal n16_low_MUX_uxn_opcodes_h_l363_c7_7a83_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l363_c7_7a83_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l363_c7_7a83_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l363_c7_7a83_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l365_c30_1390]
signal sp_relative_shift_uxn_opcodes_h_l365_c30_1390_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l365_c30_1390_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l365_c30_1390_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l365_c30_1390_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l370_c11_fc40]
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_fc40_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_fc40_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_fc40_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l370_c7_d8d3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_d8d3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_d8d3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_d8d3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_d8d3_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l370_c7_d8d3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_d8d3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_d8d3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_d8d3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_d8d3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l370_c7_d8d3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_d8d3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_d8d3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_d8d3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_d8d3_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l370_c7_d8d3]
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_d8d3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_d8d3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_d8d3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_d8d3_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l370_c7_d8d3]
signal n16_low_MUX_uxn_opcodes_h_l370_c7_d8d3_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l370_c7_d8d3_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l370_c7_d8d3_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l370_c7_d8d3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l376_c11_8c7f]
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_8c7f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_8c7f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_8c7f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l376_c7_334b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_334b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_334b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_334b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_334b_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l376_c7_334b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_334b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_334b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_334b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_334b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l376_c7_334b]
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_334b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_334b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_334b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_334b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l380_c11_82f6]
signal BIN_OP_EQ_uxn_opcodes_h_l380_c11_82f6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l380_c11_82f6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l380_c11_82f6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l380_c7_592d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_592d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_592d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_592d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_592d_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l380_c7_592d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_592d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_592d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_592d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_592d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l380_c7_592d]
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_592d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_592d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_592d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_592d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l384_c11_7d4d]
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_7d4d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_7d4d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_7d4d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l384_c7_77d1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_77d1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_77d1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_77d1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_77d1_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l384_c7_77d1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_77d1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_77d1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_77d1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_77d1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l384_c7_77d1]
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_77d1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_77d1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_77d1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_77d1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l388_c11_82bd]
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_82bd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_82bd_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_82bd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l388_c7_4f32]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4f32_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4f32_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4f32_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4f32_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l388_c7_4f32]
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4f32_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4f32_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4f32_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4f32_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l388_c7_4f32]
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_4f32_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_4f32_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_4f32_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_4f32_return_output : unsigned(7 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_71f0( ref_toks_0 : opcode_result_t;
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
      base.is_stack_index_flipped := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l339_c6_ec50
BIN_OP_EQ_uxn_opcodes_h_l339_c6_ec50 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l339_c6_ec50_left,
BIN_OP_EQ_uxn_opcodes_h_l339_c6_ec50_right,
BIN_OP_EQ_uxn_opcodes_h_l339_c6_ec50_return_output);

-- n16_high_MUX_uxn_opcodes_h_l339_c2_d5f7
n16_high_MUX_uxn_opcodes_h_l339_c2_d5f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_cond,
n16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue,
n16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse,
n16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_d5f7
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_d5f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_d5f7_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_d5f7
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_d5f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_d5f7_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_d5f7
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_d5f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_d5f7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l339_c2_d5f7
result_u8_value_MUX_uxn_opcodes_h_l339_c2_d5f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l339_c2_d5f7_cond,
result_u8_value_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_d5f7
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_d5f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_d5f7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_d5f7
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_d5f7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_d5f7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_d5f7
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_d5f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_d5f7
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_d5f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_d5f7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_d5f7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_d5f7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output);

-- n16_low_MUX_uxn_opcodes_h_l339_c2_d5f7
n16_low_MUX_uxn_opcodes_h_l339_c2_d5f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_cond,
n16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue,
n16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse,
n16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output);

-- t16_high_MUX_uxn_opcodes_h_l339_c2_d5f7
t16_high_MUX_uxn_opcodes_h_l339_c2_d5f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_cond,
t16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue,
t16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse,
t16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output);

-- t16_low_MUX_uxn_opcodes_h_l339_c2_d5f7
t16_low_MUX_uxn_opcodes_h_l339_c2_d5f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_cond,
t16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue,
t16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse,
t16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l352_c11_32f9
BIN_OP_EQ_uxn_opcodes_h_l352_c11_32f9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l352_c11_32f9_left,
BIN_OP_EQ_uxn_opcodes_h_l352_c11_32f9_right,
BIN_OP_EQ_uxn_opcodes_h_l352_c11_32f9_return_output);

-- n16_high_MUX_uxn_opcodes_h_l352_c7_406d
n16_high_MUX_uxn_opcodes_h_l352_c7_406d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l352_c7_406d_cond,
n16_high_MUX_uxn_opcodes_h_l352_c7_406d_iftrue,
n16_high_MUX_uxn_opcodes_h_l352_c7_406d_iffalse,
n16_high_MUX_uxn_opcodes_h_l352_c7_406d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_406d
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_406d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_406d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_406d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_406d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_406d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_406d
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_406d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_406d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_406d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_406d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_406d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l352_c7_406d
result_u8_value_MUX_uxn_opcodes_h_l352_c7_406d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l352_c7_406d_cond,
result_u8_value_MUX_uxn_opcodes_h_l352_c7_406d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l352_c7_406d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l352_c7_406d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_406d
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_406d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_406d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_406d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_406d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_406d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_406d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_406d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_406d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_406d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_406d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_406d_return_output);

-- n16_low_MUX_uxn_opcodes_h_l352_c7_406d
n16_low_MUX_uxn_opcodes_h_l352_c7_406d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l352_c7_406d_cond,
n16_low_MUX_uxn_opcodes_h_l352_c7_406d_iftrue,
n16_low_MUX_uxn_opcodes_h_l352_c7_406d_iffalse,
n16_low_MUX_uxn_opcodes_h_l352_c7_406d_return_output);

-- t16_high_MUX_uxn_opcodes_h_l352_c7_406d
t16_high_MUX_uxn_opcodes_h_l352_c7_406d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l352_c7_406d_cond,
t16_high_MUX_uxn_opcodes_h_l352_c7_406d_iftrue,
t16_high_MUX_uxn_opcodes_h_l352_c7_406d_iffalse,
t16_high_MUX_uxn_opcodes_h_l352_c7_406d_return_output);

-- t16_low_MUX_uxn_opcodes_h_l352_c7_406d
t16_low_MUX_uxn_opcodes_h_l352_c7_406d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l352_c7_406d_cond,
t16_low_MUX_uxn_opcodes_h_l352_c7_406d_iftrue,
t16_low_MUX_uxn_opcodes_h_l352_c7_406d_iffalse,
t16_low_MUX_uxn_opcodes_h_l352_c7_406d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l355_c11_3501
BIN_OP_EQ_uxn_opcodes_h_l355_c11_3501 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l355_c11_3501_left,
BIN_OP_EQ_uxn_opcodes_h_l355_c11_3501_right,
BIN_OP_EQ_uxn_opcodes_h_l355_c11_3501_return_output);

-- n16_high_MUX_uxn_opcodes_h_l355_c7_a819
n16_high_MUX_uxn_opcodes_h_l355_c7_a819 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l355_c7_a819_cond,
n16_high_MUX_uxn_opcodes_h_l355_c7_a819_iftrue,
n16_high_MUX_uxn_opcodes_h_l355_c7_a819_iffalse,
n16_high_MUX_uxn_opcodes_h_l355_c7_a819_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_a819
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_a819 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_a819_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_a819_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_a819_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_a819_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_a819
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_a819 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_a819_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_a819_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_a819_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_a819_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l355_c7_a819
result_u8_value_MUX_uxn_opcodes_h_l355_c7_a819 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l355_c7_a819_cond,
result_u8_value_MUX_uxn_opcodes_h_l355_c7_a819_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l355_c7_a819_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l355_c7_a819_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_a819
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_a819 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_a819_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_a819_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_a819_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_a819_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_a819
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_a819 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_a819_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_a819_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_a819_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_a819_return_output);

-- n16_low_MUX_uxn_opcodes_h_l355_c7_a819
n16_low_MUX_uxn_opcodes_h_l355_c7_a819 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l355_c7_a819_cond,
n16_low_MUX_uxn_opcodes_h_l355_c7_a819_iftrue,
n16_low_MUX_uxn_opcodes_h_l355_c7_a819_iffalse,
n16_low_MUX_uxn_opcodes_h_l355_c7_a819_return_output);

-- t16_high_MUX_uxn_opcodes_h_l355_c7_a819
t16_high_MUX_uxn_opcodes_h_l355_c7_a819 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l355_c7_a819_cond,
t16_high_MUX_uxn_opcodes_h_l355_c7_a819_iftrue,
t16_high_MUX_uxn_opcodes_h_l355_c7_a819_iffalse,
t16_high_MUX_uxn_opcodes_h_l355_c7_a819_return_output);

-- t16_low_MUX_uxn_opcodes_h_l355_c7_a819
t16_low_MUX_uxn_opcodes_h_l355_c7_a819 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l355_c7_a819_cond,
t16_low_MUX_uxn_opcodes_h_l355_c7_a819_iftrue,
t16_low_MUX_uxn_opcodes_h_l355_c7_a819_iffalse,
t16_low_MUX_uxn_opcodes_h_l355_c7_a819_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l359_c11_9df8
BIN_OP_EQ_uxn_opcodes_h_l359_c11_9df8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l359_c11_9df8_left,
BIN_OP_EQ_uxn_opcodes_h_l359_c11_9df8_right,
BIN_OP_EQ_uxn_opcodes_h_l359_c11_9df8_return_output);

-- n16_high_MUX_uxn_opcodes_h_l359_c7_0be5
n16_high_MUX_uxn_opcodes_h_l359_c7_0be5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l359_c7_0be5_cond,
n16_high_MUX_uxn_opcodes_h_l359_c7_0be5_iftrue,
n16_high_MUX_uxn_opcodes_h_l359_c7_0be5_iffalse,
n16_high_MUX_uxn_opcodes_h_l359_c7_0be5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0be5
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0be5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0be5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0be5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0be5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0be5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0be5
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0be5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0be5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0be5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0be5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0be5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l359_c7_0be5
result_u8_value_MUX_uxn_opcodes_h_l359_c7_0be5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l359_c7_0be5_cond,
result_u8_value_MUX_uxn_opcodes_h_l359_c7_0be5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l359_c7_0be5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l359_c7_0be5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0be5
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0be5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0be5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0be5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0be5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0be5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0be5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0be5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0be5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0be5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0be5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0be5_return_output);

-- n16_low_MUX_uxn_opcodes_h_l359_c7_0be5
n16_low_MUX_uxn_opcodes_h_l359_c7_0be5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l359_c7_0be5_cond,
n16_low_MUX_uxn_opcodes_h_l359_c7_0be5_iftrue,
n16_low_MUX_uxn_opcodes_h_l359_c7_0be5_iffalse,
n16_low_MUX_uxn_opcodes_h_l359_c7_0be5_return_output);

-- t16_low_MUX_uxn_opcodes_h_l359_c7_0be5
t16_low_MUX_uxn_opcodes_h_l359_c7_0be5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l359_c7_0be5_cond,
t16_low_MUX_uxn_opcodes_h_l359_c7_0be5_iftrue,
t16_low_MUX_uxn_opcodes_h_l359_c7_0be5_iffalse,
t16_low_MUX_uxn_opcodes_h_l359_c7_0be5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l363_c11_7cdf
BIN_OP_EQ_uxn_opcodes_h_l363_c11_7cdf : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l363_c11_7cdf_left,
BIN_OP_EQ_uxn_opcodes_h_l363_c11_7cdf_right,
BIN_OP_EQ_uxn_opcodes_h_l363_c11_7cdf_return_output);

-- n16_high_MUX_uxn_opcodes_h_l363_c7_7a83
n16_high_MUX_uxn_opcodes_h_l363_c7_7a83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l363_c7_7a83_cond,
n16_high_MUX_uxn_opcodes_h_l363_c7_7a83_iftrue,
n16_high_MUX_uxn_opcodes_h_l363_c7_7a83_iffalse,
n16_high_MUX_uxn_opcodes_h_l363_c7_7a83_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7a83
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7a83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7a83_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7a83_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7a83_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7a83_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7a83
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7a83 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7a83_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7a83_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7a83_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7a83_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l363_c7_7a83
result_u8_value_MUX_uxn_opcodes_h_l363_c7_7a83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l363_c7_7a83_cond,
result_u8_value_MUX_uxn_opcodes_h_l363_c7_7a83_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l363_c7_7a83_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l363_c7_7a83_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7a83
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7a83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7a83_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7a83_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7a83_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7a83_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7a83
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7a83 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7a83_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7a83_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7a83_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7a83_return_output);

-- n16_low_MUX_uxn_opcodes_h_l363_c7_7a83
n16_low_MUX_uxn_opcodes_h_l363_c7_7a83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l363_c7_7a83_cond,
n16_low_MUX_uxn_opcodes_h_l363_c7_7a83_iftrue,
n16_low_MUX_uxn_opcodes_h_l363_c7_7a83_iffalse,
n16_low_MUX_uxn_opcodes_h_l363_c7_7a83_return_output);

-- sp_relative_shift_uxn_opcodes_h_l365_c30_1390
sp_relative_shift_uxn_opcodes_h_l365_c30_1390 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l365_c30_1390_ins,
sp_relative_shift_uxn_opcodes_h_l365_c30_1390_x,
sp_relative_shift_uxn_opcodes_h_l365_c30_1390_y,
sp_relative_shift_uxn_opcodes_h_l365_c30_1390_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l370_c11_fc40
BIN_OP_EQ_uxn_opcodes_h_l370_c11_fc40 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l370_c11_fc40_left,
BIN_OP_EQ_uxn_opcodes_h_l370_c11_fc40_right,
BIN_OP_EQ_uxn_opcodes_h_l370_c11_fc40_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_d8d3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_d8d3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_d8d3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_d8d3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_d8d3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_d8d3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_d8d3
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_d8d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_d8d3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_d8d3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_d8d3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_d8d3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_d8d3
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_d8d3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_d8d3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_d8d3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_d8d3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_d8d3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l370_c7_d8d3
result_u8_value_MUX_uxn_opcodes_h_l370_c7_d8d3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l370_c7_d8d3_cond,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_d8d3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_d8d3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_d8d3_return_output);

-- n16_low_MUX_uxn_opcodes_h_l370_c7_d8d3
n16_low_MUX_uxn_opcodes_h_l370_c7_d8d3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l370_c7_d8d3_cond,
n16_low_MUX_uxn_opcodes_h_l370_c7_d8d3_iftrue,
n16_low_MUX_uxn_opcodes_h_l370_c7_d8d3_iffalse,
n16_low_MUX_uxn_opcodes_h_l370_c7_d8d3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l376_c11_8c7f
BIN_OP_EQ_uxn_opcodes_h_l376_c11_8c7f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l376_c11_8c7f_left,
BIN_OP_EQ_uxn_opcodes_h_l376_c11_8c7f_right,
BIN_OP_EQ_uxn_opcodes_h_l376_c11_8c7f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_334b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_334b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_334b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_334b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_334b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_334b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_334b
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_334b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_334b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_334b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_334b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_334b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l376_c7_334b
result_u8_value_MUX_uxn_opcodes_h_l376_c7_334b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l376_c7_334b_cond,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_334b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_334b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_334b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l380_c11_82f6
BIN_OP_EQ_uxn_opcodes_h_l380_c11_82f6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l380_c11_82f6_left,
BIN_OP_EQ_uxn_opcodes_h_l380_c11_82f6_right,
BIN_OP_EQ_uxn_opcodes_h_l380_c11_82f6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_592d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_592d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_592d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_592d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_592d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_592d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_592d
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_592d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_592d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_592d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_592d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_592d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l380_c7_592d
result_u8_value_MUX_uxn_opcodes_h_l380_c7_592d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l380_c7_592d_cond,
result_u8_value_MUX_uxn_opcodes_h_l380_c7_592d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l380_c7_592d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l380_c7_592d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l384_c11_7d4d
BIN_OP_EQ_uxn_opcodes_h_l384_c11_7d4d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l384_c11_7d4d_left,
BIN_OP_EQ_uxn_opcodes_h_l384_c11_7d4d_right,
BIN_OP_EQ_uxn_opcodes_h_l384_c11_7d4d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_77d1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_77d1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_77d1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_77d1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_77d1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_77d1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_77d1
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_77d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_77d1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_77d1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_77d1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_77d1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l384_c7_77d1
result_u8_value_MUX_uxn_opcodes_h_l384_c7_77d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l384_c7_77d1_cond,
result_u8_value_MUX_uxn_opcodes_h_l384_c7_77d1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l384_c7_77d1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l384_c7_77d1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l388_c11_82bd
BIN_OP_EQ_uxn_opcodes_h_l388_c11_82bd : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l388_c11_82bd_left,
BIN_OP_EQ_uxn_opcodes_h_l388_c11_82bd_right,
BIN_OP_EQ_uxn_opcodes_h_l388_c11_82bd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4f32
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4f32 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4f32_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4f32_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4f32_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4f32_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4f32
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4f32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4f32_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4f32_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4f32_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4f32_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l388_c7_4f32
result_u8_value_MUX_uxn_opcodes_h_l388_c7_4f32 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l388_c7_4f32_cond,
result_u8_value_MUX_uxn_opcodes_h_l388_c7_4f32_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l388_c7_4f32_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l388_c7_4f32_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l339_c6_ec50_return_output,
 n16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output,
 n16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output,
 t16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output,
 t16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l352_c11_32f9_return_output,
 n16_high_MUX_uxn_opcodes_h_l352_c7_406d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_406d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_406d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l352_c7_406d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_406d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_406d_return_output,
 n16_low_MUX_uxn_opcodes_h_l352_c7_406d_return_output,
 t16_high_MUX_uxn_opcodes_h_l352_c7_406d_return_output,
 t16_low_MUX_uxn_opcodes_h_l352_c7_406d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l355_c11_3501_return_output,
 n16_high_MUX_uxn_opcodes_h_l355_c7_a819_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_a819_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_a819_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l355_c7_a819_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_a819_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_a819_return_output,
 n16_low_MUX_uxn_opcodes_h_l355_c7_a819_return_output,
 t16_high_MUX_uxn_opcodes_h_l355_c7_a819_return_output,
 t16_low_MUX_uxn_opcodes_h_l355_c7_a819_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l359_c11_9df8_return_output,
 n16_high_MUX_uxn_opcodes_h_l359_c7_0be5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0be5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0be5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l359_c7_0be5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0be5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0be5_return_output,
 n16_low_MUX_uxn_opcodes_h_l359_c7_0be5_return_output,
 t16_low_MUX_uxn_opcodes_h_l359_c7_0be5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l363_c11_7cdf_return_output,
 n16_high_MUX_uxn_opcodes_h_l363_c7_7a83_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7a83_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7a83_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l363_c7_7a83_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7a83_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7a83_return_output,
 n16_low_MUX_uxn_opcodes_h_l363_c7_7a83_return_output,
 sp_relative_shift_uxn_opcodes_h_l365_c30_1390_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l370_c11_fc40_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_d8d3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_d8d3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_d8d3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l370_c7_d8d3_return_output,
 n16_low_MUX_uxn_opcodes_h_l370_c7_d8d3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l376_c11_8c7f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_334b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_334b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l376_c7_334b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l380_c11_82f6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_592d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_592d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l380_c7_592d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l384_c11_7d4d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_77d1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_77d1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l384_c7_77d1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l388_c11_82bd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4f32_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4f32_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l388_c7_4f32_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_ec50_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_ec50_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_ec50_return_output : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_406d_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l339_c2_d5f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_d5f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l339_c2_d5f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_d5f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_406d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_d5f7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_406d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_d5f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_406d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_d5f7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l344_c3_32fa : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_406d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_d5f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l339_c2_d5f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l339_c2_d5f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l349_c3_10d3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_406d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_d5f7_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_406d_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_406d_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_406d_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_32f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_32f9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_32f9_return_output : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_406d_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_406d_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_a819_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_406d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_406d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_406d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_a819_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_406d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_406d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_406d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_a819_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_406d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_406d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_406d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_a819_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_406d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_406d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_406d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_a819_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_406d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_406d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l353_c3_199b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_406d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_a819_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_406d_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_406d_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_406d_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_a819_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_406d_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_406d_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_406d_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_a819_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_406d_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_406d_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_406d_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_a819_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_406d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_3501_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_3501_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_3501_return_output : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_a819_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_a819_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_0be5_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_a819_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_a819_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_a819_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0be5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_a819_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_a819_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_a819_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0be5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_a819_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_a819_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_a819_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_0be5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_a819_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_a819_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_a819_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0be5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_a819_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_a819_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_6ce2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_a819_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0be5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_a819_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_a819_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_a819_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_0be5_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_a819_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_a819_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_a819_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_a819_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_a819_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_a819_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_0be5_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_a819_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_9df8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_9df8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_9df8_return_output : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_0be5_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_0be5_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_7a83_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_0be5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0be5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0be5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7a83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0be5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0be5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0be5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7a83_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0be5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_0be5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_0be5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_7a83_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_0be5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0be5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0be5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7a83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0be5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0be5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l361_c3_61c3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0be5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7a83_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0be5_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_0be5_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_0be5_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_7a83_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_0be5_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_0be5_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_0be5_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_0be5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_7cdf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_7cdf_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_7cdf_return_output : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_7a83_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_7a83_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_7a83_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7a83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7a83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7a83_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7a83_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7a83_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_d8d3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7a83_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_7a83_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_7a83_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_d8d3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_7a83_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7a83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7a83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_d8d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7a83_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7a83_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_a78f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7a83_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_d8d3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7a83_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_7a83_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_7a83_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_d8d3_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_7a83_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_1390_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_1390_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_1390_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_1390_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_fc40_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_fc40_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_fc40_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_d8d3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l373_c3_2e89 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_d8d3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_334b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_d8d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_d8d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_d8d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_334b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_d8d3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_d8d3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l372_c3_a5a3 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_d8d3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_d8d3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_d8d3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_d8d3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_334b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_d8d3_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_d8d3_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_d8d3_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_d8d3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_8c7f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_8c7f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_8c7f_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_334b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_9fe4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_334b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_592d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_334b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_334b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_334b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_592d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_334b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_334b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_334b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_592d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_334b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_82f6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_82f6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_82f6_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_592d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_ccc0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_592d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_77d1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_592d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_592d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_592d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_77d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_592d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_592d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_592d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_77d1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_592d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_7d4d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_7d4d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_7d4d_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_77d1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_6117 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_77d1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4f32_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_77d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_77d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_77d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4f32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_77d1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_77d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_77d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_4f32_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_77d1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_82bd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_82bd_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_82bd_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4f32_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_7cc9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4f32_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l388_c7_4f32_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4f32_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4f32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4f32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4f32_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_4f32_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_4f32_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_4f32_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l339_l355_l388_l359_l352_DUPLICATE_a38f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l355_l352_l363_l359_DUPLICATE_0365_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l355_l352_l370_l359_DUPLICATE_df0b_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l384_l355_l388_l370_l380_l363_l376_l359_l352_DUPLICATE_6ed2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l394_l335_DUPLICATE_398d_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_fc40_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_3501_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_82bd_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l361_c3_61c3 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0be5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l361_c3_61c3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_32f9_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_8c7f_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_9df8_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_a78f := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7a83_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_a78f;
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_1390_y := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_7cdf_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_ccc0 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_592d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_ccc0;
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_1390_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l344_c3_32fa := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l344_c3_32fa;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l349_c3_10d3 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l349_c3_10d3;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_6117 := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_77d1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_6117;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4f32_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_7cc9 := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4f32_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_7cc9;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l353_c3_199b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_406d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l353_c3_199b;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7a83_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_82f6_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_6ce2 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_a819_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_6ce2;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l372_c3_a5a3 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_d8d3_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l372_c3_a5a3;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l373_c3_2e89 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_d8d3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l373_c3_2e89;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_7d4d_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_ec50_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_9fe4 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_334b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_9fe4;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_1390_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_406d_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_a819_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_0be5_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_7a83_iffalse := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_592d_iftrue := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_4f32_iftrue := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_406d_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_a819_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_0be5_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_7a83_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_d8d3_iffalse := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_334b_iftrue := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_77d1_iftrue := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_ec50_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_32f9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_3501_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_9df8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_7cdf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_fc40_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_8c7f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_82f6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_7d4d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_82bd_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_7a83_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_d8d3_iftrue := VAR_previous_stack_read;
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_a819_iftrue := VAR_previous_stack_read;
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_0be5_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_d8d3_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_406d_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_a819_iffalse := t16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_7a83_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_406d_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_a819_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_0be5_iffalse := t16_low;
     -- BIN_OP_EQ[uxn_opcodes_h_l363_c11_7cdf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l363_c11_7cdf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_7cdf_left;
     BIN_OP_EQ_uxn_opcodes_h_l363_c11_7cdf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_7cdf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_7cdf_return_output := BIN_OP_EQ_uxn_opcodes_h_l363_c11_7cdf_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l339_l355_l388_l359_l352_DUPLICATE_a38f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l339_l355_l388_l359_l352_DUPLICATE_a38f_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l359_c11_9df8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l359_c11_9df8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_9df8_left;
     BIN_OP_EQ_uxn_opcodes_h_l359_c11_9df8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_9df8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_9df8_return_output := BIN_OP_EQ_uxn_opcodes_h_l359_c11_9df8_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l339_c2_d5f7] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l339_c2_d5f7_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l355_c11_3501] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l355_c11_3501_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_3501_left;
     BIN_OP_EQ_uxn_opcodes_h_l355_c11_3501_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_3501_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_3501_return_output := BIN_OP_EQ_uxn_opcodes_h_l355_c11_3501_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l355_l352_l370_l359_DUPLICATE_df0b LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l355_l352_l370_l359_DUPLICATE_df0b_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l388_c11_82bd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l388_c11_82bd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_82bd_left;
     BIN_OP_EQ_uxn_opcodes_h_l388_c11_82bd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_82bd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_82bd_return_output := BIN_OP_EQ_uxn_opcodes_h_l388_c11_82bd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l370_c11_fc40] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l370_c11_fc40_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_fc40_left;
     BIN_OP_EQ_uxn_opcodes_h_l370_c11_fc40_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_fc40_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_fc40_return_output := BIN_OP_EQ_uxn_opcodes_h_l370_c11_fc40_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l339_c2_d5f7] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l339_c2_d5f7_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l380_c11_82f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l380_c11_82f6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_82f6_left;
     BIN_OP_EQ_uxn_opcodes_h_l380_c11_82f6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_82f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_82f6_return_output := BIN_OP_EQ_uxn_opcodes_h_l380_c11_82f6_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l365_c30_1390] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l365_c30_1390_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_1390_ins;
     sp_relative_shift_uxn_opcodes_h_l365_c30_1390_x <= VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_1390_x;
     sp_relative_shift_uxn_opcodes_h_l365_c30_1390_y <= VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_1390_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_1390_return_output := sp_relative_shift_uxn_opcodes_h_l365_c30_1390_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l339_c2_d5f7] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l339_c2_d5f7_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l376_c11_8c7f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l376_c11_8c7f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_8c7f_left;
     BIN_OP_EQ_uxn_opcodes_h_l376_c11_8c7f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_8c7f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_8c7f_return_output := BIN_OP_EQ_uxn_opcodes_h_l376_c11_8c7f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l384_l355_l388_l370_l380_l363_l376_l359_l352_DUPLICATE_6ed2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l384_l355_l388_l370_l380_l363_l376_l359_l352_DUPLICATE_6ed2_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l355_l352_l363_l359_DUPLICATE_0365 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l355_l352_l363_l359_DUPLICATE_0365_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l384_c11_7d4d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l384_c11_7d4d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_7d4d_left;
     BIN_OP_EQ_uxn_opcodes_h_l384_c11_7d4d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_7d4d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_7d4d_return_output := BIN_OP_EQ_uxn_opcodes_h_l384_c11_7d4d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l339_c6_ec50] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l339_c6_ec50_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_ec50_left;
     BIN_OP_EQ_uxn_opcodes_h_l339_c6_ec50_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_ec50_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_ec50_return_output := BIN_OP_EQ_uxn_opcodes_h_l339_c6_ec50_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l352_c11_32f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l352_c11_32f9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_32f9_left;
     BIN_OP_EQ_uxn_opcodes_h_l352_c11_32f9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_32f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_32f9_return_output := BIN_OP_EQ_uxn_opcodes_h_l352_c11_32f9_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l339_c2_d5f7] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l339_c2_d5f7_return_output := result.is_pc_updated;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l388_c7_4f32] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l388_c7_4f32_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_ec50_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_ec50_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_d5f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_ec50_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_d5f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_ec50_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_ec50_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_d5f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_ec50_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_d5f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_ec50_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_ec50_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_d5f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_ec50_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_d5f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_ec50_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_d5f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_ec50_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_ec50_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_ec50_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_406d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_32f9_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_406d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_32f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_406d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_32f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_406d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_32f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_406d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_32f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_406d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_32f9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_406d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_32f9_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_406d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_32f9_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_406d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_32f9_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_a819_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_3501_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_a819_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_3501_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_a819_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_3501_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_a819_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_3501_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_a819_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_3501_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_a819_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_3501_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_a819_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_3501_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_a819_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_3501_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_a819_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_3501_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_0be5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_9df8_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_0be5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_9df8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0be5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_9df8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0be5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_9df8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0be5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_9df8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0be5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_9df8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_0be5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_9df8_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_0be5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_9df8_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_7a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_7cdf_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_7a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_7cdf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_7cdf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_7cdf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_7cdf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_7cdf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_7a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_7cdf_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_d8d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_fc40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_d8d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_fc40_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_d8d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_fc40_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_d8d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_fc40_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_d8d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_fc40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_334b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_8c7f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_334b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_8c7f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_334b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_8c7f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_592d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_82f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_592d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_82f6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_592d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_82f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_77d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_7d4d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_77d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_7d4d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_77d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_7d4d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4f32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_82bd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4f32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_82bd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_4f32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_82bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_406d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l355_l352_l370_l359_DUPLICATE_df0b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_a819_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l355_l352_l370_l359_DUPLICATE_df0b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0be5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l355_l352_l370_l359_DUPLICATE_df0b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_d8d3_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l355_l352_l370_l359_DUPLICATE_df0b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_406d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l384_l355_l388_l370_l380_l363_l376_l359_l352_DUPLICATE_6ed2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_a819_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l384_l355_l388_l370_l380_l363_l376_l359_l352_DUPLICATE_6ed2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0be5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l384_l355_l388_l370_l380_l363_l376_l359_l352_DUPLICATE_6ed2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7a83_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l384_l355_l388_l370_l380_l363_l376_l359_l352_DUPLICATE_6ed2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_d8d3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l384_l355_l388_l370_l380_l363_l376_l359_l352_DUPLICATE_6ed2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_334b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l384_l355_l388_l370_l380_l363_l376_l359_l352_DUPLICATE_6ed2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_592d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l384_l355_l388_l370_l380_l363_l376_l359_l352_DUPLICATE_6ed2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_77d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l384_l355_l388_l370_l380_l363_l376_l359_l352_DUPLICATE_6ed2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4f32_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l384_l355_l388_l370_l380_l363_l376_l359_l352_DUPLICATE_6ed2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_406d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l355_l352_l363_l359_DUPLICATE_0365_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_a819_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l355_l352_l363_l359_DUPLICATE_0365_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0be5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l355_l352_l363_l359_DUPLICATE_0365_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7a83_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l355_l352_l363_l359_DUPLICATE_0365_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l339_l355_l388_l359_l352_DUPLICATE_a38f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_406d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l339_l355_l388_l359_l352_DUPLICATE_a38f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_a819_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l339_l355_l388_l359_l352_DUPLICATE_a38f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_0be5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l339_l355_l388_l359_l352_DUPLICATE_a38f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_4f32_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l339_l355_l388_l359_l352_DUPLICATE_a38f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l339_c2_d5f7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l339_c2_d5f7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l339_c2_d5f7_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l339_c2_d5f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4f32_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l388_c7_4f32_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7a83_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_1390_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l388_c7_4f32] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4f32_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4f32_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4f32_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4f32_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4f32_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4f32_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4f32_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4f32_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l355_c7_a819] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l355_c7_a819_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_a819_cond;
     t16_high_MUX_uxn_opcodes_h_l355_c7_a819_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_a819_iftrue;
     t16_high_MUX_uxn_opcodes_h_l355_c7_a819_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_a819_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_a819_return_output := t16_high_MUX_uxn_opcodes_h_l355_c7_a819_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l363_c7_7a83] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7a83_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7a83_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7a83_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7a83_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7a83_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7a83_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7a83_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7a83_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l339_c2_d5f7] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_d5f7_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_d5f7_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l388_c7_4f32] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4f32_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4f32_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4f32_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4f32_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4f32_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4f32_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4f32_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4f32_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l339_c2_d5f7] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_d5f7_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_d5f7_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l359_c7_0be5] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l359_c7_0be5_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_0be5_cond;
     t16_low_MUX_uxn_opcodes_h_l359_c7_0be5_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_0be5_iftrue;
     t16_low_MUX_uxn_opcodes_h_l359_c7_0be5_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_0be5_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_0be5_return_output := t16_low_MUX_uxn_opcodes_h_l359_c7_0be5_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l370_c7_d8d3] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l370_c7_d8d3_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_d8d3_cond;
     n16_low_MUX_uxn_opcodes_h_l370_c7_d8d3_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_d8d3_iftrue;
     n16_low_MUX_uxn_opcodes_h_l370_c7_d8d3_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_d8d3_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_d8d3_return_output := n16_low_MUX_uxn_opcodes_h_l370_c7_d8d3_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l339_c2_d5f7] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l339_c2_d5f7] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l388_c7_4f32] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l388_c7_4f32_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_4f32_cond;
     result_u8_value_MUX_uxn_opcodes_h_l388_c7_4f32_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_4f32_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l388_c7_4f32_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_4f32_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_4f32_return_output := result_u8_value_MUX_uxn_opcodes_h_l388_c7_4f32_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l370_c7_d8d3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_d8d3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_d8d3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_d8d3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_d8d3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_d8d3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_d8d3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_d8d3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_d8d3_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l363_c7_7a83] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l363_c7_7a83_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_7a83_cond;
     n16_high_MUX_uxn_opcodes_h_l363_c7_7a83_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_7a83_iftrue;
     n16_high_MUX_uxn_opcodes_h_l363_c7_7a83_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_7a83_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_7a83_return_output := n16_high_MUX_uxn_opcodes_h_l363_c7_7a83_return_output;

     -- Submodule level 2
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_0be5_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_7a83_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_7a83_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_d8d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_77d1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4f32_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0be5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7a83_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7a83_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_d8d3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_77d1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4f32_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_77d1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_4f32_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_406d_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_a819_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_a819_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_0be5_return_output;
     -- t16_high_MUX[uxn_opcodes_h_l352_c7_406d] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l352_c7_406d_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_406d_cond;
     t16_high_MUX_uxn_opcodes_h_l352_c7_406d_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_406d_iftrue;
     t16_high_MUX_uxn_opcodes_h_l352_c7_406d_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_406d_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_406d_return_output := t16_high_MUX_uxn_opcodes_h_l352_c7_406d_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l355_c7_a819] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l355_c7_a819_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_a819_cond;
     t16_low_MUX_uxn_opcodes_h_l355_c7_a819_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_a819_iftrue;
     t16_low_MUX_uxn_opcodes_h_l355_c7_a819_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_a819_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_a819_return_output := t16_low_MUX_uxn_opcodes_h_l355_c7_a819_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l384_c7_77d1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_77d1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_77d1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_77d1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_77d1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_77d1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_77d1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_77d1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_77d1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l363_c7_7a83] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7a83_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7a83_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7a83_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7a83_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7a83_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7a83_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7a83_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7a83_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l359_c7_0be5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0be5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0be5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0be5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0be5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0be5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0be5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0be5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0be5_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l359_c7_0be5] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l359_c7_0be5_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_0be5_cond;
     n16_high_MUX_uxn_opcodes_h_l359_c7_0be5_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_0be5_iftrue;
     n16_high_MUX_uxn_opcodes_h_l359_c7_0be5_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_0be5_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_0be5_return_output := n16_high_MUX_uxn_opcodes_h_l359_c7_0be5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l384_c7_77d1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l384_c7_77d1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_77d1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l384_c7_77d1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_77d1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l384_c7_77d1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_77d1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_77d1_return_output := result_u8_value_MUX_uxn_opcodes_h_l384_c7_77d1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l384_c7_77d1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_77d1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_77d1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_77d1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_77d1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_77d1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_77d1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_77d1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_77d1_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l363_c7_7a83] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l363_c7_7a83_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_7a83_cond;
     n16_low_MUX_uxn_opcodes_h_l363_c7_7a83_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_7a83_iftrue;
     n16_low_MUX_uxn_opcodes_h_l363_c7_7a83_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_7a83_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_7a83_return_output := n16_low_MUX_uxn_opcodes_h_l363_c7_7a83_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_a819_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_0be5_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_0be5_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_7a83_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_592d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_77d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_a819_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_0be5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0be5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7a83_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_592d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_77d1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_592d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_77d1_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_406d_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_406d_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_a819_return_output;
     -- t16_high_MUX[uxn_opcodes_h_l339_c2_d5f7] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_cond;
     t16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue;
     t16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output := t16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l359_c7_0be5] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l359_c7_0be5_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_0be5_cond;
     n16_low_MUX_uxn_opcodes_h_l359_c7_0be5_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_0be5_iftrue;
     n16_low_MUX_uxn_opcodes_h_l359_c7_0be5_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_0be5_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_0be5_return_output := n16_low_MUX_uxn_opcodes_h_l359_c7_0be5_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l355_c7_a819] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l355_c7_a819_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_a819_cond;
     n16_high_MUX_uxn_opcodes_h_l355_c7_a819_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_a819_iftrue;
     n16_high_MUX_uxn_opcodes_h_l355_c7_a819_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_a819_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_a819_return_output := n16_high_MUX_uxn_opcodes_h_l355_c7_a819_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l359_c7_0be5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0be5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0be5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0be5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0be5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0be5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0be5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0be5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0be5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l380_c7_592d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l380_c7_592d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_592d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l380_c7_592d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_592d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l380_c7_592d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_592d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_592d_return_output := result_u8_value_MUX_uxn_opcodes_h_l380_c7_592d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l380_c7_592d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_592d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_592d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_592d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_592d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_592d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_592d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_592d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_592d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l380_c7_592d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_592d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_592d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_592d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_592d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_592d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_592d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_592d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_592d_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l352_c7_406d] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l352_c7_406d_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_406d_cond;
     t16_low_MUX_uxn_opcodes_h_l352_c7_406d_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_406d_iftrue;
     t16_low_MUX_uxn_opcodes_h_l352_c7_406d_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_406d_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_406d_return_output := t16_low_MUX_uxn_opcodes_h_l352_c7_406d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l355_c7_a819] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_a819_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_a819_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_a819_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_a819_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_a819_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_a819_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_a819_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_a819_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_406d_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_a819_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_a819_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_0be5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_334b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_592d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_406d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_a819_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_a819_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_0be5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_334b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_592d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_334b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_592d_return_output;
     REG_VAR_t16_high := VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_406d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l376_c7_334b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_334b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_334b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_334b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_334b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_334b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_334b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_334b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_334b_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l355_c7_a819] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l355_c7_a819_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_a819_cond;
     n16_low_MUX_uxn_opcodes_h_l355_c7_a819_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_a819_iftrue;
     n16_low_MUX_uxn_opcodes_h_l355_c7_a819_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_a819_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_a819_return_output := n16_low_MUX_uxn_opcodes_h_l355_c7_a819_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l376_c7_334b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_334b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_334b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_334b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_334b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_334b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_334b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_334b_return_output := result_u8_value_MUX_uxn_opcodes_h_l376_c7_334b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l355_c7_a819] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_a819_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_a819_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_a819_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_a819_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_a819_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_a819_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_a819_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_a819_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l339_c2_d5f7] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_cond;
     t16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue;
     t16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output := t16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l376_c7_334b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_334b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_334b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_334b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_334b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_334b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_334b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_334b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_334b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l352_c7_406d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_406d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_406d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_406d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_406d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_406d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_406d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_406d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_406d_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l352_c7_406d] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l352_c7_406d_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_406d_cond;
     n16_high_MUX_uxn_opcodes_h_l352_c7_406d_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_406d_iftrue;
     n16_high_MUX_uxn_opcodes_h_l352_c7_406d_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_406d_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_406d_return_output := n16_high_MUX_uxn_opcodes_h_l352_c7_406d_return_output;

     -- Submodule level 5
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_406d_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_406d_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_a819_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_d8d3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_334b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_406d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_406d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_a819_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_d8d3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_334b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_d8d3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_334b_return_output;
     REG_VAR_t16_low := VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output;
     -- n16_high_MUX[uxn_opcodes_h_l339_c2_d5f7] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_cond;
     n16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue;
     n16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output := n16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l352_c7_406d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_406d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_406d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_406d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_406d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_406d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_406d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_406d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_406d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l339_c2_d5f7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_d5f7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_d5f7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l370_c7_d8d3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_d8d3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_d8d3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_d8d3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_d8d3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_d8d3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_d8d3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_d8d3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_d8d3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l370_c7_d8d3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_d8d3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_d8d3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_d8d3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_d8d3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_d8d3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_d8d3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_d8d3_return_output := result_u8_value_MUX_uxn_opcodes_h_l370_c7_d8d3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l370_c7_d8d3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_d8d3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_d8d3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_d8d3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_d8d3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_d8d3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_d8d3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_d8d3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_d8d3_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l352_c7_406d] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l352_c7_406d_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_406d_cond;
     n16_low_MUX_uxn_opcodes_h_l352_c7_406d_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_406d_iftrue;
     n16_low_MUX_uxn_opcodes_h_l352_c7_406d_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_406d_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_406d_return_output := n16_low_MUX_uxn_opcodes_h_l352_c7_406d_return_output;

     -- Submodule level 6
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_406d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7a83_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_d8d3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_406d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7a83_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_d8d3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_7a83_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_d8d3_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l339_c2_d5f7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_d5f7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_d5f7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l363_c7_7a83] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7a83_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7a83_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7a83_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7a83_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7a83_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7a83_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7a83_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7a83_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l363_c7_7a83] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7a83_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7a83_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7a83_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7a83_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7a83_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7a83_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7a83_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7a83_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l363_c7_7a83] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l363_c7_7a83_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_7a83_cond;
     result_u8_value_MUX_uxn_opcodes_h_l363_c7_7a83_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_7a83_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l363_c7_7a83_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_7a83_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_7a83_return_output := result_u8_value_MUX_uxn_opcodes_h_l363_c7_7a83_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l339_c2_d5f7] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_cond;
     n16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue;
     n16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output := n16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output;

     -- Submodule level 7
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0be5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7a83_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0be5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7a83_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_0be5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_7a83_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l359_c7_0be5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l359_c7_0be5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_0be5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l359_c7_0be5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_0be5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l359_c7_0be5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_0be5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_0be5_return_output := result_u8_value_MUX_uxn_opcodes_h_l359_c7_0be5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l359_c7_0be5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0be5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0be5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0be5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0be5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0be5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0be5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0be5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0be5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l359_c7_0be5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0be5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0be5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0be5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0be5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0be5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0be5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0be5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0be5_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_a819_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_0be5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_a819_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_0be5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_a819_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_0be5_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l355_c7_a819] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l355_c7_a819_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_a819_cond;
     result_u8_value_MUX_uxn_opcodes_h_l355_c7_a819_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_a819_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l355_c7_a819_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_a819_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_a819_return_output := result_u8_value_MUX_uxn_opcodes_h_l355_c7_a819_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l355_c7_a819] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_a819_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_a819_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_a819_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_a819_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_a819_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_a819_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_a819_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_a819_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l355_c7_a819] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_a819_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_a819_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_a819_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_a819_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_a819_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_a819_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_a819_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_a819_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_406d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_a819_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_406d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_a819_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_406d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_a819_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l352_c7_406d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_406d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_406d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_406d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_406d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_406d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_406d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_406d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_406d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l352_c7_406d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_406d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_406d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_406d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_406d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_406d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_406d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_406d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_406d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l352_c7_406d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l352_c7_406d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_406d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l352_c7_406d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_406d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l352_c7_406d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_406d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_406d_return_output := result_u8_value_MUX_uxn_opcodes_h_l352_c7_406d_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_406d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_406d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_406d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l339_c2_d5f7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_d5f7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_d5f7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l339_c2_d5f7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_d5f7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_d5f7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l339_c2_d5f7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l339_c2_d5f7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_d5f7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_d5f7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_d5f7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output := result_u8_value_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l394_l335_DUPLICATE_398d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l394_l335_DUPLICATE_398d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_71f0(
     result,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_d5f7_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l394_l335_DUPLICATE_398d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l394_l335_DUPLICATE_398d_return_output;
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
