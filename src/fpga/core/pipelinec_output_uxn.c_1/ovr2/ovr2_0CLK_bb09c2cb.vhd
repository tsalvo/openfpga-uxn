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
-- BIN_OP_EQ[uxn_opcodes_h_l339_c6_f510]
signal BIN_OP_EQ_uxn_opcodes_h_l339_c6_f510_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l339_c6_f510_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l339_c6_f510_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l339_c2_1d9d]
signal t16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l339_c2_1d9d]
signal t16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l339_c2_1d9d]
signal n16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l339_c2_1d9d]
signal n16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l339_c2_1d9d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_1d9d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l339_c2_1d9d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_1d9d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l339_c2_1d9d]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_1d9d_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l339_c2_1d9d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_1d9d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l339_c2_1d9d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_1d9d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l339_c2_1d9d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_1d9d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l339_c2_1d9d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l339_c2_1d9d]
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l339_c2_1d9d]
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_1d9d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l352_c11_255e]
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_255e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_255e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_255e_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l352_c7_fe23]
signal t16_low_MUX_uxn_opcodes_h_l352_c7_fe23_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l352_c7_fe23_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l352_c7_fe23]
signal t16_high_MUX_uxn_opcodes_h_l352_c7_fe23_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l352_c7_fe23_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l352_c7_fe23]
signal n16_low_MUX_uxn_opcodes_h_l352_c7_fe23_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l352_c7_fe23_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l352_c7_fe23]
signal n16_high_MUX_uxn_opcodes_h_l352_c7_fe23_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l352_c7_fe23_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l352_c7_fe23]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fe23_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fe23_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l352_c7_fe23]
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fe23_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fe23_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l352_c7_fe23]
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_fe23_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_fe23_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l352_c7_fe23]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fe23_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fe23_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l352_c7_fe23]
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fe23_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fe23_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l355_c11_78f2]
signal BIN_OP_EQ_uxn_opcodes_h_l355_c11_78f2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l355_c11_78f2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l355_c11_78f2_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l355_c7_d61b]
signal t16_low_MUX_uxn_opcodes_h_l355_c7_d61b_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l355_c7_d61b_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l355_c7_d61b]
signal t16_high_MUX_uxn_opcodes_h_l355_c7_d61b_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l355_c7_d61b_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l355_c7_d61b]
signal n16_low_MUX_uxn_opcodes_h_l355_c7_d61b_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l355_c7_d61b_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l355_c7_d61b]
signal n16_high_MUX_uxn_opcodes_h_l355_c7_d61b_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l355_c7_d61b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l355_c7_d61b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_d61b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_d61b_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l355_c7_d61b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_d61b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_d61b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l355_c7_d61b]
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_d61b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_d61b_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l355_c7_d61b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_d61b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_d61b_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l355_c7_d61b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_d61b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_d61b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l359_c11_9248]
signal BIN_OP_EQ_uxn_opcodes_h_l359_c11_9248_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l359_c11_9248_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l359_c11_9248_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l359_c7_2d81]
signal t16_low_MUX_uxn_opcodes_h_l359_c7_2d81_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l359_c7_2d81_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l359_c7_2d81_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l359_c7_2d81_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l359_c7_2d81]
signal n16_low_MUX_uxn_opcodes_h_l359_c7_2d81_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l359_c7_2d81_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l359_c7_2d81_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l359_c7_2d81_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l359_c7_2d81]
signal n16_high_MUX_uxn_opcodes_h_l359_c7_2d81_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l359_c7_2d81_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l359_c7_2d81_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l359_c7_2d81_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l359_c7_2d81]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d81_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d81_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d81_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d81_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l359_c7_2d81]
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d81_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d81_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d81_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d81_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l359_c7_2d81]
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d81_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d81_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d81_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d81_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l359_c7_2d81]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d81_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d81_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d81_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d81_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l359_c7_2d81]
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d81_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d81_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d81_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d81_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l363_c11_816f]
signal BIN_OP_EQ_uxn_opcodes_h_l363_c11_816f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l363_c11_816f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l363_c11_816f_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l363_c7_515d]
signal n16_low_MUX_uxn_opcodes_h_l363_c7_515d_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l363_c7_515d_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l363_c7_515d_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l363_c7_515d_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l363_c7_515d]
signal n16_high_MUX_uxn_opcodes_h_l363_c7_515d_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l363_c7_515d_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l363_c7_515d_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l363_c7_515d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l363_c7_515d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_515d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_515d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_515d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_515d_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l363_c7_515d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_515d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_515d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_515d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_515d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l363_c7_515d]
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_515d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_515d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_515d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_515d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l363_c7_515d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_515d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_515d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_515d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_515d_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l363_c7_515d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_515d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_515d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_515d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_515d_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l365_c30_611b]
signal sp_relative_shift_uxn_opcodes_h_l365_c30_611b_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l365_c30_611b_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l365_c30_611b_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l365_c30_611b_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l370_c11_0a69]
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_0a69_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_0a69_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_0a69_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l370_c7_8a32]
signal n16_low_MUX_uxn_opcodes_h_l370_c7_8a32_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l370_c7_8a32_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l370_c7_8a32_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l370_c7_8a32_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l370_c7_8a32]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_8a32_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_8a32_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_8a32_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_8a32_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l370_c7_8a32]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_8a32_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_8a32_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_8a32_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_8a32_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l370_c7_8a32]
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_8a32_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_8a32_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_8a32_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_8a32_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l370_c7_8a32]
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_8a32_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_8a32_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_8a32_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_8a32_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l376_c11_7271]
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_7271_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_7271_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_7271_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l376_c7_611b]
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_611b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_611b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_611b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_611b_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l376_c7_611b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_611b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_611b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_611b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_611b_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l376_c7_611b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_611b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_611b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_611b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_611b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l380_c11_3892]
signal BIN_OP_EQ_uxn_opcodes_h_l380_c11_3892_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l380_c11_3892_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l380_c11_3892_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l380_c7_674d]
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_674d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_674d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_674d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_674d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l380_c7_674d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_674d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_674d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_674d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_674d_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l380_c7_674d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_674d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_674d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_674d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_674d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l384_c11_4d9d]
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_4d9d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_4d9d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_4d9d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l384_c7_3617]
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_3617_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_3617_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_3617_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_3617_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l384_c7_3617]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3617_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3617_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3617_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3617_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l384_c7_3617]
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3617_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3617_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3617_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3617_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l388_c11_0b90]
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_0b90_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_0b90_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_0b90_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l388_c7_3948]
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_3948_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_3948_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_3948_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_3948_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l388_c7_3948]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_3948_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_3948_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_3948_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_3948_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l388_c7_3948]
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_3948_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_3948_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_3948_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_3948_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_8b52( ref_toks_0 : opcode_result_t;
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
      base.is_pc_updated := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.is_vram_write := ref_toks_8;
      base.u8_value := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l339_c6_f510
BIN_OP_EQ_uxn_opcodes_h_l339_c6_f510 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l339_c6_f510_left,
BIN_OP_EQ_uxn_opcodes_h_l339_c6_f510_right,
BIN_OP_EQ_uxn_opcodes_h_l339_c6_f510_return_output);

-- t16_low_MUX_uxn_opcodes_h_l339_c2_1d9d
t16_low_MUX_uxn_opcodes_h_l339_c2_1d9d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_cond,
t16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue,
t16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse,
t16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output);

-- t16_high_MUX_uxn_opcodes_h_l339_c2_1d9d
t16_high_MUX_uxn_opcodes_h_l339_c2_1d9d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_cond,
t16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue,
t16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse,
t16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output);

-- n16_low_MUX_uxn_opcodes_h_l339_c2_1d9d
n16_low_MUX_uxn_opcodes_h_l339_c2_1d9d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_cond,
n16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue,
n16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse,
n16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output);

-- n16_high_MUX_uxn_opcodes_h_l339_c2_1d9d
n16_high_MUX_uxn_opcodes_h_l339_c2_1d9d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_cond,
n16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue,
n16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse,
n16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_1d9d
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_1d9d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_1d9d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_1d9d
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_1d9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_1d9d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_1d9d
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_1d9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_1d9d_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_1d9d
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_1d9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_1d9d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_1d9d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_1d9d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_1d9d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_1d9d
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_1d9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_1d9d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_1d9d
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_1d9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_1d9d
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_1d9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l339_c2_1d9d
result_u8_value_MUX_uxn_opcodes_h_l339_c2_1d9d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l339_c2_1d9d_cond,
result_u8_value_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l352_c11_255e
BIN_OP_EQ_uxn_opcodes_h_l352_c11_255e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l352_c11_255e_left,
BIN_OP_EQ_uxn_opcodes_h_l352_c11_255e_right,
BIN_OP_EQ_uxn_opcodes_h_l352_c11_255e_return_output);

-- t16_low_MUX_uxn_opcodes_h_l352_c7_fe23
t16_low_MUX_uxn_opcodes_h_l352_c7_fe23 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l352_c7_fe23_cond,
t16_low_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue,
t16_low_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse,
t16_low_MUX_uxn_opcodes_h_l352_c7_fe23_return_output);

-- t16_high_MUX_uxn_opcodes_h_l352_c7_fe23
t16_high_MUX_uxn_opcodes_h_l352_c7_fe23 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l352_c7_fe23_cond,
t16_high_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue,
t16_high_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse,
t16_high_MUX_uxn_opcodes_h_l352_c7_fe23_return_output);

-- n16_low_MUX_uxn_opcodes_h_l352_c7_fe23
n16_low_MUX_uxn_opcodes_h_l352_c7_fe23 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l352_c7_fe23_cond,
n16_low_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue,
n16_low_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse,
n16_low_MUX_uxn_opcodes_h_l352_c7_fe23_return_output);

-- n16_high_MUX_uxn_opcodes_h_l352_c7_fe23
n16_high_MUX_uxn_opcodes_h_l352_c7_fe23 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l352_c7_fe23_cond,
n16_high_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue,
n16_high_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse,
n16_high_MUX_uxn_opcodes_h_l352_c7_fe23_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fe23
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fe23 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fe23_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fe23_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fe23
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fe23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fe23_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fe23_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l352_c7_fe23
result_u8_value_MUX_uxn_opcodes_h_l352_c7_fe23 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l352_c7_fe23_cond,
result_u8_value_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l352_c7_fe23_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fe23
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fe23 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fe23_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fe23_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fe23
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fe23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fe23_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fe23_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l355_c11_78f2
BIN_OP_EQ_uxn_opcodes_h_l355_c11_78f2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l355_c11_78f2_left,
BIN_OP_EQ_uxn_opcodes_h_l355_c11_78f2_right,
BIN_OP_EQ_uxn_opcodes_h_l355_c11_78f2_return_output);

-- t16_low_MUX_uxn_opcodes_h_l355_c7_d61b
t16_low_MUX_uxn_opcodes_h_l355_c7_d61b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l355_c7_d61b_cond,
t16_low_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue,
t16_low_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse,
t16_low_MUX_uxn_opcodes_h_l355_c7_d61b_return_output);

-- t16_high_MUX_uxn_opcodes_h_l355_c7_d61b
t16_high_MUX_uxn_opcodes_h_l355_c7_d61b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l355_c7_d61b_cond,
t16_high_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue,
t16_high_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse,
t16_high_MUX_uxn_opcodes_h_l355_c7_d61b_return_output);

-- n16_low_MUX_uxn_opcodes_h_l355_c7_d61b
n16_low_MUX_uxn_opcodes_h_l355_c7_d61b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l355_c7_d61b_cond,
n16_low_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue,
n16_low_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse,
n16_low_MUX_uxn_opcodes_h_l355_c7_d61b_return_output);

-- n16_high_MUX_uxn_opcodes_h_l355_c7_d61b
n16_high_MUX_uxn_opcodes_h_l355_c7_d61b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l355_c7_d61b_cond,
n16_high_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue,
n16_high_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse,
n16_high_MUX_uxn_opcodes_h_l355_c7_d61b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_d61b
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_d61b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_d61b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_d61b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_d61b
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_d61b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_d61b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_d61b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l355_c7_d61b
result_u8_value_MUX_uxn_opcodes_h_l355_c7_d61b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l355_c7_d61b_cond,
result_u8_value_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l355_c7_d61b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_d61b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_d61b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_d61b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_d61b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_d61b
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_d61b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_d61b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_d61b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l359_c11_9248
BIN_OP_EQ_uxn_opcodes_h_l359_c11_9248 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l359_c11_9248_left,
BIN_OP_EQ_uxn_opcodes_h_l359_c11_9248_right,
BIN_OP_EQ_uxn_opcodes_h_l359_c11_9248_return_output);

-- t16_low_MUX_uxn_opcodes_h_l359_c7_2d81
t16_low_MUX_uxn_opcodes_h_l359_c7_2d81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l359_c7_2d81_cond,
t16_low_MUX_uxn_opcodes_h_l359_c7_2d81_iftrue,
t16_low_MUX_uxn_opcodes_h_l359_c7_2d81_iffalse,
t16_low_MUX_uxn_opcodes_h_l359_c7_2d81_return_output);

-- n16_low_MUX_uxn_opcodes_h_l359_c7_2d81
n16_low_MUX_uxn_opcodes_h_l359_c7_2d81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l359_c7_2d81_cond,
n16_low_MUX_uxn_opcodes_h_l359_c7_2d81_iftrue,
n16_low_MUX_uxn_opcodes_h_l359_c7_2d81_iffalse,
n16_low_MUX_uxn_opcodes_h_l359_c7_2d81_return_output);

-- n16_high_MUX_uxn_opcodes_h_l359_c7_2d81
n16_high_MUX_uxn_opcodes_h_l359_c7_2d81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l359_c7_2d81_cond,
n16_high_MUX_uxn_opcodes_h_l359_c7_2d81_iftrue,
n16_high_MUX_uxn_opcodes_h_l359_c7_2d81_iffalse,
n16_high_MUX_uxn_opcodes_h_l359_c7_2d81_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d81
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d81 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d81_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d81_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d81_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d81_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d81
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d81_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d81_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d81_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d81_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d81
result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d81_cond,
result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d81_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d81_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d81_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d81
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d81 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d81_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d81_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d81_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d81_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d81
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d81_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d81_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d81_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d81_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l363_c11_816f
BIN_OP_EQ_uxn_opcodes_h_l363_c11_816f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l363_c11_816f_left,
BIN_OP_EQ_uxn_opcodes_h_l363_c11_816f_right,
BIN_OP_EQ_uxn_opcodes_h_l363_c11_816f_return_output);

-- n16_low_MUX_uxn_opcodes_h_l363_c7_515d
n16_low_MUX_uxn_opcodes_h_l363_c7_515d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l363_c7_515d_cond,
n16_low_MUX_uxn_opcodes_h_l363_c7_515d_iftrue,
n16_low_MUX_uxn_opcodes_h_l363_c7_515d_iffalse,
n16_low_MUX_uxn_opcodes_h_l363_c7_515d_return_output);

-- n16_high_MUX_uxn_opcodes_h_l363_c7_515d
n16_high_MUX_uxn_opcodes_h_l363_c7_515d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l363_c7_515d_cond,
n16_high_MUX_uxn_opcodes_h_l363_c7_515d_iftrue,
n16_high_MUX_uxn_opcodes_h_l363_c7_515d_iffalse,
n16_high_MUX_uxn_opcodes_h_l363_c7_515d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_515d
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_515d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_515d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_515d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_515d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_515d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_515d
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_515d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_515d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_515d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_515d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_515d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l363_c7_515d
result_u8_value_MUX_uxn_opcodes_h_l363_c7_515d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l363_c7_515d_cond,
result_u8_value_MUX_uxn_opcodes_h_l363_c7_515d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l363_c7_515d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l363_c7_515d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_515d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_515d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_515d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_515d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_515d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_515d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_515d
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_515d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_515d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_515d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_515d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_515d_return_output);

-- sp_relative_shift_uxn_opcodes_h_l365_c30_611b
sp_relative_shift_uxn_opcodes_h_l365_c30_611b : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l365_c30_611b_ins,
sp_relative_shift_uxn_opcodes_h_l365_c30_611b_x,
sp_relative_shift_uxn_opcodes_h_l365_c30_611b_y,
sp_relative_shift_uxn_opcodes_h_l365_c30_611b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l370_c11_0a69
BIN_OP_EQ_uxn_opcodes_h_l370_c11_0a69 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l370_c11_0a69_left,
BIN_OP_EQ_uxn_opcodes_h_l370_c11_0a69_right,
BIN_OP_EQ_uxn_opcodes_h_l370_c11_0a69_return_output);

-- n16_low_MUX_uxn_opcodes_h_l370_c7_8a32
n16_low_MUX_uxn_opcodes_h_l370_c7_8a32 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l370_c7_8a32_cond,
n16_low_MUX_uxn_opcodes_h_l370_c7_8a32_iftrue,
n16_low_MUX_uxn_opcodes_h_l370_c7_8a32_iffalse,
n16_low_MUX_uxn_opcodes_h_l370_c7_8a32_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_8a32
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_8a32 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_8a32_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_8a32_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_8a32_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_8a32_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_8a32
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_8a32 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_8a32_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_8a32_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_8a32_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_8a32_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l370_c7_8a32
result_u8_value_MUX_uxn_opcodes_h_l370_c7_8a32 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l370_c7_8a32_cond,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_8a32_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_8a32_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_8a32_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_8a32
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_8a32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_8a32_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_8a32_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_8a32_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_8a32_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l376_c11_7271
BIN_OP_EQ_uxn_opcodes_h_l376_c11_7271 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l376_c11_7271_left,
BIN_OP_EQ_uxn_opcodes_h_l376_c11_7271_right,
BIN_OP_EQ_uxn_opcodes_h_l376_c11_7271_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l376_c7_611b
result_u8_value_MUX_uxn_opcodes_h_l376_c7_611b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l376_c7_611b_cond,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_611b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_611b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_611b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_611b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_611b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_611b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_611b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_611b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_611b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_611b
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_611b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_611b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_611b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_611b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_611b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l380_c11_3892
BIN_OP_EQ_uxn_opcodes_h_l380_c11_3892 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l380_c11_3892_left,
BIN_OP_EQ_uxn_opcodes_h_l380_c11_3892_right,
BIN_OP_EQ_uxn_opcodes_h_l380_c11_3892_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l380_c7_674d
result_u8_value_MUX_uxn_opcodes_h_l380_c7_674d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l380_c7_674d_cond,
result_u8_value_MUX_uxn_opcodes_h_l380_c7_674d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l380_c7_674d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l380_c7_674d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_674d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_674d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_674d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_674d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_674d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_674d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_674d
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_674d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_674d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_674d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_674d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_674d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l384_c11_4d9d
BIN_OP_EQ_uxn_opcodes_h_l384_c11_4d9d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l384_c11_4d9d_left,
BIN_OP_EQ_uxn_opcodes_h_l384_c11_4d9d_right,
BIN_OP_EQ_uxn_opcodes_h_l384_c11_4d9d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l384_c7_3617
result_u8_value_MUX_uxn_opcodes_h_l384_c7_3617 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l384_c7_3617_cond,
result_u8_value_MUX_uxn_opcodes_h_l384_c7_3617_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l384_c7_3617_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l384_c7_3617_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3617
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3617 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3617_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3617_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3617_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3617_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3617
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3617 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3617_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3617_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3617_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3617_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l388_c11_0b90
BIN_OP_EQ_uxn_opcodes_h_l388_c11_0b90 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l388_c11_0b90_left,
BIN_OP_EQ_uxn_opcodes_h_l388_c11_0b90_right,
BIN_OP_EQ_uxn_opcodes_h_l388_c11_0b90_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l388_c7_3948
result_u8_value_MUX_uxn_opcodes_h_l388_c7_3948 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l388_c7_3948_cond,
result_u8_value_MUX_uxn_opcodes_h_l388_c7_3948_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l388_c7_3948_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l388_c7_3948_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_3948
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_3948 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_3948_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_3948_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_3948_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_3948_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_3948
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_3948 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_3948_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_3948_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_3948_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_3948_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l339_c6_f510_return_output,
 t16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output,
 t16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output,
 n16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output,
 n16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l352_c11_255e_return_output,
 t16_low_MUX_uxn_opcodes_h_l352_c7_fe23_return_output,
 t16_high_MUX_uxn_opcodes_h_l352_c7_fe23_return_output,
 n16_low_MUX_uxn_opcodes_h_l352_c7_fe23_return_output,
 n16_high_MUX_uxn_opcodes_h_l352_c7_fe23_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fe23_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fe23_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l352_c7_fe23_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fe23_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fe23_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l355_c11_78f2_return_output,
 t16_low_MUX_uxn_opcodes_h_l355_c7_d61b_return_output,
 t16_high_MUX_uxn_opcodes_h_l355_c7_d61b_return_output,
 n16_low_MUX_uxn_opcodes_h_l355_c7_d61b_return_output,
 n16_high_MUX_uxn_opcodes_h_l355_c7_d61b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_d61b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_d61b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l355_c7_d61b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_d61b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_d61b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l359_c11_9248_return_output,
 t16_low_MUX_uxn_opcodes_h_l359_c7_2d81_return_output,
 n16_low_MUX_uxn_opcodes_h_l359_c7_2d81_return_output,
 n16_high_MUX_uxn_opcodes_h_l359_c7_2d81_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d81_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d81_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d81_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d81_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d81_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l363_c11_816f_return_output,
 n16_low_MUX_uxn_opcodes_h_l363_c7_515d_return_output,
 n16_high_MUX_uxn_opcodes_h_l363_c7_515d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_515d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_515d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l363_c7_515d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_515d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_515d_return_output,
 sp_relative_shift_uxn_opcodes_h_l365_c30_611b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l370_c11_0a69_return_output,
 n16_low_MUX_uxn_opcodes_h_l370_c7_8a32_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_8a32_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_8a32_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l370_c7_8a32_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_8a32_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l376_c11_7271_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l376_c7_611b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_611b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_611b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l380_c11_3892_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l380_c7_674d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_674d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_674d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l384_c11_4d9d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l384_c7_3617_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3617_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3617_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l388_c11_0b90_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l388_c7_3948_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_3948_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_3948_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_f510_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_f510_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_f510_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_fe23_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_fe23_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_fe23_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_fe23_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l344_c3_568a : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fe23_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_1d9d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l339_c2_1d9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_1d9d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l339_c2_1d9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_1d9d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fe23_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_1d9d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l349_c3_1baa : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fe23_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_1d9d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fe23_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_1d9d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l339_c2_1d9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l339_c2_1d9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_fe23_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_1d9d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_255e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_255e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_255e_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_d61b_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_fe23_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_d61b_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_fe23_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_d61b_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_fe23_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_d61b_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_fe23_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_d61b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fe23_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_d61b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fe23_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_d61b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_fe23_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l353_c3_2d49 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_d61b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fe23_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_d61b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fe23_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_78f2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_78f2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_78f2_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_2d81_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_d61b_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_d61b_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_2d81_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_d61b_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_2d81_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_d61b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d81_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_d61b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_d61b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d81_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_d61b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_48ed : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d81_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_d61b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_d61b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_9248_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_9248_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_9248_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_2d81_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_2d81_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_2d81_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_2d81_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_2d81_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_515d_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_2d81_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_2d81_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_2d81_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_515d_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_2d81_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d81_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d81_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_515d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d81_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_515d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d81_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d81_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d81_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_515d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d81_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d81_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l361_c3_d23e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d81_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_515d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d81_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_515d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d81_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_816f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_816f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_816f_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_515d_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_515d_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_8a32_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_515d_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_515d_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_515d_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_515d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_515d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_515d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_8a32_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_515d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_515d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_515d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_515d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_515d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_515d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_8a32_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_515d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_515d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_7bd9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_515d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_8a32_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_515d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_515d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_515d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_8a32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_515d_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_611b_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_611b_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_611b_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_611b_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_0a69_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_0a69_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_0a69_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_8a32_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_8a32_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_8a32_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_8a32_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l373_c3_8d0c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_8a32_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_611b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_8a32_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_8a32_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l372_c3_dda1 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_8a32_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_8a32_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_8a32_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_8a32_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_611b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_8a32_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_8a32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_8a32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_611b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_8a32_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_7271_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_7271_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_7271_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_611b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_611b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_674d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_611b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_611b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_e12c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_611b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_674d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_611b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_611b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_611b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_674d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_611b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_3892_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_3892_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_3892_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_674d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_674d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_3617_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_674d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_674d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_1665 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_674d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3617_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_674d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_674d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_674d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3617_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_674d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_4d9d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_4d9d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_4d9d_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_3617_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_3617_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_3948_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_3617_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3617_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_e88d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3617_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_3948_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3617_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3617_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3617_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_3948_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3617_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_0b90_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_0b90_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_0b90_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_3948_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_3948_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_3948_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_3948_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_3438 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_3948_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l388_c7_3948_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_3948_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_3948_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_3948_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_3948_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l339_l352_l388_l355_DUPLICATE_243e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l370_l355_l359_l352_DUPLICATE_f927_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l355_l359_l352_l363_DUPLICATE_4306_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l359_l384_l376_l363_l352_l388_l355_l380_l370_DUPLICATE_bffe_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l394_l335_DUPLICATE_e745_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_7271_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_e12c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_611b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_e12c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_78f2_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_1665 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_674d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_1665;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l361_c3_d23e := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d81_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l361_c3_d23e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l353_c3_2d49 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l353_c3_2d49;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_515d_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l349_c3_1baa := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l349_c3_1baa;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_3438 := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_3948_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_3438;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_3892_right := to_unsigned(7, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l372_c3_dda1 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_8a32_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l372_c3_dda1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_0a69_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_48ed := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_48ed;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_e88d := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3617_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_e88d;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_7bd9 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_515d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_7bd9;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l344_c3_568a := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l344_c3_568a;
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_611b_y := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_3948_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_9248_right := to_unsigned(3, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l373_c3_8d0c := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_8a32_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l373_c3_8d0c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_0b90_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_f510_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_255e_right := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_4d9d_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_816f_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_611b_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));

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
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_611b_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_2d81_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_515d_iffalse := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_674d_iftrue := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_3948_iftrue := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_2d81_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_515d_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_8a32_iffalse := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_611b_iftrue := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_3617_iftrue := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_f510_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_255e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_78f2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_9248_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_816f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_0a69_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_7271_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_3892_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_4d9d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_0b90_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_515d_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_8a32_iftrue := VAR_previous_stack_read;
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue := VAR_previous_stack_read;
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_2d81_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_8a32_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse := t16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_515d_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_2d81_iffalse := t16_low;
     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l339_c2_1d9d] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l339_c2_1d9d_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l339_l352_l388_l355_DUPLICATE_243e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l339_l352_l388_l355_DUPLICATE_243e_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l355_c11_78f2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l355_c11_78f2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_78f2_left;
     BIN_OP_EQ_uxn_opcodes_h_l355_c11_78f2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_78f2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_78f2_return_output := BIN_OP_EQ_uxn_opcodes_h_l355_c11_78f2_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l365_c30_611b] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l365_c30_611b_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_611b_ins;
     sp_relative_shift_uxn_opcodes_h_l365_c30_611b_x <= VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_611b_x;
     sp_relative_shift_uxn_opcodes_h_l365_c30_611b_y <= VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_611b_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_611b_return_output := sp_relative_shift_uxn_opcodes_h_l365_c30_611b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l359_l384_l376_l363_l352_l388_l355_l380_l370_DUPLICATE_bffe LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l359_l384_l376_l363_l352_l388_l355_l380_l370_DUPLICATE_bffe_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l363_c11_816f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l363_c11_816f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_816f_left;
     BIN_OP_EQ_uxn_opcodes_h_l363_c11_816f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_816f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_816f_return_output := BIN_OP_EQ_uxn_opcodes_h_l363_c11_816f_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l370_l355_l359_l352_DUPLICATE_f927 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l370_l355_l359_l352_DUPLICATE_f927_return_output := result.sp_relative_shift;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l339_c2_1d9d] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l339_c2_1d9d_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l359_c11_9248] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l359_c11_9248_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_9248_left;
     BIN_OP_EQ_uxn_opcodes_h_l359_c11_9248_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_9248_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_9248_return_output := BIN_OP_EQ_uxn_opcodes_h_l359_c11_9248_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l388_c7_3948] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l388_c7_3948_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l355_l359_l352_l363_DUPLICATE_4306 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l355_l359_l352_l363_DUPLICATE_4306_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l339_c6_f510] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l339_c6_f510_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_f510_left;
     BIN_OP_EQ_uxn_opcodes_h_l339_c6_f510_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_f510_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_f510_return_output := BIN_OP_EQ_uxn_opcodes_h_l339_c6_f510_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l376_c11_7271] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l376_c11_7271_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_7271_left;
     BIN_OP_EQ_uxn_opcodes_h_l376_c11_7271_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_7271_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_7271_return_output := BIN_OP_EQ_uxn_opcodes_h_l376_c11_7271_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l339_c2_1d9d] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l339_c2_1d9d_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l352_c11_255e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l352_c11_255e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_255e_left;
     BIN_OP_EQ_uxn_opcodes_h_l352_c11_255e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_255e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_255e_return_output := BIN_OP_EQ_uxn_opcodes_h_l352_c11_255e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l384_c11_4d9d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l384_c11_4d9d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_4d9d_left;
     BIN_OP_EQ_uxn_opcodes_h_l384_c11_4d9d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_4d9d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_4d9d_return_output := BIN_OP_EQ_uxn_opcodes_h_l384_c11_4d9d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l388_c11_0b90] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l388_c11_0b90_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_0b90_left;
     BIN_OP_EQ_uxn_opcodes_h_l388_c11_0b90_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_0b90_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_0b90_return_output := BIN_OP_EQ_uxn_opcodes_h_l388_c11_0b90_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l380_c11_3892] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l380_c11_3892_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_3892_left;
     BIN_OP_EQ_uxn_opcodes_h_l380_c11_3892_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_3892_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_3892_return_output := BIN_OP_EQ_uxn_opcodes_h_l380_c11_3892_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l339_c2_1d9d] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l339_c2_1d9d_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l370_c11_0a69] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l370_c11_0a69_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_0a69_left;
     BIN_OP_EQ_uxn_opcodes_h_l370_c11_0a69_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_0a69_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_0a69_return_output := BIN_OP_EQ_uxn_opcodes_h_l370_c11_0a69_return_output;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_f510_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_f510_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_1d9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_f510_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_1d9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_f510_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_f510_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_1d9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_f510_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_1d9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_f510_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_f510_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_1d9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_f510_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_1d9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_f510_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_1d9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_f510_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_f510_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_f510_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_fe23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_255e_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_fe23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_255e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fe23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_255e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fe23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_255e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fe23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_255e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fe23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_255e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_fe23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_255e_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_fe23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_255e_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_fe23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_255e_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_d61b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_78f2_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_d61b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_78f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_d61b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_78f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_d61b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_78f2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_d61b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_78f2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_d61b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_78f2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_d61b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_78f2_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_d61b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_78f2_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_d61b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_78f2_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_2d81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_9248_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_2d81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_9248_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_9248_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_9248_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_9248_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_9248_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_9248_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_2d81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_9248_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_515d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_816f_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_515d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_816f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_515d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_816f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_515d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_816f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_515d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_816f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_515d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_816f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_515d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_816f_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_8a32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_0a69_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_8a32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_0a69_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_8a32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_0a69_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_8a32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_0a69_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_8a32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_0a69_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_611b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_7271_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_611b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_7271_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_611b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_7271_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_674d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_3892_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_674d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_3892_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_674d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_3892_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_4d9d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_4d9d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_3617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_4d9d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_3948_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_0b90_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_3948_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_0b90_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_3948_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_0b90_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l370_l355_l359_l352_DUPLICATE_f927_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l370_l355_l359_l352_DUPLICATE_f927_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d81_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l370_l355_l359_l352_DUPLICATE_f927_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_8a32_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l370_l355_l359_l352_DUPLICATE_f927_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l359_l384_l376_l363_l352_l388_l355_l380_l370_DUPLICATE_bffe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l359_l384_l376_l363_l352_l388_l355_l380_l370_DUPLICATE_bffe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l359_l384_l376_l363_l352_l388_l355_l380_l370_DUPLICATE_bffe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_515d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l359_l384_l376_l363_l352_l388_l355_l380_l370_DUPLICATE_bffe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_8a32_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l359_l384_l376_l363_l352_l388_l355_l380_l370_DUPLICATE_bffe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_611b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l359_l384_l376_l363_l352_l388_l355_l380_l370_DUPLICATE_bffe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_674d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l359_l384_l376_l363_l352_l388_l355_l380_l370_DUPLICATE_bffe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3617_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l359_l384_l376_l363_l352_l388_l355_l380_l370_DUPLICATE_bffe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_3948_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l359_l384_l376_l363_l352_l388_l355_l380_l370_DUPLICATE_bffe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l355_l359_l352_l363_DUPLICATE_4306_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l355_l359_l352_l363_DUPLICATE_4306_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l355_l359_l352_l363_DUPLICATE_4306_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_515d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l355_l359_l352_l363_DUPLICATE_4306_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l339_l352_l388_l355_DUPLICATE_243e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l339_l352_l388_l355_DUPLICATE_243e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l339_l352_l388_l355_DUPLICATE_243e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d81_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l339_l352_l388_l355_DUPLICATE_243e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_3948_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l339_l352_l388_l355_DUPLICATE_243e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l339_c2_1d9d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l339_c2_1d9d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l339_c2_1d9d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l339_c2_1d9d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_3948_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l388_c7_3948_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_515d_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_611b_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l339_c2_1d9d] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l363_c7_515d] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l363_c7_515d_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_515d_cond;
     n16_high_MUX_uxn_opcodes_h_l363_c7_515d_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_515d_iftrue;
     n16_high_MUX_uxn_opcodes_h_l363_c7_515d_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_515d_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_515d_return_output := n16_high_MUX_uxn_opcodes_h_l363_c7_515d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l388_c7_3948] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l388_c7_3948_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_3948_cond;
     result_u8_value_MUX_uxn_opcodes_h_l388_c7_3948_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_3948_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l388_c7_3948_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_3948_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_3948_return_output := result_u8_value_MUX_uxn_opcodes_h_l388_c7_3948_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l339_c2_1d9d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_1d9d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_1d9d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l355_c7_d61b] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l355_c7_d61b_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_d61b_cond;
     t16_high_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue;
     t16_high_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_d61b_return_output := t16_high_MUX_uxn_opcodes_h_l355_c7_d61b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l370_c7_8a32] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_8a32_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_8a32_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_8a32_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_8a32_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_8a32_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_8a32_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_8a32_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_8a32_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l388_c7_3948] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_3948_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_3948_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_3948_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_3948_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_3948_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_3948_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_3948_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_3948_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l370_c7_8a32] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l370_c7_8a32_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_8a32_cond;
     n16_low_MUX_uxn_opcodes_h_l370_c7_8a32_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_8a32_iftrue;
     n16_low_MUX_uxn_opcodes_h_l370_c7_8a32_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_8a32_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_8a32_return_output := n16_low_MUX_uxn_opcodes_h_l370_c7_8a32_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l388_c7_3948] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_3948_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_3948_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_3948_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_3948_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_3948_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_3948_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_3948_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_3948_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l363_c7_515d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_515d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_515d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_515d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_515d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_515d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_515d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_515d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_515d_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l359_c7_2d81] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l359_c7_2d81_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_2d81_cond;
     t16_low_MUX_uxn_opcodes_h_l359_c7_2d81_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_2d81_iftrue;
     t16_low_MUX_uxn_opcodes_h_l359_c7_2d81_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_2d81_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_2d81_return_output := t16_low_MUX_uxn_opcodes_h_l359_c7_2d81_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l339_c2_1d9d] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_1d9d_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_1d9d_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l339_c2_1d9d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output;

     -- Submodule level 2
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_2d81_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_515d_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_515d_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_8a32_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3617_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_3948_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d81_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_515d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_515d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_8a32_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3617_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_3948_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_3617_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_3948_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_d61b_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_2d81_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l363_c7_515d] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l363_c7_515d_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_515d_cond;
     n16_low_MUX_uxn_opcodes_h_l363_c7_515d_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_515d_iftrue;
     n16_low_MUX_uxn_opcodes_h_l363_c7_515d_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_515d_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_515d_return_output := n16_low_MUX_uxn_opcodes_h_l363_c7_515d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l363_c7_515d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_515d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_515d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_515d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_515d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_515d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_515d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_515d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_515d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l384_c7_3617] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3617_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3617_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3617_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3617_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3617_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3617_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3617_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3617_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l359_c7_2d81] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l359_c7_2d81_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_2d81_cond;
     n16_high_MUX_uxn_opcodes_h_l359_c7_2d81_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_2d81_iftrue;
     n16_high_MUX_uxn_opcodes_h_l359_c7_2d81_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_2d81_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_2d81_return_output := n16_high_MUX_uxn_opcodes_h_l359_c7_2d81_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l355_c7_d61b] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l355_c7_d61b_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_d61b_cond;
     t16_low_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue;
     t16_low_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_d61b_return_output := t16_low_MUX_uxn_opcodes_h_l355_c7_d61b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l359_c7_2d81] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d81_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d81_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d81_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d81_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d81_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d81_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d81_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d81_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l384_c7_3617] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l384_c7_3617_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_3617_cond;
     result_u8_value_MUX_uxn_opcodes_h_l384_c7_3617_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_3617_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l384_c7_3617_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_3617_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_3617_return_output := result_u8_value_MUX_uxn_opcodes_h_l384_c7_3617_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l384_c7_3617] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3617_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3617_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3617_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3617_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3617_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3617_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3617_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3617_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l352_c7_fe23] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l352_c7_fe23_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_fe23_cond;
     t16_high_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue;
     t16_high_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_fe23_return_output := t16_high_MUX_uxn_opcodes_h_l352_c7_fe23_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_2d81_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_2d81_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_515d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_674d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_3617_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_2d81_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d81_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_515d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_674d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_3617_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_674d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_3617_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_fe23_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_d61b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l380_c7_674d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_674d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_674d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_674d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_674d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_674d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_674d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_674d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_674d_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l352_c7_fe23] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l352_c7_fe23_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_fe23_cond;
     t16_low_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue;
     t16_low_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_fe23_return_output := t16_low_MUX_uxn_opcodes_h_l352_c7_fe23_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l339_c2_1d9d] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_cond;
     t16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue;
     t16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output := t16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l359_c7_2d81] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d81_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d81_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d81_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d81_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d81_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d81_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d81_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d81_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l359_c7_2d81] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l359_c7_2d81_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_2d81_cond;
     n16_low_MUX_uxn_opcodes_h_l359_c7_2d81_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_2d81_iftrue;
     n16_low_MUX_uxn_opcodes_h_l359_c7_2d81_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_2d81_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_2d81_return_output := n16_low_MUX_uxn_opcodes_h_l359_c7_2d81_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l355_c7_d61b] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l355_c7_d61b_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_d61b_cond;
     n16_high_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue;
     n16_high_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_d61b_return_output := n16_high_MUX_uxn_opcodes_h_l355_c7_d61b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l355_c7_d61b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_d61b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_d61b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_d61b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_d61b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l380_c7_674d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l380_c7_674d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_674d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l380_c7_674d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_674d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l380_c7_674d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_674d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_674d_return_output := result_u8_value_MUX_uxn_opcodes_h_l380_c7_674d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l380_c7_674d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_674d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_674d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_674d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_674d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_674d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_674d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_674d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_674d_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_d61b_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_2d81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_611b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_674d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_d61b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_2d81_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_611b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_674d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_611b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_674d_return_output;
     REG_VAR_t16_high := VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_fe23_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l355_c7_d61b] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l355_c7_d61b_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_d61b_cond;
     n16_low_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue;
     n16_low_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_d61b_return_output := n16_low_MUX_uxn_opcodes_h_l355_c7_d61b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l355_c7_d61b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_d61b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_d61b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_d61b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_d61b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l376_c7_611b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_611b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_611b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_611b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_611b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_611b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_611b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_611b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_611b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l352_c7_fe23] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fe23_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fe23_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fe23_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fe23_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l352_c7_fe23] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l352_c7_fe23_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_fe23_cond;
     n16_high_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue;
     n16_high_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_fe23_return_output := n16_high_MUX_uxn_opcodes_h_l352_c7_fe23_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l376_c7_611b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_611b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_611b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_611b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_611b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_611b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_611b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_611b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_611b_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l339_c2_1d9d] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_cond;
     t16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue;
     t16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output := t16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l376_c7_611b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_611b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_611b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_611b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_611b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_611b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_611b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_611b_return_output := result_u8_value_MUX_uxn_opcodes_h_l376_c7_611b_return_output;

     -- Submodule level 5
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_fe23_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_d61b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_8a32_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_611b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fe23_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_d61b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_8a32_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_611b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_8a32_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_611b_return_output;
     REG_VAR_t16_low := VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l352_c7_fe23] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fe23_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fe23_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fe23_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fe23_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l339_c2_1d9d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_1d9d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_1d9d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l339_c2_1d9d] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_cond;
     n16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue;
     n16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output := n16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l352_c7_fe23] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l352_c7_fe23_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_fe23_cond;
     n16_low_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue;
     n16_low_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_fe23_return_output := n16_low_MUX_uxn_opcodes_h_l352_c7_fe23_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l370_c7_8a32] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_8a32_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_8a32_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_8a32_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_8a32_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_8a32_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_8a32_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_8a32_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_8a32_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l370_c7_8a32] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_8a32_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_8a32_cond;
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_8a32_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_8a32_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_8a32_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_8a32_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_8a32_return_output := result_u8_value_MUX_uxn_opcodes_h_l370_c7_8a32_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l370_c7_8a32] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_8a32_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_8a32_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_8a32_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_8a32_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_8a32_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_8a32_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_8a32_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_8a32_return_output;

     -- Submodule level 6
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_fe23_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_515d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_8a32_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fe23_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_515d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_8a32_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_515d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_8a32_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l363_c7_515d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l363_c7_515d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_515d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l363_c7_515d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_515d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l363_c7_515d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_515d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_515d_return_output := result_u8_value_MUX_uxn_opcodes_h_l363_c7_515d_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l339_c2_1d9d] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_cond;
     n16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue;
     n16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output := n16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l339_c2_1d9d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_1d9d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_1d9d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l363_c7_515d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_515d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_515d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_515d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_515d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_515d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_515d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_515d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_515d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l363_c7_515d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_515d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_515d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_515d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_515d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_515d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_515d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_515d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_515d_return_output;

     -- Submodule level 7
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d81_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_515d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d81_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_515d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d81_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_515d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l359_c7_2d81] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d81_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d81_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d81_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d81_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d81_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d81_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d81_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d81_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l359_c7_2d81] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d81_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d81_cond;
     result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d81_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d81_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d81_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d81_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d81_return_output := result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d81_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l359_c7_2d81] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d81_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d81_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d81_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d81_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d81_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d81_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d81_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d81_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_2d81_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_2d81_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_2d81_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l355_c7_d61b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_d61b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_d61b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_d61b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_d61b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l355_c7_d61b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_d61b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_d61b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_d61b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_d61b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l355_c7_d61b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l355_c7_d61b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_d61b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_d61b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_d61b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_d61b_return_output := result_u8_value_MUX_uxn_opcodes_h_l355_c7_d61b_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_d61b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_d61b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_d61b_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l352_c7_fe23] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l352_c7_fe23_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_fe23_cond;
     result_u8_value_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_fe23_return_output := result_u8_value_MUX_uxn_opcodes_h_l352_c7_fe23_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l352_c7_fe23] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fe23_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fe23_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fe23_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fe23_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l352_c7_fe23] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fe23_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fe23_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fe23_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fe23_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fe23_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fe23_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fe23_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fe23_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_fe23_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l339_c2_1d9d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_1d9d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_1d9d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l339_c2_1d9d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_1d9d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_1d9d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l339_c2_1d9d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l339_c2_1d9d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_1d9d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_1d9d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_1d9d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output := result_u8_value_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l394_l335_DUPLICATE_e745 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l394_l335_DUPLICATE_e745_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8b52(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_1d9d_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l394_l335_DUPLICATE_e745_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l394_l335_DUPLICATE_e745_return_output;
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
