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
-- BIN_OP_EQ[uxn_opcodes_h_l339_c6_f358]
signal BIN_OP_EQ_uxn_opcodes_h_l339_c6_f358_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l339_c6_f358_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l339_c6_f358_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l339_c2_2a42]
signal t16_low_MUX_uxn_opcodes_h_l339_c2_2a42_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l339_c2_2a42_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l339_c2_2a42]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2a42_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2a42_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l339_c2_2a42]
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_2a42_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_2a42_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l339_c2_2a42]
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2a42_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2a42_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l339_c2_2a42]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2a42_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2a42_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l339_c2_2a42]
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2a42_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2a42_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l339_c2_2a42]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2a42_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2a42_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l339_c2_2a42]
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2a42_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2a42_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l339_c2_2a42]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2a42_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2a42_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l339_c2_2a42]
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2a42_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2a42_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l339_c2_2a42]
signal n16_low_MUX_uxn_opcodes_h_l339_c2_2a42_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l339_c2_2a42_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l339_c2_2a42]
signal n16_high_MUX_uxn_opcodes_h_l339_c2_2a42_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l339_c2_2a42_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l339_c2_2a42]
signal t16_high_MUX_uxn_opcodes_h_l339_c2_2a42_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l339_c2_2a42_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l352_c11_732a]
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_732a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_732a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_732a_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l352_c7_73a8]
signal t16_low_MUX_uxn_opcodes_h_l352_c7_73a8_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l352_c7_73a8_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l352_c7_73a8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_73a8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_73a8_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l352_c7_73a8]
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_73a8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_73a8_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l352_c7_73a8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_73a8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_73a8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l352_c7_73a8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_73a8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_73a8_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l352_c7_73a8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_73a8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_73a8_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l352_c7_73a8]
signal n16_low_MUX_uxn_opcodes_h_l352_c7_73a8_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l352_c7_73a8_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l352_c7_73a8]
signal n16_high_MUX_uxn_opcodes_h_l352_c7_73a8_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l352_c7_73a8_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l352_c7_73a8]
signal t16_high_MUX_uxn_opcodes_h_l352_c7_73a8_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l352_c7_73a8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l355_c11_b797]
signal BIN_OP_EQ_uxn_opcodes_h_l355_c11_b797_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l355_c11_b797_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l355_c11_b797_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l355_c7_8a95]
signal t16_low_MUX_uxn_opcodes_h_l355_c7_8a95_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l355_c7_8a95_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l355_c7_8a95]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_8a95_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_8a95_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l355_c7_8a95]
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_8a95_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_8a95_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l355_c7_8a95]
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_8a95_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_8a95_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l355_c7_8a95]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_8a95_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_8a95_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l355_c7_8a95]
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_8a95_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_8a95_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l355_c7_8a95]
signal n16_low_MUX_uxn_opcodes_h_l355_c7_8a95_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l355_c7_8a95_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l355_c7_8a95]
signal n16_high_MUX_uxn_opcodes_h_l355_c7_8a95_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l355_c7_8a95_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l355_c7_8a95]
signal t16_high_MUX_uxn_opcodes_h_l355_c7_8a95_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l355_c7_8a95_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l359_c11_0e65]
signal BIN_OP_EQ_uxn_opcodes_h_l359_c11_0e65_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l359_c11_0e65_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l359_c11_0e65_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l359_c7_3d9c]
signal t16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l359_c7_3d9c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3d9c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3d9c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3d9c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l359_c7_3d9c]
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_3d9c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_3d9c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_3d9c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l359_c7_3d9c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3d9c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3d9c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3d9c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l359_c7_3d9c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3d9c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3d9c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3d9c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l359_c7_3d9c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3d9c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3d9c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3d9c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l359_c7_3d9c]
signal n16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l359_c7_3d9c]
signal n16_high_MUX_uxn_opcodes_h_l359_c7_3d9c_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l359_c7_3d9c_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l359_c7_3d9c_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l363_c11_3dab]
signal BIN_OP_EQ_uxn_opcodes_h_l363_c11_3dab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l363_c11_3dab_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l363_c11_3dab_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l363_c7_a057]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_a057_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_a057_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_a057_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_a057_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l363_c7_a057]
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_a057_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_a057_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_a057_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_a057_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l363_c7_a057]
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_a057_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_a057_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_a057_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_a057_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l363_c7_a057]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_a057_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_a057_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_a057_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_a057_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l363_c7_a057]
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_a057_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_a057_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_a057_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_a057_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l363_c7_a057]
signal n16_low_MUX_uxn_opcodes_h_l363_c7_a057_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l363_c7_a057_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l363_c7_a057_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l363_c7_a057_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l363_c7_a057]
signal n16_high_MUX_uxn_opcodes_h_l363_c7_a057_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l363_c7_a057_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l363_c7_a057_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l363_c7_a057_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l365_c30_93bd]
signal sp_relative_shift_uxn_opcodes_h_l365_c30_93bd_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l365_c30_93bd_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l365_c30_93bd_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l365_c30_93bd_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l370_c11_e595]
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_e595_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_e595_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_e595_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l370_c7_e9a5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e9a5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e9a5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e9a5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e9a5_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l370_c7_e9a5]
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_e9a5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_e9a5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_e9a5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_e9a5_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l370_c7_e9a5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e9a5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e9a5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e9a5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e9a5_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l370_c7_e9a5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e9a5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e9a5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e9a5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e9a5_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l370_c7_e9a5]
signal n16_low_MUX_uxn_opcodes_h_l370_c7_e9a5_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l370_c7_e9a5_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l370_c7_e9a5_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l370_c7_e9a5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l376_c11_02ff]
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ff_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ff_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l376_c7_31e3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_31e3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_31e3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_31e3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_31e3_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l376_c7_31e3]
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_31e3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_31e3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_31e3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_31e3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l376_c7_31e3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_31e3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_31e3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_31e3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_31e3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l380_c11_0ab3]
signal BIN_OP_EQ_uxn_opcodes_h_l380_c11_0ab3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l380_c11_0ab3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l380_c11_0ab3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l380_c7_ad5a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_ad5a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_ad5a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_ad5a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_ad5a_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l380_c7_ad5a]
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_ad5a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_ad5a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_ad5a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_ad5a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l380_c7_ad5a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_ad5a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_ad5a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_ad5a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_ad5a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l384_c11_fbdb]
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_fbdb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_fbdb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_fbdb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l384_c7_6f0b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_6f0b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_6f0b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_6f0b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_6f0b_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l384_c7_6f0b]
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_6f0b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_6f0b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_6f0b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_6f0b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l384_c7_6f0b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_6f0b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_6f0b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_6f0b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_6f0b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l388_c11_3816]
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_3816_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_3816_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_3816_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l388_c7_35ad]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_35ad_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_35ad_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_35ad_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_35ad_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l388_c7_35ad]
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_35ad_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_35ad_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_35ad_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_35ad_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l388_c7_35ad]
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_35ad_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_35ad_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_35ad_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_35ad_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_b856( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l339_c6_f358
BIN_OP_EQ_uxn_opcodes_h_l339_c6_f358 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l339_c6_f358_left,
BIN_OP_EQ_uxn_opcodes_h_l339_c6_f358_right,
BIN_OP_EQ_uxn_opcodes_h_l339_c6_f358_return_output);

-- t16_low_MUX_uxn_opcodes_h_l339_c2_2a42
t16_low_MUX_uxn_opcodes_h_l339_c2_2a42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l339_c2_2a42_cond,
t16_low_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue,
t16_low_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse,
t16_low_MUX_uxn_opcodes_h_l339_c2_2a42_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2a42
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2a42 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2a42_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2a42_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l339_c2_2a42
result_u8_value_MUX_uxn_opcodes_h_l339_c2_2a42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l339_c2_2a42_cond,
result_u8_value_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l339_c2_2a42_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2a42
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2a42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2a42_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2a42_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2a42
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2a42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2a42_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2a42_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2a42
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2a42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2a42_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2a42_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2a42
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2a42 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2a42_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2a42_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2a42
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2a42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2a42_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2a42_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2a42
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2a42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2a42_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2a42_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2a42
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2a42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2a42_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2a42_return_output);

-- n16_low_MUX_uxn_opcodes_h_l339_c2_2a42
n16_low_MUX_uxn_opcodes_h_l339_c2_2a42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l339_c2_2a42_cond,
n16_low_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue,
n16_low_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse,
n16_low_MUX_uxn_opcodes_h_l339_c2_2a42_return_output);

-- n16_high_MUX_uxn_opcodes_h_l339_c2_2a42
n16_high_MUX_uxn_opcodes_h_l339_c2_2a42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l339_c2_2a42_cond,
n16_high_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue,
n16_high_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse,
n16_high_MUX_uxn_opcodes_h_l339_c2_2a42_return_output);

-- t16_high_MUX_uxn_opcodes_h_l339_c2_2a42
t16_high_MUX_uxn_opcodes_h_l339_c2_2a42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l339_c2_2a42_cond,
t16_high_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue,
t16_high_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse,
t16_high_MUX_uxn_opcodes_h_l339_c2_2a42_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l352_c11_732a
BIN_OP_EQ_uxn_opcodes_h_l352_c11_732a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l352_c11_732a_left,
BIN_OP_EQ_uxn_opcodes_h_l352_c11_732a_right,
BIN_OP_EQ_uxn_opcodes_h_l352_c11_732a_return_output);

-- t16_low_MUX_uxn_opcodes_h_l352_c7_73a8
t16_low_MUX_uxn_opcodes_h_l352_c7_73a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l352_c7_73a8_cond,
t16_low_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue,
t16_low_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse,
t16_low_MUX_uxn_opcodes_h_l352_c7_73a8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_73a8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_73a8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_73a8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_73a8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l352_c7_73a8
result_u8_value_MUX_uxn_opcodes_h_l352_c7_73a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l352_c7_73a8_cond,
result_u8_value_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l352_c7_73a8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_73a8
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_73a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_73a8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_73a8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_73a8
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_73a8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_73a8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_73a8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_73a8
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_73a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_73a8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_73a8_return_output);

-- n16_low_MUX_uxn_opcodes_h_l352_c7_73a8
n16_low_MUX_uxn_opcodes_h_l352_c7_73a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l352_c7_73a8_cond,
n16_low_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue,
n16_low_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse,
n16_low_MUX_uxn_opcodes_h_l352_c7_73a8_return_output);

-- n16_high_MUX_uxn_opcodes_h_l352_c7_73a8
n16_high_MUX_uxn_opcodes_h_l352_c7_73a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l352_c7_73a8_cond,
n16_high_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue,
n16_high_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse,
n16_high_MUX_uxn_opcodes_h_l352_c7_73a8_return_output);

-- t16_high_MUX_uxn_opcodes_h_l352_c7_73a8
t16_high_MUX_uxn_opcodes_h_l352_c7_73a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l352_c7_73a8_cond,
t16_high_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue,
t16_high_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse,
t16_high_MUX_uxn_opcodes_h_l352_c7_73a8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l355_c11_b797
BIN_OP_EQ_uxn_opcodes_h_l355_c11_b797 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l355_c11_b797_left,
BIN_OP_EQ_uxn_opcodes_h_l355_c11_b797_right,
BIN_OP_EQ_uxn_opcodes_h_l355_c11_b797_return_output);

-- t16_low_MUX_uxn_opcodes_h_l355_c7_8a95
t16_low_MUX_uxn_opcodes_h_l355_c7_8a95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l355_c7_8a95_cond,
t16_low_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue,
t16_low_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse,
t16_low_MUX_uxn_opcodes_h_l355_c7_8a95_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_8a95
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_8a95 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_8a95_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_8a95_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l355_c7_8a95
result_u8_value_MUX_uxn_opcodes_h_l355_c7_8a95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l355_c7_8a95_cond,
result_u8_value_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l355_c7_8a95_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_8a95
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_8a95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_8a95_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_8a95_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_8a95
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_8a95 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_8a95_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_8a95_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_8a95
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_8a95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_8a95_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_8a95_return_output);

-- n16_low_MUX_uxn_opcodes_h_l355_c7_8a95
n16_low_MUX_uxn_opcodes_h_l355_c7_8a95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l355_c7_8a95_cond,
n16_low_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue,
n16_low_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse,
n16_low_MUX_uxn_opcodes_h_l355_c7_8a95_return_output);

-- n16_high_MUX_uxn_opcodes_h_l355_c7_8a95
n16_high_MUX_uxn_opcodes_h_l355_c7_8a95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l355_c7_8a95_cond,
n16_high_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue,
n16_high_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse,
n16_high_MUX_uxn_opcodes_h_l355_c7_8a95_return_output);

-- t16_high_MUX_uxn_opcodes_h_l355_c7_8a95
t16_high_MUX_uxn_opcodes_h_l355_c7_8a95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l355_c7_8a95_cond,
t16_high_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue,
t16_high_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse,
t16_high_MUX_uxn_opcodes_h_l355_c7_8a95_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l359_c11_0e65
BIN_OP_EQ_uxn_opcodes_h_l359_c11_0e65 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l359_c11_0e65_left,
BIN_OP_EQ_uxn_opcodes_h_l359_c11_0e65_right,
BIN_OP_EQ_uxn_opcodes_h_l359_c11_0e65_return_output);

-- t16_low_MUX_uxn_opcodes_h_l359_c7_3d9c
t16_low_MUX_uxn_opcodes_h_l359_c7_3d9c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_cond,
t16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_iftrue,
t16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_iffalse,
t16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3d9c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3d9c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3d9c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3d9c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3d9c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l359_c7_3d9c
result_u8_value_MUX_uxn_opcodes_h_l359_c7_3d9c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l359_c7_3d9c_cond,
result_u8_value_MUX_uxn_opcodes_h_l359_c7_3d9c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l359_c7_3d9c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3d9c
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3d9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3d9c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3d9c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3d9c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3d9c
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3d9c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3d9c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3d9c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3d9c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3d9c
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3d9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3d9c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3d9c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3d9c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output);

-- n16_low_MUX_uxn_opcodes_h_l359_c7_3d9c
n16_low_MUX_uxn_opcodes_h_l359_c7_3d9c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_cond,
n16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_iftrue,
n16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_iffalse,
n16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output);

-- n16_high_MUX_uxn_opcodes_h_l359_c7_3d9c
n16_high_MUX_uxn_opcodes_h_l359_c7_3d9c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l359_c7_3d9c_cond,
n16_high_MUX_uxn_opcodes_h_l359_c7_3d9c_iftrue,
n16_high_MUX_uxn_opcodes_h_l359_c7_3d9c_iffalse,
n16_high_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l363_c11_3dab
BIN_OP_EQ_uxn_opcodes_h_l363_c11_3dab : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l363_c11_3dab_left,
BIN_OP_EQ_uxn_opcodes_h_l363_c11_3dab_right,
BIN_OP_EQ_uxn_opcodes_h_l363_c11_3dab_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_a057
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_a057 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_a057_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_a057_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_a057_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_a057_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l363_c7_a057
result_u8_value_MUX_uxn_opcodes_h_l363_c7_a057 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l363_c7_a057_cond,
result_u8_value_MUX_uxn_opcodes_h_l363_c7_a057_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l363_c7_a057_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l363_c7_a057_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_a057
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_a057 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_a057_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_a057_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_a057_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_a057_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_a057
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_a057 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_a057_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_a057_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_a057_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_a057_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_a057
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_a057 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_a057_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_a057_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_a057_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_a057_return_output);

-- n16_low_MUX_uxn_opcodes_h_l363_c7_a057
n16_low_MUX_uxn_opcodes_h_l363_c7_a057 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l363_c7_a057_cond,
n16_low_MUX_uxn_opcodes_h_l363_c7_a057_iftrue,
n16_low_MUX_uxn_opcodes_h_l363_c7_a057_iffalse,
n16_low_MUX_uxn_opcodes_h_l363_c7_a057_return_output);

-- n16_high_MUX_uxn_opcodes_h_l363_c7_a057
n16_high_MUX_uxn_opcodes_h_l363_c7_a057 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l363_c7_a057_cond,
n16_high_MUX_uxn_opcodes_h_l363_c7_a057_iftrue,
n16_high_MUX_uxn_opcodes_h_l363_c7_a057_iffalse,
n16_high_MUX_uxn_opcodes_h_l363_c7_a057_return_output);

-- sp_relative_shift_uxn_opcodes_h_l365_c30_93bd
sp_relative_shift_uxn_opcodes_h_l365_c30_93bd : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l365_c30_93bd_ins,
sp_relative_shift_uxn_opcodes_h_l365_c30_93bd_x,
sp_relative_shift_uxn_opcodes_h_l365_c30_93bd_y,
sp_relative_shift_uxn_opcodes_h_l365_c30_93bd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l370_c11_e595
BIN_OP_EQ_uxn_opcodes_h_l370_c11_e595 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l370_c11_e595_left,
BIN_OP_EQ_uxn_opcodes_h_l370_c11_e595_right,
BIN_OP_EQ_uxn_opcodes_h_l370_c11_e595_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e9a5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e9a5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e9a5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e9a5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e9a5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e9a5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l370_c7_e9a5
result_u8_value_MUX_uxn_opcodes_h_l370_c7_e9a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l370_c7_e9a5_cond,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_e9a5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_e9a5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_e9a5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e9a5
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e9a5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e9a5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e9a5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e9a5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e9a5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e9a5
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e9a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e9a5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e9a5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e9a5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e9a5_return_output);

-- n16_low_MUX_uxn_opcodes_h_l370_c7_e9a5
n16_low_MUX_uxn_opcodes_h_l370_c7_e9a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l370_c7_e9a5_cond,
n16_low_MUX_uxn_opcodes_h_l370_c7_e9a5_iftrue,
n16_low_MUX_uxn_opcodes_h_l370_c7_e9a5_iffalse,
n16_low_MUX_uxn_opcodes_h_l370_c7_e9a5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ff
BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ff : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ff_left,
BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ff_right,
BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_31e3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_31e3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_31e3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_31e3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_31e3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_31e3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l376_c7_31e3
result_u8_value_MUX_uxn_opcodes_h_l376_c7_31e3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l376_c7_31e3_cond,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_31e3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_31e3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_31e3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_31e3
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_31e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_31e3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_31e3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_31e3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_31e3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l380_c11_0ab3
BIN_OP_EQ_uxn_opcodes_h_l380_c11_0ab3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l380_c11_0ab3_left,
BIN_OP_EQ_uxn_opcodes_h_l380_c11_0ab3_right,
BIN_OP_EQ_uxn_opcodes_h_l380_c11_0ab3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_ad5a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_ad5a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_ad5a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_ad5a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_ad5a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_ad5a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l380_c7_ad5a
result_u8_value_MUX_uxn_opcodes_h_l380_c7_ad5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l380_c7_ad5a_cond,
result_u8_value_MUX_uxn_opcodes_h_l380_c7_ad5a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l380_c7_ad5a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l380_c7_ad5a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_ad5a
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_ad5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_ad5a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_ad5a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_ad5a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_ad5a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l384_c11_fbdb
BIN_OP_EQ_uxn_opcodes_h_l384_c11_fbdb : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l384_c11_fbdb_left,
BIN_OP_EQ_uxn_opcodes_h_l384_c11_fbdb_right,
BIN_OP_EQ_uxn_opcodes_h_l384_c11_fbdb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_6f0b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_6f0b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_6f0b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_6f0b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_6f0b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_6f0b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l384_c7_6f0b
result_u8_value_MUX_uxn_opcodes_h_l384_c7_6f0b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l384_c7_6f0b_cond,
result_u8_value_MUX_uxn_opcodes_h_l384_c7_6f0b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l384_c7_6f0b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l384_c7_6f0b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_6f0b
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_6f0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_6f0b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_6f0b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_6f0b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_6f0b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l388_c11_3816
BIN_OP_EQ_uxn_opcodes_h_l388_c11_3816 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l388_c11_3816_left,
BIN_OP_EQ_uxn_opcodes_h_l388_c11_3816_right,
BIN_OP_EQ_uxn_opcodes_h_l388_c11_3816_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_35ad
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_35ad : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_35ad_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_35ad_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_35ad_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_35ad_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l388_c7_35ad
result_u8_value_MUX_uxn_opcodes_h_l388_c7_35ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l388_c7_35ad_cond,
result_u8_value_MUX_uxn_opcodes_h_l388_c7_35ad_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l388_c7_35ad_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l388_c7_35ad_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_35ad
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_35ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_35ad_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_35ad_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_35ad_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_35ad_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l339_c6_f358_return_output,
 t16_low_MUX_uxn_opcodes_h_l339_c2_2a42_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2a42_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l339_c2_2a42_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2a42_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2a42_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2a42_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2a42_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2a42_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2a42_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2a42_return_output,
 n16_low_MUX_uxn_opcodes_h_l339_c2_2a42_return_output,
 n16_high_MUX_uxn_opcodes_h_l339_c2_2a42_return_output,
 t16_high_MUX_uxn_opcodes_h_l339_c2_2a42_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l352_c11_732a_return_output,
 t16_low_MUX_uxn_opcodes_h_l352_c7_73a8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_73a8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l352_c7_73a8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_73a8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_73a8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_73a8_return_output,
 n16_low_MUX_uxn_opcodes_h_l352_c7_73a8_return_output,
 n16_high_MUX_uxn_opcodes_h_l352_c7_73a8_return_output,
 t16_high_MUX_uxn_opcodes_h_l352_c7_73a8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l355_c11_b797_return_output,
 t16_low_MUX_uxn_opcodes_h_l355_c7_8a95_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_8a95_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l355_c7_8a95_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_8a95_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_8a95_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_8a95_return_output,
 n16_low_MUX_uxn_opcodes_h_l355_c7_8a95_return_output,
 n16_high_MUX_uxn_opcodes_h_l355_c7_8a95_return_output,
 t16_high_MUX_uxn_opcodes_h_l355_c7_8a95_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l359_c11_0e65_return_output,
 t16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output,
 n16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output,
 n16_high_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l363_c11_3dab_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_a057_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l363_c7_a057_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_a057_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_a057_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_a057_return_output,
 n16_low_MUX_uxn_opcodes_h_l363_c7_a057_return_output,
 n16_high_MUX_uxn_opcodes_h_l363_c7_a057_return_output,
 sp_relative_shift_uxn_opcodes_h_l365_c30_93bd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l370_c11_e595_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e9a5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l370_c7_e9a5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e9a5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e9a5_return_output,
 n16_low_MUX_uxn_opcodes_h_l370_c7_e9a5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_31e3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l376_c7_31e3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_31e3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l380_c11_0ab3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_ad5a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l380_c7_ad5a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_ad5a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l384_c11_fbdb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_6f0b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l384_c7_6f0b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_6f0b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l388_c11_3816_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_35ad_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l388_c7_35ad_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_35ad_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_f358_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_f358_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_f358_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_73a8_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_2a42_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_2a42_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l349_c3_10dc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_73a8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2a42_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2a42_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_73a8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_2a42_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_2a42_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l339_c2_2a42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2a42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2a42_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l339_c2_2a42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2a42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2a42_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_73a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2a42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2a42_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l344_c3_324c : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_73a8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2a42_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2a42_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l339_c2_2a42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2a42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2a42_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l339_c2_2a42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2a42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2a42_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_73a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2a42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2a42_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_73a8_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_2a42_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_2a42_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_73a8_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_2a42_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_2a42_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_73a8_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_2a42_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_2a42_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_732a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_732a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_732a_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_8a95_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_73a8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l353_c3_d98a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_8a95_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_73a8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_8a95_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_73a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_8a95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_73a8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_8a95_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_73a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_8a95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_73a8_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_8a95_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_73a8_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_8a95_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_73a8_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_8a95_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_73a8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_b797_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_b797_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_b797_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_8a95_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_281b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_8a95_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_8a95_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_8a95_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_8a95_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_8a95_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_8a95_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_8a95_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_8a95_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0e65_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0e65_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0e65_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3d9c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l361_c3_d496 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3d9c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_a057_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3d9c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_3d9c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_3d9c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_a057_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_3d9c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3d9c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3d9c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_a057_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3d9c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3d9c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3d9c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_a057_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3d9c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3d9c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3d9c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_a057_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3d9c_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_a057_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_3d9c_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_3d9c_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_a057_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_3d9c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_3dab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_3dab_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_3dab_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_a057_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_34b6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_a057_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e9a5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_a057_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_a057_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_a057_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_e9a5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_a057_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_a057_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_a057_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_a057_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_a057_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_a057_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e9a5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_a057_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_a057_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_a057_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e9a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_a057_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_a057_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_a057_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_e9a5_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_a057_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_a057_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_a057_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_a057_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_93bd_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_93bd_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_93bd_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_93bd_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_e595_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_e595_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_e595_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e9a5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l373_c3_b83f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e9a5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_31e3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e9a5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_e9a5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_e9a5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_31e3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_e9a5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e9a5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l372_c3_05c9 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e9a5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e9a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e9a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e9a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_31e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e9a5_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_e9a5_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_e9a5_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_e9a5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ff_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ff_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_31e3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_dedd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_31e3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_ad5a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_31e3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_31e3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_31e3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_ad5a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_31e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_31e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_31e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_ad5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_31e3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_0ab3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_0ab3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_0ab3_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_ad5a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_53a3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_ad5a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_6f0b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_ad5a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_ad5a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_ad5a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_6f0b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_ad5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_ad5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_ad5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_6f0b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_ad5a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_fbdb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_fbdb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_fbdb_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_6f0b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_285c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_6f0b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_35ad_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_6f0b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_6f0b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_6f0b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_35ad_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_6f0b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_6f0b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_6f0b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_35ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_6f0b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_3816_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_3816_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_3816_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_35ad_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_a61e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_35ad_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l388_c7_35ad_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_35ad_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_35ad_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_35ad_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_35ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_35ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_35ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_35ad_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l388_l355_l352_l339_l359_DUPLICATE_37e8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l363_l355_l359_DUPLICATE_4b02_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l352_l355_l370_l359_DUPLICATE_6063_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l388_l355_l384_l352_l380_l376_l370_l363_l359_DUPLICATE_1ae2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l394_l335_DUPLICATE_b1ab_return_output : opcode_result_t;
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
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_3816_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_b797_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_dedd := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_31e3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_dedd;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l372_c3_05c9 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e9a5_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l372_c3_05c9;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_fbdb_right := to_unsigned(8, 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_93bd_y := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_93bd_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_732a_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_34b6 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_a057_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_34b6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0e65_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_a057_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_53a3 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_ad5a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_53a3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_e595_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_0ab3_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_a61e := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_35ad_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_a61e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l349_c3_10dc := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l349_c3_10dc;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_35ad_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_281b := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_281b;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_285c := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_6f0b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_285c;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_3dab_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l344_c3_324c := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l344_c3_324c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_f358_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l361_c3_d496 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3d9c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l361_c3_d496;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ff_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l373_c3_b83f := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e9a5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l373_c3_b83f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l353_c3_d98a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l353_c3_d98a;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_93bd_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_3d9c_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_a057_iffalse := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_ad5a_iftrue := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_35ad_iftrue := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_a057_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_e9a5_iffalse := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_31e3_iftrue := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_6f0b_iftrue := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_f358_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_732a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_b797_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0e65_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_3dab_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_e595_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ff_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_0ab3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_fbdb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_3816_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_a057_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_e9a5_iftrue := VAR_previous_stack_read;
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue := VAR_previous_stack_read;
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_e9a5_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse := t16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_a057_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_iffalse := t16_low;
     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l388_c7_35ad] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l388_c7_35ad_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l363_l355_l359_DUPLICATE_4b02 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l363_l355_l359_DUPLICATE_4b02_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l359_c11_0e65] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l359_c11_0e65_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0e65_left;
     BIN_OP_EQ_uxn_opcodes_h_l359_c11_0e65_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0e65_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0e65_return_output := BIN_OP_EQ_uxn_opcodes_h_l359_c11_0e65_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l352_l355_l370_l359_DUPLICATE_6063 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l352_l355_l370_l359_DUPLICATE_6063_return_output := result.sp_relative_shift;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l339_c2_2a42] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l339_c2_2a42_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l339_c6_f358] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l339_c6_f358_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_f358_left;
     BIN_OP_EQ_uxn_opcodes_h_l339_c6_f358_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_f358_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_f358_return_output := BIN_OP_EQ_uxn_opcodes_h_l339_c6_f358_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l352_c11_732a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l352_c11_732a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_732a_left;
     BIN_OP_EQ_uxn_opcodes_h_l352_c11_732a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_732a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_732a_return_output := BIN_OP_EQ_uxn_opcodes_h_l352_c11_732a_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l388_l355_l352_l339_l359_DUPLICATE_37e8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l388_l355_l352_l339_l359_DUPLICATE_37e8_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l384_c11_fbdb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l384_c11_fbdb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_fbdb_left;
     BIN_OP_EQ_uxn_opcodes_h_l384_c11_fbdb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_fbdb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_fbdb_return_output := BIN_OP_EQ_uxn_opcodes_h_l384_c11_fbdb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l388_c11_3816] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l388_c11_3816_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_3816_left;
     BIN_OP_EQ_uxn_opcodes_h_l388_c11_3816_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_3816_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_3816_return_output := BIN_OP_EQ_uxn_opcodes_h_l388_c11_3816_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l370_c11_e595] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l370_c11_e595_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_e595_left;
     BIN_OP_EQ_uxn_opcodes_h_l370_c11_e595_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_e595_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_e595_return_output := BIN_OP_EQ_uxn_opcodes_h_l370_c11_e595_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l339_c2_2a42] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l339_c2_2a42_return_output := result.is_ram_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l339_c2_2a42] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l339_c2_2a42_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l388_l355_l384_l352_l380_l376_l370_l363_l359_DUPLICATE_1ae2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l388_l355_l384_l352_l380_l376_l370_l363_l359_DUPLICATE_1ae2_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l355_c11_b797] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l355_c11_b797_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_b797_left;
     BIN_OP_EQ_uxn_opcodes_h_l355_c11_b797_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_b797_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_b797_return_output := BIN_OP_EQ_uxn_opcodes_h_l355_c11_b797_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l376_c11_02ff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ff_left;
     BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ff_return_output := BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l363_c11_3dab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l363_c11_3dab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_3dab_left;
     BIN_OP_EQ_uxn_opcodes_h_l363_c11_3dab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_3dab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_3dab_return_output := BIN_OP_EQ_uxn_opcodes_h_l363_c11_3dab_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l339_c2_2a42] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l339_c2_2a42_return_output := result.is_stack_index_flipped;

     -- sp_relative_shift[uxn_opcodes_h_l365_c30_93bd] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l365_c30_93bd_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_93bd_ins;
     sp_relative_shift_uxn_opcodes_h_l365_c30_93bd_x <= VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_93bd_x;
     sp_relative_shift_uxn_opcodes_h_l365_c30_93bd_y <= VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_93bd_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_93bd_return_output := sp_relative_shift_uxn_opcodes_h_l365_c30_93bd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l380_c11_0ab3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l380_c11_0ab3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_0ab3_left;
     BIN_OP_EQ_uxn_opcodes_h_l380_c11_0ab3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_0ab3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_0ab3_return_output := BIN_OP_EQ_uxn_opcodes_h_l380_c11_0ab3_return_output;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_2a42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_f358_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_2a42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_f358_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2a42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_f358_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2a42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_f358_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2a42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_f358_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2a42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_f358_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2a42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_f358_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2a42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_f358_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2a42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_f358_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2a42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_f358_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_2a42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_f358_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_2a42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_f358_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_2a42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_f358_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_73a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_732a_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_73a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_732a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_73a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_732a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_73a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_732a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_73a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_732a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_73a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_732a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_73a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_732a_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_73a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_732a_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_73a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_732a_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_8a95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_b797_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_8a95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_b797_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_8a95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_b797_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_8a95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_b797_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_8a95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_b797_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_8a95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_b797_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_8a95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_b797_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_8a95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_b797_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_8a95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_b797_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_3d9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0e65_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0e65_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3d9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0e65_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3d9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0e65_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3d9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0e65_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3d9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0e65_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_3d9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0e65_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0e65_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_a057_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_3dab_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_a057_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_3dab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_a057_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_3dab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_a057_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_3dab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_a057_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_3dab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_a057_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_3dab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_a057_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_3dab_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_e9a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_e595_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e9a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_e595_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e9a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_e595_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e9a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_e595_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_e9a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_e595_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_31e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_31e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_31e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_02ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_ad5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_0ab3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_ad5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_0ab3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_ad5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_0ab3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_6f0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_fbdb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_6f0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_fbdb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_6f0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_fbdb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_35ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_3816_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_35ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_3816_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_35ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_3816_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l352_l355_l370_l359_DUPLICATE_6063_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l352_l355_l370_l359_DUPLICATE_6063_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3d9c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l352_l355_l370_l359_DUPLICATE_6063_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e9a5_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l352_l355_l370_l359_DUPLICATE_6063_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l388_l355_l384_l352_l380_l376_l370_l363_l359_DUPLICATE_1ae2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l388_l355_l384_l352_l380_l376_l370_l363_l359_DUPLICATE_1ae2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3d9c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l388_l355_l384_l352_l380_l376_l370_l363_l359_DUPLICATE_1ae2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_a057_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l388_l355_l384_l352_l380_l376_l370_l363_l359_DUPLICATE_1ae2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e9a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l388_l355_l384_l352_l380_l376_l370_l363_l359_DUPLICATE_1ae2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_31e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l388_l355_l384_l352_l380_l376_l370_l363_l359_DUPLICATE_1ae2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_ad5a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l388_l355_l384_l352_l380_l376_l370_l363_l359_DUPLICATE_1ae2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_6f0b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l388_l355_l384_l352_l380_l376_l370_l363_l359_DUPLICATE_1ae2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_35ad_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l388_l355_l384_l352_l380_l376_l370_l363_l359_DUPLICATE_1ae2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l363_l355_l359_DUPLICATE_4b02_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l363_l355_l359_DUPLICATE_4b02_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3d9c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l363_l355_l359_DUPLICATE_4b02_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_a057_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l363_l355_l359_DUPLICATE_4b02_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l388_l355_l352_l339_l359_DUPLICATE_37e8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l388_l355_l352_l339_l359_DUPLICATE_37e8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l388_l355_l352_l339_l359_DUPLICATE_37e8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_3d9c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l388_l355_l352_l339_l359_DUPLICATE_37e8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_35ad_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l388_l355_l352_l339_l359_DUPLICATE_37e8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l339_c2_2a42_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l339_c2_2a42_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l339_c2_2a42_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l339_c2_2a42_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_35ad_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l388_c7_35ad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_a057_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_93bd_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l388_c7_35ad] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_35ad_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_35ad_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_35ad_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_35ad_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_35ad_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_35ad_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_35ad_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_35ad_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l388_c7_35ad] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_35ad_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_35ad_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_35ad_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_35ad_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_35ad_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_35ad_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_35ad_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_35ad_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l370_c7_e9a5] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l370_c7_e9a5_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_e9a5_cond;
     n16_low_MUX_uxn_opcodes_h_l370_c7_e9a5_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_e9a5_iftrue;
     n16_low_MUX_uxn_opcodes_h_l370_c7_e9a5_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_e9a5_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_e9a5_return_output := n16_low_MUX_uxn_opcodes_h_l370_c7_e9a5_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l339_c2_2a42] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2a42_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2a42_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2a42_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2a42_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l355_c7_8a95] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l355_c7_8a95_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_8a95_cond;
     t16_high_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue;
     t16_high_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_8a95_return_output := t16_high_MUX_uxn_opcodes_h_l355_c7_8a95_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l339_c2_2a42] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2a42_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2a42_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2a42_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2a42_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l339_c2_2a42] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2a42_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2a42_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2a42_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2a42_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l339_c2_2a42] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2a42_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2a42_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2a42_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2a42_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l359_c7_3d9c] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_cond;
     t16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_iftrue;
     t16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output := t16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l370_c7_e9a5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e9a5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e9a5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e9a5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e9a5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e9a5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e9a5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e9a5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e9a5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l388_c7_35ad] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l388_c7_35ad_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_35ad_cond;
     result_u8_value_MUX_uxn_opcodes_h_l388_c7_35ad_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_35ad_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l388_c7_35ad_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_35ad_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_35ad_return_output := result_u8_value_MUX_uxn_opcodes_h_l388_c7_35ad_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l363_c7_a057] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_a057_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_a057_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_a057_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_a057_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_a057_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_a057_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_a057_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_a057_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l363_c7_a057] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l363_c7_a057_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_a057_cond;
     n16_high_MUX_uxn_opcodes_h_l363_c7_a057_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_a057_iftrue;
     n16_high_MUX_uxn_opcodes_h_l363_c7_a057_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_a057_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_a057_return_output := n16_high_MUX_uxn_opcodes_h_l363_c7_a057_return_output;

     -- Submodule level 2
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_3d9c_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_a057_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_a057_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_e9a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_6f0b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_35ad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3d9c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_a057_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_a057_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_e9a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_6f0b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_35ad_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_6f0b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_35ad_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_8a95_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output;
     -- t16_high_MUX[uxn_opcodes_h_l352_c7_73a8] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l352_c7_73a8_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_73a8_cond;
     t16_high_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue;
     t16_high_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_73a8_return_output := t16_high_MUX_uxn_opcodes_h_l352_c7_73a8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l363_c7_a057] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_a057_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_a057_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_a057_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_a057_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_a057_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_a057_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_a057_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_a057_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l384_c7_6f0b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l384_c7_6f0b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_6f0b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l384_c7_6f0b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_6f0b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l384_c7_6f0b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_6f0b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_6f0b_return_output := result_u8_value_MUX_uxn_opcodes_h_l384_c7_6f0b_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l355_c7_8a95] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l355_c7_8a95_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_8a95_cond;
     t16_low_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue;
     t16_low_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_8a95_return_output := t16_low_MUX_uxn_opcodes_h_l355_c7_8a95_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l359_c7_3d9c] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l359_c7_3d9c_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_3d9c_cond;
     n16_high_MUX_uxn_opcodes_h_l359_c7_3d9c_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_3d9c_iftrue;
     n16_high_MUX_uxn_opcodes_h_l359_c7_3d9c_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_3d9c_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output := n16_high_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l384_c7_6f0b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_6f0b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_6f0b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_6f0b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_6f0b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_6f0b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_6f0b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_6f0b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_6f0b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l384_c7_6f0b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_6f0b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_6f0b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_6f0b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_6f0b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_6f0b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_6f0b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_6f0b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_6f0b_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l363_c7_a057] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l363_c7_a057_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_a057_cond;
     n16_low_MUX_uxn_opcodes_h_l363_c7_a057_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_a057_iftrue;
     n16_low_MUX_uxn_opcodes_h_l363_c7_a057_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_a057_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_a057_return_output := n16_low_MUX_uxn_opcodes_h_l363_c7_a057_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l359_c7_3d9c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3d9c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3d9c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3d9c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3d9c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3d9c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3d9c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_a057_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_ad5a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_6f0b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3d9c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_a057_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_ad5a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_6f0b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_ad5a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_6f0b_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_73a8_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_8a95_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l380_c7_ad5a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l380_c7_ad5a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_ad5a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l380_c7_ad5a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_ad5a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l380_c7_ad5a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_ad5a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_ad5a_return_output := result_u8_value_MUX_uxn_opcodes_h_l380_c7_ad5a_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l355_c7_8a95] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l355_c7_8a95_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_8a95_cond;
     n16_high_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue;
     n16_high_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_8a95_return_output := n16_high_MUX_uxn_opcodes_h_l355_c7_8a95_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l352_c7_73a8] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l352_c7_73a8_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_73a8_cond;
     t16_low_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue;
     t16_low_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_73a8_return_output := t16_low_MUX_uxn_opcodes_h_l352_c7_73a8_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l339_c2_2a42] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l339_c2_2a42_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_2a42_cond;
     t16_high_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue;
     t16_high_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_2a42_return_output := t16_high_MUX_uxn_opcodes_h_l339_c2_2a42_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l359_c7_3d9c] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_cond;
     n16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_iftrue;
     n16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output := n16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l359_c7_3d9c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3d9c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3d9c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3d9c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3d9c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3d9c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3d9c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l355_c7_8a95] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_8a95_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_8a95_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_8a95_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_8a95_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l380_c7_ad5a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_ad5a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_ad5a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_ad5a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_ad5a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_ad5a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_ad5a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_ad5a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_ad5a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l380_c7_ad5a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_ad5a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_ad5a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_ad5a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_ad5a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_ad5a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_ad5a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_ad5a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_ad5a_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_8a95_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_31e3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_ad5a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_8a95_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_31e3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_ad5a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_31e3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_ad5a_return_output;
     REG_VAR_t16_high := VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_2a42_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_73a8_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l352_c7_73a8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_73a8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_73a8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_73a8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_73a8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l376_c7_31e3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_31e3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_31e3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_31e3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_31e3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_31e3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_31e3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_31e3_return_output := result_u8_value_MUX_uxn_opcodes_h_l376_c7_31e3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l355_c7_8a95] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_8a95_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_8a95_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_8a95_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_8a95_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l376_c7_31e3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_31e3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_31e3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_31e3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_31e3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_31e3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_31e3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_31e3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_31e3_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l352_c7_73a8] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l352_c7_73a8_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_73a8_cond;
     n16_high_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue;
     n16_high_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_73a8_return_output := n16_high_MUX_uxn_opcodes_h_l352_c7_73a8_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l339_c2_2a42] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l339_c2_2a42_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_2a42_cond;
     t16_low_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue;
     t16_low_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_2a42_return_output := t16_low_MUX_uxn_opcodes_h_l339_c2_2a42_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l376_c7_31e3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_31e3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_31e3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_31e3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_31e3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_31e3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_31e3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_31e3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_31e3_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l355_c7_8a95] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l355_c7_8a95_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_8a95_cond;
     n16_low_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue;
     n16_low_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_8a95_return_output := n16_low_MUX_uxn_opcodes_h_l355_c7_8a95_return_output;

     -- Submodule level 5
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_73a8_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_8a95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e9a5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_31e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_73a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_8a95_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e9a5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_31e3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_e9a5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_31e3_return_output;
     REG_VAR_t16_low := VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_2a42_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l352_c7_73a8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_73a8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_73a8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_73a8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_73a8_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l339_c2_2a42] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l339_c2_2a42_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_2a42_cond;
     n16_high_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue;
     n16_high_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_2a42_return_output := n16_high_MUX_uxn_opcodes_h_l339_c2_2a42_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l339_c2_2a42] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2a42_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2a42_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2a42_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2a42_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l370_c7_e9a5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e9a5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e9a5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e9a5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e9a5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e9a5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e9a5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e9a5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e9a5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l370_c7_e9a5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_e9a5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_e9a5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_e9a5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_e9a5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_e9a5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_e9a5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_e9a5_return_output := result_u8_value_MUX_uxn_opcodes_h_l370_c7_e9a5_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l352_c7_73a8] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l352_c7_73a8_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_73a8_cond;
     n16_low_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue;
     n16_low_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_73a8_return_output := n16_low_MUX_uxn_opcodes_h_l352_c7_73a8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l370_c7_e9a5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e9a5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e9a5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e9a5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e9a5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e9a5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e9a5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e9a5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e9a5_return_output;

     -- Submodule level 6
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_2a42_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_73a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_a057_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_e9a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_73a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_a057_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_e9a5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_a057_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_e9a5_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l363_c7_a057] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_a057_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_a057_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_a057_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_a057_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_a057_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_a057_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_a057_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_a057_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l363_c7_a057] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l363_c7_a057_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_a057_cond;
     result_u8_value_MUX_uxn_opcodes_h_l363_c7_a057_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_a057_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l363_c7_a057_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_a057_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_a057_return_output := result_u8_value_MUX_uxn_opcodes_h_l363_c7_a057_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l363_c7_a057] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_a057_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_a057_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_a057_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_a057_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_a057_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_a057_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_a057_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_a057_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l339_c2_2a42] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l339_c2_2a42_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_2a42_cond;
     n16_low_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue;
     n16_low_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_2a42_return_output := n16_low_MUX_uxn_opcodes_h_l339_c2_2a42_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l339_c2_2a42] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2a42_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2a42_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2a42_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2a42_return_output;

     -- Submodule level 7
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_2a42_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3d9c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_a057_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3d9c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_a057_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_3d9c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_a057_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l359_c7_3d9c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l359_c7_3d9c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_3d9c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l359_c7_3d9c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_3d9c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l359_c7_3d9c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_3d9c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output := result_u8_value_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l359_c7_3d9c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3d9c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3d9c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3d9c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3d9c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3d9c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3d9c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l359_c7_3d9c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3d9c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3d9c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3d9c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3d9c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3d9c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3d9c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_3d9c_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l355_c7_8a95] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l355_c7_8a95_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_8a95_cond;
     result_u8_value_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_8a95_return_output := result_u8_value_MUX_uxn_opcodes_h_l355_c7_8a95_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l355_c7_8a95] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_8a95_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_8a95_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_8a95_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_8a95_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l355_c7_8a95] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_8a95_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_8a95_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_8a95_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_8a95_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_8a95_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_8a95_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_8a95_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_8a95_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_8a95_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l352_c7_73a8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_73a8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_73a8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_73a8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_73a8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l352_c7_73a8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_73a8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_73a8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_73a8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_73a8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l352_c7_73a8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l352_c7_73a8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_73a8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_73a8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_73a8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_73a8_return_output := result_u8_value_MUX_uxn_opcodes_h_l352_c7_73a8_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_73a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_73a8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_73a8_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l339_c2_2a42] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2a42_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2a42_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2a42_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2a42_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l339_c2_2a42] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l339_c2_2a42_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_2a42_cond;
     result_u8_value_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_2a42_return_output := result_u8_value_MUX_uxn_opcodes_h_l339_c2_2a42_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l339_c2_2a42] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2a42_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2a42_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2a42_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2a42_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2a42_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2a42_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l394_l335_DUPLICATE_b1ab LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l394_l335_DUPLICATE_b1ab_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b856(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2a42_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_2a42_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2a42_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2a42_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2a42_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2a42_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2a42_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2a42_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2a42_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l394_l335_DUPLICATE_b1ab_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l394_l335_DUPLICATE_b1ab_return_output;
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
