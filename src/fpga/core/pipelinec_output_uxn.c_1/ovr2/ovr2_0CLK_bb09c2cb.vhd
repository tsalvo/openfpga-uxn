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
-- BIN_OP_EQ[uxn_opcodes_h_l339_c6_2f8b]
signal BIN_OP_EQ_uxn_opcodes_h_l339_c6_2f8b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l339_c6_2f8b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l339_c6_2f8b_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l339_c2_8226]
signal t16_low_MUX_uxn_opcodes_h_l339_c2_8226_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l339_c2_8226_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l339_c2_8226_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l339_c2_8226_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l339_c2_8226]
signal n16_high_MUX_uxn_opcodes_h_l339_c2_8226_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l339_c2_8226_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l339_c2_8226_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l339_c2_8226_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l339_c2_8226]
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8226_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8226_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8226_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8226_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l339_c2_8226]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8226_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8226_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8226_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8226_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l339_c2_8226]
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8226_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8226_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8226_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8226_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l339_c2_8226]
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_8226_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_8226_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_8226_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_8226_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l339_c2_8226]
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8226_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8226_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8226_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8226_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l339_c2_8226]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8226_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8226_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8226_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8226_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l339_c2_8226]
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8226_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8226_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8226_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8226_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l339_c2_8226]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8226_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8226_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8226_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8226_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l339_c2_8226]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8226_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8226_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8226_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8226_return_output : signed(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l339_c2_8226]
signal n16_low_MUX_uxn_opcodes_h_l339_c2_8226_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l339_c2_8226_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l339_c2_8226_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l339_c2_8226_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l339_c2_8226]
signal t16_high_MUX_uxn_opcodes_h_l339_c2_8226_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l339_c2_8226_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l339_c2_8226_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l339_c2_8226_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l352_c11_daeb]
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_daeb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_daeb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_daeb_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l352_c7_fdfb]
signal t16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l352_c7_fdfb]
signal n16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l352_c7_fdfb]
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_fdfb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l352_c7_fdfb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fdfb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l352_c7_fdfb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fdfb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l352_c7_fdfb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fdfb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l352_c7_fdfb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fdfb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output : signed(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l352_c7_fdfb]
signal n16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l352_c7_fdfb]
signal t16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l355_c11_b284]
signal BIN_OP_EQ_uxn_opcodes_h_l355_c11_b284_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l355_c11_b284_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l355_c11_b284_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l355_c7_faff]
signal t16_low_MUX_uxn_opcodes_h_l355_c7_faff_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l355_c7_faff_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l355_c7_faff_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l355_c7_faff_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l355_c7_faff]
signal n16_high_MUX_uxn_opcodes_h_l355_c7_faff_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l355_c7_faff_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l355_c7_faff_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l355_c7_faff_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l355_c7_faff]
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_faff_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_faff_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_faff_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_faff_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l355_c7_faff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_faff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_faff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_faff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_faff_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l355_c7_faff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_faff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_faff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_faff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_faff_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l355_c7_faff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_faff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_faff_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_faff_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_faff_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l355_c7_faff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_faff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_faff_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_faff_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_faff_return_output : signed(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l355_c7_faff]
signal n16_low_MUX_uxn_opcodes_h_l355_c7_faff_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l355_c7_faff_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l355_c7_faff_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l355_c7_faff_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l355_c7_faff]
signal t16_high_MUX_uxn_opcodes_h_l355_c7_faff_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l355_c7_faff_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l355_c7_faff_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l355_c7_faff_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l359_c11_4a24]
signal BIN_OP_EQ_uxn_opcodes_h_l359_c11_4a24_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l359_c11_4a24_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l359_c11_4a24_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l359_c7_3c27]
signal t16_low_MUX_uxn_opcodes_h_l359_c7_3c27_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l359_c7_3c27_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l359_c7_3c27_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l359_c7_3c27_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l359_c7_3c27]
signal n16_high_MUX_uxn_opcodes_h_l359_c7_3c27_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l359_c7_3c27_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l359_c7_3c27_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l359_c7_3c27_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l359_c7_3c27]
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_3c27_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_3c27_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_3c27_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_3c27_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l359_c7_3c27]
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3c27_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3c27_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3c27_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3c27_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l359_c7_3c27]
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3c27_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3c27_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3c27_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3c27_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l359_c7_3c27]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3c27_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3c27_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3c27_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3c27_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l359_c7_3c27]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3c27_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3c27_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3c27_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3c27_return_output : signed(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l359_c7_3c27]
signal n16_low_MUX_uxn_opcodes_h_l359_c7_3c27_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l359_c7_3c27_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l359_c7_3c27_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l359_c7_3c27_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l363_c11_5513]
signal BIN_OP_EQ_uxn_opcodes_h_l363_c11_5513_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l363_c11_5513_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l363_c11_5513_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l363_c7_e1e8]
signal n16_high_MUX_uxn_opcodes_h_l363_c7_e1e8_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l363_c7_e1e8_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l363_c7_e1e8_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l363_c7_e1e8_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l363_c7_e1e8]
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_e1e8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_e1e8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_e1e8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_e1e8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l363_c7_e1e8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_e1e8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_e1e8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_e1e8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_e1e8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l363_c7_e1e8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_e1e8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_e1e8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_e1e8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_e1e8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l363_c7_e1e8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_e1e8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_e1e8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_e1e8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_e1e8_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l363_c7_e1e8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_e1e8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_e1e8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_e1e8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_e1e8_return_output : signed(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l363_c7_e1e8]
signal n16_low_MUX_uxn_opcodes_h_l363_c7_e1e8_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l363_c7_e1e8_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l363_c7_e1e8_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l363_c7_e1e8_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l365_c30_c005]
signal sp_relative_shift_uxn_opcodes_h_l365_c30_c005_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l365_c30_c005_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l365_c30_c005_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l365_c30_c005_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l370_c11_9094]
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_9094_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_9094_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_9094_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l370_c7_c839]
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_c839_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_c839_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_c839_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_c839_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l370_c7_c839]
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_c839_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_c839_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_c839_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_c839_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l370_c7_c839]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_c839_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_c839_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_c839_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_c839_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l370_c7_c839]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_c839_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_c839_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_c839_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_c839_return_output : signed(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l370_c7_c839]
signal n16_low_MUX_uxn_opcodes_h_l370_c7_c839_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l370_c7_c839_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l370_c7_c839_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l370_c7_c839_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l376_c11_017a]
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_017a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_017a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_017a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l376_c7_59d7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_59d7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_59d7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_59d7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_59d7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l376_c7_59d7]
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_59d7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_59d7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_59d7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_59d7_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l376_c7_59d7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_59d7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_59d7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_59d7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_59d7_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l380_c11_7df5]
signal BIN_OP_EQ_uxn_opcodes_h_l380_c11_7df5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l380_c11_7df5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l380_c11_7df5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l380_c7_2018]
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_2018_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_2018_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_2018_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_2018_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l380_c7_2018]
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_2018_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_2018_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_2018_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_2018_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l380_c7_2018]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_2018_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_2018_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_2018_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_2018_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l384_c11_872a]
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_872a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_872a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_872a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l384_c7_c012]
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c012_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c012_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c012_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c012_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l384_c7_c012]
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_c012_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_c012_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_c012_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_c012_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l384_c7_c012]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c012_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c012_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c012_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c012_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l388_c11_2c16]
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_2c16_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_2c16_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_2c16_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l388_c7_ca05]
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_ca05_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_ca05_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_ca05_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_ca05_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l388_c7_ca05]
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_ca05_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_ca05_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_ca05_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_ca05_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l388_c7_ca05]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_ca05_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_ca05_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_ca05_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_ca05_return_output : unsigned(3 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_375c( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_vram_write := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;
      base.sp_relative_shift := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l339_c6_2f8b
BIN_OP_EQ_uxn_opcodes_h_l339_c6_2f8b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l339_c6_2f8b_left,
BIN_OP_EQ_uxn_opcodes_h_l339_c6_2f8b_right,
BIN_OP_EQ_uxn_opcodes_h_l339_c6_2f8b_return_output);

-- t16_low_MUX_uxn_opcodes_h_l339_c2_8226
t16_low_MUX_uxn_opcodes_h_l339_c2_8226 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l339_c2_8226_cond,
t16_low_MUX_uxn_opcodes_h_l339_c2_8226_iftrue,
t16_low_MUX_uxn_opcodes_h_l339_c2_8226_iffalse,
t16_low_MUX_uxn_opcodes_h_l339_c2_8226_return_output);

-- n16_high_MUX_uxn_opcodes_h_l339_c2_8226
n16_high_MUX_uxn_opcodes_h_l339_c2_8226 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l339_c2_8226_cond,
n16_high_MUX_uxn_opcodes_h_l339_c2_8226_iftrue,
n16_high_MUX_uxn_opcodes_h_l339_c2_8226_iffalse,
n16_high_MUX_uxn_opcodes_h_l339_c2_8226_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8226
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8226 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8226_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8226_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8226_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8226_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8226
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8226 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8226_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8226_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8226_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8226_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8226
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8226 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8226_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8226_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8226_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8226_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l339_c2_8226
result_u8_value_MUX_uxn_opcodes_h_l339_c2_8226 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l339_c2_8226_cond,
result_u8_value_MUX_uxn_opcodes_h_l339_c2_8226_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l339_c2_8226_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l339_c2_8226_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8226
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8226 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8226_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8226_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8226_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8226_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8226
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8226 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8226_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8226_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8226_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8226_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8226
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8226 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8226_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8226_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8226_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8226_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8226
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8226 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8226_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8226_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8226_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8226_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8226
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8226 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8226_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8226_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8226_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8226_return_output);

-- n16_low_MUX_uxn_opcodes_h_l339_c2_8226
n16_low_MUX_uxn_opcodes_h_l339_c2_8226 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l339_c2_8226_cond,
n16_low_MUX_uxn_opcodes_h_l339_c2_8226_iftrue,
n16_low_MUX_uxn_opcodes_h_l339_c2_8226_iffalse,
n16_low_MUX_uxn_opcodes_h_l339_c2_8226_return_output);

-- t16_high_MUX_uxn_opcodes_h_l339_c2_8226
t16_high_MUX_uxn_opcodes_h_l339_c2_8226 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l339_c2_8226_cond,
t16_high_MUX_uxn_opcodes_h_l339_c2_8226_iftrue,
t16_high_MUX_uxn_opcodes_h_l339_c2_8226_iffalse,
t16_high_MUX_uxn_opcodes_h_l339_c2_8226_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l352_c11_daeb
BIN_OP_EQ_uxn_opcodes_h_l352_c11_daeb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l352_c11_daeb_left,
BIN_OP_EQ_uxn_opcodes_h_l352_c11_daeb_right,
BIN_OP_EQ_uxn_opcodes_h_l352_c11_daeb_return_output);

-- t16_low_MUX_uxn_opcodes_h_l352_c7_fdfb
t16_low_MUX_uxn_opcodes_h_l352_c7_fdfb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_cond,
t16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue,
t16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse,
t16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output);

-- n16_high_MUX_uxn_opcodes_h_l352_c7_fdfb
n16_high_MUX_uxn_opcodes_h_l352_c7_fdfb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_cond,
n16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue,
n16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse,
n16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l352_c7_fdfb
result_u8_value_MUX_uxn_opcodes_h_l352_c7_fdfb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l352_c7_fdfb_cond,
result_u8_value_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fdfb
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fdfb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fdfb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fdfb
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fdfb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fdfb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fdfb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fdfb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fdfb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fdfb
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fdfb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fdfb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output);

-- n16_low_MUX_uxn_opcodes_h_l352_c7_fdfb
n16_low_MUX_uxn_opcodes_h_l352_c7_fdfb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_cond,
n16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue,
n16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse,
n16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output);

-- t16_high_MUX_uxn_opcodes_h_l352_c7_fdfb
t16_high_MUX_uxn_opcodes_h_l352_c7_fdfb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_cond,
t16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue,
t16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse,
t16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l355_c11_b284
BIN_OP_EQ_uxn_opcodes_h_l355_c11_b284 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l355_c11_b284_left,
BIN_OP_EQ_uxn_opcodes_h_l355_c11_b284_right,
BIN_OP_EQ_uxn_opcodes_h_l355_c11_b284_return_output);

-- t16_low_MUX_uxn_opcodes_h_l355_c7_faff
t16_low_MUX_uxn_opcodes_h_l355_c7_faff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l355_c7_faff_cond,
t16_low_MUX_uxn_opcodes_h_l355_c7_faff_iftrue,
t16_low_MUX_uxn_opcodes_h_l355_c7_faff_iffalse,
t16_low_MUX_uxn_opcodes_h_l355_c7_faff_return_output);

-- n16_high_MUX_uxn_opcodes_h_l355_c7_faff
n16_high_MUX_uxn_opcodes_h_l355_c7_faff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l355_c7_faff_cond,
n16_high_MUX_uxn_opcodes_h_l355_c7_faff_iftrue,
n16_high_MUX_uxn_opcodes_h_l355_c7_faff_iffalse,
n16_high_MUX_uxn_opcodes_h_l355_c7_faff_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l355_c7_faff
result_u8_value_MUX_uxn_opcodes_h_l355_c7_faff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l355_c7_faff_cond,
result_u8_value_MUX_uxn_opcodes_h_l355_c7_faff_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l355_c7_faff_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l355_c7_faff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_faff
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_faff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_faff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_faff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_faff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_faff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_faff
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_faff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_faff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_faff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_faff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_faff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_faff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_faff : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_faff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_faff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_faff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_faff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_faff
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_faff : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_faff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_faff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_faff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_faff_return_output);

-- n16_low_MUX_uxn_opcodes_h_l355_c7_faff
n16_low_MUX_uxn_opcodes_h_l355_c7_faff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l355_c7_faff_cond,
n16_low_MUX_uxn_opcodes_h_l355_c7_faff_iftrue,
n16_low_MUX_uxn_opcodes_h_l355_c7_faff_iffalse,
n16_low_MUX_uxn_opcodes_h_l355_c7_faff_return_output);

-- t16_high_MUX_uxn_opcodes_h_l355_c7_faff
t16_high_MUX_uxn_opcodes_h_l355_c7_faff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l355_c7_faff_cond,
t16_high_MUX_uxn_opcodes_h_l355_c7_faff_iftrue,
t16_high_MUX_uxn_opcodes_h_l355_c7_faff_iffalse,
t16_high_MUX_uxn_opcodes_h_l355_c7_faff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l359_c11_4a24
BIN_OP_EQ_uxn_opcodes_h_l359_c11_4a24 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l359_c11_4a24_left,
BIN_OP_EQ_uxn_opcodes_h_l359_c11_4a24_right,
BIN_OP_EQ_uxn_opcodes_h_l359_c11_4a24_return_output);

-- t16_low_MUX_uxn_opcodes_h_l359_c7_3c27
t16_low_MUX_uxn_opcodes_h_l359_c7_3c27 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l359_c7_3c27_cond,
t16_low_MUX_uxn_opcodes_h_l359_c7_3c27_iftrue,
t16_low_MUX_uxn_opcodes_h_l359_c7_3c27_iffalse,
t16_low_MUX_uxn_opcodes_h_l359_c7_3c27_return_output);

-- n16_high_MUX_uxn_opcodes_h_l359_c7_3c27
n16_high_MUX_uxn_opcodes_h_l359_c7_3c27 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l359_c7_3c27_cond,
n16_high_MUX_uxn_opcodes_h_l359_c7_3c27_iftrue,
n16_high_MUX_uxn_opcodes_h_l359_c7_3c27_iffalse,
n16_high_MUX_uxn_opcodes_h_l359_c7_3c27_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l359_c7_3c27
result_u8_value_MUX_uxn_opcodes_h_l359_c7_3c27 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l359_c7_3c27_cond,
result_u8_value_MUX_uxn_opcodes_h_l359_c7_3c27_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l359_c7_3c27_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l359_c7_3c27_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3c27
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3c27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3c27_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3c27_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3c27_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3c27_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3c27
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3c27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3c27_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3c27_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3c27_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3c27_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3c27
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3c27 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3c27_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3c27_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3c27_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3c27_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3c27
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3c27 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3c27_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3c27_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3c27_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3c27_return_output);

-- n16_low_MUX_uxn_opcodes_h_l359_c7_3c27
n16_low_MUX_uxn_opcodes_h_l359_c7_3c27 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l359_c7_3c27_cond,
n16_low_MUX_uxn_opcodes_h_l359_c7_3c27_iftrue,
n16_low_MUX_uxn_opcodes_h_l359_c7_3c27_iffalse,
n16_low_MUX_uxn_opcodes_h_l359_c7_3c27_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l363_c11_5513
BIN_OP_EQ_uxn_opcodes_h_l363_c11_5513 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l363_c11_5513_left,
BIN_OP_EQ_uxn_opcodes_h_l363_c11_5513_right,
BIN_OP_EQ_uxn_opcodes_h_l363_c11_5513_return_output);

-- n16_high_MUX_uxn_opcodes_h_l363_c7_e1e8
n16_high_MUX_uxn_opcodes_h_l363_c7_e1e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l363_c7_e1e8_cond,
n16_high_MUX_uxn_opcodes_h_l363_c7_e1e8_iftrue,
n16_high_MUX_uxn_opcodes_h_l363_c7_e1e8_iffalse,
n16_high_MUX_uxn_opcodes_h_l363_c7_e1e8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l363_c7_e1e8
result_u8_value_MUX_uxn_opcodes_h_l363_c7_e1e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l363_c7_e1e8_cond,
result_u8_value_MUX_uxn_opcodes_h_l363_c7_e1e8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l363_c7_e1e8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l363_c7_e1e8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_e1e8
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_e1e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_e1e8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_e1e8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_e1e8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_e1e8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_e1e8
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_e1e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_e1e8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_e1e8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_e1e8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_e1e8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_e1e8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_e1e8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_e1e8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_e1e8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_e1e8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_e1e8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_e1e8
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_e1e8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_e1e8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_e1e8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_e1e8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_e1e8_return_output);

-- n16_low_MUX_uxn_opcodes_h_l363_c7_e1e8
n16_low_MUX_uxn_opcodes_h_l363_c7_e1e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l363_c7_e1e8_cond,
n16_low_MUX_uxn_opcodes_h_l363_c7_e1e8_iftrue,
n16_low_MUX_uxn_opcodes_h_l363_c7_e1e8_iffalse,
n16_low_MUX_uxn_opcodes_h_l363_c7_e1e8_return_output);

-- sp_relative_shift_uxn_opcodes_h_l365_c30_c005
sp_relative_shift_uxn_opcodes_h_l365_c30_c005 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l365_c30_c005_ins,
sp_relative_shift_uxn_opcodes_h_l365_c30_c005_x,
sp_relative_shift_uxn_opcodes_h_l365_c30_c005_y,
sp_relative_shift_uxn_opcodes_h_l365_c30_c005_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l370_c11_9094
BIN_OP_EQ_uxn_opcodes_h_l370_c11_9094 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l370_c11_9094_left,
BIN_OP_EQ_uxn_opcodes_h_l370_c11_9094_right,
BIN_OP_EQ_uxn_opcodes_h_l370_c11_9094_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_c839
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_c839 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_c839_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_c839_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_c839_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_c839_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l370_c7_c839
result_u8_value_MUX_uxn_opcodes_h_l370_c7_c839 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l370_c7_c839_cond,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_c839_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_c839_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_c839_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_c839
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_c839 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_c839_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_c839_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_c839_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_c839_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_c839
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_c839 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_c839_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_c839_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_c839_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_c839_return_output);

-- n16_low_MUX_uxn_opcodes_h_l370_c7_c839
n16_low_MUX_uxn_opcodes_h_l370_c7_c839 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l370_c7_c839_cond,
n16_low_MUX_uxn_opcodes_h_l370_c7_c839_iftrue,
n16_low_MUX_uxn_opcodes_h_l370_c7_c839_iffalse,
n16_low_MUX_uxn_opcodes_h_l370_c7_c839_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l376_c11_017a
BIN_OP_EQ_uxn_opcodes_h_l376_c11_017a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l376_c11_017a_left,
BIN_OP_EQ_uxn_opcodes_h_l376_c11_017a_right,
BIN_OP_EQ_uxn_opcodes_h_l376_c11_017a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_59d7
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_59d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_59d7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_59d7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_59d7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_59d7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l376_c7_59d7
result_u8_value_MUX_uxn_opcodes_h_l376_c7_59d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l376_c7_59d7_cond,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_59d7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_59d7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_59d7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_59d7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_59d7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_59d7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_59d7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_59d7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_59d7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l380_c11_7df5
BIN_OP_EQ_uxn_opcodes_h_l380_c11_7df5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l380_c11_7df5_left,
BIN_OP_EQ_uxn_opcodes_h_l380_c11_7df5_right,
BIN_OP_EQ_uxn_opcodes_h_l380_c11_7df5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_2018
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_2018 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_2018_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_2018_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_2018_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_2018_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l380_c7_2018
result_u8_value_MUX_uxn_opcodes_h_l380_c7_2018 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l380_c7_2018_cond,
result_u8_value_MUX_uxn_opcodes_h_l380_c7_2018_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l380_c7_2018_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l380_c7_2018_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_2018
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_2018 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_2018_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_2018_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_2018_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_2018_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l384_c11_872a
BIN_OP_EQ_uxn_opcodes_h_l384_c11_872a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l384_c11_872a_left,
BIN_OP_EQ_uxn_opcodes_h_l384_c11_872a_right,
BIN_OP_EQ_uxn_opcodes_h_l384_c11_872a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c012
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c012 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c012_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c012_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c012_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c012_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l384_c7_c012
result_u8_value_MUX_uxn_opcodes_h_l384_c7_c012 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l384_c7_c012_cond,
result_u8_value_MUX_uxn_opcodes_h_l384_c7_c012_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l384_c7_c012_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l384_c7_c012_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c012
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c012 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c012_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c012_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c012_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c012_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l388_c11_2c16
BIN_OP_EQ_uxn_opcodes_h_l388_c11_2c16 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l388_c11_2c16_left,
BIN_OP_EQ_uxn_opcodes_h_l388_c11_2c16_right,
BIN_OP_EQ_uxn_opcodes_h_l388_c11_2c16_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_ca05
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_ca05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_ca05_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_ca05_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_ca05_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_ca05_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l388_c7_ca05
result_u8_value_MUX_uxn_opcodes_h_l388_c7_ca05 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l388_c7_ca05_cond,
result_u8_value_MUX_uxn_opcodes_h_l388_c7_ca05_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l388_c7_ca05_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l388_c7_ca05_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_ca05
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_ca05 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_ca05_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_ca05_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_ca05_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_ca05_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l339_c6_2f8b_return_output,
 t16_low_MUX_uxn_opcodes_h_l339_c2_8226_return_output,
 n16_high_MUX_uxn_opcodes_h_l339_c2_8226_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8226_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8226_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8226_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l339_c2_8226_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8226_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8226_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8226_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8226_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8226_return_output,
 n16_low_MUX_uxn_opcodes_h_l339_c2_8226_return_output,
 t16_high_MUX_uxn_opcodes_h_l339_c2_8226_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l352_c11_daeb_return_output,
 t16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output,
 n16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output,
 n16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output,
 t16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l355_c11_b284_return_output,
 t16_low_MUX_uxn_opcodes_h_l355_c7_faff_return_output,
 n16_high_MUX_uxn_opcodes_h_l355_c7_faff_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l355_c7_faff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_faff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_faff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_faff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_faff_return_output,
 n16_low_MUX_uxn_opcodes_h_l355_c7_faff_return_output,
 t16_high_MUX_uxn_opcodes_h_l355_c7_faff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l359_c11_4a24_return_output,
 t16_low_MUX_uxn_opcodes_h_l359_c7_3c27_return_output,
 n16_high_MUX_uxn_opcodes_h_l359_c7_3c27_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l359_c7_3c27_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3c27_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3c27_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3c27_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3c27_return_output,
 n16_low_MUX_uxn_opcodes_h_l359_c7_3c27_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l363_c11_5513_return_output,
 n16_high_MUX_uxn_opcodes_h_l363_c7_e1e8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l363_c7_e1e8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_e1e8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_e1e8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_e1e8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_e1e8_return_output,
 n16_low_MUX_uxn_opcodes_h_l363_c7_e1e8_return_output,
 sp_relative_shift_uxn_opcodes_h_l365_c30_c005_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l370_c11_9094_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_c839_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l370_c7_c839_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_c839_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_c839_return_output,
 n16_low_MUX_uxn_opcodes_h_l370_c7_c839_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l376_c11_017a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_59d7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l376_c7_59d7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_59d7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l380_c11_7df5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_2018_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l380_c7_2018_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_2018_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l384_c11_872a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c012_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l384_c7_c012_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c012_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l388_c11_2c16_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_ca05_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l388_c7_ca05_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_ca05_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_2f8b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_2f8b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_2f8b_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_8226_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_8226_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_8226_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_8226_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_8226_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_8226_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_8226_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_8226_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8226_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8226_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l339_c2_8226_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8226_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8226_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8226_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8226_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l339_c2_8226_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8226_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8226_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8226_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8226_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8226_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8226_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_8226_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_8226_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_8226_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_8226_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8226_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8226_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8226_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8226_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8226_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l349_c3_f016 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8226_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8226_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8226_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8226_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8226_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l339_c2_8226_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8226_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8226_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8226_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8226_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l339_c2_8226_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8226_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8226_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8226_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l344_c3_bced : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8226_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8226_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8226_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_8226_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_8226_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_8226_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_8226_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_8226_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_8226_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_8226_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_8226_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_daeb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_daeb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_daeb_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_faff_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_faff_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_faff_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_fdfb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_faff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fdfb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_faff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fdfb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l353_c3_d63a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_faff_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fdfb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_faff_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fdfb_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_faff_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_faff_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_b284_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_b284_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_b284_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_faff_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_faff_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_3c27_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_faff_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_faff_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_faff_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_3c27_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_faff_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_faff_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_faff_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_3c27_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_faff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_faff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_faff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3c27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_faff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_faff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_faff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3c27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_faff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_faff_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_0131 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_faff_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3c27_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_faff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_faff_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_faff_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3c27_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_faff_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_faff_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_faff_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_3c27_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_faff_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_faff_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_faff_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_faff_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_4a24_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_4a24_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_4a24_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_3c27_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_3c27_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_3c27_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_3c27_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_3c27_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_e1e8_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_3c27_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_3c27_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_3c27_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_e1e8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_3c27_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3c27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3c27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_e1e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3c27_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3c27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3c27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_e1e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3c27_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3c27_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l361_c3_7443 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3c27_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_e1e8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3c27_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3c27_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3c27_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_e1e8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3c27_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_3c27_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_3c27_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_e1e8_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_3c27_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_5513_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_5513_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_5513_return_output : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_e1e8_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_e1e8_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_e1e8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_e1e8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_e1e8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_c839_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_e1e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_e1e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_e1e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_c839_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_e1e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_e1e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_e1e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_e1e8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_e1e8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_f961 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_e1e8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_c839_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_e1e8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_e1e8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_e1e8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_c839_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_e1e8_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_e1e8_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_e1e8_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_c839_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_e1e8_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_c005_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_c005_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_c005_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_c005_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_9094_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_9094_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_9094_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_c839_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_c839_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_59d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_c839_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_c839_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_c839_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_59d7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_c839_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_c839_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l373_c3_8464 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_c839_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_59d7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_c839_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_c839_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l372_c3_bdde : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_c839_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_c839_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_c839_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_c839_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_c839_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_017a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_017a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_017a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_59d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_59d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_2018_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_59d7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_59d7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_59d7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_2018_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_59d7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_59d7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_412e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_59d7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_2018_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_59d7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_7df5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_7df5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_7df5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_2018_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_2018_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c012_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_2018_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_2018_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_2018_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_c012_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_2018_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_2018_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_8931 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_2018_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c012_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_2018_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_872a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_872a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_872a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c012_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c012_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_ca05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c012_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_c012_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_c012_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_ca05_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_c012_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c012_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_fce8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c012_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_ca05_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c012_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_2c16_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_2c16_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_2c16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_ca05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_ca05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_ca05_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_ca05_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_ca05_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_ca05_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_ca05_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_73a4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_ca05_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l388_c7_ca05_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_ca05_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l388_l355_l352_l339_l359_DUPLICATE_8fca_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l388_l355_l384_l352_l380_l376_l370_l363_l359_DUPLICATE_4259_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l363_l355_l359_DUPLICATE_70f1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l352_l355_l370_l359_DUPLICATE_cd27_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l335_l394_DUPLICATE_b8c1_return_output : opcode_result_t;
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
     VAR_result_sp_relative_shift_uxn_opcodes_h_l344_c3_bced := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8226_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l344_c3_bced;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l361_c3_7443 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3c27_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l361_c3_7443;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_e1e8_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_f961 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_e1e8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_f961;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l372_c3_bdde := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_c839_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l372_c3_bdde;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8226_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_412e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_59d7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_412e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_4a24_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_c005_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l349_c3_f016 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8226_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l349_c3_f016;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8226_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_5513_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8226_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8226_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_daeb_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_ca05_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_872a_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_8931 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_2018_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_8931;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_fce8 := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c012_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_fce8;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l373_c3_8464 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_c839_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l373_c3_8464;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_0131 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_faff_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_0131;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_73a4 := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_ca05_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_73a4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_017a_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_2f8b_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_b284_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l353_c3_d63a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l353_c3_d63a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_9094_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_2c16_right := to_unsigned(9, 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_c005_y := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_7df5_right := to_unsigned(7, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8226_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8226_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_c005_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_8226_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_faff_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_3c27_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_e1e8_iffalse := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_2018_iftrue := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_ca05_iftrue := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_8226_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_faff_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_3c27_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_e1e8_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_c839_iffalse := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_59d7_iftrue := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_c012_iftrue := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_2f8b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_daeb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_b284_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_4a24_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_5513_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_9094_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_017a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_7df5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_872a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_2c16_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_e1e8_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_c839_iftrue := VAR_previous_stack_read;
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_faff_iftrue := VAR_previous_stack_read;
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_3c27_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_c839_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_8226_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_faff_iffalse := t16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_e1e8_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_8226_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_faff_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_3c27_iffalse := t16_low;
     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l388_c7_ca05] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l388_c7_ca05_return_output := result.stack_address_sp_offset;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l339_c2_8226] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l339_c2_8226_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l388_l355_l352_l339_l359_DUPLICATE_8fca LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l388_l355_l352_l339_l359_DUPLICATE_8fca_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l363_l355_l359_DUPLICATE_70f1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l363_l355_l359_DUPLICATE_70f1_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l388_c11_2c16] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l388_c11_2c16_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_2c16_left;
     BIN_OP_EQ_uxn_opcodes_h_l388_c11_2c16_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_2c16_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_2c16_return_output := BIN_OP_EQ_uxn_opcodes_h_l388_c11_2c16_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l339_c2_8226] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l339_c2_8226_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l352_c11_daeb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l352_c11_daeb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_daeb_left;
     BIN_OP_EQ_uxn_opcodes_h_l352_c11_daeb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_daeb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_daeb_return_output := BIN_OP_EQ_uxn_opcodes_h_l352_c11_daeb_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l339_c2_8226] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l339_c2_8226_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l370_c11_9094] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l370_c11_9094_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_9094_left;
     BIN_OP_EQ_uxn_opcodes_h_l370_c11_9094_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_9094_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_9094_return_output := BIN_OP_EQ_uxn_opcodes_h_l370_c11_9094_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l359_c11_4a24] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l359_c11_4a24_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_4a24_left;
     BIN_OP_EQ_uxn_opcodes_h_l359_c11_4a24_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_4a24_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_4a24_return_output := BIN_OP_EQ_uxn_opcodes_h_l359_c11_4a24_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l376_c11_017a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l376_c11_017a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_017a_left;
     BIN_OP_EQ_uxn_opcodes_h_l376_c11_017a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_017a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_017a_return_output := BIN_OP_EQ_uxn_opcodes_h_l376_c11_017a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l388_l355_l384_l352_l380_l376_l370_l363_l359_DUPLICATE_4259 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l388_l355_l384_l352_l380_l376_l370_l363_l359_DUPLICATE_4259_return_output := result.is_opc_done;

     -- sp_relative_shift[uxn_opcodes_h_l365_c30_c005] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l365_c30_c005_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_c005_ins;
     sp_relative_shift_uxn_opcodes_h_l365_c30_c005_x <= VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_c005_x;
     sp_relative_shift_uxn_opcodes_h_l365_c30_c005_y <= VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_c005_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_c005_return_output := sp_relative_shift_uxn_opcodes_h_l365_c30_c005_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l380_c11_7df5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l380_c11_7df5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_7df5_left;
     BIN_OP_EQ_uxn_opcodes_h_l380_c11_7df5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_7df5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_7df5_return_output := BIN_OP_EQ_uxn_opcodes_h_l380_c11_7df5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l355_c11_b284] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l355_c11_b284_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_b284_left;
     BIN_OP_EQ_uxn_opcodes_h_l355_c11_b284_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_b284_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_b284_return_output := BIN_OP_EQ_uxn_opcodes_h_l355_c11_b284_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l363_c11_5513] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l363_c11_5513_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_5513_left;
     BIN_OP_EQ_uxn_opcodes_h_l363_c11_5513_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_5513_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_5513_return_output := BIN_OP_EQ_uxn_opcodes_h_l363_c11_5513_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l352_l355_l370_l359_DUPLICATE_cd27 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l352_l355_l370_l359_DUPLICATE_cd27_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l384_c11_872a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l384_c11_872a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_872a_left;
     BIN_OP_EQ_uxn_opcodes_h_l384_c11_872a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_872a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_872a_return_output := BIN_OP_EQ_uxn_opcodes_h_l384_c11_872a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l339_c6_2f8b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l339_c6_2f8b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_2f8b_left;
     BIN_OP_EQ_uxn_opcodes_h_l339_c6_2f8b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_2f8b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_2f8b_return_output := BIN_OP_EQ_uxn_opcodes_h_l339_c6_2f8b_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l339_c2_8226] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l339_c2_8226_return_output := result.is_stack_index_flipped;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_8226_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_2f8b_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_8226_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_2f8b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8226_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_2f8b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8226_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_2f8b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8226_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_2f8b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8226_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_2f8b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8226_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_2f8b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8226_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_2f8b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8226_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_2f8b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8226_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_2f8b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_8226_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_2f8b_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_8226_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_2f8b_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_8226_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_2f8b_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_daeb_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_daeb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fdfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_daeb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fdfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_daeb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fdfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_daeb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fdfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_daeb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_fdfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_daeb_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_daeb_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_daeb_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_faff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_b284_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_faff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_b284_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_faff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_b284_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_faff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_b284_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_faff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_b284_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_faff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_b284_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_faff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_b284_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_faff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_b284_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_faff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_b284_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_3c27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_4a24_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_3c27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_4a24_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3c27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_4a24_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3c27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_4a24_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3c27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_4a24_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3c27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_4a24_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_3c27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_4a24_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_3c27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_4a24_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_e1e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_5513_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_e1e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_5513_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_e1e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_5513_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_e1e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_5513_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_e1e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_5513_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_e1e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_5513_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_e1e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_5513_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_c839_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_9094_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_c839_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_9094_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_c839_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_9094_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_c839_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_9094_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_c839_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_9094_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_59d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_017a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_59d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_017a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_59d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_017a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_2018_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_7df5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_2018_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_7df5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_2018_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_7df5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c012_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_872a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c012_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_872a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_c012_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_872a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_ca05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_2c16_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_ca05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_2c16_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_ca05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_2c16_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l352_l355_l370_l359_DUPLICATE_cd27_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_faff_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l352_l355_l370_l359_DUPLICATE_cd27_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3c27_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l352_l355_l370_l359_DUPLICATE_cd27_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_c839_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l352_l355_l370_l359_DUPLICATE_cd27_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l388_l355_l384_l352_l380_l376_l370_l363_l359_DUPLICATE_4259_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_faff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l388_l355_l384_l352_l380_l376_l370_l363_l359_DUPLICATE_4259_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3c27_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l388_l355_l384_l352_l380_l376_l370_l363_l359_DUPLICATE_4259_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_e1e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l388_l355_l384_l352_l380_l376_l370_l363_l359_DUPLICATE_4259_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_c839_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l388_l355_l384_l352_l380_l376_l370_l363_l359_DUPLICATE_4259_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_59d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l388_l355_l384_l352_l380_l376_l370_l363_l359_DUPLICATE_4259_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_2018_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l388_l355_l384_l352_l380_l376_l370_l363_l359_DUPLICATE_4259_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c012_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l388_l355_l384_l352_l380_l376_l370_l363_l359_DUPLICATE_4259_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_ca05_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l388_l355_l384_l352_l380_l376_l370_l363_l359_DUPLICATE_4259_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l363_l355_l359_DUPLICATE_70f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_faff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l363_l355_l359_DUPLICATE_70f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3c27_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l363_l355_l359_DUPLICATE_70f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_e1e8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l363_l355_l359_DUPLICATE_70f1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_8226_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l388_l355_l352_l339_l359_DUPLICATE_8fca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l388_l355_l352_l339_l359_DUPLICATE_8fca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_faff_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l388_l355_l352_l339_l359_DUPLICATE_8fca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_3c27_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l388_l355_l352_l339_l359_DUPLICATE_8fca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_ca05_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l388_l355_l352_l339_l359_DUPLICATE_8fca_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8226_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l339_c2_8226_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8226_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l339_c2_8226_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8226_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l339_c2_8226_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8226_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l339_c2_8226_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_ca05_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l388_c7_ca05_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_e1e8_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_c005_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l339_c2_8226] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8226_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8226_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8226_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8226_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8226_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8226_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8226_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8226_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l359_c7_3c27] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l359_c7_3c27_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_3c27_cond;
     t16_low_MUX_uxn_opcodes_h_l359_c7_3c27_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_3c27_iftrue;
     t16_low_MUX_uxn_opcodes_h_l359_c7_3c27_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_3c27_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_3c27_return_output := t16_low_MUX_uxn_opcodes_h_l359_c7_3c27_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l363_c7_e1e8] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l363_c7_e1e8_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_e1e8_cond;
     n16_high_MUX_uxn_opcodes_h_l363_c7_e1e8_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_e1e8_iftrue;
     n16_high_MUX_uxn_opcodes_h_l363_c7_e1e8_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_e1e8_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_e1e8_return_output := n16_high_MUX_uxn_opcodes_h_l363_c7_e1e8_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l339_c2_8226] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8226_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8226_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8226_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8226_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8226_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8226_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8226_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8226_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l388_c7_ca05] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_ca05_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_ca05_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_ca05_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_ca05_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_ca05_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_ca05_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_ca05_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_ca05_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l388_c7_ca05] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l388_c7_ca05_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_ca05_cond;
     result_u8_value_MUX_uxn_opcodes_h_l388_c7_ca05_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_ca05_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l388_c7_ca05_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_ca05_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_ca05_return_output := result_u8_value_MUX_uxn_opcodes_h_l388_c7_ca05_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l370_c7_c839] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l370_c7_c839_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_c839_cond;
     n16_low_MUX_uxn_opcodes_h_l370_c7_c839_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_c839_iftrue;
     n16_low_MUX_uxn_opcodes_h_l370_c7_c839_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_c839_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_c839_return_output := n16_low_MUX_uxn_opcodes_h_l370_c7_c839_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l355_c7_faff] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l355_c7_faff_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_faff_cond;
     t16_high_MUX_uxn_opcodes_h_l355_c7_faff_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_faff_iftrue;
     t16_high_MUX_uxn_opcodes_h_l355_c7_faff_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_faff_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_faff_return_output := t16_high_MUX_uxn_opcodes_h_l355_c7_faff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l388_c7_ca05] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_ca05_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_ca05_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_ca05_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_ca05_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_ca05_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_ca05_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_ca05_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_ca05_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l363_c7_e1e8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_e1e8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_e1e8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_e1e8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_e1e8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_e1e8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_e1e8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_e1e8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_e1e8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l370_c7_c839] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_c839_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_c839_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_c839_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_c839_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_c839_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_c839_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_c839_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_c839_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l339_c2_8226] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8226_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8226_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8226_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8226_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8226_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8226_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8226_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8226_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l339_c2_8226] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8226_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8226_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8226_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8226_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8226_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8226_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8226_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8226_return_output;

     -- Submodule level 2
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_3c27_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_e1e8_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_e1e8_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_c839_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c012_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_ca05_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3c27_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_e1e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_e1e8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_c839_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c012_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_ca05_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_c012_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_ca05_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_faff_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_faff_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_3c27_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l384_c7_c012] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c012_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c012_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c012_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c012_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c012_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c012_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c012_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c012_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l355_c7_faff] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l355_c7_faff_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_faff_cond;
     t16_low_MUX_uxn_opcodes_h_l355_c7_faff_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_faff_iftrue;
     t16_low_MUX_uxn_opcodes_h_l355_c7_faff_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_faff_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_faff_return_output := t16_low_MUX_uxn_opcodes_h_l355_c7_faff_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l384_c7_c012] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l384_c7_c012_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_c012_cond;
     result_u8_value_MUX_uxn_opcodes_h_l384_c7_c012_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_c012_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l384_c7_c012_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_c012_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_c012_return_output := result_u8_value_MUX_uxn_opcodes_h_l384_c7_c012_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l359_c7_3c27] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l359_c7_3c27_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_3c27_cond;
     n16_high_MUX_uxn_opcodes_h_l359_c7_3c27_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_3c27_iftrue;
     n16_high_MUX_uxn_opcodes_h_l359_c7_3c27_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_3c27_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_3c27_return_output := n16_high_MUX_uxn_opcodes_h_l359_c7_3c27_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l363_c7_e1e8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_e1e8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_e1e8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_e1e8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_e1e8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_e1e8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_e1e8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_e1e8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_e1e8_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l363_c7_e1e8] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l363_c7_e1e8_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_e1e8_cond;
     n16_low_MUX_uxn_opcodes_h_l363_c7_e1e8_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_e1e8_iftrue;
     n16_low_MUX_uxn_opcodes_h_l363_c7_e1e8_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_e1e8_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_e1e8_return_output := n16_low_MUX_uxn_opcodes_h_l363_c7_e1e8_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l352_c7_fdfb] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_cond;
     t16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue;
     t16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output := t16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l359_c7_3c27] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3c27_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3c27_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3c27_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3c27_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3c27_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3c27_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3c27_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3c27_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l384_c7_c012] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c012_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c012_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c012_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c012_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c012_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c012_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c012_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c012_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_faff_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_3c27_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_3c27_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_e1e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_2018_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_c012_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_faff_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_3c27_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3c27_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_e1e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_2018_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_c012_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_2018_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_c012_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_8226_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_faff_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l355_c7_faff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_faff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_faff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_faff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_faff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_faff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_faff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_faff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_faff_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l359_c7_3c27] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3c27_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3c27_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3c27_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3c27_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3c27_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3c27_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3c27_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3c27_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l359_c7_3c27] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l359_c7_3c27_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_3c27_cond;
     n16_low_MUX_uxn_opcodes_h_l359_c7_3c27_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_3c27_iftrue;
     n16_low_MUX_uxn_opcodes_h_l359_c7_3c27_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_3c27_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_3c27_return_output := n16_low_MUX_uxn_opcodes_h_l359_c7_3c27_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l380_c7_2018] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l380_c7_2018_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_2018_cond;
     result_u8_value_MUX_uxn_opcodes_h_l380_c7_2018_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_2018_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l380_c7_2018_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_2018_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_2018_return_output := result_u8_value_MUX_uxn_opcodes_h_l380_c7_2018_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l339_c2_8226] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l339_c2_8226_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_8226_cond;
     t16_high_MUX_uxn_opcodes_h_l339_c2_8226_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_8226_iftrue;
     t16_high_MUX_uxn_opcodes_h_l339_c2_8226_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_8226_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_8226_return_output := t16_high_MUX_uxn_opcodes_h_l339_c2_8226_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l380_c7_2018] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_2018_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_2018_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_2018_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_2018_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_2018_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_2018_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_2018_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_2018_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l352_c7_fdfb] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_cond;
     t16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue;
     t16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output := t16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l355_c7_faff] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l355_c7_faff_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_faff_cond;
     n16_high_MUX_uxn_opcodes_h_l355_c7_faff_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_faff_iftrue;
     n16_high_MUX_uxn_opcodes_h_l355_c7_faff_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_faff_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_faff_return_output := n16_high_MUX_uxn_opcodes_h_l355_c7_faff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l380_c7_2018] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_2018_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_2018_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_2018_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_2018_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_2018_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_2018_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_2018_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_2018_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_faff_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_faff_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_3c27_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_59d7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_2018_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_faff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_faff_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_3c27_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_59d7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_2018_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_59d7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_2018_return_output;
     REG_VAR_t16_high := VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_8226_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_8226_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l355_c7_faff] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l355_c7_faff_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_faff_cond;
     n16_low_MUX_uxn_opcodes_h_l355_c7_faff_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_faff_iftrue;
     n16_low_MUX_uxn_opcodes_h_l355_c7_faff_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_faff_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_faff_return_output := n16_low_MUX_uxn_opcodes_h_l355_c7_faff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l376_c7_59d7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_59d7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_59d7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_59d7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_59d7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_59d7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_59d7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_59d7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_59d7_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l339_c2_8226] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l339_c2_8226_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_8226_cond;
     t16_low_MUX_uxn_opcodes_h_l339_c2_8226_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_8226_iftrue;
     t16_low_MUX_uxn_opcodes_h_l339_c2_8226_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_8226_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_8226_return_output := t16_low_MUX_uxn_opcodes_h_l339_c2_8226_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l376_c7_59d7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_59d7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_59d7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_59d7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_59d7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_59d7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_59d7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_59d7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_59d7_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l352_c7_fdfb] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_cond;
     n16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue;
     n16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output := n16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l355_c7_faff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_faff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_faff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_faff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_faff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_faff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_faff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_faff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_faff_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l376_c7_59d7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_59d7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_59d7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_59d7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_59d7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_59d7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_59d7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_59d7_return_output := result_u8_value_MUX_uxn_opcodes_h_l376_c7_59d7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l352_c7_fdfb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fdfb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fdfb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output;

     -- Submodule level 5
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_8226_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_faff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_c839_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_59d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8226_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_faff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_c839_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_59d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_c839_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_59d7_return_output;
     REG_VAR_t16_low := VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_8226_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l339_c2_8226] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8226_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8226_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8226_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8226_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8226_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8226_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8226_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8226_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l352_c7_fdfb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fdfb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fdfb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l370_c7_c839] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_c839_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_c839_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_c839_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_c839_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_c839_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_c839_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_c839_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_c839_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l370_c7_c839] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_c839_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_c839_cond;
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_c839_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_c839_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_c839_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_c839_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_c839_return_output := result_u8_value_MUX_uxn_opcodes_h_l370_c7_c839_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l339_c2_8226] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l339_c2_8226_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_8226_cond;
     n16_high_MUX_uxn_opcodes_h_l339_c2_8226_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_8226_iftrue;
     n16_high_MUX_uxn_opcodes_h_l339_c2_8226_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_8226_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_8226_return_output := n16_high_MUX_uxn_opcodes_h_l339_c2_8226_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l352_c7_fdfb] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_cond;
     n16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue;
     n16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output := n16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l370_c7_c839] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_c839_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_c839_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_c839_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_c839_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_c839_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_c839_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_c839_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_c839_return_output;

     -- Submodule level 6
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_8226_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_8226_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_e1e8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_c839_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8226_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_e1e8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_c839_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_e1e8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_c839_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l363_c7_e1e8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_e1e8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_e1e8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_e1e8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_e1e8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_e1e8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_e1e8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_e1e8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_e1e8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l363_c7_e1e8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l363_c7_e1e8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_e1e8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l363_c7_e1e8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_e1e8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l363_c7_e1e8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_e1e8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_e1e8_return_output := result_u8_value_MUX_uxn_opcodes_h_l363_c7_e1e8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l363_c7_e1e8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_e1e8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_e1e8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_e1e8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_e1e8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_e1e8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_e1e8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_e1e8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_e1e8_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l339_c2_8226] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l339_c2_8226_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_8226_cond;
     n16_low_MUX_uxn_opcodes_h_l339_c2_8226_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_8226_iftrue;
     n16_low_MUX_uxn_opcodes_h_l339_c2_8226_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_8226_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_8226_return_output := n16_low_MUX_uxn_opcodes_h_l339_c2_8226_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l339_c2_8226] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8226_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8226_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8226_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8226_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8226_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8226_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8226_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8226_return_output;

     -- Submodule level 7
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_8226_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3c27_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_e1e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3c27_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_e1e8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_3c27_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_e1e8_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l359_c7_3c27] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l359_c7_3c27_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_3c27_cond;
     result_u8_value_MUX_uxn_opcodes_h_l359_c7_3c27_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_3c27_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l359_c7_3c27_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_3c27_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_3c27_return_output := result_u8_value_MUX_uxn_opcodes_h_l359_c7_3c27_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l359_c7_3c27] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3c27_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3c27_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3c27_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3c27_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3c27_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3c27_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3c27_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3c27_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l359_c7_3c27] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3c27_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3c27_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3c27_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3c27_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3c27_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3c27_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3c27_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3c27_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_faff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_3c27_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_faff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_3c27_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_faff_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_3c27_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l355_c7_faff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_faff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_faff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_faff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_faff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_faff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_faff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_faff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_faff_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l355_c7_faff] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l355_c7_faff_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_faff_cond;
     result_u8_value_MUX_uxn_opcodes_h_l355_c7_faff_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_faff_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l355_c7_faff_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_faff_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_faff_return_output := result_u8_value_MUX_uxn_opcodes_h_l355_c7_faff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l355_c7_faff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_faff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_faff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_faff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_faff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_faff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_faff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_faff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_faff_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_faff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_faff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_faff_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l352_c7_fdfb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fdfb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fdfb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l352_c7_fdfb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l352_c7_fdfb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_fdfb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output := result_u8_value_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l352_c7_fdfb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fdfb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fdfb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fdfb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fdfb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8226_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8226_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_8226_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_fdfb_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l339_c2_8226] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8226_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8226_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8226_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8226_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8226_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8226_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8226_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8226_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l339_c2_8226] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l339_c2_8226_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_8226_cond;
     result_u8_value_MUX_uxn_opcodes_h_l339_c2_8226_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_8226_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l339_c2_8226_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_8226_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_8226_return_output := result_u8_value_MUX_uxn_opcodes_h_l339_c2_8226_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l339_c2_8226] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8226_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8226_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8226_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8226_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8226_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8226_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8226_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8226_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l335_l394_DUPLICATE_b8c1 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l335_l394_DUPLICATE_b8c1_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_375c(
     result,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_8226_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_8226_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_8226_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_8226_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_8226_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_8226_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_8226_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_8226_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_8226_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l335_l394_DUPLICATE_b8c1_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l335_l394_DUPLICATE_b8c1_return_output;
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
