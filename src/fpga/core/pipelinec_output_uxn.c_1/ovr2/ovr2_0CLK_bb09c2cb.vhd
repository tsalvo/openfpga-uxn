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
-- BIN_OP_EQ[uxn_opcodes_h_l339_c6_3fb3]
signal BIN_OP_EQ_uxn_opcodes_h_l339_c6_3fb3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l339_c6_3fb3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l339_c6_3fb3_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l339_c2_bcf1]
signal t16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l339_c2_bcf1]
signal n16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l339_c2_bcf1]
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l339_c2_bcf1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_bcf1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l339_c2_bcf1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_bcf1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l339_c2_bcf1]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_bcf1_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l339_c2_bcf1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_bcf1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l339_c2_bcf1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_bcf1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l339_c2_bcf1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_bcf1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l339_c2_bcf1]
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_bcf1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l339_c2_bcf1]
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l339_c2_bcf1]
signal n16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l339_c2_bcf1]
signal t16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l352_c11_1440]
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_1440_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_1440_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_1440_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l352_c7_562f]
signal t16_low_MUX_uxn_opcodes_h_l352_c7_562f_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l352_c7_562f_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l352_c7_562f_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l352_c7_562f_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l352_c7_562f]
signal n16_high_MUX_uxn_opcodes_h_l352_c7_562f_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l352_c7_562f_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l352_c7_562f_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l352_c7_562f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l352_c7_562f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_562f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_562f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_562f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_562f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l352_c7_562f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_562f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_562f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_562f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_562f_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l352_c7_562f]
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_562f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_562f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_562f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l352_c7_562f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l352_c7_562f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_562f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_562f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_562f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_562f_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l352_c7_562f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_562f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_562f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_562f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_562f_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l352_c7_562f]
signal n16_low_MUX_uxn_opcodes_h_l352_c7_562f_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l352_c7_562f_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l352_c7_562f_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l352_c7_562f_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l352_c7_562f]
signal t16_high_MUX_uxn_opcodes_h_l352_c7_562f_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l352_c7_562f_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l352_c7_562f_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l352_c7_562f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l355_c11_4eff]
signal BIN_OP_EQ_uxn_opcodes_h_l355_c11_4eff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l355_c11_4eff_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l355_c11_4eff_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l355_c7_803f]
signal t16_low_MUX_uxn_opcodes_h_l355_c7_803f_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l355_c7_803f_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l355_c7_803f_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l355_c7_803f_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l355_c7_803f]
signal n16_high_MUX_uxn_opcodes_h_l355_c7_803f_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l355_c7_803f_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l355_c7_803f_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l355_c7_803f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l355_c7_803f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_803f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_803f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_803f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_803f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l355_c7_803f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_803f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_803f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_803f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_803f_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l355_c7_803f]
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_803f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_803f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_803f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l355_c7_803f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l355_c7_803f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_803f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_803f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_803f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_803f_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l355_c7_803f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_803f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_803f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_803f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_803f_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l355_c7_803f]
signal n16_low_MUX_uxn_opcodes_h_l355_c7_803f_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l355_c7_803f_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l355_c7_803f_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l355_c7_803f_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l355_c7_803f]
signal t16_high_MUX_uxn_opcodes_h_l355_c7_803f_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l355_c7_803f_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l355_c7_803f_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l355_c7_803f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l359_c11_6877]
signal BIN_OP_EQ_uxn_opcodes_h_l359_c11_6877_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l359_c11_6877_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l359_c11_6877_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l359_c7_32c1]
signal t16_low_MUX_uxn_opcodes_h_l359_c7_32c1_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l359_c7_32c1_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l359_c7_32c1_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l359_c7_32c1_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l359_c7_32c1]
signal n16_high_MUX_uxn_opcodes_h_l359_c7_32c1_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l359_c7_32c1_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l359_c7_32c1_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l359_c7_32c1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l359_c7_32c1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_32c1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_32c1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_32c1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_32c1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l359_c7_32c1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_32c1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_32c1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_32c1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_32c1_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l359_c7_32c1]
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_32c1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_32c1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_32c1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l359_c7_32c1_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l359_c7_32c1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_32c1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_32c1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_32c1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_32c1_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l359_c7_32c1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_32c1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_32c1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_32c1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_32c1_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l359_c7_32c1]
signal n16_low_MUX_uxn_opcodes_h_l359_c7_32c1_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l359_c7_32c1_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l359_c7_32c1_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l359_c7_32c1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l363_c11_f615]
signal BIN_OP_EQ_uxn_opcodes_h_l363_c11_f615_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l363_c11_f615_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l363_c11_f615_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l363_c7_c81b]
signal n16_high_MUX_uxn_opcodes_h_l363_c7_c81b_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l363_c7_c81b_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l363_c7_c81b_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l363_c7_c81b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l363_c7_c81b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c81b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c81b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c81b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c81b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l363_c7_c81b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c81b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c81b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c81b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c81b_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l363_c7_c81b]
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_c81b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_c81b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_c81b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l363_c7_c81b_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l363_c7_c81b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c81b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c81b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c81b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c81b_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l363_c7_c81b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c81b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c81b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c81b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c81b_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l363_c7_c81b]
signal n16_low_MUX_uxn_opcodes_h_l363_c7_c81b_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l363_c7_c81b_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l363_c7_c81b_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l363_c7_c81b_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l365_c30_2288]
signal sp_relative_shift_uxn_opcodes_h_l365_c30_2288_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l365_c30_2288_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l365_c30_2288_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l365_c30_2288_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l370_c11_c4e7]
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_c4e7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_c4e7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l370_c11_c4e7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l370_c7_aeff]
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_aeff_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_aeff_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_aeff_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l370_c7_aeff_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l370_c7_aeff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_aeff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_aeff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_aeff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_aeff_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l370_c7_aeff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_aeff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_aeff_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_aeff_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_aeff_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l370_c7_aeff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_aeff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_aeff_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_aeff_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_aeff_return_output : unsigned(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l370_c7_aeff]
signal n16_low_MUX_uxn_opcodes_h_l370_c7_aeff_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l370_c7_aeff_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l370_c7_aeff_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l370_c7_aeff_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l376_c11_6f6d]
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_6f6d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_6f6d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l376_c11_6f6d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l376_c7_fc08]
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_fc08_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_fc08_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_fc08_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l376_c7_fc08_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l376_c7_fc08]
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_fc08_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_fc08_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_fc08_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_fc08_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l376_c7_fc08]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_fc08_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_fc08_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_fc08_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_fc08_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l380_c11_a829]
signal BIN_OP_EQ_uxn_opcodes_h_l380_c11_a829_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l380_c11_a829_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l380_c11_a829_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l380_c7_a316]
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_a316_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_a316_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_a316_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l380_c7_a316_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l380_c7_a316]
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_a316_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_a316_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_a316_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_a316_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l380_c7_a316]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_a316_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_a316_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_a316_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_a316_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l384_c11_0130]
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_0130_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_0130_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l384_c11_0130_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l384_c7_f418]
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_f418_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_f418_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_f418_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l384_c7_f418_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l384_c7_f418]
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_f418_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_f418_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_f418_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_f418_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l384_c7_f418]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_f418_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_f418_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_f418_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_f418_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l388_c11_8c91]
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_8c91_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_8c91_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l388_c11_8c91_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l388_c7_5978]
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_5978_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_5978_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_5978_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l388_c7_5978_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l388_c7_5978]
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_5978_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_5978_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_5978_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_5978_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l388_c7_5978]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_5978_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_5978_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_5978_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_5978_return_output : unsigned(3 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_a47b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
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
      base.is_ram_write := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.u8_value := ref_toks_8;
      base.is_vram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l339_c6_3fb3
BIN_OP_EQ_uxn_opcodes_h_l339_c6_3fb3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l339_c6_3fb3_left,
BIN_OP_EQ_uxn_opcodes_h_l339_c6_3fb3_right,
BIN_OP_EQ_uxn_opcodes_h_l339_c6_3fb3_return_output);

-- t16_low_MUX_uxn_opcodes_h_l339_c2_bcf1
t16_low_MUX_uxn_opcodes_h_l339_c2_bcf1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_cond,
t16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue,
t16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse,
t16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output);

-- n16_high_MUX_uxn_opcodes_h_l339_c2_bcf1
n16_high_MUX_uxn_opcodes_h_l339_c2_bcf1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_cond,
n16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue,
n16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse,
n16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_bcf1
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_bcf1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_bcf1
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_bcf1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_bcf1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_bcf1
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_bcf1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_bcf1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_bcf1
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_bcf1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_bcf1_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_bcf1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_bcf1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_bcf1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_bcf1
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_bcf1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_bcf1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_bcf1
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_bcf1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_bcf1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l339_c2_bcf1
result_u8_value_MUX_uxn_opcodes_h_l339_c2_bcf1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l339_c2_bcf1_cond,
result_u8_value_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_bcf1
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_bcf1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output);

-- n16_low_MUX_uxn_opcodes_h_l339_c2_bcf1
n16_low_MUX_uxn_opcodes_h_l339_c2_bcf1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_cond,
n16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue,
n16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse,
n16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output);

-- t16_high_MUX_uxn_opcodes_h_l339_c2_bcf1
t16_high_MUX_uxn_opcodes_h_l339_c2_bcf1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_cond,
t16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue,
t16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse,
t16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l352_c11_1440
BIN_OP_EQ_uxn_opcodes_h_l352_c11_1440 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l352_c11_1440_left,
BIN_OP_EQ_uxn_opcodes_h_l352_c11_1440_right,
BIN_OP_EQ_uxn_opcodes_h_l352_c11_1440_return_output);

-- t16_low_MUX_uxn_opcodes_h_l352_c7_562f
t16_low_MUX_uxn_opcodes_h_l352_c7_562f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l352_c7_562f_cond,
t16_low_MUX_uxn_opcodes_h_l352_c7_562f_iftrue,
t16_low_MUX_uxn_opcodes_h_l352_c7_562f_iffalse,
t16_low_MUX_uxn_opcodes_h_l352_c7_562f_return_output);

-- n16_high_MUX_uxn_opcodes_h_l352_c7_562f
n16_high_MUX_uxn_opcodes_h_l352_c7_562f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l352_c7_562f_cond,
n16_high_MUX_uxn_opcodes_h_l352_c7_562f_iftrue,
n16_high_MUX_uxn_opcodes_h_l352_c7_562f_iffalse,
n16_high_MUX_uxn_opcodes_h_l352_c7_562f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_562f
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_562f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_562f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_562f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_562f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_562f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_562f
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_562f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_562f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_562f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_562f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_562f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l352_c7_562f
result_u8_value_MUX_uxn_opcodes_h_l352_c7_562f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l352_c7_562f_cond,
result_u8_value_MUX_uxn_opcodes_h_l352_c7_562f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l352_c7_562f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l352_c7_562f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_562f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_562f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_562f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_562f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_562f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_562f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_562f
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_562f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_562f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_562f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_562f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_562f_return_output);

-- n16_low_MUX_uxn_opcodes_h_l352_c7_562f
n16_low_MUX_uxn_opcodes_h_l352_c7_562f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l352_c7_562f_cond,
n16_low_MUX_uxn_opcodes_h_l352_c7_562f_iftrue,
n16_low_MUX_uxn_opcodes_h_l352_c7_562f_iffalse,
n16_low_MUX_uxn_opcodes_h_l352_c7_562f_return_output);

-- t16_high_MUX_uxn_opcodes_h_l352_c7_562f
t16_high_MUX_uxn_opcodes_h_l352_c7_562f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l352_c7_562f_cond,
t16_high_MUX_uxn_opcodes_h_l352_c7_562f_iftrue,
t16_high_MUX_uxn_opcodes_h_l352_c7_562f_iffalse,
t16_high_MUX_uxn_opcodes_h_l352_c7_562f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l355_c11_4eff
BIN_OP_EQ_uxn_opcodes_h_l355_c11_4eff : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l355_c11_4eff_left,
BIN_OP_EQ_uxn_opcodes_h_l355_c11_4eff_right,
BIN_OP_EQ_uxn_opcodes_h_l355_c11_4eff_return_output);

-- t16_low_MUX_uxn_opcodes_h_l355_c7_803f
t16_low_MUX_uxn_opcodes_h_l355_c7_803f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l355_c7_803f_cond,
t16_low_MUX_uxn_opcodes_h_l355_c7_803f_iftrue,
t16_low_MUX_uxn_opcodes_h_l355_c7_803f_iffalse,
t16_low_MUX_uxn_opcodes_h_l355_c7_803f_return_output);

-- n16_high_MUX_uxn_opcodes_h_l355_c7_803f
n16_high_MUX_uxn_opcodes_h_l355_c7_803f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l355_c7_803f_cond,
n16_high_MUX_uxn_opcodes_h_l355_c7_803f_iftrue,
n16_high_MUX_uxn_opcodes_h_l355_c7_803f_iffalse,
n16_high_MUX_uxn_opcodes_h_l355_c7_803f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_803f
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_803f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_803f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_803f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_803f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_803f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_803f
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_803f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_803f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_803f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_803f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_803f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l355_c7_803f
result_u8_value_MUX_uxn_opcodes_h_l355_c7_803f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l355_c7_803f_cond,
result_u8_value_MUX_uxn_opcodes_h_l355_c7_803f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l355_c7_803f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l355_c7_803f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_803f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_803f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_803f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_803f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_803f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_803f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_803f
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_803f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_803f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_803f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_803f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_803f_return_output);

-- n16_low_MUX_uxn_opcodes_h_l355_c7_803f
n16_low_MUX_uxn_opcodes_h_l355_c7_803f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l355_c7_803f_cond,
n16_low_MUX_uxn_opcodes_h_l355_c7_803f_iftrue,
n16_low_MUX_uxn_opcodes_h_l355_c7_803f_iffalse,
n16_low_MUX_uxn_opcodes_h_l355_c7_803f_return_output);

-- t16_high_MUX_uxn_opcodes_h_l355_c7_803f
t16_high_MUX_uxn_opcodes_h_l355_c7_803f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l355_c7_803f_cond,
t16_high_MUX_uxn_opcodes_h_l355_c7_803f_iftrue,
t16_high_MUX_uxn_opcodes_h_l355_c7_803f_iffalse,
t16_high_MUX_uxn_opcodes_h_l355_c7_803f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l359_c11_6877
BIN_OP_EQ_uxn_opcodes_h_l359_c11_6877 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l359_c11_6877_left,
BIN_OP_EQ_uxn_opcodes_h_l359_c11_6877_right,
BIN_OP_EQ_uxn_opcodes_h_l359_c11_6877_return_output);

-- t16_low_MUX_uxn_opcodes_h_l359_c7_32c1
t16_low_MUX_uxn_opcodes_h_l359_c7_32c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l359_c7_32c1_cond,
t16_low_MUX_uxn_opcodes_h_l359_c7_32c1_iftrue,
t16_low_MUX_uxn_opcodes_h_l359_c7_32c1_iffalse,
t16_low_MUX_uxn_opcodes_h_l359_c7_32c1_return_output);

-- n16_high_MUX_uxn_opcodes_h_l359_c7_32c1
n16_high_MUX_uxn_opcodes_h_l359_c7_32c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l359_c7_32c1_cond,
n16_high_MUX_uxn_opcodes_h_l359_c7_32c1_iftrue,
n16_high_MUX_uxn_opcodes_h_l359_c7_32c1_iffalse,
n16_high_MUX_uxn_opcodes_h_l359_c7_32c1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_32c1
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_32c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_32c1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_32c1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_32c1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_32c1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_32c1
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_32c1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_32c1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_32c1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_32c1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_32c1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l359_c7_32c1
result_u8_value_MUX_uxn_opcodes_h_l359_c7_32c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l359_c7_32c1_cond,
result_u8_value_MUX_uxn_opcodes_h_l359_c7_32c1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l359_c7_32c1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l359_c7_32c1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_32c1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_32c1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_32c1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_32c1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_32c1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_32c1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_32c1
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_32c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_32c1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_32c1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_32c1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_32c1_return_output);

-- n16_low_MUX_uxn_opcodes_h_l359_c7_32c1
n16_low_MUX_uxn_opcodes_h_l359_c7_32c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l359_c7_32c1_cond,
n16_low_MUX_uxn_opcodes_h_l359_c7_32c1_iftrue,
n16_low_MUX_uxn_opcodes_h_l359_c7_32c1_iffalse,
n16_low_MUX_uxn_opcodes_h_l359_c7_32c1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l363_c11_f615
BIN_OP_EQ_uxn_opcodes_h_l363_c11_f615 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l363_c11_f615_left,
BIN_OP_EQ_uxn_opcodes_h_l363_c11_f615_right,
BIN_OP_EQ_uxn_opcodes_h_l363_c11_f615_return_output);

-- n16_high_MUX_uxn_opcodes_h_l363_c7_c81b
n16_high_MUX_uxn_opcodes_h_l363_c7_c81b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l363_c7_c81b_cond,
n16_high_MUX_uxn_opcodes_h_l363_c7_c81b_iftrue,
n16_high_MUX_uxn_opcodes_h_l363_c7_c81b_iffalse,
n16_high_MUX_uxn_opcodes_h_l363_c7_c81b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c81b
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c81b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c81b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c81b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c81b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c81b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c81b
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c81b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c81b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c81b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c81b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c81b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l363_c7_c81b
result_u8_value_MUX_uxn_opcodes_h_l363_c7_c81b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l363_c7_c81b_cond,
result_u8_value_MUX_uxn_opcodes_h_l363_c7_c81b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l363_c7_c81b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l363_c7_c81b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c81b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c81b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c81b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c81b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c81b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c81b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c81b
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c81b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c81b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c81b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c81b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c81b_return_output);

-- n16_low_MUX_uxn_opcodes_h_l363_c7_c81b
n16_low_MUX_uxn_opcodes_h_l363_c7_c81b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l363_c7_c81b_cond,
n16_low_MUX_uxn_opcodes_h_l363_c7_c81b_iftrue,
n16_low_MUX_uxn_opcodes_h_l363_c7_c81b_iffalse,
n16_low_MUX_uxn_opcodes_h_l363_c7_c81b_return_output);

-- sp_relative_shift_uxn_opcodes_h_l365_c30_2288
sp_relative_shift_uxn_opcodes_h_l365_c30_2288 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l365_c30_2288_ins,
sp_relative_shift_uxn_opcodes_h_l365_c30_2288_x,
sp_relative_shift_uxn_opcodes_h_l365_c30_2288_y,
sp_relative_shift_uxn_opcodes_h_l365_c30_2288_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l370_c11_c4e7
BIN_OP_EQ_uxn_opcodes_h_l370_c11_c4e7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l370_c11_c4e7_left,
BIN_OP_EQ_uxn_opcodes_h_l370_c11_c4e7_right,
BIN_OP_EQ_uxn_opcodes_h_l370_c11_c4e7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l370_c7_aeff
result_u8_value_MUX_uxn_opcodes_h_l370_c7_aeff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l370_c7_aeff_cond,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_aeff_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_aeff_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l370_c7_aeff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_aeff
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_aeff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_aeff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_aeff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_aeff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_aeff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_aeff
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_aeff : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_aeff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_aeff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_aeff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_aeff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_aeff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_aeff : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_aeff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_aeff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_aeff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_aeff_return_output);

-- n16_low_MUX_uxn_opcodes_h_l370_c7_aeff
n16_low_MUX_uxn_opcodes_h_l370_c7_aeff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l370_c7_aeff_cond,
n16_low_MUX_uxn_opcodes_h_l370_c7_aeff_iftrue,
n16_low_MUX_uxn_opcodes_h_l370_c7_aeff_iffalse,
n16_low_MUX_uxn_opcodes_h_l370_c7_aeff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l376_c11_6f6d
BIN_OP_EQ_uxn_opcodes_h_l376_c11_6f6d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l376_c11_6f6d_left,
BIN_OP_EQ_uxn_opcodes_h_l376_c11_6f6d_right,
BIN_OP_EQ_uxn_opcodes_h_l376_c11_6f6d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l376_c7_fc08
result_u8_value_MUX_uxn_opcodes_h_l376_c7_fc08 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l376_c7_fc08_cond,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_fc08_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_fc08_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l376_c7_fc08_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_fc08
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_fc08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_fc08_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_fc08_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_fc08_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_fc08_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_fc08
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_fc08 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_fc08_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_fc08_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_fc08_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_fc08_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l380_c11_a829
BIN_OP_EQ_uxn_opcodes_h_l380_c11_a829 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l380_c11_a829_left,
BIN_OP_EQ_uxn_opcodes_h_l380_c11_a829_right,
BIN_OP_EQ_uxn_opcodes_h_l380_c11_a829_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l380_c7_a316
result_u8_value_MUX_uxn_opcodes_h_l380_c7_a316 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l380_c7_a316_cond,
result_u8_value_MUX_uxn_opcodes_h_l380_c7_a316_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l380_c7_a316_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l380_c7_a316_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_a316
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_a316 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_a316_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_a316_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_a316_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_a316_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_a316
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_a316 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_a316_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_a316_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_a316_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_a316_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l384_c11_0130
BIN_OP_EQ_uxn_opcodes_h_l384_c11_0130 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l384_c11_0130_left,
BIN_OP_EQ_uxn_opcodes_h_l384_c11_0130_right,
BIN_OP_EQ_uxn_opcodes_h_l384_c11_0130_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l384_c7_f418
result_u8_value_MUX_uxn_opcodes_h_l384_c7_f418 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l384_c7_f418_cond,
result_u8_value_MUX_uxn_opcodes_h_l384_c7_f418_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l384_c7_f418_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l384_c7_f418_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_f418
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_f418 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_f418_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_f418_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_f418_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_f418_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_f418
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_f418 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_f418_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_f418_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_f418_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_f418_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l388_c11_8c91
BIN_OP_EQ_uxn_opcodes_h_l388_c11_8c91 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l388_c11_8c91_left,
BIN_OP_EQ_uxn_opcodes_h_l388_c11_8c91_right,
BIN_OP_EQ_uxn_opcodes_h_l388_c11_8c91_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l388_c7_5978
result_u8_value_MUX_uxn_opcodes_h_l388_c7_5978 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l388_c7_5978_cond,
result_u8_value_MUX_uxn_opcodes_h_l388_c7_5978_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l388_c7_5978_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l388_c7_5978_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_5978
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_5978 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_5978_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_5978_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_5978_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_5978_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_5978
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_5978 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_5978_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_5978_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_5978_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_5978_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l339_c6_3fb3_return_output,
 t16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output,
 n16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output,
 n16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output,
 t16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l352_c11_1440_return_output,
 t16_low_MUX_uxn_opcodes_h_l352_c7_562f_return_output,
 n16_high_MUX_uxn_opcodes_h_l352_c7_562f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_562f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_562f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l352_c7_562f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_562f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_562f_return_output,
 n16_low_MUX_uxn_opcodes_h_l352_c7_562f_return_output,
 t16_high_MUX_uxn_opcodes_h_l352_c7_562f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l355_c11_4eff_return_output,
 t16_low_MUX_uxn_opcodes_h_l355_c7_803f_return_output,
 n16_high_MUX_uxn_opcodes_h_l355_c7_803f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_803f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_803f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l355_c7_803f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_803f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_803f_return_output,
 n16_low_MUX_uxn_opcodes_h_l355_c7_803f_return_output,
 t16_high_MUX_uxn_opcodes_h_l355_c7_803f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l359_c11_6877_return_output,
 t16_low_MUX_uxn_opcodes_h_l359_c7_32c1_return_output,
 n16_high_MUX_uxn_opcodes_h_l359_c7_32c1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_32c1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_32c1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l359_c7_32c1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_32c1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_32c1_return_output,
 n16_low_MUX_uxn_opcodes_h_l359_c7_32c1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l363_c11_f615_return_output,
 n16_high_MUX_uxn_opcodes_h_l363_c7_c81b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c81b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c81b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l363_c7_c81b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c81b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c81b_return_output,
 n16_low_MUX_uxn_opcodes_h_l363_c7_c81b_return_output,
 sp_relative_shift_uxn_opcodes_h_l365_c30_2288_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l370_c11_c4e7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l370_c7_aeff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_aeff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_aeff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_aeff_return_output,
 n16_low_MUX_uxn_opcodes_h_l370_c7_aeff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l376_c11_6f6d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l376_c7_fc08_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_fc08_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_fc08_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l380_c11_a829_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l380_c7_a316_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_a316_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_a316_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l384_c11_0130_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l384_c7_f418_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_f418_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_f418_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l388_c11_8c91_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l388_c7_5978_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_5978_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_5978_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_3fb3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_3fb3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_3fb3_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_562f_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_562f_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l339_c2_bcf1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_562f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_bcf1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l344_c3_6e6d : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_562f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_bcf1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l339_c2_bcf1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_bcf1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l349_c3_d44b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_562f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_bcf1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_562f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_bcf1_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l339_c2_bcf1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_bcf1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_562f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_bcf1_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l339_c2_bcf1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_562f_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_562f_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_1440_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_1440_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_1440_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_562f_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_562f_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_803f_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_562f_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_562f_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_562f_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_803f_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_562f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_562f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_562f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_803f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_562f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_562f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_562f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_803f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_562f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_562f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_562f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_803f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_562f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_562f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l353_c3_5207 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_562f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_803f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_562f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_562f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_562f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_803f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_562f_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_562f_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_562f_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_803f_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_562f_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_562f_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_562f_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_803f_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_562f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_4eff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_4eff_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_4eff_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_803f_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_803f_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_32c1_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_803f_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_803f_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_803f_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_32c1_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_803f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_803f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_803f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_32c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_803f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_803f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_803f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_32c1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_803f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_803f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_803f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_32c1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_803f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_803f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_4f4f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_803f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_32c1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_803f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_803f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_803f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_32c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_803f_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_803f_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_803f_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_32c1_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_803f_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_803f_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_803f_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_803f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_6877_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_6877_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_6877_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_32c1_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_32c1_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_32c1_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_32c1_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_32c1_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_c81b_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_32c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_32c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_32c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c81b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_32c1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_32c1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_32c1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c81b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_32c1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_32c1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_32c1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_c81b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_32c1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_32c1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l361_c3_52f5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_32c1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c81b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_32c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_32c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_32c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c81b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_32c1_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_32c1_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_32c1_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_c81b_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_32c1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_f615_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_f615_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_f615_return_output : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_c81b_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_c81b_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_c81b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c81b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c81b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_aeff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c81b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c81b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c81b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_aeff_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c81b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_c81b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_c81b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_aeff_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_c81b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c81b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_465b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c81b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_aeff_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c81b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c81b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c81b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c81b_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_c81b_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_c81b_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_aeff_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_c81b_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_2288_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_2288_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_2288_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_2288_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_c4e7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_c4e7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_c4e7_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_aeff_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_aeff_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_fc08_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_aeff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_aeff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_aeff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_fc08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_aeff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_aeff_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l372_c3_e562 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_aeff_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_aeff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_aeff_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l373_c3_1ba5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_aeff_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_fc08_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_aeff_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_aeff_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_aeff_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_aeff_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_6f6d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_6f6d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_6f6d_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_fc08_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_fc08_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_a316_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_fc08_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_fc08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_fc08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_a316_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_fc08_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_fc08_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_b923 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_fc08_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_a316_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_fc08_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_a829_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_a829_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_a829_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_a316_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_a316_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_f418_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_a316_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_a316_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_a316_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_f418_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_a316_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_a316_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_6fd6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_a316_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_f418_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_a316_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_0130_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_0130_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_0130_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_f418_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_f418_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_5978_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_f418_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_f418_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_f418_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_5978_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_f418_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_f418_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_ea65 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_f418_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_5978_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_f418_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_8c91_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_8c91_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_8c91_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_5978_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_5978_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_5978_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_5978_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_5978_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_5978_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_5978_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_70d4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_5978_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l388_c7_5978_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_5978_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_7538_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l359_l388_l355_l384_l352_l380_l376_l370_l363_DUPLICATE_8fe6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l355_l370_l359_l352_DUPLICATE_6385_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l355_l359_l352_l363_DUPLICATE_983e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l394_l335_DUPLICATE_7812_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l349_c3_d44b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l349_c3_d44b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_3fb3_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_4eff_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_ea65 := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_f418_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l385_c3_ea65;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_8c91_right := to_unsigned(9, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_6877_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_1440_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_6fd6 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_a316_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l381_c3_6fd6;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c81b_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_70d4 := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_5978_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l389_c3_70d4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l361_c3_52f5 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_32c1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l361_c3_52f5;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_5978_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l373_c3_1ba5 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_aeff_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l373_c3_1ba5;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_f615_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_4f4f := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_803f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_4f4f;
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_2288_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_a829_right := to_unsigned(7, 3);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_0130_right := to_unsigned(8, 4);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l344_c3_6e6d := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l344_c3_6e6d;
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_2288_y := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_6f6d_right := to_unsigned(6, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l353_c3_5207 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_562f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l353_c3_5207;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_c4e7_right := to_unsigned(5, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l372_c3_e562 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_aeff_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l372_c3_e562;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_465b := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c81b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l367_c3_465b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_b923 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_fc08_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l377_c3_b923;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_2288_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_562f_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_803f_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_32c1_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_c81b_iffalse := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_a316_iftrue := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_5978_iftrue := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_562f_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_803f_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_32c1_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_c81b_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_aeff_iffalse := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_fc08_iftrue := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_f418_iftrue := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_3fb3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_1440_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_4eff_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_6877_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_f615_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_c4e7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_6f6d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_a829_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_0130_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_8c91_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_c81b_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_aeff_iftrue := VAR_previous_stack_read;
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_803f_iftrue := VAR_previous_stack_read;
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_32c1_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_aeff_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_562f_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_803f_iffalse := t16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_c81b_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_562f_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_803f_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_32c1_iffalse := t16_low;
     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l339_c2_bcf1] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l339_c2_bcf1_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l388_c11_8c91] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l388_c11_8c91_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_8c91_left;
     BIN_OP_EQ_uxn_opcodes_h_l388_c11_8c91_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_8c91_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_8c91_return_output := BIN_OP_EQ_uxn_opcodes_h_l388_c11_8c91_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l376_c11_6f6d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l376_c11_6f6d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_6f6d_left;
     BIN_OP_EQ_uxn_opcodes_h_l376_c11_6f6d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_6f6d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_6f6d_return_output := BIN_OP_EQ_uxn_opcodes_h_l376_c11_6f6d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l380_c11_a829] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l380_c11_a829_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_a829_left;
     BIN_OP_EQ_uxn_opcodes_h_l380_c11_a829_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_a829_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_a829_return_output := BIN_OP_EQ_uxn_opcodes_h_l380_c11_a829_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l352_c11_1440] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l352_c11_1440_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_1440_left;
     BIN_OP_EQ_uxn_opcodes_h_l352_c11_1440_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_1440_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_1440_return_output := BIN_OP_EQ_uxn_opcodes_h_l352_c11_1440_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l384_c11_0130] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l384_c11_0130_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_0130_left;
     BIN_OP_EQ_uxn_opcodes_h_l384_c11_0130_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_0130_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_0130_return_output := BIN_OP_EQ_uxn_opcodes_h_l384_c11_0130_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l359_l388_l355_l384_l352_l380_l376_l370_l363_DUPLICATE_8fe6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l359_l388_l355_l384_l352_l380_l376_l370_l363_DUPLICATE_8fe6_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l359_c11_6877] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l359_c11_6877_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_6877_left;
     BIN_OP_EQ_uxn_opcodes_h_l359_c11_6877_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_6877_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_6877_return_output := BIN_OP_EQ_uxn_opcodes_h_l359_c11_6877_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l363_c11_f615] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l363_c11_f615_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_f615_left;
     BIN_OP_EQ_uxn_opcodes_h_l363_c11_f615_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_f615_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_f615_return_output := BIN_OP_EQ_uxn_opcodes_h_l363_c11_f615_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l339_c6_3fb3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l339_c6_3fb3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_3fb3_left;
     BIN_OP_EQ_uxn_opcodes_h_l339_c6_3fb3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_3fb3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_3fb3_return_output := BIN_OP_EQ_uxn_opcodes_h_l339_c6_3fb3_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l355_l370_l359_l352_DUPLICATE_6385 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l355_l370_l359_l352_DUPLICATE_6385_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_7538 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_7538_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l355_c11_4eff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l355_c11_4eff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_4eff_left;
     BIN_OP_EQ_uxn_opcodes_h_l355_c11_4eff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_4eff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_4eff_return_output := BIN_OP_EQ_uxn_opcodes_h_l355_c11_4eff_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l339_c2_bcf1] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l339_c2_bcf1_return_output := result.is_pc_updated;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l339_c2_bcf1] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l339_c2_bcf1_return_output := result.is_vram_write;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l388_c7_5978] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l388_c7_5978_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l355_l359_l352_l363_DUPLICATE_983e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l355_l359_l352_l363_DUPLICATE_983e_return_output := result.is_stack_write;

     -- sp_relative_shift[uxn_opcodes_h_l365_c30_2288] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l365_c30_2288_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_2288_ins;
     sp_relative_shift_uxn_opcodes_h_l365_c30_2288_x <= VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_2288_x;
     sp_relative_shift_uxn_opcodes_h_l365_c30_2288_y <= VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_2288_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_2288_return_output := sp_relative_shift_uxn_opcodes_h_l365_c30_2288_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l339_c2_bcf1] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l339_c2_bcf1_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l370_c11_c4e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l370_c11_c4e7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_c4e7_left;
     BIN_OP_EQ_uxn_opcodes_h_l370_c11_c4e7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_c4e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_c4e7_return_output := BIN_OP_EQ_uxn_opcodes_h_l370_c11_c4e7_return_output;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_3fb3_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_3fb3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_bcf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_3fb3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_bcf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_3fb3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_3fb3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_bcf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_3fb3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_bcf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_3fb3_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_3fb3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_bcf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_3fb3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_bcf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_3fb3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_bcf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_3fb3_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_3fb3_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c6_3fb3_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_562f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_1440_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_562f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_1440_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_562f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_1440_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_562f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_1440_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_562f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_1440_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_562f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_1440_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_562f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_1440_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_562f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_1440_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_562f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_1440_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_803f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_4eff_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_803f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_4eff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_803f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_4eff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_803f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_4eff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_803f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_4eff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_803f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_4eff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_803f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_4eff_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_803f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_4eff_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_803f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l355_c11_4eff_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_32c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_6877_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_32c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_6877_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_32c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_6877_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_32c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_6877_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_32c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_6877_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_32c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_6877_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_32c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_6877_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_32c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l359_c11_6877_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_c81b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_f615_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_c81b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_f615_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c81b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_f615_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c81b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_f615_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c81b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_f615_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c81b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_f615_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_c81b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l363_c11_f615_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_aeff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_c4e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_aeff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_c4e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_aeff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_c4e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_aeff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_c4e7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_aeff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l370_c11_c4e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_fc08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_6f6d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_fc08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_6f6d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_fc08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l376_c11_6f6d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_a316_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_a829_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_a316_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_a829_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_a316_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l380_c11_a829_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_f418_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_0130_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_f418_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_0130_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_f418_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l384_c11_0130_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_5978_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_8c91_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_5978_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_8c91_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_5978_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l388_c11_8c91_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_562f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l355_l370_l359_l352_DUPLICATE_6385_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_803f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l355_l370_l359_l352_DUPLICATE_6385_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_32c1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l355_l370_l359_l352_DUPLICATE_6385_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_aeff_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l355_l370_l359_l352_DUPLICATE_6385_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_562f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l359_l388_l355_l384_l352_l380_l376_l370_l363_DUPLICATE_8fe6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_803f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l359_l388_l355_l384_l352_l380_l376_l370_l363_DUPLICATE_8fe6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_32c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l359_l388_l355_l384_l352_l380_l376_l370_l363_DUPLICATE_8fe6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c81b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l359_l388_l355_l384_l352_l380_l376_l370_l363_DUPLICATE_8fe6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_aeff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l359_l388_l355_l384_l352_l380_l376_l370_l363_DUPLICATE_8fe6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_fc08_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l359_l388_l355_l384_l352_l380_l376_l370_l363_DUPLICATE_8fe6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_a316_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l359_l388_l355_l384_l352_l380_l376_l370_l363_DUPLICATE_8fe6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_f418_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l359_l388_l355_l384_l352_l380_l376_l370_l363_DUPLICATE_8fe6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_5978_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l359_l388_l355_l384_l352_l380_l376_l370_l363_DUPLICATE_8fe6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_562f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l355_l359_l352_l363_DUPLICATE_983e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_803f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l355_l359_l352_l363_DUPLICATE_983e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_32c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l355_l359_l352_l363_DUPLICATE_983e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c81b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l355_l359_l352_l363_DUPLICATE_983e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_7538_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_562f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_7538_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_803f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_7538_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_32c1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_7538_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_5978_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l359_l388_l355_l352_l339_DUPLICATE_7538_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l339_c2_bcf1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l339_c2_bcf1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l339_c2_bcf1_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l339_c2_bcf1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_5978_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l388_c7_5978_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c81b_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l365_c30_2288_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l388_c7_5978] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l388_c7_5978_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_5978_cond;
     result_u8_value_MUX_uxn_opcodes_h_l388_c7_5978_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_5978_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l388_c7_5978_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_5978_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_5978_return_output := result_u8_value_MUX_uxn_opcodes_h_l388_c7_5978_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l388_c7_5978] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_5978_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_5978_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_5978_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_5978_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_5978_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_5978_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_5978_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_5978_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l339_c2_bcf1] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_bcf1_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_bcf1_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l359_c7_32c1] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l359_c7_32c1_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_32c1_cond;
     t16_low_MUX_uxn_opcodes_h_l359_c7_32c1_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_32c1_iftrue;
     t16_low_MUX_uxn_opcodes_h_l359_c7_32c1_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_32c1_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_32c1_return_output := t16_low_MUX_uxn_opcodes_h_l359_c7_32c1_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l363_c7_c81b] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l363_c7_c81b_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_c81b_cond;
     n16_high_MUX_uxn_opcodes_h_l363_c7_c81b_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_c81b_iftrue;
     n16_high_MUX_uxn_opcodes_h_l363_c7_c81b_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_c81b_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_c81b_return_output := n16_high_MUX_uxn_opcodes_h_l363_c7_c81b_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l339_c2_bcf1] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l388_c7_5978] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_5978_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_5978_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_5978_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_5978_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_5978_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_5978_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_5978_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_5978_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l370_c7_aeff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_aeff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_aeff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_aeff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_aeff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_aeff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_aeff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_aeff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_aeff_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l339_c2_bcf1] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l355_c7_803f] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l355_c7_803f_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_803f_cond;
     t16_high_MUX_uxn_opcodes_h_l355_c7_803f_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_803f_iftrue;
     t16_high_MUX_uxn_opcodes_h_l355_c7_803f_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_803f_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_803f_return_output := t16_high_MUX_uxn_opcodes_h_l355_c7_803f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l339_c2_bcf1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_bcf1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_bcf1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l370_c7_aeff] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l370_c7_aeff_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_aeff_cond;
     n16_low_MUX_uxn_opcodes_h_l370_c7_aeff_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_aeff_iftrue;
     n16_low_MUX_uxn_opcodes_h_l370_c7_aeff_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_aeff_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_aeff_return_output := n16_low_MUX_uxn_opcodes_h_l370_c7_aeff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l363_c7_c81b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c81b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c81b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c81b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c81b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c81b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c81b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c81b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c81b_return_output;

     -- Submodule level 2
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_32c1_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l363_c7_c81b_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_c81b_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l370_c7_aeff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_f418_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l388_c7_5978_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_32c1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l363_c7_c81b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c81b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l370_c7_aeff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_f418_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l388_c7_5978_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_f418_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l388_c7_5978_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_562f_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l355_c7_803f_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_803f_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l359_c7_32c1_return_output;
     -- t16_high_MUX[uxn_opcodes_h_l352_c7_562f] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l352_c7_562f_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_562f_cond;
     t16_high_MUX_uxn_opcodes_h_l352_c7_562f_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_562f_iftrue;
     t16_high_MUX_uxn_opcodes_h_l352_c7_562f_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_562f_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_562f_return_output := t16_high_MUX_uxn_opcodes_h_l352_c7_562f_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l355_c7_803f] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l355_c7_803f_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_803f_cond;
     t16_low_MUX_uxn_opcodes_h_l355_c7_803f_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_803f_iftrue;
     t16_low_MUX_uxn_opcodes_h_l355_c7_803f_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_803f_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_803f_return_output := t16_low_MUX_uxn_opcodes_h_l355_c7_803f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l384_c7_f418] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_f418_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_f418_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_f418_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_f418_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_f418_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_f418_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_f418_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_f418_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l363_c7_c81b] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l363_c7_c81b_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_c81b_cond;
     n16_low_MUX_uxn_opcodes_h_l363_c7_c81b_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_c81b_iftrue;
     n16_low_MUX_uxn_opcodes_h_l363_c7_c81b_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_c81b_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_c81b_return_output := n16_low_MUX_uxn_opcodes_h_l363_c7_c81b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l384_c7_f418] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l384_c7_f418_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_f418_cond;
     result_u8_value_MUX_uxn_opcodes_h_l384_c7_f418_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_f418_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l384_c7_f418_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_f418_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_f418_return_output := result_u8_value_MUX_uxn_opcodes_h_l384_c7_f418_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l359_c7_32c1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_32c1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_32c1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_32c1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_32c1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_32c1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_32c1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_32c1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_32c1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l363_c7_c81b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c81b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c81b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c81b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c81b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c81b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c81b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c81b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c81b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l384_c7_f418] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_f418_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_f418_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_f418_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_f418_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_f418_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_f418_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_f418_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_f418_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l359_c7_32c1] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l359_c7_32c1_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_32c1_cond;
     n16_high_MUX_uxn_opcodes_h_l359_c7_32c1_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_32c1_iftrue;
     n16_high_MUX_uxn_opcodes_h_l359_c7_32c1_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_32c1_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_32c1_return_output := n16_high_MUX_uxn_opcodes_h_l359_c7_32c1_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_803f_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l359_c7_32c1_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_32c1_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l363_c7_c81b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_a316_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l384_c7_f418_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_803f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l359_c7_32c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_32c1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l363_c7_c81b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_a316_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l384_c7_f418_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_a316_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l384_c7_f418_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l352_c7_562f_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_562f_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l355_c7_803f_return_output;
     -- t16_low_MUX[uxn_opcodes_h_l352_c7_562f] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l352_c7_562f_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_562f_cond;
     t16_low_MUX_uxn_opcodes_h_l352_c7_562f_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_562f_iftrue;
     t16_low_MUX_uxn_opcodes_h_l352_c7_562f_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_562f_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_562f_return_output := t16_low_MUX_uxn_opcodes_h_l352_c7_562f_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l339_c2_bcf1] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_cond;
     t16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue;
     t16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output := t16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l380_c7_a316] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l380_c7_a316_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_a316_cond;
     result_u8_value_MUX_uxn_opcodes_h_l380_c7_a316_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_a316_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l380_c7_a316_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_a316_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_a316_return_output := result_u8_value_MUX_uxn_opcodes_h_l380_c7_a316_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l355_c7_803f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_803f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_803f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_803f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_803f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_803f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_803f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_803f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_803f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l359_c7_32c1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_32c1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_32c1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_32c1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_32c1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_32c1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_32c1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_32c1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_32c1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l380_c7_a316] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_a316_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_a316_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_a316_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_a316_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_a316_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_a316_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_a316_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_a316_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l355_c7_803f] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l355_c7_803f_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_803f_cond;
     n16_high_MUX_uxn_opcodes_h_l355_c7_803f_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_803f_iftrue;
     n16_high_MUX_uxn_opcodes_h_l355_c7_803f_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_803f_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_803f_return_output := n16_high_MUX_uxn_opcodes_h_l355_c7_803f_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l359_c7_32c1] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l359_c7_32c1_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_32c1_cond;
     n16_low_MUX_uxn_opcodes_h_l359_c7_32c1_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_32c1_iftrue;
     n16_low_MUX_uxn_opcodes_h_l359_c7_32c1_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_32c1_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_32c1_return_output := n16_low_MUX_uxn_opcodes_h_l359_c7_32c1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l380_c7_a316] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_a316_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_a316_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_a316_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_a316_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_a316_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_a316_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_a316_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_a316_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_562f_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l355_c7_803f_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_803f_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l359_c7_32c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_fc08_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l380_c7_a316_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_562f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l355_c7_803f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_803f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l359_c7_32c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_fc08_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l380_c7_a316_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_fc08_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l380_c7_a316_return_output;
     REG_VAR_t16_high := VAR_t16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l352_c7_562f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l376_c7_fc08] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_fc08_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_fc08_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_fc08_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_fc08_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_fc08_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_fc08_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_fc08_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_fc08_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l376_c7_fc08] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_fc08_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_fc08_cond;
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_fc08_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_fc08_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l376_c7_fc08_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_fc08_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_fc08_return_output := result_u8_value_MUX_uxn_opcodes_h_l376_c7_fc08_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l339_c2_bcf1] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_cond;
     t16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue;
     t16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output := t16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l355_c7_803f] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l355_c7_803f_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_803f_cond;
     n16_low_MUX_uxn_opcodes_h_l355_c7_803f_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_803f_iftrue;
     n16_low_MUX_uxn_opcodes_h_l355_c7_803f_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_803f_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_803f_return_output := n16_low_MUX_uxn_opcodes_h_l355_c7_803f_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l352_c7_562f] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l352_c7_562f_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_562f_cond;
     n16_high_MUX_uxn_opcodes_h_l352_c7_562f_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_562f_iftrue;
     n16_high_MUX_uxn_opcodes_h_l352_c7_562f_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_562f_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_562f_return_output := n16_high_MUX_uxn_opcodes_h_l352_c7_562f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l352_c7_562f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_562f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_562f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_562f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_562f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_562f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_562f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_562f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_562f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l355_c7_803f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_803f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_803f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_803f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_803f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_803f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_803f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_803f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_803f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l376_c7_fc08] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_fc08_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_fc08_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_fc08_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_fc08_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_fc08_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_fc08_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_fc08_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_fc08_return_output;

     -- Submodule level 5
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l352_c7_562f_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_562f_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l355_c7_803f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_aeff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l376_c7_fc08_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_562f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_562f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l355_c7_803f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_aeff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l376_c7_fc08_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_aeff_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l376_c7_fc08_return_output;
     REG_VAR_t16_low := VAR_t16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l352_c7_562f] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l352_c7_562f_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_562f_cond;
     n16_low_MUX_uxn_opcodes_h_l352_c7_562f_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_562f_iftrue;
     n16_low_MUX_uxn_opcodes_h_l352_c7_562f_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_562f_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_562f_return_output := n16_low_MUX_uxn_opcodes_h_l352_c7_562f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l370_c7_aeff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_aeff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_aeff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_aeff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_aeff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_aeff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_aeff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_aeff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_aeff_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l352_c7_562f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_562f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_562f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_562f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_562f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_562f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_562f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_562f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_562f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l370_c7_aeff] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_aeff_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_aeff_cond;
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_aeff_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_aeff_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l370_c7_aeff_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_aeff_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_aeff_return_output := result_u8_value_MUX_uxn_opcodes_h_l370_c7_aeff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l370_c7_aeff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_aeff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_aeff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_aeff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_aeff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_aeff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_aeff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_aeff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_aeff_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l339_c2_bcf1] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_cond;
     n16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue;
     n16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output := n16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l339_c2_bcf1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_bcf1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_bcf1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output;

     -- Submodule level 6
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l352_c7_562f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c81b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l370_c7_aeff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l352_c7_562f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c81b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l370_c7_aeff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_c81b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l370_c7_aeff_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l339_c2_bcf1] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_cond;
     n16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue;
     n16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output := n16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l363_c7_c81b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l363_c7_c81b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_c81b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l363_c7_c81b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_c81b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l363_c7_c81b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_c81b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_c81b_return_output := result_u8_value_MUX_uxn_opcodes_h_l363_c7_c81b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l363_c7_c81b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c81b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c81b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c81b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c81b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c81b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c81b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c81b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c81b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l339_c2_bcf1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_bcf1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_bcf1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l363_c7_c81b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c81b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c81b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c81b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c81b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c81b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c81b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c81b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c81b_return_output;

     -- Submodule level 7
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_32c1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l363_c7_c81b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_32c1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l363_c7_c81b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_32c1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l363_c7_c81b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l359_c7_32c1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_32c1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_32c1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_32c1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_32c1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_32c1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_32c1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_32c1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_32c1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l359_c7_32c1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l359_c7_32c1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_32c1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l359_c7_32c1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_32c1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l359_c7_32c1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_32c1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_32c1_return_output := result_u8_value_MUX_uxn_opcodes_h_l359_c7_32c1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l359_c7_32c1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_32c1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_32c1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_32c1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_32c1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_32c1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_32c1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_32c1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_32c1_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_803f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l359_c7_32c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_803f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l359_c7_32c1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_803f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l359_c7_32c1_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l355_c7_803f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_803f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_803f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_803f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_803f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_803f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_803f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_803f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_803f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l355_c7_803f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l355_c7_803f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_803f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l355_c7_803f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_803f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l355_c7_803f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_803f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_803f_return_output := result_u8_value_MUX_uxn_opcodes_h_l355_c7_803f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l355_c7_803f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_803f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_803f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_803f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_803f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_803f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_803f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_803f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_803f_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_562f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l355_c7_803f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_562f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l355_c7_803f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_562f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l355_c7_803f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l352_c7_562f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_562f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_562f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_562f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_562f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_562f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_562f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_562f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_562f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l352_c7_562f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l352_c7_562f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_562f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l352_c7_562f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_562f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l352_c7_562f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_562f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_562f_return_output := result_u8_value_MUX_uxn_opcodes_h_l352_c7_562f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l352_c7_562f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_562f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_562f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_562f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_562f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_562f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_562f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_562f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_562f_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_562f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_562f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l352_c7_562f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l339_c2_bcf1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_bcf1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_bcf1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l339_c2_bcf1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l339_c2_bcf1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_bcf1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output := result_u8_value_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l339_c2_bcf1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_bcf1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_bcf1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_bcf1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_bcf1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l394_l335_DUPLICATE_7812 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l394_l335_DUPLICATE_7812_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a47b(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l339_c2_bcf1_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l394_l335_DUPLICATE_7812_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l394_l335_DUPLICATE_7812_return_output;
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
