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
-- BIN_OP_EQ[uxn_opcodes_h_l339_c6_17ba]
signal BIN_OP_EQ_uxn_opcodes_h_l339_c6_17ba_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l339_c6_17ba_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l339_c6_17ba_return_output : unsigned(0 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l339_c2_4394]
signal t16_high_MUX_uxn_opcodes_h_l339_c2_4394_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l339_c2_4394_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l339_c2_4394_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l339_c2_4394_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l339_c2_4394]
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_4394_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_4394_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_4394_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_4394_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l339_c2_4394]
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_4394_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_4394_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_4394_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_4394_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l339_c2_4394]
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_4394_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_4394_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_4394_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_4394_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l339_c2_4394]
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_4394_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_4394_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_4394_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_4394_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l339_c2_4394]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_4394_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_4394_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_4394_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_4394_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l339_c2_4394]
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_4394_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_4394_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_4394_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_4394_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l339_c2_4394]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_4394_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_4394_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_4394_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_4394_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l339_c2_4394]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_4394_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_4394_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_4394_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_4394_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l339_c2_4394]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_4394_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_4394_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_4394_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_4394_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l339_c2_4394]
signal n16_low_MUX_uxn_opcodes_h_l339_c2_4394_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l339_c2_4394_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l339_c2_4394_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l339_c2_4394_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l339_c2_4394]
signal t16_low_MUX_uxn_opcodes_h_l339_c2_4394_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l339_c2_4394_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l339_c2_4394_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l339_c2_4394_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l339_c2_4394]
signal n16_high_MUX_uxn_opcodes_h_l339_c2_4394_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l339_c2_4394_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l339_c2_4394_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l339_c2_4394_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l352_c11_0d8d]
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_0d8d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_0d8d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_0d8d_return_output : unsigned(0 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l352_c7_9028]
signal t16_high_MUX_uxn_opcodes_h_l352_c7_9028_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l352_c7_9028_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l352_c7_9028_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l352_c7_9028_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l352_c7_9028]
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_9028_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_9028_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_9028_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_9028_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l352_c7_9028]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_9028_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_9028_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_9028_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_9028_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l352_c7_9028]
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_9028_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_9028_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_9028_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_9028_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l352_c7_9028]
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_9028_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_9028_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_9028_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_9028_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l352_c7_9028]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_9028_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_9028_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_9028_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_9028_return_output : signed(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l352_c7_9028]
signal n16_low_MUX_uxn_opcodes_h_l352_c7_9028_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l352_c7_9028_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l352_c7_9028_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l352_c7_9028_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l352_c7_9028]
signal t16_low_MUX_uxn_opcodes_h_l352_c7_9028_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l352_c7_9028_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l352_c7_9028_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l352_c7_9028_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l352_c7_9028]
signal n16_high_MUX_uxn_opcodes_h_l352_c7_9028_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l352_c7_9028_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l352_c7_9028_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l352_c7_9028_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l355_c11_17b2]
signal BIN_OP_EQ_uxn_opcodes_h_l355_c11_17b2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l355_c11_17b2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l355_c11_17b2_return_output : unsigned(0 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l355_c7_9087]
signal t16_high_MUX_uxn_opcodes_h_l355_c7_9087_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l355_c7_9087_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l355_c7_9087_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l355_c7_9087_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l355_c7_9087]
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_9087_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_9087_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_9087_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_9087_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l355_c7_9087]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_9087_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_9087_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_9087_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_9087_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l355_c7_9087]
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_9087_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_9087_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_9087_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_9087_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l355_c7_9087]
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_9087_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_9087_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_9087_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_9087_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l355_c7_9087]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_9087_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_9087_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_9087_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_9087_return_output : signed(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l355_c7_9087]
signal n16_low_MUX_uxn_opcodes_h_l355_c7_9087_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l355_c7_9087_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l355_c7_9087_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l355_c7_9087_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l355_c7_9087]
signal t16_low_MUX_uxn_opcodes_h_l355_c7_9087_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l355_c7_9087_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l355_c7_9087_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l355_c7_9087_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l355_c7_9087]
signal n16_high_MUX_uxn_opcodes_h_l355_c7_9087_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l355_c7_9087_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l355_c7_9087_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l355_c7_9087_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l359_c11_7fb3]
signal BIN_OP_EQ_uxn_opcodes_h_l359_c11_7fb3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l359_c11_7fb3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l359_c11_7fb3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l359_c7_3acd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3acd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3acd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3acd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3acd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l359_c7_3acd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3acd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3acd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3acd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3acd_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l359_c7_3acd]
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_3acd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_3acd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_3acd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_3acd_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l359_c7_3acd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3acd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3acd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3acd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3acd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l359_c7_3acd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3acd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3acd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3acd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3acd_return_output : signed(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l359_c7_3acd]
signal n16_low_MUX_uxn_opcodes_h_l359_c7_3acd_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l359_c7_3acd_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l359_c7_3acd_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l359_c7_3acd_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l359_c7_3acd]
signal t16_low_MUX_uxn_opcodes_h_l359_c7_3acd_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l359_c7_3acd_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l359_c7_3acd_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l359_c7_3acd_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l359_c7_3acd]
signal n16_high_MUX_uxn_opcodes_h_l359_c7_3acd_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l359_c7_3acd_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l359_c7_3acd_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l359_c7_3acd_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l363_c11_715a]
signal BIN_OP_EQ_uxn_opcodes_h_l363_c11_715a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l363_c11_715a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l363_c11_715a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l363_c7_c5e5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c5e5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c5e5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c5e5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c5e5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l363_c7_c5e5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c5e5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c5e5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c5e5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c5e5_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l363_c7_c5e5]
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_c5e5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_c5e5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_c5e5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_c5e5_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l363_c7_c5e5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c5e5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c5e5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c5e5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c5e5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l363_c7_c5e5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c5e5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c5e5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c5e5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c5e5_return_output : signed(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l363_c7_c5e5]
signal n16_low_MUX_uxn_opcodes_h_l363_c7_c5e5_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l363_c7_c5e5_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l363_c7_c5e5_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l363_c7_c5e5_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l363_c7_c5e5]
signal n16_high_MUX_uxn_opcodes_h_l363_c7_c5e5_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l363_c7_c5e5_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l363_c7_c5e5_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l363_c7_c5e5_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l365_c30_6f3b]
signal sp_relative_shift_uxn_opcodes_h_l365_c30_6f3b_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l365_c30_6f3b_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l365_c30_6f3b_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l365_c30_6f3b_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l370_c11_2fe8]
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_2fe8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_2fe8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_2fe8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l370_c7_3abe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_3abe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_3abe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_3abe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_3abe_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l370_c7_3abe]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_3abe_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_3abe_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_3abe_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_3abe_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l370_c7_3abe]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_3abe_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_3abe_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_3abe_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_3abe_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l370_c7_3abe]
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_3abe_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_3abe_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_3abe_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_3abe_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l370_c7_3abe]
signal n16_low_MUX_uxn_opcodes_h_l370_c7_3abe_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l370_c7_3abe_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l370_c7_3abe_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l370_c7_3abe_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l376_c11_df65]
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_df65_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_df65_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_df65_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l376_c7_e359]
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e359_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e359_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e359_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e359_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l376_c7_e359]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e359_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e359_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e359_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e359_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l376_c7_e359]
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_e359_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_e359_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_e359_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_e359_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l380_c11_7a43]
signal BIN_OP_EQ_uxn_opcodes_h_l380_c11_7a43_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l380_c11_7a43_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l380_c11_7a43_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l380_c7_e161]
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e161_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e161_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e161_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e161_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l380_c7_e161]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e161_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e161_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e161_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e161_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l380_c7_e161]
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_e161_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_e161_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_e161_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_e161_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l384_c11_a499]
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_a499_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_a499_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_a499_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l384_c7_1613]
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1613_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1613_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1613_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1613_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l384_c7_1613]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1613_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1613_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1613_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1613_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l384_c7_1613]
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_1613_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_1613_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_1613_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_1613_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l388_c11_c15f]
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_c15f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_c15f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_c15f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l388_c7_83e6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_83e6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_83e6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_83e6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_83e6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l388_c7_83e6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_83e6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_83e6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_83e6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_83e6_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l388_c7_83e6]
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_83e6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_83e6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_83e6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_83e6_return_output : unsigned(7 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_c580( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.u8_value := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;
      base.is_pc_updated := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l339_c6_17ba
BIN_OP_EQ_uxn_opcodes_h_l339_c6_17ba : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l339_c6_17ba_left,
BIN_OP_EQ_uxn_opcodes_h_l339_c6_17ba_right,
BIN_OP_EQ_uxn_opcodes_h_l339_c6_17ba_return_output);

-- t16_high_MUX_uxn_opcodes_h_l339_c2_4394
t16_high_MUX_uxn_opcodes_h_l339_c2_4394 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l339_c2_4394_cond,
t16_high_MUX_uxn_opcodes_h_l339_c2_4394_iftrue,
t16_high_MUX_uxn_opcodes_h_l339_c2_4394_iffalse,
t16_high_MUX_uxn_opcodes_h_l339_c2_4394_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_4394
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_4394 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_4394_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_4394_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_4394_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_4394_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_4394
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_4394 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_4394_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_4394_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_4394_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_4394_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_4394
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_4394 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_4394_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_4394_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_4394_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_4394_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_4394
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_4394 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_4394_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_4394_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_4394_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_4394_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_4394
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_4394 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_4394_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_4394_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_4394_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_4394_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l339_c2_4394
result_u8_value_MUX_uxn_opcodes_h_l339_c2_4394 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l339_c2_4394_cond,
result_u8_value_MUX_uxn_opcodes_h_l339_c2_4394_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l339_c2_4394_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l339_c2_4394_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_4394
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_4394 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_4394_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_4394_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_4394_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_4394_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_4394
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_4394 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_4394_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_4394_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_4394_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_4394_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_4394
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_4394 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_4394_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_4394_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_4394_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_4394_return_output);

-- n16_low_MUX_uxn_opcodes_h_l339_c2_4394
n16_low_MUX_uxn_opcodes_h_l339_c2_4394 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l339_c2_4394_cond,
n16_low_MUX_uxn_opcodes_h_l339_c2_4394_iftrue,
n16_low_MUX_uxn_opcodes_h_l339_c2_4394_iffalse,
n16_low_MUX_uxn_opcodes_h_l339_c2_4394_return_output);

-- t16_low_MUX_uxn_opcodes_h_l339_c2_4394
t16_low_MUX_uxn_opcodes_h_l339_c2_4394 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l339_c2_4394_cond,
t16_low_MUX_uxn_opcodes_h_l339_c2_4394_iftrue,
t16_low_MUX_uxn_opcodes_h_l339_c2_4394_iffalse,
t16_low_MUX_uxn_opcodes_h_l339_c2_4394_return_output);

-- n16_high_MUX_uxn_opcodes_h_l339_c2_4394
n16_high_MUX_uxn_opcodes_h_l339_c2_4394 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l339_c2_4394_cond,
n16_high_MUX_uxn_opcodes_h_l339_c2_4394_iftrue,
n16_high_MUX_uxn_opcodes_h_l339_c2_4394_iffalse,
n16_high_MUX_uxn_opcodes_h_l339_c2_4394_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l352_c11_0d8d
BIN_OP_EQ_uxn_opcodes_h_l352_c11_0d8d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l352_c11_0d8d_left,
BIN_OP_EQ_uxn_opcodes_h_l352_c11_0d8d_right,
BIN_OP_EQ_uxn_opcodes_h_l352_c11_0d8d_return_output);

-- t16_high_MUX_uxn_opcodes_h_l352_c7_9028
t16_high_MUX_uxn_opcodes_h_l352_c7_9028 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l352_c7_9028_cond,
t16_high_MUX_uxn_opcodes_h_l352_c7_9028_iftrue,
t16_high_MUX_uxn_opcodes_h_l352_c7_9028_iffalse,
t16_high_MUX_uxn_opcodes_h_l352_c7_9028_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_9028
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_9028 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_9028_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_9028_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_9028_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_9028_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_9028
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_9028 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_9028_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_9028_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_9028_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_9028_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l352_c7_9028
result_u8_value_MUX_uxn_opcodes_h_l352_c7_9028 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l352_c7_9028_cond,
result_u8_value_MUX_uxn_opcodes_h_l352_c7_9028_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l352_c7_9028_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l352_c7_9028_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_9028
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_9028 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_9028_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_9028_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_9028_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_9028_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_9028
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_9028 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_9028_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_9028_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_9028_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_9028_return_output);

-- n16_low_MUX_uxn_opcodes_h_l352_c7_9028
n16_low_MUX_uxn_opcodes_h_l352_c7_9028 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l352_c7_9028_cond,
n16_low_MUX_uxn_opcodes_h_l352_c7_9028_iftrue,
n16_low_MUX_uxn_opcodes_h_l352_c7_9028_iffalse,
n16_low_MUX_uxn_opcodes_h_l352_c7_9028_return_output);

-- t16_low_MUX_uxn_opcodes_h_l352_c7_9028
t16_low_MUX_uxn_opcodes_h_l352_c7_9028 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l352_c7_9028_cond,
t16_low_MUX_uxn_opcodes_h_l352_c7_9028_iftrue,
t16_low_MUX_uxn_opcodes_h_l352_c7_9028_iffalse,
t16_low_MUX_uxn_opcodes_h_l352_c7_9028_return_output);

-- n16_high_MUX_uxn_opcodes_h_l352_c7_9028
n16_high_MUX_uxn_opcodes_h_l352_c7_9028 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l352_c7_9028_cond,
n16_high_MUX_uxn_opcodes_h_l352_c7_9028_iftrue,
n16_high_MUX_uxn_opcodes_h_l352_c7_9028_iffalse,
n16_high_MUX_uxn_opcodes_h_l352_c7_9028_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l355_c11_17b2
BIN_OP_EQ_uxn_opcodes_h_l355_c11_17b2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l355_c11_17b2_left,
BIN_OP_EQ_uxn_opcodes_h_l355_c11_17b2_right,
BIN_OP_EQ_uxn_opcodes_h_l355_c11_17b2_return_output);

-- t16_high_MUX_uxn_opcodes_h_l355_c7_9087
t16_high_MUX_uxn_opcodes_h_l355_c7_9087 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l355_c7_9087_cond,
t16_high_MUX_uxn_opcodes_h_l355_c7_9087_iftrue,
t16_high_MUX_uxn_opcodes_h_l355_c7_9087_iffalse,
t16_high_MUX_uxn_opcodes_h_l355_c7_9087_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_9087
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_9087 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_9087_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_9087_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_9087_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_9087_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_9087
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_9087 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_9087_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_9087_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_9087_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_9087_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l355_c7_9087
result_u8_value_MUX_uxn_opcodes_h_l355_c7_9087 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l355_c7_9087_cond,
result_u8_value_MUX_uxn_opcodes_h_l355_c7_9087_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l355_c7_9087_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l355_c7_9087_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_9087
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_9087 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_9087_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_9087_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_9087_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_9087_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_9087
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_9087 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_9087_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_9087_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_9087_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_9087_return_output);

-- n16_low_MUX_uxn_opcodes_h_l355_c7_9087
n16_low_MUX_uxn_opcodes_h_l355_c7_9087 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l355_c7_9087_cond,
n16_low_MUX_uxn_opcodes_h_l355_c7_9087_iftrue,
n16_low_MUX_uxn_opcodes_h_l355_c7_9087_iffalse,
n16_low_MUX_uxn_opcodes_h_l355_c7_9087_return_output);

-- t16_low_MUX_uxn_opcodes_h_l355_c7_9087
t16_low_MUX_uxn_opcodes_h_l355_c7_9087 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l355_c7_9087_cond,
t16_low_MUX_uxn_opcodes_h_l355_c7_9087_iftrue,
t16_low_MUX_uxn_opcodes_h_l355_c7_9087_iffalse,
t16_low_MUX_uxn_opcodes_h_l355_c7_9087_return_output);

-- n16_high_MUX_uxn_opcodes_h_l355_c7_9087
n16_high_MUX_uxn_opcodes_h_l355_c7_9087 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l355_c7_9087_cond,
n16_high_MUX_uxn_opcodes_h_l355_c7_9087_iftrue,
n16_high_MUX_uxn_opcodes_h_l355_c7_9087_iffalse,
n16_high_MUX_uxn_opcodes_h_l355_c7_9087_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l359_c11_7fb3
BIN_OP_EQ_uxn_opcodes_h_l359_c11_7fb3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l359_c11_7fb3_left,
BIN_OP_EQ_uxn_opcodes_h_l359_c11_7fb3_right,
BIN_OP_EQ_uxn_opcodes_h_l359_c11_7fb3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3acd
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3acd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3acd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3acd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3acd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3acd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3acd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3acd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3acd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3acd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3acd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3acd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l359_c7_3acd
result_u8_value_MUX_uxn_opcodes_h_l359_c7_3acd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l359_c7_3acd_cond,
result_u8_value_MUX_uxn_opcodes_h_l359_c7_3acd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l359_c7_3acd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l359_c7_3acd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3acd
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3acd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3acd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3acd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3acd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3acd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3acd
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3acd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3acd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3acd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3acd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3acd_return_output);

-- n16_low_MUX_uxn_opcodes_h_l359_c7_3acd
n16_low_MUX_uxn_opcodes_h_l359_c7_3acd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l359_c7_3acd_cond,
n16_low_MUX_uxn_opcodes_h_l359_c7_3acd_iftrue,
n16_low_MUX_uxn_opcodes_h_l359_c7_3acd_iffalse,
n16_low_MUX_uxn_opcodes_h_l359_c7_3acd_return_output);

-- t16_low_MUX_uxn_opcodes_h_l359_c7_3acd
t16_low_MUX_uxn_opcodes_h_l359_c7_3acd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l359_c7_3acd_cond,
t16_low_MUX_uxn_opcodes_h_l359_c7_3acd_iftrue,
t16_low_MUX_uxn_opcodes_h_l359_c7_3acd_iffalse,
t16_low_MUX_uxn_opcodes_h_l359_c7_3acd_return_output);

-- n16_high_MUX_uxn_opcodes_h_l359_c7_3acd
n16_high_MUX_uxn_opcodes_h_l359_c7_3acd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l359_c7_3acd_cond,
n16_high_MUX_uxn_opcodes_h_l359_c7_3acd_iftrue,
n16_high_MUX_uxn_opcodes_h_l359_c7_3acd_iffalse,
n16_high_MUX_uxn_opcodes_h_l359_c7_3acd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l363_c11_715a
BIN_OP_EQ_uxn_opcodes_h_l363_c11_715a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l363_c11_715a_left,
BIN_OP_EQ_uxn_opcodes_h_l363_c11_715a_right,
BIN_OP_EQ_uxn_opcodes_h_l363_c11_715a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c5e5
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c5e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c5e5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c5e5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c5e5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c5e5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c5e5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c5e5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c5e5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c5e5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c5e5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c5e5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l363_c7_c5e5
result_u8_value_MUX_uxn_opcodes_h_l363_c7_c5e5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l363_c7_c5e5_cond,
result_u8_value_MUX_uxn_opcodes_h_l363_c7_c5e5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l363_c7_c5e5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l363_c7_c5e5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c5e5
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c5e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c5e5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c5e5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c5e5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c5e5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c5e5
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c5e5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c5e5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c5e5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c5e5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c5e5_return_output);

-- n16_low_MUX_uxn_opcodes_h_l363_c7_c5e5
n16_low_MUX_uxn_opcodes_h_l363_c7_c5e5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l363_c7_c5e5_cond,
n16_low_MUX_uxn_opcodes_h_l363_c7_c5e5_iftrue,
n16_low_MUX_uxn_opcodes_h_l363_c7_c5e5_iffalse,
n16_low_MUX_uxn_opcodes_h_l363_c7_c5e5_return_output);

-- n16_high_MUX_uxn_opcodes_h_l363_c7_c5e5
n16_high_MUX_uxn_opcodes_h_l363_c7_c5e5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l363_c7_c5e5_cond,
n16_high_MUX_uxn_opcodes_h_l363_c7_c5e5_iftrue,
n16_high_MUX_uxn_opcodes_h_l363_c7_c5e5_iffalse,
n16_high_MUX_uxn_opcodes_h_l363_c7_c5e5_return_output);

-- sp_relative_shift_uxn_opcodes_h_l365_c30_6f3b
sp_relative_shift_uxn_opcodes_h_l365_c30_6f3b : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l365_c30_6f3b_ins,
sp_relative_shift_uxn_opcodes_h_l365_c30_6f3b_x,
sp_relative_shift_uxn_opcodes_h_l365_c30_6f3b_y,
sp_relative_shift_uxn_opcodes_h_l365_c30_6f3b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l370_c11_2fe8
BIN_OP_EQ_uxn_opcodes_h_l370_c11_2fe8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l370_c11_2fe8_left,
BIN_OP_EQ_uxn_opcodes_h_l370_c11_2fe8_right,
BIN_OP_EQ_uxn_opcodes_h_l370_c11_2fe8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_3abe
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_3abe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_3abe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_3abe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_3abe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_3abe_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_3abe
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_3abe : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_3abe_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_3abe_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_3abe_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_3abe_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_3abe
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_3abe : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_3abe_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_3abe_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_3abe_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_3abe_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l370_c7_3abe
result_u8_value_MUX_uxn_opcodes_h_l370_c7_3abe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l370_c7_3abe_cond,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_3abe_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_3abe_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_3abe_return_output);

-- n16_low_MUX_uxn_opcodes_h_l370_c7_3abe
n16_low_MUX_uxn_opcodes_h_l370_c7_3abe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l370_c7_3abe_cond,
n16_low_MUX_uxn_opcodes_h_l370_c7_3abe_iftrue,
n16_low_MUX_uxn_opcodes_h_l370_c7_3abe_iffalse,
n16_low_MUX_uxn_opcodes_h_l370_c7_3abe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l376_c11_df65
BIN_OP_EQ_uxn_opcodes_h_l376_c11_df65 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l376_c11_df65_left,
BIN_OP_EQ_uxn_opcodes_h_l376_c11_df65_right,
BIN_OP_EQ_uxn_opcodes_h_l376_c11_df65_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e359
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e359 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e359_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e359_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e359_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e359_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e359
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e359 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e359_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e359_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e359_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e359_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l376_c7_e359
result_u8_value_MUX_uxn_opcodes_h_l376_c7_e359 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l376_c7_e359_cond,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_e359_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_e359_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_e359_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l380_c11_7a43
BIN_OP_EQ_uxn_opcodes_h_l380_c11_7a43 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l380_c11_7a43_left,
BIN_OP_EQ_uxn_opcodes_h_l380_c11_7a43_right,
BIN_OP_EQ_uxn_opcodes_h_l380_c11_7a43_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e161
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e161 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e161_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e161_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e161_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e161_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e161
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e161 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e161_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e161_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e161_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e161_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l380_c7_e161
result_u8_value_MUX_uxn_opcodes_h_l380_c7_e161 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l380_c7_e161_cond,
result_u8_value_MUX_uxn_opcodes_h_l380_c7_e161_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l380_c7_e161_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l380_c7_e161_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l384_c11_a499
BIN_OP_EQ_uxn_opcodes_h_l384_c11_a499 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l384_c11_a499_left,
BIN_OP_EQ_uxn_opcodes_h_l384_c11_a499_right,
BIN_OP_EQ_uxn_opcodes_h_l384_c11_a499_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1613
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1613 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1613_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1613_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1613_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1613_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1613
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1613 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1613_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1613_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1613_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1613_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l384_c7_1613
result_u8_value_MUX_uxn_opcodes_h_l384_c7_1613 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l384_c7_1613_cond,
result_u8_value_MUX_uxn_opcodes_h_l384_c7_1613_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l384_c7_1613_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l384_c7_1613_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l388_c11_c15f
BIN_OP_EQ_uxn_opcodes_h_l388_c11_c15f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l388_c11_c15f_left,
BIN_OP_EQ_uxn_opcodes_h_l388_c11_c15f_right,
BIN_OP_EQ_uxn_opcodes_h_l388_c11_c15f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_83e6
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_83e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_83e6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_83e6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_83e6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_83e6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_83e6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_83e6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_83e6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_83e6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_83e6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_83e6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l388_c7_83e6
result_u8_value_MUX_uxn_opcodes_h_l388_c7_83e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l388_c7_83e6_cond,
result_u8_value_MUX_uxn_opcodes_h_l388_c7_83e6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l388_c7_83e6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l388_c7_83e6_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l339_c6_17ba_return_output,
 t16_high_MUX_uxn_opcodes_h_l339_c2_4394_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_4394_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_4394_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_4394_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_4394_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_4394_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l339_c2_4394_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_4394_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_4394_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_4394_return_output,
 n16_low_MUX_uxn_opcodes_h_l339_c2_4394_return_output,
 t16_low_MUX_uxn_opcodes_h_l339_c2_4394_return_output,
 n16_high_MUX_uxn_opcodes_h_l339_c2_4394_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l352_c11_0d8d_return_output,
 t16_high_MUX_uxn_opcodes_h_l352_c7_9028_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_9028_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_9028_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l352_c7_9028_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_9028_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_9028_return_output,
 n16_low_MUX_uxn_opcodes_h_l352_c7_9028_return_output,
 t16_low_MUX_uxn_opcodes_h_l352_c7_9028_return_output,
 n16_high_MUX_uxn_opcodes_h_l352_c7_9028_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l355_c11_17b2_return_output,
 t16_high_MUX_uxn_opcodes_h_l355_c7_9087_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_9087_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_9087_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l355_c7_9087_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_9087_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_9087_return_output,
 n16_low_MUX_uxn_opcodes_h_l355_c7_9087_return_output,
 t16_low_MUX_uxn_opcodes_h_l355_c7_9087_return_output,
 n16_high_MUX_uxn_opcodes_h_l355_c7_9087_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l359_c11_7fb3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3acd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3acd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l359_c7_3acd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3acd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3acd_return_output,
 n16_low_MUX_uxn_opcodes_h_l359_c7_3acd_return_output,
 t16_low_MUX_uxn_opcodes_h_l359_c7_3acd_return_output,
 n16_high_MUX_uxn_opcodes_h_l359_c7_3acd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l363_c11_715a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c5e5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c5e5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l363_c7_c5e5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c5e5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c5e5_return_output,
 n16_low_MUX_uxn_opcodes_h_l363_c7_c5e5_return_output,
 n16_high_MUX_uxn_opcodes_h_l363_c7_c5e5_return_output,
 sp_relative_shift_uxn_opcodes_h_l365_c30_6f3b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l370_c11_2fe8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_3abe_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_3abe_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_3abe_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l370_c7_3abe_return_output,
 n16_low_MUX_uxn_opcodes_h_l370_c7_3abe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l376_c11_df65_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e359_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e359_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l376_c7_e359_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l380_c11_7a43_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e161_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e161_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l380_c7_e161_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l384_c11_a499_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1613_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1613_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l384_c7_1613_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l388_c11_c15f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_83e6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_83e6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l388_c7_83e6_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_17ba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_17ba_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_17ba_return_output : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_4394_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_4394_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_9028_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_4394_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_4394_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_4394_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_4394_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_9028_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_4394_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_4394_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_4394_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_4394_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l339_c2_4394_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_4394_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_4394_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_4394_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_4394_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l339_c2_4394_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_4394_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_4394_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_4394_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_4394_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_9028_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_4394_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_4394_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_4394_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l349_c3_8551 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_4394_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_9028_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_4394_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_4394_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_4394_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_4394_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_9028_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_4394_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_4394_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_4394_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l344_c3_0999 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_4394_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_9028_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_4394_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_4394_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_4394_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_4394_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l339_c2_4394_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_4394_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_4394_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_4394_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_4394_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l339_c2_4394_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_4394_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_4394_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_4394_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_4394_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_9028_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_4394_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_4394_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_4394_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_4394_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_9028_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_4394_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_4394_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_4394_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_4394_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_9028_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_4394_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_4394_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0d8d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0d8d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0d8d_return_output : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_9028_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_9028_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_9087_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_9028_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_9028_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_9028_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_9087_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_9028_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_9028_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l353_c3_c1ab : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_9028_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_9087_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_9028_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_9028_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_9028_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_9087_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_9028_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_9028_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_9028_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_9087_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_9028_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_9028_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_9028_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_9087_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_9028_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_9028_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_9028_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_9087_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_9028_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_9028_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_9028_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_9087_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_9028_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_9028_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_9028_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_9087_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_9028_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_17b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_17b2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_17b2_return_output : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_9087_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_9087_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_9087_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_9087_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_9087_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3acd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_9087_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_9087_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_db72 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_9087_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3acd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_9087_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_9087_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_9087_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_3acd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_9087_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_9087_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_9087_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3acd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_9087_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_9087_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_9087_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3acd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_9087_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_9087_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_9087_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_3acd_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_9087_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_9087_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_9087_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_3acd_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_9087_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_9087_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_9087_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_3acd_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_9087_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_7fb3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_7fb3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_7fb3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3acd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3acd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c5e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3acd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3acd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l361_c3_00f4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3acd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c5e5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3acd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_3acd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_3acd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_c5e5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_3acd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3acd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3acd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c5e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3acd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3acd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3acd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c5e5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3acd_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_3acd_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_3acd_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_c5e5_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_3acd_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_3acd_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_3acd_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_3acd_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_3acd_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_3acd_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_c5e5_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_3acd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_715a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_715a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_715a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c5e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c5e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_3abe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c5e5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c5e5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_48c0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c5e5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_3abe_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c5e5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_c5e5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_c5e5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_3abe_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_c5e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c5e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c5e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c5e5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c5e5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c5e5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_3abe_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c5e5_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_c5e5_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_c5e5_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_3abe_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_c5e5_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_c5e5_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_c5e5_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_c5e5_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_6f3b_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_6f3b_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_6f3b_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_6f3b_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_2fe8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_2fe8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_2fe8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_3abe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_3abe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e359_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_3abe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_3abe_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l373_c3_b882 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_3abe_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e359_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_3abe_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_3abe_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l372_c3_19f8 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_3abe_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_3abe_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_3abe_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_3abe_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_e359_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_3abe_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_3abe_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_3abe_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_3abe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_df65_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_df65_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_df65_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e359_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e359_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e161_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e359_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e359_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_e2a1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e359_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e161_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e359_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_e359_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_e359_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_e161_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_e359_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_7a43_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_7a43_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_7a43_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e161_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e161_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1613_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e161_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e161_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_17d6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e161_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1613_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e161_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_e161_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_e161_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_1613_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_e161_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_a499_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_a499_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_a499_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1613_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1613_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_83e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1613_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1613_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_1861 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1613_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_83e6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1613_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_1613_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_1613_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_83e6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_1613_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_c15f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_c15f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_c15f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_83e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_83e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_83e6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_83e6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_175e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_83e6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l388_c7_83e6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_83e6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_83e6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_83e6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_83e6_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l339_l359_l388_l355_l352_DUPLICATE_2123_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l370_l363_l359_l388_l355_l384_l352_l380_DUPLICATE_0e36_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l355_l359_l352_l363_DUPLICATE_4374_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l355_l370_l359_l352_DUPLICATE_03dd_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l394_l335_DUPLICATE_cc21_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l353_c3_c1ab := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_9028_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l353_c3_c1ab;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_4394_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_4394_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l344_c3_0999 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_4394_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l344_c3_0999;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_4394_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_1861 := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1613_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_1861;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0d8d_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_17ba_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_175e := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_83e6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_175e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_e2a1 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e359_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_e2a1;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_83e6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_715a_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_4394_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_48c0 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c5e5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_48c0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_7a43_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_17d6 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e161_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_17d6;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_4394_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_17b2_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l373_c3_b882 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_3abe_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l373_c3_b882;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_a499_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_7fb3_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l349_c3_8551 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_4394_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l349_c3_8551;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c5e5_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_df65_right := to_unsigned(6, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_6f3b_y := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_6f3b_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_4394_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_2fe8_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_db72 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_9087_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_db72;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l372_c3_19f8 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_3abe_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l372_c3_19f8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_c15f_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l361_c3_00f4 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3acd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l361_c3_00f4;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_6f3b_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_4394_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_9028_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_9087_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_3acd_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_c5e5_iffalse := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_e161_iftrue := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_83e6_iftrue := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_4394_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_9028_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_9087_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_3acd_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_c5e5_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_3abe_iffalse := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_e359_iftrue := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_1613_iftrue := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_17ba_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0d8d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_17b2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_7fb3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_715a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_2fe8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_df65_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_7a43_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_a499_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_c15f_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_c5e5_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_3abe_iftrue := VAR_previous_stack_read;
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_9087_iftrue := VAR_previous_stack_read;
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_3acd_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_3abe_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_4394_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_9028_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_9087_iffalse := t16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_c5e5_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_4394_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_9028_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_9087_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_3acd_iffalse := t16_low;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l355_l359_l352_l363_DUPLICATE_4374 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l355_l359_l352_l363_DUPLICATE_4374_return_output := result.is_stack_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l339_c2_4394] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l339_c2_4394_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l352_c11_0d8d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l352_c11_0d8d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0d8d_left;
     BIN_OP_EQ_uxn_opcodes_h_l352_c11_0d8d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0d8d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0d8d_return_output := BIN_OP_EQ_uxn_opcodes_h_l352_c11_0d8d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l370_l363_l359_l388_l355_l384_l352_l380_DUPLICATE_0e36 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l370_l363_l359_l388_l355_l384_l352_l380_DUPLICATE_0e36_return_output := result.is_opc_done;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l339_c2_4394] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l339_c2_4394_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l359_c11_7fb3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l359_c11_7fb3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_7fb3_left;
     BIN_OP_EQ_uxn_opcodes_h_l359_c11_7fb3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_7fb3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_7fb3_return_output := BIN_OP_EQ_uxn_opcodes_h_l359_c11_7fb3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l339_c6_17ba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l339_c6_17ba_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_17ba_left;
     BIN_OP_EQ_uxn_opcodes_h_l339_c6_17ba_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_17ba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_17ba_return_output := BIN_OP_EQ_uxn_opcodes_h_l339_c6_17ba_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l339_c2_4394] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l339_c2_4394_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l355_c11_17b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l355_c11_17b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_17b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l355_c11_17b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_17b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_17b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l355_c11_17b2_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l365_c30_6f3b] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l365_c30_6f3b_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_6f3b_ins;
     sp_relative_shift_uxn_opcodes_h_l365_c30_6f3b_x <= VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_6f3b_x;
     sp_relative_shift_uxn_opcodes_h_l365_c30_6f3b_y <= VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_6f3b_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_6f3b_return_output := sp_relative_shift_uxn_opcodes_h_l365_c30_6f3b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l370_c11_2fe8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l370_c11_2fe8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_2fe8_left;
     BIN_OP_EQ_uxn_opcodes_h_l370_c11_2fe8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_2fe8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_2fe8_return_output := BIN_OP_EQ_uxn_opcodes_h_l370_c11_2fe8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l380_c11_7a43] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l380_c11_7a43_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_7a43_left;
     BIN_OP_EQ_uxn_opcodes_h_l380_c11_7a43_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_7a43_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_7a43_return_output := BIN_OP_EQ_uxn_opcodes_h_l380_c11_7a43_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l388_c7_83e6] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l388_c7_83e6_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l355_l370_l359_l352_DUPLICATE_03dd LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l355_l370_l359_l352_DUPLICATE_03dd_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l376_c11_df65] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l376_c11_df65_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_df65_left;
     BIN_OP_EQ_uxn_opcodes_h_l376_c11_df65_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_df65_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_df65_return_output := BIN_OP_EQ_uxn_opcodes_h_l376_c11_df65_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l388_c11_c15f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l388_c11_c15f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_c15f_left;
     BIN_OP_EQ_uxn_opcodes_h_l388_c11_c15f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_c15f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_c15f_return_output := BIN_OP_EQ_uxn_opcodes_h_l388_c11_c15f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l363_c11_715a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l363_c11_715a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_715a_left;
     BIN_OP_EQ_uxn_opcodes_h_l363_c11_715a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_715a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_715a_return_output := BIN_OP_EQ_uxn_opcodes_h_l363_c11_715a_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l339_l359_l388_l355_l352_DUPLICATE_2123 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l339_l359_l388_l355_l352_DUPLICATE_2123_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l384_c11_a499] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l384_c11_a499_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_a499_left;
     BIN_OP_EQ_uxn_opcodes_h_l384_c11_a499_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_a499_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_a499_return_output := BIN_OP_EQ_uxn_opcodes_h_l384_c11_a499_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l339_c2_4394] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l339_c2_4394_return_output := result.is_stack_index_flipped;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_4394_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_17ba_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_4394_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_17ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_4394_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_17ba_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_4394_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_17ba_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_4394_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_17ba_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_4394_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_17ba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_4394_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_17ba_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_4394_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_17ba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_4394_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_17ba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_4394_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_17ba_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_4394_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_17ba_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_4394_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_17ba_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_4394_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_17ba_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_9028_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0d8d_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_9028_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0d8d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_9028_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0d8d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_9028_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0d8d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_9028_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0d8d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_9028_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0d8d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_9028_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0d8d_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_9028_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0d8d_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_9028_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_0d8d_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_9087_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_17b2_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_9087_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_17b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_9087_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_17b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_9087_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_17b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_9087_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_17b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_9087_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_17b2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_9087_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_17b2_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_9087_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_17b2_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_9087_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_17b2_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_3acd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_7fb3_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_3acd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_7fb3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3acd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_7fb3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3acd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_7fb3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3acd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_7fb3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3acd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_7fb3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_3acd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_7fb3_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_3acd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_7fb3_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_c5e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_715a_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_c5e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_715a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c5e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_715a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c5e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_715a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c5e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_715a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c5e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_715a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_c5e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_715a_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_3abe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_2fe8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_3abe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_2fe8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_3abe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_2fe8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_3abe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_2fe8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_3abe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_2fe8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e359_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_df65_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e359_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_df65_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_e359_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_df65_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e161_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_7a43_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e161_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_7a43_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_e161_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_7a43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1613_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_a499_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1613_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_a499_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_1613_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_a499_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_83e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_c15f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_83e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_c15f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_83e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_c15f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_9028_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l355_l370_l359_l352_DUPLICATE_03dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_9087_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l355_l370_l359_l352_DUPLICATE_03dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3acd_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l355_l370_l359_l352_DUPLICATE_03dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_3abe_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l355_l370_l359_l352_DUPLICATE_03dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_9028_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l370_l363_l359_l388_l355_l384_l352_l380_DUPLICATE_0e36_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_9087_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l370_l363_l359_l388_l355_l384_l352_l380_DUPLICATE_0e36_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3acd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l370_l363_l359_l388_l355_l384_l352_l380_DUPLICATE_0e36_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c5e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l370_l363_l359_l388_l355_l384_l352_l380_DUPLICATE_0e36_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_3abe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l370_l363_l359_l388_l355_l384_l352_l380_DUPLICATE_0e36_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e359_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l370_l363_l359_l388_l355_l384_l352_l380_DUPLICATE_0e36_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e161_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l370_l363_l359_l388_l355_l384_l352_l380_DUPLICATE_0e36_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1613_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l370_l363_l359_l388_l355_l384_l352_l380_DUPLICATE_0e36_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_83e6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l376_l370_l363_l359_l388_l355_l384_l352_l380_DUPLICATE_0e36_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_9028_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l355_l359_l352_l363_DUPLICATE_4374_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_9087_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l355_l359_l352_l363_DUPLICATE_4374_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3acd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l355_l359_l352_l363_DUPLICATE_4374_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c5e5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l355_l359_l352_l363_DUPLICATE_4374_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_4394_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l339_l359_l388_l355_l352_DUPLICATE_2123_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_9028_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l339_l359_l388_l355_l352_DUPLICATE_2123_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_9087_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l339_l359_l388_l355_l352_DUPLICATE_2123_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_3acd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l339_l359_l388_l355_l352_DUPLICATE_2123_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_83e6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l339_l359_l388_l355_l352_DUPLICATE_2123_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_4394_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l339_c2_4394_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_4394_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l339_c2_4394_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_4394_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l339_c2_4394_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_4394_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l339_c2_4394_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_83e6_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l388_c7_83e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c5e5_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_6f3b_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l339_c2_4394] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_4394_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_4394_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_4394_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_4394_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_4394_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_4394_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_4394_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_4394_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l339_c2_4394] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_4394_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_4394_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_4394_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_4394_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_4394_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_4394_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_4394_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_4394_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l339_c2_4394] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_4394_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_4394_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_4394_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_4394_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_4394_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_4394_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_4394_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_4394_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l388_c7_83e6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_83e6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_83e6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_83e6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_83e6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_83e6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_83e6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_83e6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_83e6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l363_c7_c5e5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c5e5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c5e5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c5e5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c5e5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c5e5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c5e5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c5e5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c5e5_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l359_c7_3acd] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l359_c7_3acd_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_3acd_cond;
     t16_low_MUX_uxn_opcodes_h_l359_c7_3acd_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_3acd_iftrue;
     t16_low_MUX_uxn_opcodes_h_l359_c7_3acd_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_3acd_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_3acd_return_output := t16_low_MUX_uxn_opcodes_h_l359_c7_3acd_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l363_c7_c5e5] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l363_c7_c5e5_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_c5e5_cond;
     n16_high_MUX_uxn_opcodes_h_l363_c7_c5e5_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_c5e5_iftrue;
     n16_high_MUX_uxn_opcodes_h_l363_c7_c5e5_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_c5e5_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_c5e5_return_output := n16_high_MUX_uxn_opcodes_h_l363_c7_c5e5_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l355_c7_9087] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l355_c7_9087_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_9087_cond;
     t16_high_MUX_uxn_opcodes_h_l355_c7_9087_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_9087_iftrue;
     t16_high_MUX_uxn_opcodes_h_l355_c7_9087_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_9087_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_9087_return_output := t16_high_MUX_uxn_opcodes_h_l355_c7_9087_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l370_c7_3abe] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_3abe_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_3abe_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_3abe_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_3abe_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_3abe_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_3abe_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_3abe_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_3abe_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l339_c2_4394] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_4394_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_4394_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_4394_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_4394_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_4394_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_4394_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_4394_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_4394_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l388_c7_83e6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_83e6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_83e6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_83e6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_83e6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_83e6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_83e6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_83e6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_83e6_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l370_c7_3abe] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l370_c7_3abe_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_3abe_cond;
     n16_low_MUX_uxn_opcodes_h_l370_c7_3abe_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_3abe_iftrue;
     n16_low_MUX_uxn_opcodes_h_l370_c7_3abe_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_3abe_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_3abe_return_output := n16_low_MUX_uxn_opcodes_h_l370_c7_3abe_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l388_c7_83e6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l388_c7_83e6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_83e6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l388_c7_83e6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_83e6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l388_c7_83e6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_83e6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_83e6_return_output := result_u8_value_MUX_uxn_opcodes_h_l388_c7_83e6_return_output;

     -- Submodule level 2
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_3acd_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_c5e5_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_c5e5_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_3abe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1613_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_83e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3acd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c5e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c5e5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_3abe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1613_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_83e6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_1613_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_83e6_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_9028_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_9087_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_9087_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_3acd_return_output;
     -- t16_high_MUX[uxn_opcodes_h_l352_c7_9028] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l352_c7_9028_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_9028_cond;
     t16_high_MUX_uxn_opcodes_h_l352_c7_9028_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_9028_iftrue;
     t16_high_MUX_uxn_opcodes_h_l352_c7_9028_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_9028_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_9028_return_output := t16_high_MUX_uxn_opcodes_h_l352_c7_9028_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l359_c7_3acd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3acd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3acd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3acd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3acd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3acd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3acd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3acd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3acd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l384_c7_1613] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1613_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1613_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1613_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1613_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1613_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1613_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1613_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1613_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l363_c7_c5e5] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l363_c7_c5e5_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_c5e5_cond;
     n16_low_MUX_uxn_opcodes_h_l363_c7_c5e5_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_c5e5_iftrue;
     n16_low_MUX_uxn_opcodes_h_l363_c7_c5e5_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_c5e5_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_c5e5_return_output := n16_low_MUX_uxn_opcodes_h_l363_c7_c5e5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l363_c7_c5e5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c5e5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c5e5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c5e5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c5e5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c5e5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c5e5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c5e5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c5e5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l384_c7_1613] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1613_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1613_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1613_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1613_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1613_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1613_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1613_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1613_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l355_c7_9087] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l355_c7_9087_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_9087_cond;
     t16_low_MUX_uxn_opcodes_h_l355_c7_9087_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_9087_iftrue;
     t16_low_MUX_uxn_opcodes_h_l355_c7_9087_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_9087_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_9087_return_output := t16_low_MUX_uxn_opcodes_h_l355_c7_9087_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l359_c7_3acd] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l359_c7_3acd_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_3acd_cond;
     n16_high_MUX_uxn_opcodes_h_l359_c7_3acd_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_3acd_iftrue;
     n16_high_MUX_uxn_opcodes_h_l359_c7_3acd_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_3acd_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_3acd_return_output := n16_high_MUX_uxn_opcodes_h_l359_c7_3acd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l384_c7_1613] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l384_c7_1613_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_1613_cond;
     result_u8_value_MUX_uxn_opcodes_h_l384_c7_1613_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_1613_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l384_c7_1613_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_1613_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_1613_return_output := result_u8_value_MUX_uxn_opcodes_h_l384_c7_1613_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_9087_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_3acd_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_3acd_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_c5e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e161_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_1613_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_9087_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3acd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3acd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c5e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e161_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_1613_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_e161_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_1613_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_4394_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_9028_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_9028_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_9087_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l359_c7_3acd] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l359_c7_3acd_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_3acd_cond;
     n16_low_MUX_uxn_opcodes_h_l359_c7_3acd_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_3acd_iftrue;
     n16_low_MUX_uxn_opcodes_h_l359_c7_3acd_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_3acd_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_3acd_return_output := n16_low_MUX_uxn_opcodes_h_l359_c7_3acd_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l352_c7_9028] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l352_c7_9028_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_9028_cond;
     t16_low_MUX_uxn_opcodes_h_l352_c7_9028_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_9028_iftrue;
     t16_low_MUX_uxn_opcodes_h_l352_c7_9028_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_9028_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_9028_return_output := t16_low_MUX_uxn_opcodes_h_l352_c7_9028_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l355_c7_9087] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_9087_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_9087_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_9087_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_9087_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_9087_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_9087_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_9087_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_9087_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l380_c7_e161] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e161_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e161_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e161_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e161_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e161_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e161_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e161_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e161_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l355_c7_9087] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l355_c7_9087_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_9087_cond;
     n16_high_MUX_uxn_opcodes_h_l355_c7_9087_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_9087_iftrue;
     n16_high_MUX_uxn_opcodes_h_l355_c7_9087_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_9087_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_9087_return_output := n16_high_MUX_uxn_opcodes_h_l355_c7_9087_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l339_c2_4394] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l339_c2_4394_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_4394_cond;
     t16_high_MUX_uxn_opcodes_h_l339_c2_4394_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_4394_iftrue;
     t16_high_MUX_uxn_opcodes_h_l339_c2_4394_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_4394_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_4394_return_output := t16_high_MUX_uxn_opcodes_h_l339_c2_4394_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l359_c7_3acd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3acd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3acd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3acd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3acd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3acd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3acd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3acd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3acd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l380_c7_e161] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l380_c7_e161_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_e161_cond;
     result_u8_value_MUX_uxn_opcodes_h_l380_c7_e161_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_e161_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l380_c7_e161_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_e161_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_e161_return_output := result_u8_value_MUX_uxn_opcodes_h_l380_c7_e161_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l380_c7_e161] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e161_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e161_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e161_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e161_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e161_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e161_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e161_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e161_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_9028_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_9087_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_9087_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_3acd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e359_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_e161_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_9028_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_9087_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_9087_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3acd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e359_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_e161_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_e359_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_e161_return_output;
     REG_VAR_t16_high := VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_4394_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_4394_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_9028_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l355_c7_9087] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_9087_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_9087_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_9087_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_9087_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_9087_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_9087_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_9087_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_9087_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l376_c7_e359] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e359_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e359_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e359_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e359_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e359_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e359_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e359_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e359_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l376_c7_e359] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e359_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e359_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e359_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e359_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e359_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e359_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e359_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e359_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l352_c7_9028] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_9028_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_9028_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_9028_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_9028_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_9028_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_9028_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_9028_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_9028_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l352_c7_9028] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l352_c7_9028_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_9028_cond;
     n16_high_MUX_uxn_opcodes_h_l352_c7_9028_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_9028_iftrue;
     n16_high_MUX_uxn_opcodes_h_l352_c7_9028_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_9028_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_9028_return_output := n16_high_MUX_uxn_opcodes_h_l352_c7_9028_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l339_c2_4394] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l339_c2_4394_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_4394_cond;
     t16_low_MUX_uxn_opcodes_h_l339_c2_4394_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_4394_iftrue;
     t16_low_MUX_uxn_opcodes_h_l339_c2_4394_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_4394_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_4394_return_output := t16_low_MUX_uxn_opcodes_h_l339_c2_4394_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l355_c7_9087] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l355_c7_9087_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_9087_cond;
     n16_low_MUX_uxn_opcodes_h_l355_c7_9087_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_9087_iftrue;
     n16_low_MUX_uxn_opcodes_h_l355_c7_9087_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_9087_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_9087_return_output := n16_low_MUX_uxn_opcodes_h_l355_c7_9087_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l376_c7_e359] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_e359_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_e359_cond;
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_e359_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_e359_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_e359_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_e359_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_e359_return_output := result_u8_value_MUX_uxn_opcodes_h_l376_c7_e359_return_output;

     -- Submodule level 5
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_4394_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_9028_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_9028_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_9087_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_3abe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_e359_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_4394_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_9028_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_9028_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_9087_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_3abe_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_e359_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_3abe_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_e359_return_output;
     REG_VAR_t16_low := VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_4394_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l370_c7_3abe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_3abe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_3abe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_3abe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_3abe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_3abe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_3abe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_3abe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_3abe_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l339_c2_4394] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l339_c2_4394_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_4394_cond;
     n16_high_MUX_uxn_opcodes_h_l339_c2_4394_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_4394_iftrue;
     n16_high_MUX_uxn_opcodes_h_l339_c2_4394_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_4394_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_4394_return_output := n16_high_MUX_uxn_opcodes_h_l339_c2_4394_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l352_c7_9028] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l352_c7_9028_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_9028_cond;
     n16_low_MUX_uxn_opcodes_h_l352_c7_9028_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_9028_iftrue;
     n16_low_MUX_uxn_opcodes_h_l352_c7_9028_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_9028_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_9028_return_output := n16_low_MUX_uxn_opcodes_h_l352_c7_9028_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l370_c7_3abe] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_3abe_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_3abe_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_3abe_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_3abe_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_3abe_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_3abe_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_3abe_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_3abe_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l370_c7_3abe] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_3abe_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_3abe_cond;
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_3abe_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_3abe_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_3abe_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_3abe_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_3abe_return_output := result_u8_value_MUX_uxn_opcodes_h_l370_c7_3abe_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l352_c7_9028] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_9028_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_9028_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_9028_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_9028_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_9028_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_9028_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_9028_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_9028_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l339_c2_4394] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_4394_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_4394_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_4394_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_4394_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_4394_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_4394_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_4394_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_4394_return_output;

     -- Submodule level 6
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_4394_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_4394_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_9028_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c5e5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_3abe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_4394_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_9028_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c5e5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_3abe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_c5e5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_3abe_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l363_c7_c5e5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c5e5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c5e5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c5e5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c5e5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c5e5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c5e5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c5e5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c5e5_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l339_c2_4394] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l339_c2_4394_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_4394_cond;
     n16_low_MUX_uxn_opcodes_h_l339_c2_4394_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_4394_iftrue;
     n16_low_MUX_uxn_opcodes_h_l339_c2_4394_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_4394_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_4394_return_output := n16_low_MUX_uxn_opcodes_h_l339_c2_4394_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l363_c7_c5e5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l363_c7_c5e5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_c5e5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l363_c7_c5e5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_c5e5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l363_c7_c5e5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_c5e5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_c5e5_return_output := result_u8_value_MUX_uxn_opcodes_h_l363_c7_c5e5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l363_c7_c5e5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c5e5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c5e5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c5e5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c5e5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c5e5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c5e5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c5e5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c5e5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l339_c2_4394] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_4394_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_4394_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_4394_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_4394_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_4394_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_4394_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_4394_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_4394_return_output;

     -- Submodule level 7
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_4394_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3acd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c5e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3acd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c5e5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_3acd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_c5e5_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l359_c7_3acd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3acd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3acd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3acd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3acd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3acd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3acd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3acd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3acd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l359_c7_3acd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3acd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3acd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3acd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3acd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3acd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3acd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3acd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3acd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l359_c7_3acd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l359_c7_3acd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_3acd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l359_c7_3acd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_3acd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l359_c7_3acd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_3acd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_3acd_return_output := result_u8_value_MUX_uxn_opcodes_h_l359_c7_3acd_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_9087_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3acd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_9087_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3acd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_9087_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_3acd_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l355_c7_9087] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_9087_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_9087_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_9087_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_9087_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_9087_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_9087_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_9087_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_9087_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l355_c7_9087] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_9087_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_9087_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_9087_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_9087_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_9087_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_9087_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_9087_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_9087_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l355_c7_9087] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l355_c7_9087_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_9087_cond;
     result_u8_value_MUX_uxn_opcodes_h_l355_c7_9087_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_9087_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l355_c7_9087_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_9087_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_9087_return_output := result_u8_value_MUX_uxn_opcodes_h_l355_c7_9087_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_9028_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_9087_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_9028_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_9087_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_9028_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_9087_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l352_c7_9028] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_9028_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_9028_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_9028_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_9028_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_9028_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_9028_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_9028_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_9028_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l352_c7_9028] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l352_c7_9028_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_9028_cond;
     result_u8_value_MUX_uxn_opcodes_h_l352_c7_9028_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_9028_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l352_c7_9028_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_9028_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_9028_return_output := result_u8_value_MUX_uxn_opcodes_h_l352_c7_9028_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l352_c7_9028] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_9028_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_9028_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_9028_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_9028_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_9028_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_9028_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_9028_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_9028_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_4394_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_9028_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_4394_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_9028_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_4394_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_9028_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l339_c2_4394] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_4394_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_4394_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_4394_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_4394_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_4394_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_4394_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_4394_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_4394_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l339_c2_4394] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_4394_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_4394_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_4394_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_4394_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_4394_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_4394_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_4394_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_4394_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l339_c2_4394] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l339_c2_4394_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_4394_cond;
     result_u8_value_MUX_uxn_opcodes_h_l339_c2_4394_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_4394_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l339_c2_4394_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_4394_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_4394_return_output := result_u8_value_MUX_uxn_opcodes_h_l339_c2_4394_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l394_l335_DUPLICATE_cc21 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l394_l335_DUPLICATE_cc21_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c580(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_4394_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_4394_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_4394_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_4394_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_4394_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_4394_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_4394_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_4394_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_4394_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l394_l335_DUPLICATE_cc21_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l394_l335_DUPLICATE_cc21_return_output;
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
