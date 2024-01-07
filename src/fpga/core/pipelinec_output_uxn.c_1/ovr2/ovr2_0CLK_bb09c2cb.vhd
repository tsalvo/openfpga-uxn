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
-- BIN_OP_EQ[uxn_opcodes_h_l339_c6_cdba]
signal BIN_OP_EQ_uxn_opcodes_h_l339_c6_cdba_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l339_c6_cdba_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l339_c6_cdba_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l339_c2_b6a4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_b6a4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l339_c2_b6a4]
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l339_c2_b6a4]
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_b6a4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l339_c2_b6a4]
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l339_c2_b6a4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_b6a4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l339_c2_b6a4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_b6a4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l339_c2_b6a4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_b6a4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l339_c2_b6a4]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_b6a4_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l339_c2_b6a4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_b6a4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l339_c2_b6a4]
signal n16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l339_c2_b6a4]
signal n16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l339_c2_b6a4]
signal t16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l339_c2_b6a4]
signal t16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l352_c11_99f9]
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_99f9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_99f9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_99f9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l352_c7_6dc5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_6dc5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l352_c7_6dc5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6dc5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l352_c7_6dc5]
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_6dc5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l352_c7_6dc5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6dc5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l352_c7_6dc5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6dc5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l352_c7_6dc5]
signal n16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l352_c7_6dc5]
signal n16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l352_c7_6dc5]
signal t16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l352_c7_6dc5]
signal t16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l355_c11_a0f2]
signal BIN_OP_EQ_uxn_opcodes_h_l355_c11_a0f2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l355_c11_a0f2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l355_c11_a0f2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l355_c7_4fec]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4fec_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4fec_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l355_c7_4fec]
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4fec_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4fec_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l355_c7_4fec]
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_4fec_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_4fec_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l355_c7_4fec]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4fec_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4fec_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l355_c7_4fec]
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4fec_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4fec_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l355_c7_4fec]
signal n16_high_MUX_uxn_opcodes_h_l355_c7_4fec_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l355_c7_4fec_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l355_c7_4fec]
signal n16_low_MUX_uxn_opcodes_h_l355_c7_4fec_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l355_c7_4fec_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l355_c7_4fec]
signal t16_low_MUX_uxn_opcodes_h_l355_c7_4fec_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l355_c7_4fec_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l355_c7_4fec]
signal t16_high_MUX_uxn_opcodes_h_l355_c7_4fec_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l355_c7_4fec_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l359_c11_c370]
signal BIN_OP_EQ_uxn_opcodes_h_l359_c11_c370_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l359_c11_c370_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l359_c11_c370_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l359_c7_42a1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_42a1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_42a1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_42a1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_42a1_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l359_c7_42a1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_42a1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_42a1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_42a1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_42a1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l359_c7_42a1]
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_42a1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_42a1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_42a1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_42a1_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l359_c7_42a1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_42a1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_42a1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_42a1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_42a1_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l359_c7_42a1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_42a1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_42a1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_42a1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_42a1_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l359_c7_42a1]
signal n16_high_MUX_uxn_opcodes_h_l359_c7_42a1_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l359_c7_42a1_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l359_c7_42a1_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l359_c7_42a1_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l359_c7_42a1]
signal n16_low_MUX_uxn_opcodes_h_l359_c7_42a1_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l359_c7_42a1_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l359_c7_42a1_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l359_c7_42a1_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l359_c7_42a1]
signal t16_low_MUX_uxn_opcodes_h_l359_c7_42a1_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l359_c7_42a1_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l359_c7_42a1_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l359_c7_42a1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l363_c11_96f0]
signal BIN_OP_EQ_uxn_opcodes_h_l363_c11_96f0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l363_c11_96f0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l363_c11_96f0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l363_c7_2401]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_2401_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_2401_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_2401_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_2401_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l363_c7_2401]
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_2401_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_2401_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_2401_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_2401_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l363_c7_2401]
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_2401_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_2401_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_2401_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_2401_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l363_c7_2401]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_2401_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_2401_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_2401_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_2401_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l363_c7_2401]
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_2401_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_2401_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_2401_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_2401_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l363_c7_2401]
signal n16_high_MUX_uxn_opcodes_h_l363_c7_2401_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l363_c7_2401_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l363_c7_2401_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l363_c7_2401_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l363_c7_2401]
signal n16_low_MUX_uxn_opcodes_h_l363_c7_2401_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l363_c7_2401_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l363_c7_2401_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l363_c7_2401_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l365_c30_447a]
signal sp_relative_shift_uxn_opcodes_h_l365_c30_447a_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l365_c30_447a_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l365_c30_447a_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l365_c30_447a_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l370_c11_8ed1]
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_8ed1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_8ed1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_8ed1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l370_c7_2554]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_2554_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_2554_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_2554_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_2554_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l370_c7_2554]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_2554_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_2554_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_2554_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_2554_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l370_c7_2554]
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_2554_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_2554_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_2554_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_2554_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l370_c7_2554]
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_2554_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_2554_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_2554_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_2554_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l370_c7_2554]
signal n16_low_MUX_uxn_opcodes_h_l370_c7_2554_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l370_c7_2554_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l370_c7_2554_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l370_c7_2554_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l376_c11_79fd]
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_79fd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_79fd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_79fd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l376_c7_48a4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_48a4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_48a4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_48a4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_48a4_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l376_c7_48a4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_48a4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_48a4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_48a4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_48a4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l376_c7_48a4]
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_48a4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_48a4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_48a4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_48a4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l380_c11_4478]
signal BIN_OP_EQ_uxn_opcodes_h_l380_c11_4478_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l380_c11_4478_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l380_c11_4478_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l380_c7_d5ff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_d5ff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_d5ff_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_d5ff_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_d5ff_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l380_c7_d5ff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_d5ff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_d5ff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_d5ff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_d5ff_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l380_c7_d5ff]
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_d5ff_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_d5ff_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_d5ff_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_d5ff_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l384_c11_53e5]
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_53e5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_53e5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_53e5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l384_c7_3041]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3041_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3041_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3041_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3041_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l384_c7_3041]
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3041_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3041_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3041_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3041_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l384_c7_3041]
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_3041_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_3041_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_3041_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_3041_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l388_c11_dff2]
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_dff2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_dff2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_dff2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l388_c7_4850]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4850_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4850_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4850_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4850_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l388_c7_4850]
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4850_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4850_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4850_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4850_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l388_c7_4850]
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_4850_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_4850_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_4850_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_4850_return_output : unsigned(7 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6( ref_toks_0 : opcode_result_t;
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
      base.is_pc_updated := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.is_ram_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l339_c6_cdba
BIN_OP_EQ_uxn_opcodes_h_l339_c6_cdba : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l339_c6_cdba_left,
BIN_OP_EQ_uxn_opcodes_h_l339_c6_cdba_right,
BIN_OP_EQ_uxn_opcodes_h_l339_c6_cdba_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_b6a4
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_b6a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_b6a4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_b6a4
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_b6a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l339_c2_b6a4
result_u8_value_MUX_uxn_opcodes_h_l339_c2_b6a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l339_c2_b6a4_cond,
result_u8_value_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_b6a4
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_b6a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_b6a4
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_b6a4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_b6a4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_b6a4
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_b6a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_b6a4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_b6a4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_b6a4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_b6a4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_b6a4
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_b6a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_b6a4_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_b6a4
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_b6a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_b6a4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output);

-- n16_high_MUX_uxn_opcodes_h_l339_c2_b6a4
n16_high_MUX_uxn_opcodes_h_l339_c2_b6a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_cond,
n16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue,
n16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse,
n16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output);

-- n16_low_MUX_uxn_opcodes_h_l339_c2_b6a4
n16_low_MUX_uxn_opcodes_h_l339_c2_b6a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_cond,
n16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue,
n16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse,
n16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output);

-- t16_low_MUX_uxn_opcodes_h_l339_c2_b6a4
t16_low_MUX_uxn_opcodes_h_l339_c2_b6a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_cond,
t16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue,
t16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse,
t16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output);

-- t16_high_MUX_uxn_opcodes_h_l339_c2_b6a4
t16_high_MUX_uxn_opcodes_h_l339_c2_b6a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_cond,
t16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue,
t16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse,
t16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l352_c11_99f9
BIN_OP_EQ_uxn_opcodes_h_l352_c11_99f9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l352_c11_99f9_left,
BIN_OP_EQ_uxn_opcodes_h_l352_c11_99f9_right,
BIN_OP_EQ_uxn_opcodes_h_l352_c11_99f9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_6dc5
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_6dc5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_6dc5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6dc5
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6dc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6dc5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l352_c7_6dc5
result_u8_value_MUX_uxn_opcodes_h_l352_c7_6dc5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l352_c7_6dc5_cond,
result_u8_value_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6dc5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6dc5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6dc5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6dc5
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6dc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6dc5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output);

-- n16_high_MUX_uxn_opcodes_h_l352_c7_6dc5
n16_high_MUX_uxn_opcodes_h_l352_c7_6dc5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_cond,
n16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue,
n16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse,
n16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output);

-- n16_low_MUX_uxn_opcodes_h_l352_c7_6dc5
n16_low_MUX_uxn_opcodes_h_l352_c7_6dc5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_cond,
n16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue,
n16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse,
n16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output);

-- t16_low_MUX_uxn_opcodes_h_l352_c7_6dc5
t16_low_MUX_uxn_opcodes_h_l352_c7_6dc5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_cond,
t16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue,
t16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse,
t16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output);

-- t16_high_MUX_uxn_opcodes_h_l352_c7_6dc5
t16_high_MUX_uxn_opcodes_h_l352_c7_6dc5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_cond,
t16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue,
t16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse,
t16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l355_c11_a0f2
BIN_OP_EQ_uxn_opcodes_h_l355_c11_a0f2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l355_c11_a0f2_left,
BIN_OP_EQ_uxn_opcodes_h_l355_c11_a0f2_right,
BIN_OP_EQ_uxn_opcodes_h_l355_c11_a0f2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4fec
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4fec : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4fec_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4fec_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4fec
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4fec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4fec_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4fec_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l355_c7_4fec
result_u8_value_MUX_uxn_opcodes_h_l355_c7_4fec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l355_c7_4fec_cond,
result_u8_value_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l355_c7_4fec_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4fec
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4fec : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4fec_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4fec_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4fec
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4fec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4fec_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4fec_return_output);

-- n16_high_MUX_uxn_opcodes_h_l355_c7_4fec
n16_high_MUX_uxn_opcodes_h_l355_c7_4fec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l355_c7_4fec_cond,
n16_high_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue,
n16_high_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse,
n16_high_MUX_uxn_opcodes_h_l355_c7_4fec_return_output);

-- n16_low_MUX_uxn_opcodes_h_l355_c7_4fec
n16_low_MUX_uxn_opcodes_h_l355_c7_4fec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l355_c7_4fec_cond,
n16_low_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue,
n16_low_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse,
n16_low_MUX_uxn_opcodes_h_l355_c7_4fec_return_output);

-- t16_low_MUX_uxn_opcodes_h_l355_c7_4fec
t16_low_MUX_uxn_opcodes_h_l355_c7_4fec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l355_c7_4fec_cond,
t16_low_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue,
t16_low_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse,
t16_low_MUX_uxn_opcodes_h_l355_c7_4fec_return_output);

-- t16_high_MUX_uxn_opcodes_h_l355_c7_4fec
t16_high_MUX_uxn_opcodes_h_l355_c7_4fec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l355_c7_4fec_cond,
t16_high_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue,
t16_high_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse,
t16_high_MUX_uxn_opcodes_h_l355_c7_4fec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l359_c11_c370
BIN_OP_EQ_uxn_opcodes_h_l359_c11_c370 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l359_c11_c370_left,
BIN_OP_EQ_uxn_opcodes_h_l359_c11_c370_right,
BIN_OP_EQ_uxn_opcodes_h_l359_c11_c370_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_42a1
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_42a1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_42a1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_42a1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_42a1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_42a1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_42a1
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_42a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_42a1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_42a1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_42a1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_42a1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l359_c7_42a1
result_u8_value_MUX_uxn_opcodes_h_l359_c7_42a1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l359_c7_42a1_cond,
result_u8_value_MUX_uxn_opcodes_h_l359_c7_42a1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l359_c7_42a1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l359_c7_42a1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_42a1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_42a1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_42a1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_42a1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_42a1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_42a1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_42a1
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_42a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_42a1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_42a1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_42a1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_42a1_return_output);

-- n16_high_MUX_uxn_opcodes_h_l359_c7_42a1
n16_high_MUX_uxn_opcodes_h_l359_c7_42a1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l359_c7_42a1_cond,
n16_high_MUX_uxn_opcodes_h_l359_c7_42a1_iftrue,
n16_high_MUX_uxn_opcodes_h_l359_c7_42a1_iffalse,
n16_high_MUX_uxn_opcodes_h_l359_c7_42a1_return_output);

-- n16_low_MUX_uxn_opcodes_h_l359_c7_42a1
n16_low_MUX_uxn_opcodes_h_l359_c7_42a1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l359_c7_42a1_cond,
n16_low_MUX_uxn_opcodes_h_l359_c7_42a1_iftrue,
n16_low_MUX_uxn_opcodes_h_l359_c7_42a1_iffalse,
n16_low_MUX_uxn_opcodes_h_l359_c7_42a1_return_output);

-- t16_low_MUX_uxn_opcodes_h_l359_c7_42a1
t16_low_MUX_uxn_opcodes_h_l359_c7_42a1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l359_c7_42a1_cond,
t16_low_MUX_uxn_opcodes_h_l359_c7_42a1_iftrue,
t16_low_MUX_uxn_opcodes_h_l359_c7_42a1_iffalse,
t16_low_MUX_uxn_opcodes_h_l359_c7_42a1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l363_c11_96f0
BIN_OP_EQ_uxn_opcodes_h_l363_c11_96f0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l363_c11_96f0_left,
BIN_OP_EQ_uxn_opcodes_h_l363_c11_96f0_right,
BIN_OP_EQ_uxn_opcodes_h_l363_c11_96f0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_2401
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_2401 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_2401_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_2401_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_2401_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_2401_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_2401
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_2401 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_2401_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_2401_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_2401_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_2401_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l363_c7_2401
result_u8_value_MUX_uxn_opcodes_h_l363_c7_2401 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l363_c7_2401_cond,
result_u8_value_MUX_uxn_opcodes_h_l363_c7_2401_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l363_c7_2401_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l363_c7_2401_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_2401
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_2401 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_2401_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_2401_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_2401_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_2401_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_2401
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_2401 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_2401_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_2401_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_2401_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_2401_return_output);

-- n16_high_MUX_uxn_opcodes_h_l363_c7_2401
n16_high_MUX_uxn_opcodes_h_l363_c7_2401 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l363_c7_2401_cond,
n16_high_MUX_uxn_opcodes_h_l363_c7_2401_iftrue,
n16_high_MUX_uxn_opcodes_h_l363_c7_2401_iffalse,
n16_high_MUX_uxn_opcodes_h_l363_c7_2401_return_output);

-- n16_low_MUX_uxn_opcodes_h_l363_c7_2401
n16_low_MUX_uxn_opcodes_h_l363_c7_2401 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l363_c7_2401_cond,
n16_low_MUX_uxn_opcodes_h_l363_c7_2401_iftrue,
n16_low_MUX_uxn_opcodes_h_l363_c7_2401_iffalse,
n16_low_MUX_uxn_opcodes_h_l363_c7_2401_return_output);

-- sp_relative_shift_uxn_opcodes_h_l365_c30_447a
sp_relative_shift_uxn_opcodes_h_l365_c30_447a : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l365_c30_447a_ins,
sp_relative_shift_uxn_opcodes_h_l365_c30_447a_x,
sp_relative_shift_uxn_opcodes_h_l365_c30_447a_y,
sp_relative_shift_uxn_opcodes_h_l365_c30_447a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l370_c11_8ed1
BIN_OP_EQ_uxn_opcodes_h_l370_c11_8ed1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l370_c11_8ed1_left,
BIN_OP_EQ_uxn_opcodes_h_l370_c11_8ed1_right,
BIN_OP_EQ_uxn_opcodes_h_l370_c11_8ed1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_2554
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_2554 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_2554_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_2554_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_2554_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_2554_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_2554
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_2554 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_2554_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_2554_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_2554_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_2554_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_2554
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_2554 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_2554_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_2554_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_2554_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_2554_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l370_c7_2554
result_u8_value_MUX_uxn_opcodes_h_l370_c7_2554 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l370_c7_2554_cond,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_2554_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_2554_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_2554_return_output);

-- n16_low_MUX_uxn_opcodes_h_l370_c7_2554
n16_low_MUX_uxn_opcodes_h_l370_c7_2554 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l370_c7_2554_cond,
n16_low_MUX_uxn_opcodes_h_l370_c7_2554_iftrue,
n16_low_MUX_uxn_opcodes_h_l370_c7_2554_iffalse,
n16_low_MUX_uxn_opcodes_h_l370_c7_2554_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l376_c11_79fd
BIN_OP_EQ_uxn_opcodes_h_l376_c11_79fd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l376_c11_79fd_left,
BIN_OP_EQ_uxn_opcodes_h_l376_c11_79fd_right,
BIN_OP_EQ_uxn_opcodes_h_l376_c11_79fd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_48a4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_48a4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_48a4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_48a4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_48a4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_48a4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_48a4
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_48a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_48a4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_48a4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_48a4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_48a4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l376_c7_48a4
result_u8_value_MUX_uxn_opcodes_h_l376_c7_48a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l376_c7_48a4_cond,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_48a4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_48a4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_48a4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l380_c11_4478
BIN_OP_EQ_uxn_opcodes_h_l380_c11_4478 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l380_c11_4478_left,
BIN_OP_EQ_uxn_opcodes_h_l380_c11_4478_right,
BIN_OP_EQ_uxn_opcodes_h_l380_c11_4478_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_d5ff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_d5ff : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_d5ff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_d5ff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_d5ff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_d5ff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_d5ff
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_d5ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_d5ff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_d5ff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_d5ff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_d5ff_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l380_c7_d5ff
result_u8_value_MUX_uxn_opcodes_h_l380_c7_d5ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l380_c7_d5ff_cond,
result_u8_value_MUX_uxn_opcodes_h_l380_c7_d5ff_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l380_c7_d5ff_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l380_c7_d5ff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l384_c11_53e5
BIN_OP_EQ_uxn_opcodes_h_l384_c11_53e5 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l384_c11_53e5_left,
BIN_OP_EQ_uxn_opcodes_h_l384_c11_53e5_right,
BIN_OP_EQ_uxn_opcodes_h_l384_c11_53e5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3041
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3041 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3041_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3041_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3041_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3041_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3041
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3041 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3041_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3041_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3041_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3041_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l384_c7_3041
result_u8_value_MUX_uxn_opcodes_h_l384_c7_3041 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l384_c7_3041_cond,
result_u8_value_MUX_uxn_opcodes_h_l384_c7_3041_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l384_c7_3041_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l384_c7_3041_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l388_c11_dff2
BIN_OP_EQ_uxn_opcodes_h_l388_c11_dff2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l388_c11_dff2_left,
BIN_OP_EQ_uxn_opcodes_h_l388_c11_dff2_right,
BIN_OP_EQ_uxn_opcodes_h_l388_c11_dff2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4850
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4850 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4850_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4850_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4850_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4850_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4850
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4850 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4850_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4850_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4850_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4850_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l388_c7_4850
result_u8_value_MUX_uxn_opcodes_h_l388_c7_4850 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l388_c7_4850_cond,
result_u8_value_MUX_uxn_opcodes_h_l388_c7_4850_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l388_c7_4850_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l388_c7_4850_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l339_c6_cdba_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output,
 n16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output,
 n16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output,
 t16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output,
 t16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l352_c11_99f9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output,
 n16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output,
 n16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output,
 t16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output,
 t16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l355_c11_a0f2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4fec_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4fec_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l355_c7_4fec_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4fec_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4fec_return_output,
 n16_high_MUX_uxn_opcodes_h_l355_c7_4fec_return_output,
 n16_low_MUX_uxn_opcodes_h_l355_c7_4fec_return_output,
 t16_low_MUX_uxn_opcodes_h_l355_c7_4fec_return_output,
 t16_high_MUX_uxn_opcodes_h_l355_c7_4fec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l359_c11_c370_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_42a1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_42a1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l359_c7_42a1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_42a1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_42a1_return_output,
 n16_high_MUX_uxn_opcodes_h_l359_c7_42a1_return_output,
 n16_low_MUX_uxn_opcodes_h_l359_c7_42a1_return_output,
 t16_low_MUX_uxn_opcodes_h_l359_c7_42a1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l363_c11_96f0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_2401_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_2401_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l363_c7_2401_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_2401_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_2401_return_output,
 n16_high_MUX_uxn_opcodes_h_l363_c7_2401_return_output,
 n16_low_MUX_uxn_opcodes_h_l363_c7_2401_return_output,
 sp_relative_shift_uxn_opcodes_h_l365_c30_447a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l370_c11_8ed1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_2554_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_2554_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_2554_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l370_c7_2554_return_output,
 n16_low_MUX_uxn_opcodes_h_l370_c7_2554_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l376_c11_79fd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_48a4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_48a4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l376_c7_48a4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l380_c11_4478_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_d5ff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_d5ff_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l380_c7_d5ff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l384_c11_53e5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3041_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3041_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l384_c7_3041_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l388_c11_dff2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4850_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4850_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l388_c7_4850_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_cdba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_cdba_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_cdba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l339_c2_b6a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_b6a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l339_c2_b6a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_b6a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l339_c2_b6a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l344_c3_3f70 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_b6a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_b6a4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l349_c3_aa0d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_b6a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l339_c2_b6a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_b6a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_b6a4_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_99f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_99f9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_99f9_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4fec_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_6dc5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4fec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6dc5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_4fec_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_6dc5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l353_c3_4256 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4fec_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6dc5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4fec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6dc5_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_4fec_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_4fec_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_4fec_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_4fec_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_a0f2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_a0f2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_a0f2_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_42a1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4fec_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_42a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4fec_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_42a1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_4fec_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_709e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_42a1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4fec_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_42a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4fec_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_42a1_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_4fec_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_42a1_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_4fec_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_42a1_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_4fec_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_4fec_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_c370_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_c370_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_c370_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_42a1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_42a1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_2401_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_42a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_42a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_42a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_2401_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_42a1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_42a1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_42a1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_2401_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_42a1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_42a1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l361_c3_e2f4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_42a1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_2401_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_42a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_42a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_42a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_2401_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_42a1_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_42a1_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_42a1_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_2401_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_42a1_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_42a1_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_42a1_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_2401_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_42a1_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_42a1_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_42a1_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_42a1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_96f0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_96f0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_96f0_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_2401_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_2401_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_2554_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_2401_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_2401_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_2401_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_2401_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_2401_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_2401_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_2554_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_2401_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_2401_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_1b1e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_2401_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_2554_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_2401_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_2401_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_2401_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_2554_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_2401_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_2401_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_2401_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_2401_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_2401_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_2401_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_2554_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_2401_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_447a_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_447a_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_447a_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_447a_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_8ed1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_8ed1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_8ed1_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_2554_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l373_c3_07c6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_2554_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_48a4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_2554_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_2554_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l372_c3_c4e3 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_2554_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_2554_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_2554_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_2554_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_48a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_2554_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_2554_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_2554_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_48a4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_2554_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_2554_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_2554_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_2554_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_79fd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_79fd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_79fd_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_48a4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_284c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_48a4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_d5ff_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_48a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_48a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_48a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_d5ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_48a4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_48a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_48a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_d5ff_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_48a4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_4478_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_4478_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_4478_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_d5ff_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_51e4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_d5ff_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3041_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_d5ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_d5ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_d5ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3041_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_d5ff_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_d5ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_d5ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_3041_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_d5ff_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_53e5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_53e5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_53e5_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3041_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_0ea4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3041_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4850_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3041_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3041_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3041_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4850_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3041_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_3041_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_3041_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_4850_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_3041_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_dff2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_dff2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_dff2_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4850_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_f853 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4850_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l388_c7_4850_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4850_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4850_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4850_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4850_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_4850_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_4850_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_4850_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_4b92_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l370_l359_l352_l355_DUPLICATE_a5d8_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l359_l352_l363_l355_DUPLICATE_a2db_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l359_l388_l355_l384_l352_l380_l376_l370_l363_DUPLICATE_0b88_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l394_l335_DUPLICATE_dda0_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_4478_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_a0f2_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l344_c3_3f70 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l344_c3_3f70;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_51e4 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_d5ff_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_51e4;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_c370_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_447a_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_8ed1_right := to_unsigned(5, 3);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_53e5_right := to_unsigned(8, 4);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l372_c3_c4e3 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_2554_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l372_c3_c4e3;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l353_c3_4256 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l353_c3_4256;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_284c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_48a4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_284c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l361_c3_e2f4 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_42a1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l361_c3_e2f4;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_96f0_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_cdba_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_2401_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_709e := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_709e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_1b1e := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_2401_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_1b1e;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_dff2_right := to_unsigned(9, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4850_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_99f9_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_0ea4 := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3041_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_0ea4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_f853 := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4850_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_f853;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l349_c3_aa0d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l349_c3_aa0d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_79fd_right := to_unsigned(6, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_447a_y := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l373_c3_07c6 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_2554_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l373_c3_07c6;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_447a_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_42a1_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_2401_iffalse := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_d5ff_iftrue := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_4850_iftrue := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_42a1_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_2401_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_2554_iffalse := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_48a4_iftrue := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_3041_iftrue := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_cdba_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_99f9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_a0f2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_c370_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_96f0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_8ed1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_79fd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_4478_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_53e5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_dff2_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_2401_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_2554_iftrue := VAR_previous_stack_read;
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue := VAR_previous_stack_read;
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_42a1_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_2554_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse := t16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_2401_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_42a1_iffalse := t16_low;
     -- BIN_OP_EQ[uxn_opcodes_h_l359_c11_c370] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l359_c11_c370_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_c370_left;
     BIN_OP_EQ_uxn_opcodes_h_l359_c11_c370_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_c370_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_c370_return_output := BIN_OP_EQ_uxn_opcodes_h_l359_c11_c370_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l365_c30_447a] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l365_c30_447a_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_447a_ins;
     sp_relative_shift_uxn_opcodes_h_l365_c30_447a_x <= VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_447a_x;
     sp_relative_shift_uxn_opcodes_h_l365_c30_447a_y <= VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_447a_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_447a_return_output := sp_relative_shift_uxn_opcodes_h_l365_c30_447a_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l339_c2_b6a4] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l339_c2_b6a4_return_output := result.is_ram_write;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l388_c7_4850] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l388_c7_4850_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_4b92 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_4b92_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l363_c11_96f0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l363_c11_96f0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_96f0_left;
     BIN_OP_EQ_uxn_opcodes_h_l363_c11_96f0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_96f0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_96f0_return_output := BIN_OP_EQ_uxn_opcodes_h_l363_c11_96f0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l359_l352_l363_l355_DUPLICATE_a2db LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l359_l352_l363_l355_DUPLICATE_a2db_return_output := result.is_stack_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l370_l359_l352_l355_DUPLICATE_a5d8 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l370_l359_l352_l355_DUPLICATE_a5d8_return_output := result.sp_relative_shift;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l339_c2_b6a4] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l339_c2_b6a4_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l376_c11_79fd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l376_c11_79fd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_79fd_left;
     BIN_OP_EQ_uxn_opcodes_h_l376_c11_79fd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_79fd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_79fd_return_output := BIN_OP_EQ_uxn_opcodes_h_l376_c11_79fd_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l359_l388_l355_l384_l352_l380_l376_l370_l363_DUPLICATE_0b88 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l359_l388_l355_l384_l352_l380_l376_l370_l363_DUPLICATE_0b88_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l388_c11_dff2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l388_c11_dff2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_dff2_left;
     BIN_OP_EQ_uxn_opcodes_h_l388_c11_dff2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_dff2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_dff2_return_output := BIN_OP_EQ_uxn_opcodes_h_l388_c11_dff2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l339_c6_cdba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l339_c6_cdba_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_cdba_left;
     BIN_OP_EQ_uxn_opcodes_h_l339_c6_cdba_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_cdba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_cdba_return_output := BIN_OP_EQ_uxn_opcodes_h_l339_c6_cdba_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l339_c2_b6a4] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l339_c2_b6a4_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l380_c11_4478] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l380_c11_4478_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_4478_left;
     BIN_OP_EQ_uxn_opcodes_h_l380_c11_4478_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_4478_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_4478_return_output := BIN_OP_EQ_uxn_opcodes_h_l380_c11_4478_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l352_c11_99f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l352_c11_99f9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_99f9_left;
     BIN_OP_EQ_uxn_opcodes_h_l352_c11_99f9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_99f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_99f9_return_output := BIN_OP_EQ_uxn_opcodes_h_l352_c11_99f9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l370_c11_8ed1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l370_c11_8ed1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_8ed1_left;
     BIN_OP_EQ_uxn_opcodes_h_l370_c11_8ed1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_8ed1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_8ed1_return_output := BIN_OP_EQ_uxn_opcodes_h_l370_c11_8ed1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l355_c11_a0f2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l355_c11_a0f2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_a0f2_left;
     BIN_OP_EQ_uxn_opcodes_h_l355_c11_a0f2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_a0f2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_a0f2_return_output := BIN_OP_EQ_uxn_opcodes_h_l355_c11_a0f2_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l339_c2_b6a4] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l339_c2_b6a4_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l384_c11_53e5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l384_c11_53e5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_53e5_left;
     BIN_OP_EQ_uxn_opcodes_h_l384_c11_53e5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_53e5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_53e5_return_output := BIN_OP_EQ_uxn_opcodes_h_l384_c11_53e5_return_output;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_cdba_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_cdba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_b6a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_cdba_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_b6a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_cdba_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_cdba_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_b6a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_cdba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_b6a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_cdba_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_cdba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_b6a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_cdba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_b6a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_cdba_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_b6a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_cdba_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_cdba_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_cdba_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_99f9_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_99f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6dc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_99f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6dc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_99f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_6dc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_99f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6dc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_99f9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_6dc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_99f9_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_99f9_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_99f9_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_4fec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_a0f2_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_4fec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_a0f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4fec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_a0f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4fec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_a0f2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4fec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_a0f2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4fec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_a0f2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_4fec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_a0f2_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_4fec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_a0f2_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_4fec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_a0f2_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_42a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_c370_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_42a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_c370_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_42a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_c370_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_42a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_c370_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_42a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_c370_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_42a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_c370_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_42a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_c370_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_42a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_c370_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_2401_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_96f0_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_2401_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_96f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_2401_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_96f0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_2401_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_96f0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_2401_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_96f0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_2401_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_96f0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_2401_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_96f0_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_2554_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_8ed1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_2554_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_8ed1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_2554_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_8ed1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_2554_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_8ed1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_2554_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_8ed1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_48a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_79fd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_48a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_79fd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_48a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_79fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_d5ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_4478_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_d5ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_4478_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_d5ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_4478_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3041_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_53e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3041_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_53e5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_3041_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_53e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4850_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_dff2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4850_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_dff2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_4850_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_dff2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l370_l359_l352_l355_DUPLICATE_a5d8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l370_l359_l352_l355_DUPLICATE_a5d8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_42a1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l370_l359_l352_l355_DUPLICATE_a5d8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_2554_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l370_l359_l352_l355_DUPLICATE_a5d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l359_l388_l355_l384_l352_l380_l376_l370_l363_DUPLICATE_0b88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l359_l388_l355_l384_l352_l380_l376_l370_l363_DUPLICATE_0b88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_42a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l359_l388_l355_l384_l352_l380_l376_l370_l363_DUPLICATE_0b88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_2401_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l359_l388_l355_l384_l352_l380_l376_l370_l363_DUPLICATE_0b88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_2554_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l359_l388_l355_l384_l352_l380_l376_l370_l363_DUPLICATE_0b88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_48a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l359_l388_l355_l384_l352_l380_l376_l370_l363_DUPLICATE_0b88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_d5ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l359_l388_l355_l384_l352_l380_l376_l370_l363_DUPLICATE_0b88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3041_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l359_l388_l355_l384_l352_l380_l376_l370_l363_DUPLICATE_0b88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4850_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l359_l388_l355_l384_l352_l380_l376_l370_l363_DUPLICATE_0b88_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l359_l352_l363_l355_DUPLICATE_a2db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l359_l352_l363_l355_DUPLICATE_a2db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_42a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l359_l352_l363_l355_DUPLICATE_a2db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_2401_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l359_l352_l363_l355_DUPLICATE_a2db_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_4b92_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_4b92_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_4b92_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_42a1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_4b92_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_4850_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_4b92_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l339_c2_b6a4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l339_c2_b6a4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l339_c2_b6a4_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l339_c2_b6a4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4850_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l388_c7_4850_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_2401_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_447a_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l370_c7_2554] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l370_c7_2554_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_2554_cond;
     n16_low_MUX_uxn_opcodes_h_l370_c7_2554_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_2554_iftrue;
     n16_low_MUX_uxn_opcodes_h_l370_c7_2554_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_2554_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_2554_return_output := n16_low_MUX_uxn_opcodes_h_l370_c7_2554_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l388_c7_4850] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4850_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4850_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4850_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4850_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4850_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4850_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4850_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4850_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l388_c7_4850] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4850_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4850_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4850_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4850_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4850_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4850_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4850_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4850_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l370_c7_2554] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_2554_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_2554_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_2554_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_2554_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_2554_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_2554_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_2554_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_2554_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l363_c7_2401] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_2401_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_2401_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_2401_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_2401_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_2401_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_2401_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_2401_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_2401_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l339_c2_b6a4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_b6a4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_b6a4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l339_c2_b6a4] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l388_c7_4850] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l388_c7_4850_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_4850_cond;
     result_u8_value_MUX_uxn_opcodes_h_l388_c7_4850_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_4850_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l388_c7_4850_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_4850_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_4850_return_output := result_u8_value_MUX_uxn_opcodes_h_l388_c7_4850_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l339_c2_b6a4] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_b6a4_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_b6a4_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l339_c2_b6a4] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l355_c7_4fec] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l355_c7_4fec_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_4fec_cond;
     t16_high_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue;
     t16_high_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_4fec_return_output := t16_high_MUX_uxn_opcodes_h_l355_c7_4fec_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l363_c7_2401] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l363_c7_2401_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_2401_cond;
     n16_high_MUX_uxn_opcodes_h_l363_c7_2401_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_2401_iftrue;
     n16_high_MUX_uxn_opcodes_h_l363_c7_2401_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_2401_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_2401_return_output := n16_high_MUX_uxn_opcodes_h_l363_c7_2401_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l359_c7_42a1] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l359_c7_42a1_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_42a1_cond;
     t16_low_MUX_uxn_opcodes_h_l359_c7_42a1_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_42a1_iftrue;
     t16_low_MUX_uxn_opcodes_h_l359_c7_42a1_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_42a1_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_42a1_return_output := t16_low_MUX_uxn_opcodes_h_l359_c7_42a1_return_output;

     -- Submodule level 2
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_42a1_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_2401_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_2401_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_2554_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3041_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_4850_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_42a1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_2401_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_2401_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_2554_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3041_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_4850_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_3041_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_4850_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_4fec_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_42a1_return_output;
     -- t16_high_MUX[uxn_opcodes_h_l352_c7_6dc5] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_cond;
     t16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue;
     t16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output := t16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l384_c7_3041] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3041_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3041_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3041_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3041_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3041_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3041_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3041_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3041_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l384_c7_3041] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l384_c7_3041_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_3041_cond;
     result_u8_value_MUX_uxn_opcodes_h_l384_c7_3041_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_3041_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l384_c7_3041_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_3041_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_3041_return_output := result_u8_value_MUX_uxn_opcodes_h_l384_c7_3041_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l363_c7_2401] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l363_c7_2401_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_2401_cond;
     n16_low_MUX_uxn_opcodes_h_l363_c7_2401_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_2401_iftrue;
     n16_low_MUX_uxn_opcodes_h_l363_c7_2401_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_2401_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_2401_return_output := n16_low_MUX_uxn_opcodes_h_l363_c7_2401_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l359_c7_42a1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_42a1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_42a1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_42a1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_42a1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_42a1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_42a1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_42a1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_42a1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l384_c7_3041] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3041_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3041_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3041_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3041_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3041_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3041_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3041_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3041_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l359_c7_42a1] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l359_c7_42a1_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_42a1_cond;
     n16_high_MUX_uxn_opcodes_h_l359_c7_42a1_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_42a1_iftrue;
     n16_high_MUX_uxn_opcodes_h_l359_c7_42a1_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_42a1_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_42a1_return_output := n16_high_MUX_uxn_opcodes_h_l359_c7_42a1_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l355_c7_4fec] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l355_c7_4fec_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_4fec_cond;
     t16_low_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue;
     t16_low_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_4fec_return_output := t16_low_MUX_uxn_opcodes_h_l355_c7_4fec_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l363_c7_2401] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_2401_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_2401_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_2401_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_2401_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_2401_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_2401_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_2401_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_2401_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_42a1_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_42a1_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_2401_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_d5ff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3041_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_42a1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_42a1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_2401_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_d5ff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3041_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_d5ff_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_3041_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_4fec_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l380_c7_d5ff] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l380_c7_d5ff_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_d5ff_cond;
     result_u8_value_MUX_uxn_opcodes_h_l380_c7_d5ff_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_d5ff_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l380_c7_d5ff_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_d5ff_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_d5ff_return_output := result_u8_value_MUX_uxn_opcodes_h_l380_c7_d5ff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l380_c7_d5ff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_d5ff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_d5ff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_d5ff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_d5ff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_d5ff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_d5ff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_d5ff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_d5ff_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l359_c7_42a1] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l359_c7_42a1_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_42a1_cond;
     n16_low_MUX_uxn_opcodes_h_l359_c7_42a1_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_42a1_iftrue;
     n16_low_MUX_uxn_opcodes_h_l359_c7_42a1_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_42a1_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_42a1_return_output := n16_low_MUX_uxn_opcodes_h_l359_c7_42a1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l355_c7_4fec] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4fec_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4fec_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4fec_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4fec_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l352_c7_6dc5] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_cond;
     t16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue;
     t16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output := t16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l339_c2_b6a4] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_cond;
     t16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue;
     t16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output := t16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l355_c7_4fec] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l355_c7_4fec_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_4fec_cond;
     n16_high_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue;
     n16_high_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_4fec_return_output := n16_high_MUX_uxn_opcodes_h_l355_c7_4fec_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l359_c7_42a1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_42a1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_42a1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_42a1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_42a1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_42a1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_42a1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_42a1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_42a1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l380_c7_d5ff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_d5ff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_d5ff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_d5ff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_d5ff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_d5ff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_d5ff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_d5ff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_d5ff_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_4fec_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_42a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_48a4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_d5ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_4fec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_42a1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_48a4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_d5ff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_48a4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_d5ff_return_output;
     REG_VAR_t16_high := VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l376_c7_48a4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_48a4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_48a4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_48a4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_48a4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_48a4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_48a4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_48a4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_48a4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l376_c7_48a4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_48a4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_48a4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_48a4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_48a4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_48a4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_48a4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_48a4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_48a4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l352_c7_6dc5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6dc5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6dc5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l376_c7_48a4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_48a4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_48a4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_48a4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_48a4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_48a4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_48a4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_48a4_return_output := result_u8_value_MUX_uxn_opcodes_h_l376_c7_48a4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l355_c7_4fec] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4fec_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4fec_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4fec_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4fec_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l339_c2_b6a4] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_cond;
     t16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue;
     t16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output := t16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l352_c7_6dc5] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_cond;
     n16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue;
     n16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output := n16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l355_c7_4fec] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l355_c7_4fec_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_4fec_cond;
     n16_low_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue;
     n16_low_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_4fec_return_output := n16_low_MUX_uxn_opcodes_h_l355_c7_4fec_return_output;

     -- Submodule level 5
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_4fec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_2554_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_48a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_4fec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_2554_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_48a4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_2554_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_48a4_return_output;
     REG_VAR_t16_low := VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l370_c7_2554] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_2554_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_2554_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_2554_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_2554_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_2554_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_2554_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_2554_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_2554_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l352_c7_6dc5] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_cond;
     n16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue;
     n16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output := n16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l370_c7_2554] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_2554_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_2554_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_2554_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_2554_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_2554_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_2554_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_2554_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_2554_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l370_c7_2554] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_2554_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_2554_cond;
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_2554_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_2554_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_2554_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_2554_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_2554_return_output := result_u8_value_MUX_uxn_opcodes_h_l370_c7_2554_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l352_c7_6dc5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_6dc5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_6dc5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l339_c2_b6a4] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_cond;
     n16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue;
     n16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output := n16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l339_c2_b6a4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_b6a4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_b6a4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output;

     -- Submodule level 6
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_2401_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_2554_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_2401_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_2554_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_2401_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_2554_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l363_c7_2401] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l363_c7_2401_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_2401_cond;
     result_u8_value_MUX_uxn_opcodes_h_l363_c7_2401_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_2401_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l363_c7_2401_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_2401_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_2401_return_output := result_u8_value_MUX_uxn_opcodes_h_l363_c7_2401_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l363_c7_2401] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_2401_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_2401_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_2401_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_2401_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_2401_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_2401_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_2401_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_2401_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l363_c7_2401] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_2401_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_2401_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_2401_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_2401_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_2401_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_2401_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_2401_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_2401_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l339_c2_b6a4] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_cond;
     n16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue;
     n16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output := n16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l339_c2_b6a4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_b6a4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_b6a4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output;

     -- Submodule level 7
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_42a1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_2401_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_42a1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_2401_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_42a1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_2401_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l359_c7_42a1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l359_c7_42a1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_42a1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l359_c7_42a1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_42a1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l359_c7_42a1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_42a1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_42a1_return_output := result_u8_value_MUX_uxn_opcodes_h_l359_c7_42a1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l359_c7_42a1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_42a1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_42a1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_42a1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_42a1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_42a1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_42a1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_42a1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_42a1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l359_c7_42a1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_42a1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_42a1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_42a1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_42a1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_42a1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_42a1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_42a1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_42a1_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_42a1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_42a1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_42a1_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l355_c7_4fec] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l355_c7_4fec_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_4fec_cond;
     result_u8_value_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_4fec_return_output := result_u8_value_MUX_uxn_opcodes_h_l355_c7_4fec_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l355_c7_4fec] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4fec_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4fec_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4fec_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4fec_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l355_c7_4fec] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4fec_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4fec_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4fec_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4fec_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4fec_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4fec_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_4fec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_4fec_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_4fec_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l352_c7_6dc5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6dc5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6dc5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l352_c7_6dc5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l352_c7_6dc5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_6dc5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output := result_u8_value_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l352_c7_6dc5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6dc5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6dc5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6dc5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6dc5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_6dc5_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l339_c2_b6a4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_b6a4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_b6a4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l339_c2_b6a4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l339_c2_b6a4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_b6a4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output := result_u8_value_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l339_c2_b6a4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_b6a4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_b6a4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_b6a4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_b6a4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l394_l335_DUPLICATE_dda0 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l394_l335_DUPLICATE_dda0_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_b6a4_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l394_l335_DUPLICATE_dda0_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l394_l335_DUPLICATE_dda0_return_output;
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
