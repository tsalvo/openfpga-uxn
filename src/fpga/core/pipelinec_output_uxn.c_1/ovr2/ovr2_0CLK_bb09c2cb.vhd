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
-- BIN_OP_EQ[uxn_opcodes_h_l339_c6_254f]
signal BIN_OP_EQ_uxn_opcodes_h_l339_c6_254f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l339_c6_254f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l339_c6_254f_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l339_c2_04c3]
signal t16_low_MUX_uxn_opcodes_h_l339_c2_04c3_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l339_c2_04c3_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l339_c2_04c3]
signal n16_high_MUX_uxn_opcodes_h_l339_c2_04c3_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l339_c2_04c3_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l339_c2_04c3]
signal t16_high_MUX_uxn_opcodes_h_l339_c2_04c3_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l339_c2_04c3_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l339_c2_04c3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_04c3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_04c3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l339_c2_04c3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_04c3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_04c3_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l339_c2_04c3]
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_04c3_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_04c3_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l339_c2_04c3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_04c3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_04c3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l339_c2_04c3]
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_04c3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_04c3_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l339_c2_04c3]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_04c3_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_04c3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l339_c2_04c3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_04c3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_04c3_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l339_c2_04c3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_04c3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_04c3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l339_c2_04c3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_04c3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_04c3_return_output : unsigned(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l339_c2_04c3]
signal n16_low_MUX_uxn_opcodes_h_l339_c2_04c3_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l339_c2_04c3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l352_c11_b397]
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_b397_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_b397_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_b397_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l352_c7_d4ab]
signal t16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l352_c7_d4ab]
signal n16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l352_c7_d4ab]
signal t16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l352_c7_d4ab]
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d4ab_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l352_c7_d4ab]
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_d4ab_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l352_c7_d4ab]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d4ab_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l352_c7_d4ab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d4ab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l352_c7_d4ab]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d4ab_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output : unsigned(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l352_c7_d4ab]
signal n16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l355_c11_e9d9]
signal BIN_OP_EQ_uxn_opcodes_h_l355_c11_e9d9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l355_c11_e9d9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l355_c11_e9d9_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l355_c7_924e]
signal t16_low_MUX_uxn_opcodes_h_l355_c7_924e_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l355_c7_924e_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l355_c7_924e_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l355_c7_924e_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l355_c7_924e]
signal n16_high_MUX_uxn_opcodes_h_l355_c7_924e_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l355_c7_924e_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l355_c7_924e_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l355_c7_924e_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l355_c7_924e]
signal t16_high_MUX_uxn_opcodes_h_l355_c7_924e_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l355_c7_924e_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l355_c7_924e_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l355_c7_924e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l355_c7_924e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_924e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_924e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_924e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_924e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l355_c7_924e]
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_924e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_924e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_924e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_924e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l355_c7_924e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_924e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_924e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_924e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_924e_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l355_c7_924e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_924e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_924e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_924e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_924e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l355_c7_924e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_924e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_924e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_924e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_924e_return_output : unsigned(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l355_c7_924e]
signal n16_low_MUX_uxn_opcodes_h_l355_c7_924e_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l355_c7_924e_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l355_c7_924e_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l355_c7_924e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l359_c11_2e9d]
signal BIN_OP_EQ_uxn_opcodes_h_l359_c11_2e9d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l359_c11_2e9d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l359_c11_2e9d_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l359_c7_f815]
signal t16_low_MUX_uxn_opcodes_h_l359_c7_f815_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l359_c7_f815_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l359_c7_f815_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l359_c7_f815_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l359_c7_f815]
signal n16_high_MUX_uxn_opcodes_h_l359_c7_f815_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l359_c7_f815_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l359_c7_f815_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l359_c7_f815_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l359_c7_f815]
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_f815_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_f815_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_f815_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_f815_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l359_c7_f815]
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_f815_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_f815_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_f815_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_f815_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l359_c7_f815]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_f815_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_f815_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_f815_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_f815_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l359_c7_f815]
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_f815_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_f815_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_f815_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_f815_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l359_c7_f815]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_f815_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_f815_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_f815_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_f815_return_output : unsigned(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l359_c7_f815]
signal n16_low_MUX_uxn_opcodes_h_l359_c7_f815_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l359_c7_f815_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l359_c7_f815_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l359_c7_f815_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l363_c11_2965]
signal BIN_OP_EQ_uxn_opcodes_h_l363_c11_2965_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l363_c11_2965_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l363_c11_2965_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l363_c7_7c7a]
signal n16_high_MUX_uxn_opcodes_h_l363_c7_7c7a_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l363_c7_7c7a_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l363_c7_7c7a_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l363_c7_7c7a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l363_c7_7c7a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7c7a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7c7a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7c7a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7c7a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l363_c7_7c7a]
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_7c7a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_7c7a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_7c7a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_7c7a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l363_c7_7c7a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7c7a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7c7a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7c7a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7c7a_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l363_c7_7c7a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7c7a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7c7a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7c7a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7c7a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l363_c7_7c7a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7c7a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7c7a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7c7a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7c7a_return_output : unsigned(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l363_c7_7c7a]
signal n16_low_MUX_uxn_opcodes_h_l363_c7_7c7a_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l363_c7_7c7a_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l363_c7_7c7a_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l363_c7_7c7a_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l365_c30_2f37]
signal sp_relative_shift_uxn_opcodes_h_l365_c30_2f37_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l365_c30_2f37_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l365_c30_2f37_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l365_c30_2f37_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l370_c11_5aeb]
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_5aeb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_5aeb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_5aeb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l370_c7_71f3]
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_71f3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_71f3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_71f3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_71f3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l370_c7_71f3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_71f3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_71f3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_71f3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_71f3_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l370_c7_71f3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_71f3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_71f3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_71f3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_71f3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l370_c7_71f3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_71f3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_71f3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_71f3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_71f3_return_output : unsigned(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l370_c7_71f3]
signal n16_low_MUX_uxn_opcodes_h_l370_c7_71f3_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l370_c7_71f3_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l370_c7_71f3_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l370_c7_71f3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l376_c11_2ae2]
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_2ae2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_2ae2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_2ae2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l376_c7_74c9]
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_74c9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_74c9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_74c9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_74c9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l376_c7_74c9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_74c9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_74c9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_74c9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_74c9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l376_c7_74c9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_74c9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_74c9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_74c9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_74c9_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l380_c11_baff]
signal BIN_OP_EQ_uxn_opcodes_h_l380_c11_baff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l380_c11_baff_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l380_c11_baff_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l380_c7_27fa]
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_27fa_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_27fa_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_27fa_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_27fa_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l380_c7_27fa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_27fa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_27fa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_27fa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_27fa_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l380_c7_27fa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_27fa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_27fa_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_27fa_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_27fa_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l384_c11_0a62]
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_0a62_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_0a62_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_0a62_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l384_c7_7ca1]
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_7ca1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_7ca1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_7ca1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_7ca1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l384_c7_7ca1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_7ca1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_7ca1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_7ca1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_7ca1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l384_c7_7ca1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_7ca1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_7ca1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_7ca1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_7ca1_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l388_c11_b292]
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_b292_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_b292_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_b292_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l388_c7_7d42]
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_7d42_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_7d42_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_7d42_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_7d42_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l388_c7_7d42]
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_7d42_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_7d42_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_7d42_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_7d42_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l388_c7_7d42]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_7d42_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_7d42_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_7d42_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_7d42_return_output : unsigned(3 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea( ref_toks_0 : opcode_result_t;
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
      base.is_ram_write := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_opc_done := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l339_c6_254f
BIN_OP_EQ_uxn_opcodes_h_l339_c6_254f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l339_c6_254f_left,
BIN_OP_EQ_uxn_opcodes_h_l339_c6_254f_right,
BIN_OP_EQ_uxn_opcodes_h_l339_c6_254f_return_output);

-- t16_low_MUX_uxn_opcodes_h_l339_c2_04c3
t16_low_MUX_uxn_opcodes_h_l339_c2_04c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l339_c2_04c3_cond,
t16_low_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue,
t16_low_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse,
t16_low_MUX_uxn_opcodes_h_l339_c2_04c3_return_output);

-- n16_high_MUX_uxn_opcodes_h_l339_c2_04c3
n16_high_MUX_uxn_opcodes_h_l339_c2_04c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l339_c2_04c3_cond,
n16_high_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue,
n16_high_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse,
n16_high_MUX_uxn_opcodes_h_l339_c2_04c3_return_output);

-- t16_high_MUX_uxn_opcodes_h_l339_c2_04c3
t16_high_MUX_uxn_opcodes_h_l339_c2_04c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l339_c2_04c3_cond,
t16_high_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue,
t16_high_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse,
t16_high_MUX_uxn_opcodes_h_l339_c2_04c3_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_04c3
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_04c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_04c3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_04c3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_04c3
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_04c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_04c3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_04c3_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_04c3
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_04c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_04c3_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_04c3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_04c3
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_04c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_04c3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_04c3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l339_c2_04c3
result_u8_value_MUX_uxn_opcodes_h_l339_c2_04c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l339_c2_04c3_cond,
result_u8_value_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l339_c2_04c3_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_04c3
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_04c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_04c3_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_04c3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_04c3
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_04c3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_04c3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_04c3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_04c3
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_04c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_04c3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_04c3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_04c3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_04c3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_04c3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_04c3_return_output);

-- n16_low_MUX_uxn_opcodes_h_l339_c2_04c3
n16_low_MUX_uxn_opcodes_h_l339_c2_04c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l339_c2_04c3_cond,
n16_low_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue,
n16_low_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse,
n16_low_MUX_uxn_opcodes_h_l339_c2_04c3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l352_c11_b397
BIN_OP_EQ_uxn_opcodes_h_l352_c11_b397 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l352_c11_b397_left,
BIN_OP_EQ_uxn_opcodes_h_l352_c11_b397_right,
BIN_OP_EQ_uxn_opcodes_h_l352_c11_b397_return_output);

-- t16_low_MUX_uxn_opcodes_h_l352_c7_d4ab
t16_low_MUX_uxn_opcodes_h_l352_c7_d4ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_cond,
t16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue,
t16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse,
t16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output);

-- n16_high_MUX_uxn_opcodes_h_l352_c7_d4ab
n16_high_MUX_uxn_opcodes_h_l352_c7_d4ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_cond,
n16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue,
n16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse,
n16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output);

-- t16_high_MUX_uxn_opcodes_h_l352_c7_d4ab
t16_high_MUX_uxn_opcodes_h_l352_c7_d4ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_cond,
t16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue,
t16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse,
t16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d4ab
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d4ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d4ab_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l352_c7_d4ab
result_u8_value_MUX_uxn_opcodes_h_l352_c7_d4ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l352_c7_d4ab_cond,
result_u8_value_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d4ab
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d4ab : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d4ab_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d4ab
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d4ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d4ab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d4ab
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d4ab : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d4ab_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output);

-- n16_low_MUX_uxn_opcodes_h_l352_c7_d4ab
n16_low_MUX_uxn_opcodes_h_l352_c7_d4ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_cond,
n16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue,
n16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse,
n16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l355_c11_e9d9
BIN_OP_EQ_uxn_opcodes_h_l355_c11_e9d9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l355_c11_e9d9_left,
BIN_OP_EQ_uxn_opcodes_h_l355_c11_e9d9_right,
BIN_OP_EQ_uxn_opcodes_h_l355_c11_e9d9_return_output);

-- t16_low_MUX_uxn_opcodes_h_l355_c7_924e
t16_low_MUX_uxn_opcodes_h_l355_c7_924e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l355_c7_924e_cond,
t16_low_MUX_uxn_opcodes_h_l355_c7_924e_iftrue,
t16_low_MUX_uxn_opcodes_h_l355_c7_924e_iffalse,
t16_low_MUX_uxn_opcodes_h_l355_c7_924e_return_output);

-- n16_high_MUX_uxn_opcodes_h_l355_c7_924e
n16_high_MUX_uxn_opcodes_h_l355_c7_924e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l355_c7_924e_cond,
n16_high_MUX_uxn_opcodes_h_l355_c7_924e_iftrue,
n16_high_MUX_uxn_opcodes_h_l355_c7_924e_iffalse,
n16_high_MUX_uxn_opcodes_h_l355_c7_924e_return_output);

-- t16_high_MUX_uxn_opcodes_h_l355_c7_924e
t16_high_MUX_uxn_opcodes_h_l355_c7_924e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l355_c7_924e_cond,
t16_high_MUX_uxn_opcodes_h_l355_c7_924e_iftrue,
t16_high_MUX_uxn_opcodes_h_l355_c7_924e_iffalse,
t16_high_MUX_uxn_opcodes_h_l355_c7_924e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_924e
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_924e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_924e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_924e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_924e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_924e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l355_c7_924e
result_u8_value_MUX_uxn_opcodes_h_l355_c7_924e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l355_c7_924e_cond,
result_u8_value_MUX_uxn_opcodes_h_l355_c7_924e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l355_c7_924e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l355_c7_924e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_924e
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_924e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_924e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_924e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_924e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_924e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_924e
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_924e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_924e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_924e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_924e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_924e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_924e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_924e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_924e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_924e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_924e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_924e_return_output);

-- n16_low_MUX_uxn_opcodes_h_l355_c7_924e
n16_low_MUX_uxn_opcodes_h_l355_c7_924e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l355_c7_924e_cond,
n16_low_MUX_uxn_opcodes_h_l355_c7_924e_iftrue,
n16_low_MUX_uxn_opcodes_h_l355_c7_924e_iffalse,
n16_low_MUX_uxn_opcodes_h_l355_c7_924e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l359_c11_2e9d
BIN_OP_EQ_uxn_opcodes_h_l359_c11_2e9d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l359_c11_2e9d_left,
BIN_OP_EQ_uxn_opcodes_h_l359_c11_2e9d_right,
BIN_OP_EQ_uxn_opcodes_h_l359_c11_2e9d_return_output);

-- t16_low_MUX_uxn_opcodes_h_l359_c7_f815
t16_low_MUX_uxn_opcodes_h_l359_c7_f815 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l359_c7_f815_cond,
t16_low_MUX_uxn_opcodes_h_l359_c7_f815_iftrue,
t16_low_MUX_uxn_opcodes_h_l359_c7_f815_iffalse,
t16_low_MUX_uxn_opcodes_h_l359_c7_f815_return_output);

-- n16_high_MUX_uxn_opcodes_h_l359_c7_f815
n16_high_MUX_uxn_opcodes_h_l359_c7_f815 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l359_c7_f815_cond,
n16_high_MUX_uxn_opcodes_h_l359_c7_f815_iftrue,
n16_high_MUX_uxn_opcodes_h_l359_c7_f815_iffalse,
n16_high_MUX_uxn_opcodes_h_l359_c7_f815_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_f815
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_f815 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_f815_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_f815_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_f815_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_f815_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l359_c7_f815
result_u8_value_MUX_uxn_opcodes_h_l359_c7_f815 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l359_c7_f815_cond,
result_u8_value_MUX_uxn_opcodes_h_l359_c7_f815_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l359_c7_f815_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l359_c7_f815_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_f815
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_f815 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_f815_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_f815_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_f815_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_f815_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_f815
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_f815 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_f815_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_f815_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_f815_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_f815_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_f815
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_f815 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_f815_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_f815_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_f815_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_f815_return_output);

-- n16_low_MUX_uxn_opcodes_h_l359_c7_f815
n16_low_MUX_uxn_opcodes_h_l359_c7_f815 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l359_c7_f815_cond,
n16_low_MUX_uxn_opcodes_h_l359_c7_f815_iftrue,
n16_low_MUX_uxn_opcodes_h_l359_c7_f815_iffalse,
n16_low_MUX_uxn_opcodes_h_l359_c7_f815_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l363_c11_2965
BIN_OP_EQ_uxn_opcodes_h_l363_c11_2965 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l363_c11_2965_left,
BIN_OP_EQ_uxn_opcodes_h_l363_c11_2965_right,
BIN_OP_EQ_uxn_opcodes_h_l363_c11_2965_return_output);

-- n16_high_MUX_uxn_opcodes_h_l363_c7_7c7a
n16_high_MUX_uxn_opcodes_h_l363_c7_7c7a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l363_c7_7c7a_cond,
n16_high_MUX_uxn_opcodes_h_l363_c7_7c7a_iftrue,
n16_high_MUX_uxn_opcodes_h_l363_c7_7c7a_iffalse,
n16_high_MUX_uxn_opcodes_h_l363_c7_7c7a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7c7a
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7c7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7c7a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7c7a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7c7a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7c7a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l363_c7_7c7a
result_u8_value_MUX_uxn_opcodes_h_l363_c7_7c7a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l363_c7_7c7a_cond,
result_u8_value_MUX_uxn_opcodes_h_l363_c7_7c7a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l363_c7_7c7a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l363_c7_7c7a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7c7a
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7c7a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7c7a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7c7a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7c7a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7c7a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7c7a
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7c7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7c7a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7c7a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7c7a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7c7a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7c7a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7c7a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7c7a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7c7a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7c7a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7c7a_return_output);

-- n16_low_MUX_uxn_opcodes_h_l363_c7_7c7a
n16_low_MUX_uxn_opcodes_h_l363_c7_7c7a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l363_c7_7c7a_cond,
n16_low_MUX_uxn_opcodes_h_l363_c7_7c7a_iftrue,
n16_low_MUX_uxn_opcodes_h_l363_c7_7c7a_iffalse,
n16_low_MUX_uxn_opcodes_h_l363_c7_7c7a_return_output);

-- sp_relative_shift_uxn_opcodes_h_l365_c30_2f37
sp_relative_shift_uxn_opcodes_h_l365_c30_2f37 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l365_c30_2f37_ins,
sp_relative_shift_uxn_opcodes_h_l365_c30_2f37_x,
sp_relative_shift_uxn_opcodes_h_l365_c30_2f37_y,
sp_relative_shift_uxn_opcodes_h_l365_c30_2f37_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l370_c11_5aeb
BIN_OP_EQ_uxn_opcodes_h_l370_c11_5aeb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l370_c11_5aeb_left,
BIN_OP_EQ_uxn_opcodes_h_l370_c11_5aeb_right,
BIN_OP_EQ_uxn_opcodes_h_l370_c11_5aeb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l370_c7_71f3
result_u8_value_MUX_uxn_opcodes_h_l370_c7_71f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l370_c7_71f3_cond,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_71f3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_71f3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_71f3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_71f3
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_71f3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_71f3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_71f3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_71f3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_71f3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_71f3
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_71f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_71f3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_71f3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_71f3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_71f3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_71f3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_71f3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_71f3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_71f3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_71f3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_71f3_return_output);

-- n16_low_MUX_uxn_opcodes_h_l370_c7_71f3
n16_low_MUX_uxn_opcodes_h_l370_c7_71f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l370_c7_71f3_cond,
n16_low_MUX_uxn_opcodes_h_l370_c7_71f3_iftrue,
n16_low_MUX_uxn_opcodes_h_l370_c7_71f3_iffalse,
n16_low_MUX_uxn_opcodes_h_l370_c7_71f3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l376_c11_2ae2
BIN_OP_EQ_uxn_opcodes_h_l376_c11_2ae2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l376_c11_2ae2_left,
BIN_OP_EQ_uxn_opcodes_h_l376_c11_2ae2_right,
BIN_OP_EQ_uxn_opcodes_h_l376_c11_2ae2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l376_c7_74c9
result_u8_value_MUX_uxn_opcodes_h_l376_c7_74c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l376_c7_74c9_cond,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_74c9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_74c9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_74c9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_74c9
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_74c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_74c9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_74c9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_74c9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_74c9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_74c9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_74c9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_74c9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_74c9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_74c9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_74c9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l380_c11_baff
BIN_OP_EQ_uxn_opcodes_h_l380_c11_baff : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l380_c11_baff_left,
BIN_OP_EQ_uxn_opcodes_h_l380_c11_baff_right,
BIN_OP_EQ_uxn_opcodes_h_l380_c11_baff_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l380_c7_27fa
result_u8_value_MUX_uxn_opcodes_h_l380_c7_27fa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l380_c7_27fa_cond,
result_u8_value_MUX_uxn_opcodes_h_l380_c7_27fa_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l380_c7_27fa_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l380_c7_27fa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_27fa
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_27fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_27fa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_27fa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_27fa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_27fa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_27fa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_27fa : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_27fa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_27fa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_27fa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_27fa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l384_c11_0a62
BIN_OP_EQ_uxn_opcodes_h_l384_c11_0a62 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l384_c11_0a62_left,
BIN_OP_EQ_uxn_opcodes_h_l384_c11_0a62_right,
BIN_OP_EQ_uxn_opcodes_h_l384_c11_0a62_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l384_c7_7ca1
result_u8_value_MUX_uxn_opcodes_h_l384_c7_7ca1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l384_c7_7ca1_cond,
result_u8_value_MUX_uxn_opcodes_h_l384_c7_7ca1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l384_c7_7ca1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l384_c7_7ca1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_7ca1
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_7ca1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_7ca1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_7ca1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_7ca1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_7ca1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_7ca1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_7ca1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_7ca1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_7ca1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_7ca1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_7ca1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l388_c11_b292
BIN_OP_EQ_uxn_opcodes_h_l388_c11_b292 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l388_c11_b292_left,
BIN_OP_EQ_uxn_opcodes_h_l388_c11_b292_right,
BIN_OP_EQ_uxn_opcodes_h_l388_c11_b292_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l388_c7_7d42
result_u8_value_MUX_uxn_opcodes_h_l388_c7_7d42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l388_c7_7d42_cond,
result_u8_value_MUX_uxn_opcodes_h_l388_c7_7d42_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l388_c7_7d42_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l388_c7_7d42_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_7d42
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_7d42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_7d42_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_7d42_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_7d42_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_7d42_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_7d42
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_7d42 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_7d42_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_7d42_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_7d42_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_7d42_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l339_c6_254f_return_output,
 t16_low_MUX_uxn_opcodes_h_l339_c2_04c3_return_output,
 n16_high_MUX_uxn_opcodes_h_l339_c2_04c3_return_output,
 t16_high_MUX_uxn_opcodes_h_l339_c2_04c3_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_04c3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_04c3_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_04c3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_04c3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l339_c2_04c3_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_04c3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_04c3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_04c3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_04c3_return_output,
 n16_low_MUX_uxn_opcodes_h_l339_c2_04c3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l352_c11_b397_return_output,
 t16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output,
 n16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output,
 t16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output,
 n16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l355_c11_e9d9_return_output,
 t16_low_MUX_uxn_opcodes_h_l355_c7_924e_return_output,
 n16_high_MUX_uxn_opcodes_h_l355_c7_924e_return_output,
 t16_high_MUX_uxn_opcodes_h_l355_c7_924e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_924e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l355_c7_924e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_924e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_924e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_924e_return_output,
 n16_low_MUX_uxn_opcodes_h_l355_c7_924e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l359_c11_2e9d_return_output,
 t16_low_MUX_uxn_opcodes_h_l359_c7_f815_return_output,
 n16_high_MUX_uxn_opcodes_h_l359_c7_f815_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_f815_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l359_c7_f815_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_f815_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_f815_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_f815_return_output,
 n16_low_MUX_uxn_opcodes_h_l359_c7_f815_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l363_c11_2965_return_output,
 n16_high_MUX_uxn_opcodes_h_l363_c7_7c7a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7c7a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l363_c7_7c7a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7c7a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7c7a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7c7a_return_output,
 n16_low_MUX_uxn_opcodes_h_l363_c7_7c7a_return_output,
 sp_relative_shift_uxn_opcodes_h_l365_c30_2f37_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l370_c11_5aeb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l370_c7_71f3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_71f3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_71f3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_71f3_return_output,
 n16_low_MUX_uxn_opcodes_h_l370_c7_71f3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l376_c11_2ae2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l376_c7_74c9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_74c9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_74c9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l380_c11_baff_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l380_c7_27fa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_27fa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_27fa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l384_c11_0a62_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l384_c7_7ca1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_7ca1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_7ca1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l388_c11_b292_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l388_c7_7d42_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_7d42_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_7d42_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_254f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_254f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_254f_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_04c3_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_04c3_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_04c3_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_04c3_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_04c3_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_04c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l339_c2_04c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_04c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_04c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_04c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_04c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l339_c2_04c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_04c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_04c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l339_c2_04c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_04c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_04c3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_04c3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_04c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l339_c2_04c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_04c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_04c3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l344_c3_072f : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_04c3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_04c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_04c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_04c3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l349_c3_983d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_04c3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_04c3_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_04c3_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_04c3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_b397_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_b397_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_b397_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_924e_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_924e_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_924e_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_924e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d4ab_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_924e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_d4ab_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_924e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d4ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_924e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d4ab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l353_c3_5eaa : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_924e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d4ab_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_924e_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_e9d9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_e9d9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_e9d9_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_924e_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_924e_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_f815_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_924e_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_924e_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_924e_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_f815_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_924e_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_924e_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_924e_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_924e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_924e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_924e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_f815_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_924e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_924e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_924e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_f815_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_924e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_924e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_924e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_f815_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_924e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_924e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_924e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_f815_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_924e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_924e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_4f79 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_924e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_f815_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_924e_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_924e_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_924e_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_f815_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_924e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_2e9d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_2e9d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_2e9d_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_f815_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_f815_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_f815_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_f815_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_f815_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_7c7a_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_f815_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_f815_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_f815_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7c7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_f815_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_f815_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_f815_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_7c7a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_f815_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_f815_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_f815_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7c7a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_f815_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_f815_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_f815_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7c7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_f815_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_f815_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l361_c3_93f4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_f815_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7c7a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_f815_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_f815_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_f815_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_7c7a_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_f815_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_2965_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_2965_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_2965_return_output : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_7c7a_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_7c7a_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_7c7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7c7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7c7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7c7a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_7c7a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_7c7a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_71f3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_7c7a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7c7a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7c7a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_71f3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7c7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7c7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7c7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_71f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7c7a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7c7a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_5a24 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7c7a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_71f3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7c7a_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_7c7a_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_7c7a_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_71f3_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_7c7a_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_2f37_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_2f37_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_2f37_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_2f37_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_5aeb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_5aeb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_5aeb_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_71f3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_71f3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_74c9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_71f3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_71f3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l372_c3_f5a8 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_71f3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_71f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_71f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_71f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_74c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_71f3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_71f3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l373_c3_8073 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_71f3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_74c9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_71f3_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_71f3_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_71f3_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_71f3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_2ae2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_2ae2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_2ae2_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_74c9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_74c9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_27fa_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_74c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_74c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_74c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_27fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_74c9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_74c9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_2ae0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_74c9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_27fa_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_74c9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_baff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_baff_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_baff_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_27fa_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_27fa_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_7ca1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_27fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_27fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_27fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_7ca1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_27fa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_27fa_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_b2b5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_27fa_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_7ca1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_27fa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_0a62_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_0a62_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_0a62_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_7ca1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_7ca1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_7d42_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_7ca1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_7ca1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_7ca1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_7d42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_7ca1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_7ca1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_80aa : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_7ca1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_7d42_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_7ca1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_b292_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_b292_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_b292_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_7d42_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_7d42_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_7d42_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_7d42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_7d42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_7d42_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_7d42_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_97ef : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_7d42_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l388_c7_7d42_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_7d42_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l355_l339_l388_l359_l352_DUPLICATE_efb1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l363_l355_l359_l352_DUPLICATE_e74d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l370_l355_l359_l352_DUPLICATE_81f1_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l363_l355_l388_l384_l376_l380_l359_l352_DUPLICATE_b859_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l394_l335_DUPLICATE_55fc_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_b2b5 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_27fa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_b2b5;
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_2f37_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l349_c3_983d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l349_c3_983d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_254f_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_2ae0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_74c9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_2ae0;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7c7a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l373_c3_8073 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_71f3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l373_c3_8073;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l372_c3_f5a8 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_71f3_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l372_c3_f5a8;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l353_c3_5eaa := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l353_c3_5eaa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_0a62_right := to_unsigned(8, 4);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_80aa := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_7ca1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_80aa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_e9d9_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_b292_right := to_unsigned(9, 4);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l361_c3_93f4 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_f815_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l361_c3_93f4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_b397_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_97ef := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_7d42_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_97ef;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_7d42_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_2965_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_2ae2_right := to_unsigned(6, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_2f37_y := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_baff_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_5a24 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7c7a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_5a24;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l344_c3_072f := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l344_c3_072f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_2e9d_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_4f79 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_924e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_4f79;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_5aeb_right := to_unsigned(5, 3);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_2f37_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_924e_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_f815_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_7c7a_iffalse := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_27fa_iftrue := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_7d42_iftrue := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_924e_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_f815_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_7c7a_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_71f3_iffalse := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_74c9_iftrue := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_7ca1_iftrue := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_254f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_b397_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_e9d9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_2e9d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_2965_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_5aeb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_2ae2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_baff_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_0a62_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_b292_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_7c7a_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_71f3_iftrue := VAR_previous_stack_read;
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_924e_iftrue := VAR_previous_stack_read;
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_f815_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_71f3_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_924e_iffalse := t16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_7c7a_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_924e_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_f815_iffalse := t16_low;
     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l388_c7_7d42] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l388_c7_7d42_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l365_c30_2f37] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l365_c30_2f37_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_2f37_ins;
     sp_relative_shift_uxn_opcodes_h_l365_c30_2f37_x <= VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_2f37_x;
     sp_relative_shift_uxn_opcodes_h_l365_c30_2f37_y <= VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_2f37_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_2f37_return_output := sp_relative_shift_uxn_opcodes_h_l365_c30_2f37_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l339_c2_04c3] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l339_c2_04c3_return_output := result.is_ram_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l339_c2_04c3] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l339_c2_04c3_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l363_c11_2965] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l363_c11_2965_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_2965_left;
     BIN_OP_EQ_uxn_opcodes_h_l363_c11_2965_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_2965_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_2965_return_output := BIN_OP_EQ_uxn_opcodes_h_l363_c11_2965_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l363_l355_l359_l352_DUPLICATE_e74d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l363_l355_l359_l352_DUPLICATE_e74d_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l352_c11_b397] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l352_c11_b397_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_b397_left;
     BIN_OP_EQ_uxn_opcodes_h_l352_c11_b397_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_b397_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_b397_return_output := BIN_OP_EQ_uxn_opcodes_h_l352_c11_b397_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l339_c2_04c3] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l339_c2_04c3_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l339_c6_254f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l339_c6_254f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_254f_left;
     BIN_OP_EQ_uxn_opcodes_h_l339_c6_254f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_254f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_254f_return_output := BIN_OP_EQ_uxn_opcodes_h_l339_c6_254f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l388_c11_b292] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l388_c11_b292_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_b292_left;
     BIN_OP_EQ_uxn_opcodes_h_l388_c11_b292_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_b292_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_b292_return_output := BIN_OP_EQ_uxn_opcodes_h_l388_c11_b292_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l370_c11_5aeb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l370_c11_5aeb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_5aeb_left;
     BIN_OP_EQ_uxn_opcodes_h_l370_c11_5aeb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_5aeb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_5aeb_return_output := BIN_OP_EQ_uxn_opcodes_h_l370_c11_5aeb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l384_c11_0a62] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l384_c11_0a62_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_0a62_left;
     BIN_OP_EQ_uxn_opcodes_h_l384_c11_0a62_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_0a62_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_0a62_return_output := BIN_OP_EQ_uxn_opcodes_h_l384_c11_0a62_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l339_c2_04c3] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l339_c2_04c3_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l355_l339_l388_l359_l352_DUPLICATE_efb1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l355_l339_l388_l359_l352_DUPLICATE_efb1_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l355_c11_e9d9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l355_c11_e9d9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_e9d9_left;
     BIN_OP_EQ_uxn_opcodes_h_l355_c11_e9d9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_e9d9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_e9d9_return_output := BIN_OP_EQ_uxn_opcodes_h_l355_c11_e9d9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l376_c11_2ae2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l376_c11_2ae2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_2ae2_left;
     BIN_OP_EQ_uxn_opcodes_h_l376_c11_2ae2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_2ae2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_2ae2_return_output := BIN_OP_EQ_uxn_opcodes_h_l376_c11_2ae2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l363_l355_l388_l384_l376_l380_l359_l352_DUPLICATE_b859 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l363_l355_l388_l384_l376_l380_l359_l352_DUPLICATE_b859_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l359_c11_2e9d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l359_c11_2e9d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_2e9d_left;
     BIN_OP_EQ_uxn_opcodes_h_l359_c11_2e9d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_2e9d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_2e9d_return_output := BIN_OP_EQ_uxn_opcodes_h_l359_c11_2e9d_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l370_l355_l359_l352_DUPLICATE_81f1 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l370_l355_l359_l352_DUPLICATE_81f1_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l380_c11_baff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l380_c11_baff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_baff_left;
     BIN_OP_EQ_uxn_opcodes_h_l380_c11_baff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_baff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_baff_return_output := BIN_OP_EQ_uxn_opcodes_h_l380_c11_baff_return_output;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_04c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_254f_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_04c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_254f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_04c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_254f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_04c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_254f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_04c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_254f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_04c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_254f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_04c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_254f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_04c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_254f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_04c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_254f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_04c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_254f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_04c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_254f_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_04c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_254f_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_04c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_254f_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_b397_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_b397_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d4ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_b397_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d4ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_b397_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d4ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_b397_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d4ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_b397_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_d4ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_b397_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_b397_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_b397_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_924e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_e9d9_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_924e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_e9d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_924e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_e9d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_924e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_e9d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_924e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_e9d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_924e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_e9d9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_924e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_e9d9_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_924e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_e9d9_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_924e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_e9d9_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_f815_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_2e9d_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_f815_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_2e9d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_f815_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_2e9d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_f815_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_2e9d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_f815_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_2e9d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_f815_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_2e9d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_f815_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_2e9d_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_f815_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_2e9d_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_7c7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_2965_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_7c7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_2965_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7c7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_2965_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7c7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_2965_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7c7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_2965_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7c7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_2965_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_7c7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_2965_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_71f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_5aeb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_71f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_5aeb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_71f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_5aeb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_71f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_5aeb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_71f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_5aeb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_74c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_2ae2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_74c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_2ae2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_74c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_2ae2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_27fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_baff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_27fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_baff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_27fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_baff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_7ca1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_0a62_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_7ca1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_0a62_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_7ca1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_0a62_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_7d42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_b292_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_7d42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_b292_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_7d42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_b292_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l370_l355_l359_l352_DUPLICATE_81f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_924e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l370_l355_l359_l352_DUPLICATE_81f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_f815_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l370_l355_l359_l352_DUPLICATE_81f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_71f3_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l370_l355_l359_l352_DUPLICATE_81f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l363_l355_l388_l384_l376_l380_l359_l352_DUPLICATE_b859_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_924e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l363_l355_l388_l384_l376_l380_l359_l352_DUPLICATE_b859_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_f815_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l363_l355_l388_l384_l376_l380_l359_l352_DUPLICATE_b859_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7c7a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l363_l355_l388_l384_l376_l380_l359_l352_DUPLICATE_b859_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_71f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l363_l355_l388_l384_l376_l380_l359_l352_DUPLICATE_b859_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_74c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l363_l355_l388_l384_l376_l380_l359_l352_DUPLICATE_b859_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_27fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l363_l355_l388_l384_l376_l380_l359_l352_DUPLICATE_b859_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_7ca1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l363_l355_l388_l384_l376_l380_l359_l352_DUPLICATE_b859_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_7d42_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l370_l363_l355_l388_l384_l376_l380_l359_l352_DUPLICATE_b859_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l363_l355_l359_l352_DUPLICATE_e74d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_924e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l363_l355_l359_l352_DUPLICATE_e74d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_f815_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l363_l355_l359_l352_DUPLICATE_e74d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7c7a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l363_l355_l359_l352_DUPLICATE_e74d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l355_l339_l388_l359_l352_DUPLICATE_efb1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l355_l339_l388_l359_l352_DUPLICATE_efb1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_924e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l355_l339_l388_l359_l352_DUPLICATE_efb1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_f815_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l355_l339_l388_l359_l352_DUPLICATE_efb1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_7d42_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l355_l339_l388_l359_l352_DUPLICATE_efb1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l339_c2_04c3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l339_c2_04c3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l339_c2_04c3_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l339_c2_04c3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_7d42_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l388_c7_7d42_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7c7a_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_2f37_return_output;
     -- t16_low_MUX[uxn_opcodes_h_l359_c7_f815] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l359_c7_f815_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_f815_cond;
     t16_low_MUX_uxn_opcodes_h_l359_c7_f815_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_f815_iftrue;
     t16_low_MUX_uxn_opcodes_h_l359_c7_f815_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_f815_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_f815_return_output := t16_low_MUX_uxn_opcodes_h_l359_c7_f815_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l388_c7_7d42] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l388_c7_7d42_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_7d42_cond;
     result_u8_value_MUX_uxn_opcodes_h_l388_c7_7d42_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_7d42_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l388_c7_7d42_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_7d42_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_7d42_return_output := result_u8_value_MUX_uxn_opcodes_h_l388_c7_7d42_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l370_c7_71f3] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l370_c7_71f3_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_71f3_cond;
     n16_low_MUX_uxn_opcodes_h_l370_c7_71f3_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_71f3_iftrue;
     n16_low_MUX_uxn_opcodes_h_l370_c7_71f3_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_71f3_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_71f3_return_output := n16_low_MUX_uxn_opcodes_h_l370_c7_71f3_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l339_c2_04c3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_04c3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_04c3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_04c3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_04c3_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l339_c2_04c3] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_04c3_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_04c3_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_04c3_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_04c3_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l339_c2_04c3] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_04c3_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_04c3_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_04c3_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_04c3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l388_c7_7d42] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_7d42_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_7d42_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_7d42_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_7d42_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_7d42_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_7d42_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_7d42_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_7d42_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l363_c7_7c7a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7c7a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7c7a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7c7a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7c7a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7c7a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7c7a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7c7a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7c7a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l388_c7_7d42] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_7d42_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_7d42_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_7d42_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_7d42_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_7d42_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_7d42_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_7d42_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_7d42_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l370_c7_71f3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_71f3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_71f3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_71f3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_71f3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_71f3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_71f3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_71f3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_71f3_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l363_c7_7c7a] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l363_c7_7c7a_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_7c7a_cond;
     n16_high_MUX_uxn_opcodes_h_l363_c7_7c7a_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_7c7a_iftrue;
     n16_high_MUX_uxn_opcodes_h_l363_c7_7c7a_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_7c7a_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_7c7a_return_output := n16_high_MUX_uxn_opcodes_h_l363_c7_7c7a_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l355_c7_924e] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l355_c7_924e_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_924e_cond;
     t16_high_MUX_uxn_opcodes_h_l355_c7_924e_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_924e_iftrue;
     t16_high_MUX_uxn_opcodes_h_l355_c7_924e_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_924e_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_924e_return_output := t16_high_MUX_uxn_opcodes_h_l355_c7_924e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l339_c2_04c3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_04c3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_04c3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_04c3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_04c3_return_output;

     -- Submodule level 2
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_f815_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_7c7a_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_7c7a_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_71f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_7ca1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_7d42_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_f815_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_7c7a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7c7a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_71f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_7ca1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_7d42_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_7ca1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_7d42_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_924e_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_924e_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_f815_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l363_c7_7c7a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7c7a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7c7a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7c7a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7c7a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7c7a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7c7a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7c7a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7c7a_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l355_c7_924e] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l355_c7_924e_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_924e_cond;
     t16_low_MUX_uxn_opcodes_h_l355_c7_924e_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_924e_iftrue;
     t16_low_MUX_uxn_opcodes_h_l355_c7_924e_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_924e_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_924e_return_output := t16_low_MUX_uxn_opcodes_h_l355_c7_924e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l384_c7_7ca1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_7ca1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_7ca1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_7ca1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_7ca1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_7ca1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_7ca1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_7ca1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_7ca1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l384_c7_7ca1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_7ca1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_7ca1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_7ca1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_7ca1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_7ca1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_7ca1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_7ca1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_7ca1_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l352_c7_d4ab] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_cond;
     t16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue;
     t16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output := t16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l359_c7_f815] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_f815_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_f815_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_f815_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_f815_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_f815_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_f815_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_f815_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_f815_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l384_c7_7ca1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l384_c7_7ca1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_7ca1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l384_c7_7ca1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_7ca1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l384_c7_7ca1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_7ca1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_7ca1_return_output := result_u8_value_MUX_uxn_opcodes_h_l384_c7_7ca1_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l359_c7_f815] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l359_c7_f815_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_f815_cond;
     n16_high_MUX_uxn_opcodes_h_l359_c7_f815_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_f815_iftrue;
     n16_high_MUX_uxn_opcodes_h_l359_c7_f815_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_f815_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_f815_return_output := n16_high_MUX_uxn_opcodes_h_l359_c7_f815_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l363_c7_7c7a] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l363_c7_7c7a_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_7c7a_cond;
     n16_low_MUX_uxn_opcodes_h_l363_c7_7c7a_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_7c7a_iftrue;
     n16_low_MUX_uxn_opcodes_h_l363_c7_7c7a_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_7c7a_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_7c7a_return_output := n16_low_MUX_uxn_opcodes_h_l363_c7_7c7a_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_924e_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_f815_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_f815_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_7c7a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_27fa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_7ca1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_924e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_f815_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_f815_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_7c7a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_27fa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_7ca1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_27fa_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_7ca1_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_924e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l355_c7_924e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_924e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_924e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_924e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_924e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_924e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_924e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_924e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_924e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l380_c7_27fa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_27fa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_27fa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_27fa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_27fa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_27fa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_27fa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_27fa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_27fa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l359_c7_f815] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_f815_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_f815_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_f815_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_f815_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_f815_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_f815_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_f815_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_f815_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l359_c7_f815] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l359_c7_f815_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_f815_cond;
     n16_low_MUX_uxn_opcodes_h_l359_c7_f815_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_f815_iftrue;
     n16_low_MUX_uxn_opcodes_h_l359_c7_f815_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_f815_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_f815_return_output := n16_low_MUX_uxn_opcodes_h_l359_c7_f815_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l355_c7_924e] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l355_c7_924e_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_924e_cond;
     n16_high_MUX_uxn_opcodes_h_l355_c7_924e_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_924e_iftrue;
     n16_high_MUX_uxn_opcodes_h_l355_c7_924e_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_924e_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_924e_return_output := n16_high_MUX_uxn_opcodes_h_l355_c7_924e_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l352_c7_d4ab] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_cond;
     t16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue;
     t16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output := t16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l380_c7_27fa] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l380_c7_27fa_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_27fa_cond;
     result_u8_value_MUX_uxn_opcodes_h_l380_c7_27fa_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_27fa_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l380_c7_27fa_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_27fa_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_27fa_return_output := result_u8_value_MUX_uxn_opcodes_h_l380_c7_27fa_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l339_c2_04c3] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l339_c2_04c3_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_04c3_cond;
     t16_high_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue;
     t16_high_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_04c3_return_output := t16_high_MUX_uxn_opcodes_h_l339_c2_04c3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l380_c7_27fa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_27fa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_27fa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_27fa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_27fa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_27fa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_27fa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_27fa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_27fa_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_924e_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_924e_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_f815_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_74c9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_27fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_924e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_924e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_f815_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_74c9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_27fa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_74c9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_27fa_return_output;
     REG_VAR_t16_high := VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_04c3_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l352_c7_d4ab] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d4ab_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d4ab_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l376_c7_74c9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_74c9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_74c9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_74c9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_74c9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_74c9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_74c9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_74c9_return_output := result_u8_value_MUX_uxn_opcodes_h_l376_c7_74c9_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l352_c7_d4ab] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_cond;
     n16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue;
     n16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output := n16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l376_c7_74c9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_74c9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_74c9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_74c9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_74c9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_74c9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_74c9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_74c9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_74c9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l355_c7_924e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_924e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_924e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_924e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_924e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_924e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_924e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_924e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_924e_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l355_c7_924e] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l355_c7_924e_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_924e_cond;
     n16_low_MUX_uxn_opcodes_h_l355_c7_924e_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_924e_iftrue;
     n16_low_MUX_uxn_opcodes_h_l355_c7_924e_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_924e_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_924e_return_output := n16_low_MUX_uxn_opcodes_h_l355_c7_924e_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l339_c2_04c3] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l339_c2_04c3_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_04c3_cond;
     t16_low_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue;
     t16_low_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_04c3_return_output := t16_low_MUX_uxn_opcodes_h_l339_c2_04c3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l376_c7_74c9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_74c9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_74c9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_74c9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_74c9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_74c9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_74c9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_74c9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_74c9_return_output;

     -- Submodule level 5
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_924e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_71f3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_74c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_924e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_71f3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_74c9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_71f3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_74c9_return_output;
     REG_VAR_t16_low := VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_04c3_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l370_c7_71f3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_71f3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_71f3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_71f3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_71f3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_71f3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_71f3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_71f3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_71f3_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l339_c2_04c3] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l339_c2_04c3_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_04c3_cond;
     n16_high_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue;
     n16_high_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_04c3_return_output := n16_high_MUX_uxn_opcodes_h_l339_c2_04c3_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l352_c7_d4ab] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_cond;
     n16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue;
     n16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output := n16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l370_c7_71f3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_71f3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_71f3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_71f3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_71f3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_71f3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_71f3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_71f3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_71f3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l339_c2_04c3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_04c3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_04c3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_04c3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_04c3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l370_c7_71f3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_71f3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_71f3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_71f3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_71f3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_71f3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_71f3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_71f3_return_output := result_u8_value_MUX_uxn_opcodes_h_l370_c7_71f3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l352_c7_d4ab] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d4ab_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d4ab_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output;

     -- Submodule level 6
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_04c3_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7c7a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_71f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7c7a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_71f3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_7c7a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_71f3_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l339_c2_04c3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_04c3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_04c3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_04c3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_04c3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l363_c7_7c7a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7c7a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7c7a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7c7a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7c7a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7c7a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7c7a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7c7a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7c7a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l363_c7_7c7a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7c7a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7c7a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7c7a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7c7a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7c7a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7c7a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7c7a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7c7a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l363_c7_7c7a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l363_c7_7c7a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_7c7a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l363_c7_7c7a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_7c7a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l363_c7_7c7a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_7c7a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_7c7a_return_output := result_u8_value_MUX_uxn_opcodes_h_l363_c7_7c7a_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l339_c2_04c3] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l339_c2_04c3_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_04c3_cond;
     n16_low_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue;
     n16_low_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_04c3_return_output := n16_low_MUX_uxn_opcodes_h_l339_c2_04c3_return_output;

     -- Submodule level 7
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_04c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_f815_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_7c7a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_f815_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_7c7a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_f815_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_7c7a_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l359_c7_f815] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l359_c7_f815_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_f815_cond;
     result_u8_value_MUX_uxn_opcodes_h_l359_c7_f815_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_f815_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l359_c7_f815_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_f815_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_f815_return_output := result_u8_value_MUX_uxn_opcodes_h_l359_c7_f815_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l359_c7_f815] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_f815_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_f815_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_f815_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_f815_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_f815_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_f815_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_f815_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_f815_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l359_c7_f815] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_f815_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_f815_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_f815_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_f815_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_f815_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_f815_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_f815_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_f815_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_924e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_f815_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_924e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_f815_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_924e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_f815_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l355_c7_924e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_924e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_924e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_924e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_924e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_924e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_924e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_924e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_924e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l355_c7_924e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l355_c7_924e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_924e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l355_c7_924e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_924e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l355_c7_924e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_924e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_924e_return_output := result_u8_value_MUX_uxn_opcodes_h_l355_c7_924e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l355_c7_924e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_924e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_924e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_924e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_924e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_924e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_924e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_924e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_924e_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_924e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_924e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_924e_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l352_c7_d4ab] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l352_c7_d4ab_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_d4ab_cond;
     result_u8_value_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output := result_u8_value_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l352_c7_d4ab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d4ab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d4ab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l352_c7_d4ab] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d4ab_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d4ab_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d4ab_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d4ab_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_d4ab_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l339_c2_04c3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_04c3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_04c3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_04c3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_04c3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l339_c2_04c3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l339_c2_04c3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_04c3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_04c3_return_output := result_u8_value_MUX_uxn_opcodes_h_l339_c2_04c3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l339_c2_04c3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_04c3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_04c3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_04c3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_04c3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_04c3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_04c3_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l394_l335_DUPLICATE_55fc LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l394_l335_DUPLICATE_55fc_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_04c3_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_04c3_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_04c3_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_04c3_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_04c3_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_04c3_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_04c3_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_04c3_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_04c3_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l394_l335_DUPLICATE_55fc_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l394_l335_DUPLICATE_55fc_return_output;
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
