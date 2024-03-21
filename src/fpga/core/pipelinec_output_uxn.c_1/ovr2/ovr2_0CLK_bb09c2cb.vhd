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
-- BIN_OP_EQ[uxn_opcodes_h_l339_c6_6baf]
signal BIN_OP_EQ_uxn_opcodes_h_l339_c6_6baf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l339_c6_6baf_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l339_c6_6baf_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l339_c2_2b9a]
signal t16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l339_c2_2b9a]
signal t16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l339_c2_2b9a]
signal n16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l339_c2_2b9a]
signal n16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l339_c2_2b9a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2b9a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l339_c2_2b9a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2b9a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l339_c2_2b9a]
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_2b9a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l339_c2_2b9a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2b9a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l339_c2_2b9a]
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l339_c2_2b9a]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2b9a_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l339_c2_2b9a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2b9a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l339_c2_2b9a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l339_c2_2b9a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2b9a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l352_c11_3726]
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_3726_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_3726_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_3726_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l352_c7_2adf]
signal t16_low_MUX_uxn_opcodes_h_l352_c7_2adf_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l352_c7_2adf_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l352_c7_2adf]
signal t16_high_MUX_uxn_opcodes_h_l352_c7_2adf_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l352_c7_2adf_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l352_c7_2adf]
signal n16_low_MUX_uxn_opcodes_h_l352_c7_2adf_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l352_c7_2adf_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l352_c7_2adf]
signal n16_high_MUX_uxn_opcodes_h_l352_c7_2adf_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l352_c7_2adf_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l352_c7_2adf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_2adf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_2adf_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l352_c7_2adf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_2adf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_2adf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l352_c7_2adf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_2adf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_2adf_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l352_c7_2adf]
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_2adf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_2adf_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l352_c7_2adf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_2adf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_2adf_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l355_c11_e7e4]
signal BIN_OP_EQ_uxn_opcodes_h_l355_c11_e7e4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l355_c11_e7e4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l355_c11_e7e4_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l355_c7_ea67]
signal t16_low_MUX_uxn_opcodes_h_l355_c7_ea67_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l355_c7_ea67_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l355_c7_ea67]
signal t16_high_MUX_uxn_opcodes_h_l355_c7_ea67_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l355_c7_ea67_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l355_c7_ea67]
signal n16_low_MUX_uxn_opcodes_h_l355_c7_ea67_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l355_c7_ea67_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l355_c7_ea67]
signal n16_high_MUX_uxn_opcodes_h_l355_c7_ea67_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l355_c7_ea67_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l355_c7_ea67]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ea67_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ea67_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l355_c7_ea67]
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ea67_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ea67_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l355_c7_ea67]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ea67_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ea67_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l355_c7_ea67]
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_ea67_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_ea67_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l355_c7_ea67]
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ea67_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ea67_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l359_c11_0735]
signal BIN_OP_EQ_uxn_opcodes_h_l359_c11_0735_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l359_c11_0735_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l359_c11_0735_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l359_c7_5677]
signal t16_low_MUX_uxn_opcodes_h_l359_c7_5677_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l359_c7_5677_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l359_c7_5677_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l359_c7_5677_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l359_c7_5677]
signal n16_low_MUX_uxn_opcodes_h_l359_c7_5677_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l359_c7_5677_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l359_c7_5677_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l359_c7_5677_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l359_c7_5677]
signal n16_high_MUX_uxn_opcodes_h_l359_c7_5677_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l359_c7_5677_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l359_c7_5677_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l359_c7_5677_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l359_c7_5677]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_5677_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_5677_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_5677_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_5677_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l359_c7_5677]
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_5677_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_5677_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_5677_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_5677_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l359_c7_5677]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_5677_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_5677_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_5677_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_5677_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l359_c7_5677]
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_5677_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_5677_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_5677_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_5677_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l359_c7_5677]
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_5677_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_5677_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_5677_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_5677_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l363_c11_c9a9]
signal BIN_OP_EQ_uxn_opcodes_h_l363_c11_c9a9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l363_c11_c9a9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l363_c11_c9a9_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l363_c7_f741]
signal n16_low_MUX_uxn_opcodes_h_l363_c7_f741_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l363_c7_f741_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l363_c7_f741_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l363_c7_f741_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l363_c7_f741]
signal n16_high_MUX_uxn_opcodes_h_l363_c7_f741_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l363_c7_f741_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l363_c7_f741_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l363_c7_f741_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l363_c7_f741]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_f741_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_f741_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_f741_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_f741_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l363_c7_f741]
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_f741_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_f741_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_f741_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_f741_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l363_c7_f741]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_f741_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_f741_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_f741_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_f741_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l363_c7_f741]
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_f741_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_f741_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_f741_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_f741_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l363_c7_f741]
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_f741_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_f741_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_f741_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_f741_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l365_c30_fe3a]
signal sp_relative_shift_uxn_opcodes_h_l365_c30_fe3a_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l365_c30_fe3a_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l365_c30_fe3a_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l365_c30_fe3a_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l370_c11_99ad]
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_99ad_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_99ad_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_99ad_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l370_c7_9fcb]
signal n16_low_MUX_uxn_opcodes_h_l370_c7_9fcb_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l370_c7_9fcb_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l370_c7_9fcb_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l370_c7_9fcb_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l370_c7_9fcb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_9fcb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_9fcb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_9fcb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_9fcb_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l370_c7_9fcb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_9fcb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_9fcb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_9fcb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_9fcb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l370_c7_9fcb]
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_9fcb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_9fcb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_9fcb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_9fcb_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l370_c7_9fcb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_9fcb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_9fcb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_9fcb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_9fcb_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l376_c11_1f76]
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_1f76_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_1f76_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_1f76_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l376_c7_0cf1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_0cf1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_0cf1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_0cf1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_0cf1_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l376_c7_0cf1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_0cf1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_0cf1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_0cf1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_0cf1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l376_c7_0cf1]
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_0cf1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_0cf1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_0cf1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_0cf1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l380_c11_9894]
signal BIN_OP_EQ_uxn_opcodes_h_l380_c11_9894_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l380_c11_9894_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l380_c11_9894_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l380_c7_355f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_355f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_355f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_355f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_355f_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l380_c7_355f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_355f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_355f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_355f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_355f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l380_c7_355f]
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_355f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_355f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_355f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_355f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l384_c11_7a8c]
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_7a8c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_7a8c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_7a8c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l384_c7_48fb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_48fb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_48fb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_48fb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_48fb_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l384_c7_48fb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_48fb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_48fb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_48fb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_48fb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l384_c7_48fb]
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_48fb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_48fb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_48fb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_48fb_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l388_c11_24bf]
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_24bf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_24bf_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_24bf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l388_c7_aa8d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_aa8d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_aa8d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_aa8d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_aa8d_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l388_c7_aa8d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_aa8d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_aa8d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_aa8d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_aa8d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l388_c7_aa8d]
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_aa8d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_aa8d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_aa8d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_aa8d_return_output : unsigned(7 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_a6df( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_vram_write := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.is_stack_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l339_c6_6baf
BIN_OP_EQ_uxn_opcodes_h_l339_c6_6baf : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l339_c6_6baf_left,
BIN_OP_EQ_uxn_opcodes_h_l339_c6_6baf_right,
BIN_OP_EQ_uxn_opcodes_h_l339_c6_6baf_return_output);

-- t16_low_MUX_uxn_opcodes_h_l339_c2_2b9a
t16_low_MUX_uxn_opcodes_h_l339_c2_2b9a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_cond,
t16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue,
t16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse,
t16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output);

-- t16_high_MUX_uxn_opcodes_h_l339_c2_2b9a
t16_high_MUX_uxn_opcodes_h_l339_c2_2b9a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_cond,
t16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue,
t16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse,
t16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output);

-- n16_low_MUX_uxn_opcodes_h_l339_c2_2b9a
n16_low_MUX_uxn_opcodes_h_l339_c2_2b9a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_cond,
n16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue,
n16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse,
n16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output);

-- n16_high_MUX_uxn_opcodes_h_l339_c2_2b9a
n16_high_MUX_uxn_opcodes_h_l339_c2_2b9a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_cond,
n16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue,
n16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse,
n16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2b9a
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2b9a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2b9a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2b9a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2b9a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2b9a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l339_c2_2b9a
result_u8_value_MUX_uxn_opcodes_h_l339_c2_2b9a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l339_c2_2b9a_cond,
result_u8_value_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2b9a
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2b9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2b9a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2b9a
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2b9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2b9a
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2b9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2b9a_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2b9a
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2b9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2b9a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2b9a
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2b9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2b9a
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2b9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2b9a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l352_c11_3726
BIN_OP_EQ_uxn_opcodes_h_l352_c11_3726 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l352_c11_3726_left,
BIN_OP_EQ_uxn_opcodes_h_l352_c11_3726_right,
BIN_OP_EQ_uxn_opcodes_h_l352_c11_3726_return_output);

-- t16_low_MUX_uxn_opcodes_h_l352_c7_2adf
t16_low_MUX_uxn_opcodes_h_l352_c7_2adf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l352_c7_2adf_cond,
t16_low_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue,
t16_low_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse,
t16_low_MUX_uxn_opcodes_h_l352_c7_2adf_return_output);

-- t16_high_MUX_uxn_opcodes_h_l352_c7_2adf
t16_high_MUX_uxn_opcodes_h_l352_c7_2adf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l352_c7_2adf_cond,
t16_high_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue,
t16_high_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse,
t16_high_MUX_uxn_opcodes_h_l352_c7_2adf_return_output);

-- n16_low_MUX_uxn_opcodes_h_l352_c7_2adf
n16_low_MUX_uxn_opcodes_h_l352_c7_2adf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l352_c7_2adf_cond,
n16_low_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue,
n16_low_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse,
n16_low_MUX_uxn_opcodes_h_l352_c7_2adf_return_output);

-- n16_high_MUX_uxn_opcodes_h_l352_c7_2adf
n16_high_MUX_uxn_opcodes_h_l352_c7_2adf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l352_c7_2adf_cond,
n16_high_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue,
n16_high_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse,
n16_high_MUX_uxn_opcodes_h_l352_c7_2adf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_2adf
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_2adf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_2adf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_2adf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_2adf
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_2adf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_2adf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_2adf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_2adf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_2adf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_2adf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_2adf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l352_c7_2adf
result_u8_value_MUX_uxn_opcodes_h_l352_c7_2adf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l352_c7_2adf_cond,
result_u8_value_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l352_c7_2adf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_2adf
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_2adf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_2adf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_2adf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l355_c11_e7e4
BIN_OP_EQ_uxn_opcodes_h_l355_c11_e7e4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l355_c11_e7e4_left,
BIN_OP_EQ_uxn_opcodes_h_l355_c11_e7e4_right,
BIN_OP_EQ_uxn_opcodes_h_l355_c11_e7e4_return_output);

-- t16_low_MUX_uxn_opcodes_h_l355_c7_ea67
t16_low_MUX_uxn_opcodes_h_l355_c7_ea67 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l355_c7_ea67_cond,
t16_low_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue,
t16_low_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse,
t16_low_MUX_uxn_opcodes_h_l355_c7_ea67_return_output);

-- t16_high_MUX_uxn_opcodes_h_l355_c7_ea67
t16_high_MUX_uxn_opcodes_h_l355_c7_ea67 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l355_c7_ea67_cond,
t16_high_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue,
t16_high_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse,
t16_high_MUX_uxn_opcodes_h_l355_c7_ea67_return_output);

-- n16_low_MUX_uxn_opcodes_h_l355_c7_ea67
n16_low_MUX_uxn_opcodes_h_l355_c7_ea67 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l355_c7_ea67_cond,
n16_low_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue,
n16_low_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse,
n16_low_MUX_uxn_opcodes_h_l355_c7_ea67_return_output);

-- n16_high_MUX_uxn_opcodes_h_l355_c7_ea67
n16_high_MUX_uxn_opcodes_h_l355_c7_ea67 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l355_c7_ea67_cond,
n16_high_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue,
n16_high_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse,
n16_high_MUX_uxn_opcodes_h_l355_c7_ea67_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ea67
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ea67 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ea67_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ea67_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ea67
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ea67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ea67_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ea67_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ea67
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ea67 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ea67_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ea67_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l355_c7_ea67
result_u8_value_MUX_uxn_opcodes_h_l355_c7_ea67 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l355_c7_ea67_cond,
result_u8_value_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l355_c7_ea67_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ea67
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ea67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ea67_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ea67_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l359_c11_0735
BIN_OP_EQ_uxn_opcodes_h_l359_c11_0735 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l359_c11_0735_left,
BIN_OP_EQ_uxn_opcodes_h_l359_c11_0735_right,
BIN_OP_EQ_uxn_opcodes_h_l359_c11_0735_return_output);

-- t16_low_MUX_uxn_opcodes_h_l359_c7_5677
t16_low_MUX_uxn_opcodes_h_l359_c7_5677 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l359_c7_5677_cond,
t16_low_MUX_uxn_opcodes_h_l359_c7_5677_iftrue,
t16_low_MUX_uxn_opcodes_h_l359_c7_5677_iffalse,
t16_low_MUX_uxn_opcodes_h_l359_c7_5677_return_output);

-- n16_low_MUX_uxn_opcodes_h_l359_c7_5677
n16_low_MUX_uxn_opcodes_h_l359_c7_5677 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l359_c7_5677_cond,
n16_low_MUX_uxn_opcodes_h_l359_c7_5677_iftrue,
n16_low_MUX_uxn_opcodes_h_l359_c7_5677_iffalse,
n16_low_MUX_uxn_opcodes_h_l359_c7_5677_return_output);

-- n16_high_MUX_uxn_opcodes_h_l359_c7_5677
n16_high_MUX_uxn_opcodes_h_l359_c7_5677 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l359_c7_5677_cond,
n16_high_MUX_uxn_opcodes_h_l359_c7_5677_iftrue,
n16_high_MUX_uxn_opcodes_h_l359_c7_5677_iffalse,
n16_high_MUX_uxn_opcodes_h_l359_c7_5677_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_5677
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_5677 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_5677_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_5677_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_5677_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_5677_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_5677
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_5677 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_5677_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_5677_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_5677_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_5677_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_5677
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_5677 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_5677_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_5677_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_5677_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_5677_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l359_c7_5677
result_u8_value_MUX_uxn_opcodes_h_l359_c7_5677 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l359_c7_5677_cond,
result_u8_value_MUX_uxn_opcodes_h_l359_c7_5677_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l359_c7_5677_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l359_c7_5677_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_5677
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_5677 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_5677_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_5677_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_5677_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_5677_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l363_c11_c9a9
BIN_OP_EQ_uxn_opcodes_h_l363_c11_c9a9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l363_c11_c9a9_left,
BIN_OP_EQ_uxn_opcodes_h_l363_c11_c9a9_right,
BIN_OP_EQ_uxn_opcodes_h_l363_c11_c9a9_return_output);

-- n16_low_MUX_uxn_opcodes_h_l363_c7_f741
n16_low_MUX_uxn_opcodes_h_l363_c7_f741 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l363_c7_f741_cond,
n16_low_MUX_uxn_opcodes_h_l363_c7_f741_iftrue,
n16_low_MUX_uxn_opcodes_h_l363_c7_f741_iffalse,
n16_low_MUX_uxn_opcodes_h_l363_c7_f741_return_output);

-- n16_high_MUX_uxn_opcodes_h_l363_c7_f741
n16_high_MUX_uxn_opcodes_h_l363_c7_f741 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l363_c7_f741_cond,
n16_high_MUX_uxn_opcodes_h_l363_c7_f741_iftrue,
n16_high_MUX_uxn_opcodes_h_l363_c7_f741_iffalse,
n16_high_MUX_uxn_opcodes_h_l363_c7_f741_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_f741
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_f741 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_f741_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_f741_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_f741_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_f741_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_f741
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_f741 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_f741_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_f741_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_f741_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_f741_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_f741
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_f741 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_f741_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_f741_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_f741_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_f741_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l363_c7_f741
result_u8_value_MUX_uxn_opcodes_h_l363_c7_f741 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l363_c7_f741_cond,
result_u8_value_MUX_uxn_opcodes_h_l363_c7_f741_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l363_c7_f741_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l363_c7_f741_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_f741
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_f741 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_f741_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_f741_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_f741_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_f741_return_output);

-- sp_relative_shift_uxn_opcodes_h_l365_c30_fe3a
sp_relative_shift_uxn_opcodes_h_l365_c30_fe3a : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l365_c30_fe3a_ins,
sp_relative_shift_uxn_opcodes_h_l365_c30_fe3a_x,
sp_relative_shift_uxn_opcodes_h_l365_c30_fe3a_y,
sp_relative_shift_uxn_opcodes_h_l365_c30_fe3a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l370_c11_99ad
BIN_OP_EQ_uxn_opcodes_h_l370_c11_99ad : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l370_c11_99ad_left,
BIN_OP_EQ_uxn_opcodes_h_l370_c11_99ad_right,
BIN_OP_EQ_uxn_opcodes_h_l370_c11_99ad_return_output);

-- n16_low_MUX_uxn_opcodes_h_l370_c7_9fcb
n16_low_MUX_uxn_opcodes_h_l370_c7_9fcb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l370_c7_9fcb_cond,
n16_low_MUX_uxn_opcodes_h_l370_c7_9fcb_iftrue,
n16_low_MUX_uxn_opcodes_h_l370_c7_9fcb_iffalse,
n16_low_MUX_uxn_opcodes_h_l370_c7_9fcb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_9fcb
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_9fcb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_9fcb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_9fcb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_9fcb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_9fcb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_9fcb
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_9fcb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_9fcb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_9fcb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_9fcb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_9fcb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l370_c7_9fcb
result_u8_value_MUX_uxn_opcodes_h_l370_c7_9fcb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l370_c7_9fcb_cond,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_9fcb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_9fcb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_9fcb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_9fcb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_9fcb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_9fcb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_9fcb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_9fcb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_9fcb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l376_c11_1f76
BIN_OP_EQ_uxn_opcodes_h_l376_c11_1f76 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l376_c11_1f76_left,
BIN_OP_EQ_uxn_opcodes_h_l376_c11_1f76_right,
BIN_OP_EQ_uxn_opcodes_h_l376_c11_1f76_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_0cf1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_0cf1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_0cf1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_0cf1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_0cf1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_0cf1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_0cf1
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_0cf1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_0cf1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_0cf1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_0cf1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_0cf1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l376_c7_0cf1
result_u8_value_MUX_uxn_opcodes_h_l376_c7_0cf1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l376_c7_0cf1_cond,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_0cf1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_0cf1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_0cf1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l380_c11_9894
BIN_OP_EQ_uxn_opcodes_h_l380_c11_9894 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l380_c11_9894_left,
BIN_OP_EQ_uxn_opcodes_h_l380_c11_9894_right,
BIN_OP_EQ_uxn_opcodes_h_l380_c11_9894_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_355f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_355f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_355f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_355f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_355f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_355f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_355f
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_355f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_355f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_355f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_355f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_355f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l380_c7_355f
result_u8_value_MUX_uxn_opcodes_h_l380_c7_355f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l380_c7_355f_cond,
result_u8_value_MUX_uxn_opcodes_h_l380_c7_355f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l380_c7_355f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l380_c7_355f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l384_c11_7a8c
BIN_OP_EQ_uxn_opcodes_h_l384_c11_7a8c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l384_c11_7a8c_left,
BIN_OP_EQ_uxn_opcodes_h_l384_c11_7a8c_right,
BIN_OP_EQ_uxn_opcodes_h_l384_c11_7a8c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_48fb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_48fb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_48fb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_48fb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_48fb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_48fb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_48fb
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_48fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_48fb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_48fb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_48fb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_48fb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l384_c7_48fb
result_u8_value_MUX_uxn_opcodes_h_l384_c7_48fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l384_c7_48fb_cond,
result_u8_value_MUX_uxn_opcodes_h_l384_c7_48fb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l384_c7_48fb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l384_c7_48fb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l388_c11_24bf
BIN_OP_EQ_uxn_opcodes_h_l388_c11_24bf : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l388_c11_24bf_left,
BIN_OP_EQ_uxn_opcodes_h_l388_c11_24bf_right,
BIN_OP_EQ_uxn_opcodes_h_l388_c11_24bf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_aa8d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_aa8d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_aa8d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_aa8d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_aa8d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_aa8d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_aa8d
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_aa8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_aa8d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_aa8d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_aa8d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_aa8d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l388_c7_aa8d
result_u8_value_MUX_uxn_opcodes_h_l388_c7_aa8d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l388_c7_aa8d_cond,
result_u8_value_MUX_uxn_opcodes_h_l388_c7_aa8d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l388_c7_aa8d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l388_c7_aa8d_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l339_c6_6baf_return_output,
 t16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output,
 t16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output,
 n16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output,
 n16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l352_c11_3726_return_output,
 t16_low_MUX_uxn_opcodes_h_l352_c7_2adf_return_output,
 t16_high_MUX_uxn_opcodes_h_l352_c7_2adf_return_output,
 n16_low_MUX_uxn_opcodes_h_l352_c7_2adf_return_output,
 n16_high_MUX_uxn_opcodes_h_l352_c7_2adf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_2adf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_2adf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_2adf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l352_c7_2adf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_2adf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l355_c11_e7e4_return_output,
 t16_low_MUX_uxn_opcodes_h_l355_c7_ea67_return_output,
 t16_high_MUX_uxn_opcodes_h_l355_c7_ea67_return_output,
 n16_low_MUX_uxn_opcodes_h_l355_c7_ea67_return_output,
 n16_high_MUX_uxn_opcodes_h_l355_c7_ea67_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ea67_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ea67_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ea67_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l355_c7_ea67_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ea67_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l359_c11_0735_return_output,
 t16_low_MUX_uxn_opcodes_h_l359_c7_5677_return_output,
 n16_low_MUX_uxn_opcodes_h_l359_c7_5677_return_output,
 n16_high_MUX_uxn_opcodes_h_l359_c7_5677_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_5677_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_5677_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_5677_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l359_c7_5677_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_5677_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l363_c11_c9a9_return_output,
 n16_low_MUX_uxn_opcodes_h_l363_c7_f741_return_output,
 n16_high_MUX_uxn_opcodes_h_l363_c7_f741_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_f741_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_f741_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_f741_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l363_c7_f741_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_f741_return_output,
 sp_relative_shift_uxn_opcodes_h_l365_c30_fe3a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l370_c11_99ad_return_output,
 n16_low_MUX_uxn_opcodes_h_l370_c7_9fcb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_9fcb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_9fcb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l370_c7_9fcb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_9fcb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l376_c11_1f76_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_0cf1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_0cf1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l376_c7_0cf1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l380_c11_9894_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_355f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_355f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l380_c7_355f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l384_c11_7a8c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_48fb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_48fb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l384_c7_48fb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l388_c11_24bf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_aa8d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_aa8d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l388_c7_aa8d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_6baf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_6baf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_6baf_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_2adf_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_2adf_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_2adf_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_2adf_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l344_c3_f8b2 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_2adf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2b9a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l349_c3_7a32 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_2adf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2b9a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_2adf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_2b9a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_2adf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2b9a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l339_c2_2b9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l339_c2_2b9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2b9a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l339_c2_2b9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2b9a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l339_c2_2b9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_2adf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2b9a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_3726_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_3726_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_3726_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_ea67_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_2adf_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_ea67_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_2adf_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_ea67_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_2adf_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_ea67_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_2adf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ea67_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_2adf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ea67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_2adf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l353_c3_de3d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ea67_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_2adf_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_ea67_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_2adf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ea67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_2adf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_e7e4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_e7e4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_e7e4_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_5677_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_ea67_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_ea67_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_5677_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_ea67_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_5677_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_ea67_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_5677_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ea67_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_5677_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ea67_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_81dc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_5677_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ea67_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_5677_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_ea67_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_5677_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ea67_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0735_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0735_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0735_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_5677_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_5677_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_5677_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_5677_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_5677_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_f741_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_5677_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_5677_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_5677_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_f741_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_5677_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_5677_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_5677_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_f741_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_5677_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_5677_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_5677_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_f741_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_5677_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_5677_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l361_c3_8eb7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_5677_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_f741_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_5677_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_5677_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_5677_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_f741_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_5677_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_5677_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_5677_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_f741_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_5677_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_c9a9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_c9a9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_c9a9_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_f741_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_f741_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_9fcb_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_f741_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_f741_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_f741_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_f741_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_f741_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_f741_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_9fcb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_f741_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_f741_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_f741_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_9fcb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_f741_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_f741_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_a7db : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_f741_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_9fcb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_f741_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_f741_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_f741_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_9fcb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_f741_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_f741_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_f741_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_f741_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_fe3a_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_fe3a_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_fe3a_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_fe3a_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_99ad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_99ad_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_99ad_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_9fcb_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_9fcb_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_9fcb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_9fcb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l372_c3_10de : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_9fcb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_9fcb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_9fcb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_9fcb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_0cf1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_9fcb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_9fcb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_9fcb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_0cf1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_9fcb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_9fcb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l373_c3_537f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_9fcb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_0cf1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_9fcb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_1f76_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_1f76_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_1f76_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_0cf1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_e6b3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_0cf1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_355f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_0cf1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_0cf1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_0cf1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_355f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_0cf1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_0cf1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_0cf1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_355f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_0cf1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_9894_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_9894_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_9894_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_355f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_f06c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_355f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_48fb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_355f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_355f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_355f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_48fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_355f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_355f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_355f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_48fb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_355f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_7a8c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_7a8c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_7a8c_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_48fb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_9980 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_48fb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_aa8d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_48fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_48fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_48fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_aa8d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_48fb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_48fb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_48fb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_aa8d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_48fb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_24bf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_24bf_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_24bf_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_aa8d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_356e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_aa8d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l388_c7_aa8d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_aa8d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_aa8d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_aa8d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_aa8d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_aa8d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_aa8d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_aa8d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_93e7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l352_l355_l370_l359_DUPLICATE_799f_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l363_l359_l388_l355_l384_l352_l380_l376_l370_DUPLICATE_4df0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l363_l355_l359_DUPLICATE_84c4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l335_l394_DUPLICATE_89ba_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_7a8c_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l373_c3_537f := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_9fcb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l373_c3_537f;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_e7e4_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_6baf_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l353_c3_de3d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l353_c3_de3d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_9980 := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_48fb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_9980;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_356e := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_aa8d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_356e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_f06c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_355f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_f06c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_1f76_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l361_c3_8eb7 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_5677_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l361_c3_8eb7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_c9a9_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_a7db := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_f741_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_a7db;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_aa8d_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_fe3a_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_9894_right := to_unsigned(7, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_fe3a_y := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l372_c3_10de := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_9fcb_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l372_c3_10de;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_81dc := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_81dc;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l349_c3_7a32 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l349_c3_7a32;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_f741_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l344_c3_f8b2 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l344_c3_f8b2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0735_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_e6b3 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_0cf1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_e6b3;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_99ad_right := to_unsigned(5, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_24bf_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_3726_right := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_fe3a_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_5677_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_f741_iffalse := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_355f_iftrue := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_aa8d_iftrue := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_5677_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_f741_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_9fcb_iffalse := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_0cf1_iftrue := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_48fb_iftrue := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_6baf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_3726_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_e7e4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0735_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_c9a9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_99ad_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_1f76_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_9894_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_7a8c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_24bf_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_f741_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_9fcb_iftrue := VAR_previous_stack_read;
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue := VAR_previous_stack_read;
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_5677_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_9fcb_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse := t16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_f741_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_5677_iffalse := t16_low;
     -- BIN_OP_EQ[uxn_opcodes_h_l339_c6_6baf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l339_c6_6baf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_6baf_left;
     BIN_OP_EQ_uxn_opcodes_h_l339_c6_6baf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_6baf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_6baf_return_output := BIN_OP_EQ_uxn_opcodes_h_l339_c6_6baf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l352_c11_3726] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l352_c11_3726_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_3726_left;
     BIN_OP_EQ_uxn_opcodes_h_l352_c11_3726_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_3726_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_3726_return_output := BIN_OP_EQ_uxn_opcodes_h_l352_c11_3726_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_93e7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_93e7_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l384_c11_7a8c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l384_c11_7a8c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_7a8c_left;
     BIN_OP_EQ_uxn_opcodes_h_l384_c11_7a8c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_7a8c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_7a8c_return_output := BIN_OP_EQ_uxn_opcodes_h_l384_c11_7a8c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l380_c11_9894] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l380_c11_9894_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_9894_left;
     BIN_OP_EQ_uxn_opcodes_h_l380_c11_9894_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_9894_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_9894_return_output := BIN_OP_EQ_uxn_opcodes_h_l380_c11_9894_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l359_c11_0735] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l359_c11_0735_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0735_left;
     BIN_OP_EQ_uxn_opcodes_h_l359_c11_0735_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0735_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0735_return_output := BIN_OP_EQ_uxn_opcodes_h_l359_c11_0735_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l339_c2_2b9a] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l339_c2_2b9a_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l370_c11_99ad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l370_c11_99ad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_99ad_left;
     BIN_OP_EQ_uxn_opcodes_h_l370_c11_99ad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_99ad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_99ad_return_output := BIN_OP_EQ_uxn_opcodes_h_l370_c11_99ad_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l363_l355_l359_DUPLICATE_84c4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l363_l355_l359_DUPLICATE_84c4_return_output := result.is_stack_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l352_l355_l370_l359_DUPLICATE_799f LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l352_l355_l370_l359_DUPLICATE_799f_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l355_c11_e7e4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l355_c11_e7e4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_e7e4_left;
     BIN_OP_EQ_uxn_opcodes_h_l355_c11_e7e4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_e7e4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_e7e4_return_output := BIN_OP_EQ_uxn_opcodes_h_l355_c11_e7e4_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l339_c2_2b9a] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l339_c2_2b9a_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l363_l359_l388_l355_l384_l352_l380_l376_l370_DUPLICATE_4df0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l363_l359_l388_l355_l384_l352_l380_l376_l370_DUPLICATE_4df0_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l388_c11_24bf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l388_c11_24bf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_24bf_left;
     BIN_OP_EQ_uxn_opcodes_h_l388_c11_24bf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_24bf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_24bf_return_output := BIN_OP_EQ_uxn_opcodes_h_l388_c11_24bf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l363_c11_c9a9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l363_c11_c9a9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_c9a9_left;
     BIN_OP_EQ_uxn_opcodes_h_l363_c11_c9a9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_c9a9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_c9a9_return_output := BIN_OP_EQ_uxn_opcodes_h_l363_c11_c9a9_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l365_c30_fe3a] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l365_c30_fe3a_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_fe3a_ins;
     sp_relative_shift_uxn_opcodes_h_l365_c30_fe3a_x <= VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_fe3a_x;
     sp_relative_shift_uxn_opcodes_h_l365_c30_fe3a_y <= VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_fe3a_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_fe3a_return_output := sp_relative_shift_uxn_opcodes_h_l365_c30_fe3a_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l339_c2_2b9a] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l339_c2_2b9a_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l376_c11_1f76] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l376_c11_1f76_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_1f76_left;
     BIN_OP_EQ_uxn_opcodes_h_l376_c11_1f76_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_1f76_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_1f76_return_output := BIN_OP_EQ_uxn_opcodes_h_l376_c11_1f76_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l388_c7_aa8d] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l388_c7_aa8d_return_output := result.stack_address_sp_offset;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l339_c2_2b9a] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l339_c2_2b9a_return_output := result.is_ram_write;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_6baf_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_6baf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2b9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_6baf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2b9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_6baf_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_6baf_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2b9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_6baf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2b9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_6baf_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_6baf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2b9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_6baf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2b9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_6baf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_2b9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_6baf_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_6baf_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_6baf_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_2adf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_3726_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_2adf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_3726_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_2adf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_3726_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_2adf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_3726_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_2adf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_3726_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_2adf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_3726_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_2adf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_3726_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_2adf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_3726_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_2adf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_3726_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_ea67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_e7e4_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_ea67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_e7e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ea67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_e7e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ea67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_e7e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ea67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_e7e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ea67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_e7e4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_ea67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_e7e4_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_ea67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_e7e4_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_ea67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_e7e4_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_5677_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0735_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_5677_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0735_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_5677_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0735_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_5677_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0735_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_5677_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0735_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_5677_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0735_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_5677_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0735_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_5677_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_0735_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_f741_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_c9a9_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_f741_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_c9a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_f741_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_c9a9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_f741_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_c9a9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_f741_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_c9a9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_f741_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_c9a9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_f741_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_c9a9_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_9fcb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_99ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_9fcb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_99ad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_9fcb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_99ad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_9fcb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_99ad_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_9fcb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_99ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_0cf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_1f76_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_0cf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_1f76_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_0cf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_1f76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_355f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_9894_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_355f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_9894_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_355f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_9894_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_48fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_7a8c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_48fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_7a8c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_48fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_7a8c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_aa8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_24bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_aa8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_24bf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_aa8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_24bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l352_l355_l370_l359_DUPLICATE_799f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l352_l355_l370_l359_DUPLICATE_799f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_5677_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l352_l355_l370_l359_DUPLICATE_799f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_9fcb_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l352_l355_l370_l359_DUPLICATE_799f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l363_l359_l388_l355_l384_l352_l380_l376_l370_DUPLICATE_4df0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l363_l359_l388_l355_l384_l352_l380_l376_l370_DUPLICATE_4df0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_5677_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l363_l359_l388_l355_l384_l352_l380_l376_l370_DUPLICATE_4df0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_f741_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l363_l359_l388_l355_l384_l352_l380_l376_l370_DUPLICATE_4df0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_9fcb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l363_l359_l388_l355_l384_l352_l380_l376_l370_DUPLICATE_4df0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_0cf1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l363_l359_l388_l355_l384_l352_l380_l376_l370_DUPLICATE_4df0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_355f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l363_l359_l388_l355_l384_l352_l380_l376_l370_DUPLICATE_4df0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_48fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l363_l359_l388_l355_l384_l352_l380_l376_l370_DUPLICATE_4df0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_aa8d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l363_l359_l388_l355_l384_l352_l380_l376_l370_DUPLICATE_4df0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l363_l355_l359_DUPLICATE_84c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l363_l355_l359_DUPLICATE_84c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_5677_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l363_l355_l359_DUPLICATE_84c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_f741_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l352_l363_l355_l359_DUPLICATE_84c4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_93e7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_93e7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_93e7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_5677_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_93e7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_aa8d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_93e7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l339_c2_2b9a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l339_c2_2b9a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l339_c2_2b9a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l339_c2_2b9a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_aa8d_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l388_c7_aa8d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_f741_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_fe3a_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l339_c2_2b9a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2b9a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2b9a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l355_c7_ea67] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l355_c7_ea67_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_ea67_cond;
     t16_high_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue;
     t16_high_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_ea67_return_output := t16_high_MUX_uxn_opcodes_h_l355_c7_ea67_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l388_c7_aa8d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_aa8d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_aa8d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_aa8d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_aa8d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_aa8d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_aa8d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_aa8d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_aa8d_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l339_c2_2b9a] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2b9a_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2b9a_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l363_c7_f741] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_f741_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_f741_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_f741_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_f741_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_f741_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_f741_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_f741_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_f741_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l370_c7_9fcb] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l370_c7_9fcb_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_9fcb_cond;
     n16_low_MUX_uxn_opcodes_h_l370_c7_9fcb_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_9fcb_iftrue;
     n16_low_MUX_uxn_opcodes_h_l370_c7_9fcb_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_9fcb_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_9fcb_return_output := n16_low_MUX_uxn_opcodes_h_l370_c7_9fcb_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l359_c7_5677] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l359_c7_5677_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_5677_cond;
     t16_low_MUX_uxn_opcodes_h_l359_c7_5677_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_5677_iftrue;
     t16_low_MUX_uxn_opcodes_h_l359_c7_5677_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_5677_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_5677_return_output := t16_low_MUX_uxn_opcodes_h_l359_c7_5677_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l339_c2_2b9a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l388_c7_aa8d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l388_c7_aa8d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_aa8d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l388_c7_aa8d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_aa8d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l388_c7_aa8d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_aa8d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_aa8d_return_output := result_u8_value_MUX_uxn_opcodes_h_l388_c7_aa8d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l370_c7_9fcb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_9fcb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_9fcb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_9fcb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_9fcb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_9fcb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_9fcb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_9fcb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_9fcb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l388_c7_aa8d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_aa8d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_aa8d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_aa8d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_aa8d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_aa8d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_aa8d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_aa8d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_aa8d_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l363_c7_f741] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l363_c7_f741_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_f741_cond;
     n16_high_MUX_uxn_opcodes_h_l363_c7_f741_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_f741_iftrue;
     n16_high_MUX_uxn_opcodes_h_l363_c7_f741_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_f741_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_f741_return_output := n16_high_MUX_uxn_opcodes_h_l363_c7_f741_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l339_c2_2b9a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output;

     -- Submodule level 2
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_5677_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_f741_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_f741_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_9fcb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_48fb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_aa8d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_5677_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_f741_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_f741_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_9fcb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_48fb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_aa8d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_48fb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_aa8d_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_ea67_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_5677_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l359_c7_5677] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_5677_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_5677_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_5677_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_5677_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_5677_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_5677_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_5677_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_5677_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l363_c7_f741] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_f741_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_f741_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_f741_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_f741_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_f741_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_f741_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_f741_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_f741_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l363_c7_f741] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l363_c7_f741_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_f741_cond;
     n16_low_MUX_uxn_opcodes_h_l363_c7_f741_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_f741_iftrue;
     n16_low_MUX_uxn_opcodes_h_l363_c7_f741_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_f741_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_f741_return_output := n16_low_MUX_uxn_opcodes_h_l363_c7_f741_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l352_c7_2adf] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l352_c7_2adf_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_2adf_cond;
     t16_high_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue;
     t16_high_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_2adf_return_output := t16_high_MUX_uxn_opcodes_h_l352_c7_2adf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l384_c7_48fb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_48fb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_48fb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_48fb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_48fb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_48fb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_48fb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_48fb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_48fb_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l359_c7_5677] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l359_c7_5677_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_5677_cond;
     n16_high_MUX_uxn_opcodes_h_l359_c7_5677_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_5677_iftrue;
     n16_high_MUX_uxn_opcodes_h_l359_c7_5677_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_5677_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_5677_return_output := n16_high_MUX_uxn_opcodes_h_l359_c7_5677_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l384_c7_48fb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_48fb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_48fb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_48fb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_48fb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_48fb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_48fb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_48fb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_48fb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l384_c7_48fb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l384_c7_48fb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_48fb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l384_c7_48fb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_48fb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l384_c7_48fb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_48fb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_48fb_return_output := result_u8_value_MUX_uxn_opcodes_h_l384_c7_48fb_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l355_c7_ea67] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l355_c7_ea67_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_ea67_cond;
     t16_low_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue;
     t16_low_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_ea67_return_output := t16_low_MUX_uxn_opcodes_h_l355_c7_ea67_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_5677_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_5677_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_f741_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_355f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_48fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_5677_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_5677_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_f741_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_355f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_48fb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_355f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_48fb_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_2adf_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_ea67_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l380_c7_355f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_355f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_355f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_355f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_355f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_355f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_355f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_355f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_355f_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l339_c2_2b9a] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_cond;
     t16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue;
     t16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output := t16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l355_c7_ea67] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l355_c7_ea67_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_ea67_cond;
     n16_high_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue;
     n16_high_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_ea67_return_output := n16_high_MUX_uxn_opcodes_h_l355_c7_ea67_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l355_c7_ea67] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ea67_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ea67_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ea67_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ea67_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l352_c7_2adf] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l352_c7_2adf_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_2adf_cond;
     t16_low_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue;
     t16_low_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_2adf_return_output := t16_low_MUX_uxn_opcodes_h_l352_c7_2adf_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l359_c7_5677] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l359_c7_5677_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_5677_cond;
     n16_low_MUX_uxn_opcodes_h_l359_c7_5677_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_5677_iftrue;
     n16_low_MUX_uxn_opcodes_h_l359_c7_5677_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_5677_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_5677_return_output := n16_low_MUX_uxn_opcodes_h_l359_c7_5677_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l380_c7_355f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_355f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_355f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_355f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_355f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_355f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_355f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_355f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_355f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l359_c7_5677] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_5677_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_5677_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_5677_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_5677_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_5677_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_5677_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_5677_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_5677_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l380_c7_355f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l380_c7_355f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_355f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l380_c7_355f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_355f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l380_c7_355f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_355f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_355f_return_output := result_u8_value_MUX_uxn_opcodes_h_l380_c7_355f_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_ea67_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_5677_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_0cf1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_355f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_ea67_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_5677_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_0cf1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_355f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_0cf1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_355f_return_output;
     REG_VAR_t16_high := VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_2adf_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l355_c7_ea67] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l355_c7_ea67_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_ea67_cond;
     n16_low_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue;
     n16_low_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_ea67_return_output := n16_low_MUX_uxn_opcodes_h_l355_c7_ea67_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l352_c7_2adf] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l352_c7_2adf_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_2adf_cond;
     n16_high_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue;
     n16_high_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_2adf_return_output := n16_high_MUX_uxn_opcodes_h_l352_c7_2adf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l355_c7_ea67] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ea67_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ea67_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ea67_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ea67_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l339_c2_2b9a] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_cond;
     t16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue;
     t16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output := t16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l352_c7_2adf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_2adf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_2adf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_2adf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_2adf_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l376_c7_0cf1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_0cf1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_0cf1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_0cf1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_0cf1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_0cf1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_0cf1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_0cf1_return_output := result_u8_value_MUX_uxn_opcodes_h_l376_c7_0cf1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l376_c7_0cf1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_0cf1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_0cf1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_0cf1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_0cf1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_0cf1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_0cf1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_0cf1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_0cf1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l376_c7_0cf1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_0cf1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_0cf1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_0cf1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_0cf1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_0cf1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_0cf1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_0cf1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_0cf1_return_output;

     -- Submodule level 5
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_2adf_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_ea67_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_9fcb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_0cf1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_2adf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_ea67_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_9fcb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_0cf1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_9fcb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_0cf1_return_output;
     REG_VAR_t16_low := VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l370_c7_9fcb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_9fcb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_9fcb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_9fcb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_9fcb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_9fcb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_9fcb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_9fcb_return_output := result_u8_value_MUX_uxn_opcodes_h_l370_c7_9fcb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l339_c2_2b9a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2b9a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2b9a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l370_c7_9fcb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_9fcb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_9fcb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_9fcb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_9fcb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_9fcb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_9fcb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_9fcb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_9fcb_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l352_c7_2adf] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l352_c7_2adf_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_2adf_cond;
     n16_low_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue;
     n16_low_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_2adf_return_output := n16_low_MUX_uxn_opcodes_h_l352_c7_2adf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l352_c7_2adf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_2adf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_2adf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_2adf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_2adf_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l339_c2_2b9a] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_cond;
     n16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue;
     n16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output := n16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l370_c7_9fcb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_9fcb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_9fcb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_9fcb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_9fcb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_9fcb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_9fcb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_9fcb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_9fcb_return_output;

     -- Submodule level 6
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_2adf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_f741_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_9fcb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_2adf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_f741_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_9fcb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_f741_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_9fcb_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l339_c2_2b9a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2b9a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2b9a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l363_c7_f741] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_f741_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_f741_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_f741_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_f741_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_f741_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_f741_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_f741_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_f741_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l339_c2_2b9a] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_cond;
     n16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue;
     n16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output := n16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l363_c7_f741] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l363_c7_f741_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_f741_cond;
     result_u8_value_MUX_uxn_opcodes_h_l363_c7_f741_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_f741_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l363_c7_f741_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_f741_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_f741_return_output := result_u8_value_MUX_uxn_opcodes_h_l363_c7_f741_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l363_c7_f741] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_f741_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_f741_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_f741_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_f741_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_f741_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_f741_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_f741_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_f741_return_output;

     -- Submodule level 7
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_5677_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_f741_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_5677_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_f741_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_5677_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_f741_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l359_c7_5677] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_5677_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_5677_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_5677_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_5677_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_5677_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_5677_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_5677_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_5677_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l359_c7_5677] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_5677_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_5677_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_5677_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_5677_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_5677_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_5677_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_5677_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_5677_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l359_c7_5677] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l359_c7_5677_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_5677_cond;
     result_u8_value_MUX_uxn_opcodes_h_l359_c7_5677_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_5677_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l359_c7_5677_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_5677_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_5677_return_output := result_u8_value_MUX_uxn_opcodes_h_l359_c7_5677_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_5677_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_5677_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_5677_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l355_c7_ea67] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ea67_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ea67_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ea67_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ea67_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l355_c7_ea67] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l355_c7_ea67_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_ea67_cond;
     result_u8_value_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_ea67_return_output := result_u8_value_MUX_uxn_opcodes_h_l355_c7_ea67_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l355_c7_ea67] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ea67_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ea67_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ea67_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ea67_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ea67_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ea67_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_ea67_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_ea67_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_ea67_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l352_c7_2adf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_2adf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_2adf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_2adf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_2adf_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l352_c7_2adf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l352_c7_2adf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_2adf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_2adf_return_output := result_u8_value_MUX_uxn_opcodes_h_l352_c7_2adf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l352_c7_2adf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_2adf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_2adf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_2adf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_2adf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_2adf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_2adf_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_2adf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_2adf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_2adf_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l339_c2_2b9a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2b9a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2b9a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l339_c2_2b9a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l339_c2_2b9a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_2b9a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output := result_u8_value_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l339_c2_2b9a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2b9a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2b9a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2b9a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2b9a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l335_l394_DUPLICATE_89ba LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l335_l394_DUPLICATE_89ba_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a6df(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_2b9a_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l335_l394_DUPLICATE_89ba_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l335_l394_DUPLICATE_89ba_return_output;
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
