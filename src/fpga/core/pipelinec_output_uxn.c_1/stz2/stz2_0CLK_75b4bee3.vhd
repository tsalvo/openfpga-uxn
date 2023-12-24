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
-- Submodules: 53
entity stz2_0CLK_75b4bee3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end stz2_0CLK_75b4bee3;
architecture arch of stz2_0CLK_75b4bee3 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16_low : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16_high : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n16_low : unsigned(7 downto 0);
signal REG_COMB_n16_high : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1574_c6_00aa]
signal BIN_OP_EQ_uxn_opcodes_h_l1574_c6_00aa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1574_c6_00aa_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1574_c6_00aa_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1574_c2_8b1d]
signal n16_low_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1574_c2_8b1d]
signal t8_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1574_c2_8b1d]
signal n16_high_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1574_c2_8b1d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1574_c2_8b1d]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1574_c2_8b1d]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1574_c2_8b1d]
signal result_u8_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1574_c2_8b1d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1574_c2_8b1d]
signal result_u16_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1574_c2_8b1d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1574_c2_8b1d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1574_c2_8b1d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1574_c2_8b1d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1587_c11_633b]
signal BIN_OP_EQ_uxn_opcodes_h_l1587_c11_633b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1587_c11_633b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1587_c11_633b_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1587_c7_ce44]
signal n16_low_MUX_uxn_opcodes_h_l1587_c7_ce44_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1587_c7_ce44]
signal t8_MUX_uxn_opcodes_h_l1587_c7_ce44_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1587_c7_ce44]
signal n16_high_MUX_uxn_opcodes_h_l1587_c7_ce44_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1587_c7_ce44]
signal result_u16_value_MUX_uxn_opcodes_h_l1587_c7_ce44_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1587_c7_ce44]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1587_c7_ce44_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1587_c7_ce44]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_ce44_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1587_c7_ce44]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_ce44_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1587_c7_ce44]
signal result_u8_value_MUX_uxn_opcodes_h_l1587_c7_ce44_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1587_c7_ce44]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_ce44_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1590_c11_8303]
signal BIN_OP_EQ_uxn_opcodes_h_l1590_c11_8303_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1590_c11_8303_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1590_c11_8303_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1590_c7_dcdc]
signal n16_low_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1590_c7_dcdc]
signal t8_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1590_c7_dcdc]
signal n16_high_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1590_c7_dcdc]
signal result_u16_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1590_c7_dcdc]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1590_c7_dcdc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1590_c7_dcdc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1590_c7_dcdc]
signal result_u8_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1590_c7_dcdc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1594_c11_7831]
signal BIN_OP_EQ_uxn_opcodes_h_l1594_c11_7831_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1594_c11_7831_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1594_c11_7831_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1594_c7_a83c]
signal n16_low_MUX_uxn_opcodes_h_l1594_c7_a83c_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1594_c7_a83c_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1594_c7_a83c_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1594_c7_a83c_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1594_c7_a83c]
signal n16_high_MUX_uxn_opcodes_h_l1594_c7_a83c_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1594_c7_a83c_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1594_c7_a83c_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1594_c7_a83c_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1594_c7_a83c]
signal result_u16_value_MUX_uxn_opcodes_h_l1594_c7_a83c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1594_c7_a83c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1594_c7_a83c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1594_c7_a83c_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1594_c7_a83c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_a83c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_a83c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_a83c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_a83c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1594_c7_a83c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_a83c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_a83c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_a83c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_a83c_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1594_c7_a83c]
signal result_u8_value_MUX_uxn_opcodes_h_l1594_c7_a83c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1594_c7_a83c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1594_c7_a83c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1594_c7_a83c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1594_c7_a83c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_a83c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_a83c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_a83c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_a83c_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1596_c30_e339]
signal sp_relative_shift_uxn_opcodes_h_l1596_c30_e339_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1596_c30_e339_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1596_c30_e339_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1596_c30_e339_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1601_c11_c135]
signal BIN_OP_EQ_uxn_opcodes_h_l1601_c11_c135_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1601_c11_c135_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1601_c11_c135_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1601_c7_4e44]
signal n16_low_MUX_uxn_opcodes_h_l1601_c7_4e44_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1601_c7_4e44_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1601_c7_4e44_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1601_c7_4e44_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1601_c7_4e44]
signal result_u16_value_MUX_uxn_opcodes_h_l1601_c7_4e44_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1601_c7_4e44_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1601_c7_4e44_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1601_c7_4e44_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1601_c7_4e44]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_4e44_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_4e44_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_4e44_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_4e44_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1601_c7_4e44]
signal result_u8_value_MUX_uxn_opcodes_h_l1601_c7_4e44_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1601_c7_4e44_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1601_c7_4e44_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1601_c7_4e44_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1601_c7_4e44]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_4e44_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_4e44_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_4e44_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_4e44_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1604_c33_a725]
signal BIN_OP_PLUS_uxn_opcodes_h_l1604_c33_a725_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1604_c33_a725_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1604_c33_a725_return_output : unsigned(8 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint9_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(8 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_775a( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.u16_value := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;
      base.is_ram_write := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1574_c6_00aa
BIN_OP_EQ_uxn_opcodes_h_l1574_c6_00aa : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1574_c6_00aa_left,
BIN_OP_EQ_uxn_opcodes_h_l1574_c6_00aa_right,
BIN_OP_EQ_uxn_opcodes_h_l1574_c6_00aa_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1574_c2_8b1d
n16_low_MUX_uxn_opcodes_h_l1574_c2_8b1d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond,
n16_low_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue,
n16_low_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse,
n16_low_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output);

-- t8_MUX_uxn_opcodes_h_l1574_c2_8b1d
t8_MUX_uxn_opcodes_h_l1574_c2_8b1d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond,
t8_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue,
t8_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse,
t8_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1574_c2_8b1d
n16_high_MUX_uxn_opcodes_h_l1574_c2_8b1d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond,
n16_high_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue,
n16_high_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse,
n16_high_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1574_c2_8b1d
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c2_8b1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d
result_is_vram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c2_8b1d
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c2_8b1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1574_c2_8b1d
result_u8_value_MUX_uxn_opcodes_h_l1574_c2_8b1d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1574_c2_8b1d
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c2_8b1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1574_c2_8b1d
result_u16_value_MUX_uxn_opcodes_h_l1574_c2_8b1d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond,
result_u16_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c2_8b1d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c2_8b1d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1574_c2_8b1d
result_is_pc_updated_MUX_uxn_opcodes_h_l1574_c2_8b1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c2_8b1d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c2_8b1d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d
result_is_ram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1587_c11_633b
BIN_OP_EQ_uxn_opcodes_h_l1587_c11_633b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1587_c11_633b_left,
BIN_OP_EQ_uxn_opcodes_h_l1587_c11_633b_right,
BIN_OP_EQ_uxn_opcodes_h_l1587_c11_633b_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1587_c7_ce44
n16_low_MUX_uxn_opcodes_h_l1587_c7_ce44 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1587_c7_ce44_cond,
n16_low_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue,
n16_low_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse,
n16_low_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output);

-- t8_MUX_uxn_opcodes_h_l1587_c7_ce44
t8_MUX_uxn_opcodes_h_l1587_c7_ce44 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1587_c7_ce44_cond,
t8_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue,
t8_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse,
t8_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1587_c7_ce44
n16_high_MUX_uxn_opcodes_h_l1587_c7_ce44 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1587_c7_ce44_cond,
n16_high_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue,
n16_high_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse,
n16_high_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1587_c7_ce44
result_u16_value_MUX_uxn_opcodes_h_l1587_c7_ce44 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1587_c7_ce44_cond,
result_u16_value_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1587_c7_ce44
result_is_ram_write_MUX_uxn_opcodes_h_l1587_c7_ce44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1587_c7_ce44_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_ce44
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_ce44 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_ce44_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_ce44
result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_ce44 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_ce44_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1587_c7_ce44
result_u8_value_MUX_uxn_opcodes_h_l1587_c7_ce44 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1587_c7_ce44_cond,
result_u8_value_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_ce44
result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_ce44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_ce44_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1590_c11_8303
BIN_OP_EQ_uxn_opcodes_h_l1590_c11_8303 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1590_c11_8303_left,
BIN_OP_EQ_uxn_opcodes_h_l1590_c11_8303_right,
BIN_OP_EQ_uxn_opcodes_h_l1590_c11_8303_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1590_c7_dcdc
n16_low_MUX_uxn_opcodes_h_l1590_c7_dcdc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond,
n16_low_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue,
n16_low_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse,
n16_low_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output);

-- t8_MUX_uxn_opcodes_h_l1590_c7_dcdc
t8_MUX_uxn_opcodes_h_l1590_c7_dcdc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond,
t8_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue,
t8_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse,
t8_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1590_c7_dcdc
n16_high_MUX_uxn_opcodes_h_l1590_c7_dcdc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond,
n16_high_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue,
n16_high_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse,
n16_high_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1590_c7_dcdc
result_u16_value_MUX_uxn_opcodes_h_l1590_c7_dcdc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond,
result_u16_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1590_c7_dcdc
result_is_ram_write_MUX_uxn_opcodes_h_l1590_c7_dcdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_dcdc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_dcdc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_dcdc
result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_dcdc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1590_c7_dcdc
result_u8_value_MUX_uxn_opcodes_h_l1590_c7_dcdc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond,
result_u8_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_dcdc
result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_dcdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1594_c11_7831
BIN_OP_EQ_uxn_opcodes_h_l1594_c11_7831 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1594_c11_7831_left,
BIN_OP_EQ_uxn_opcodes_h_l1594_c11_7831_right,
BIN_OP_EQ_uxn_opcodes_h_l1594_c11_7831_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1594_c7_a83c
n16_low_MUX_uxn_opcodes_h_l1594_c7_a83c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1594_c7_a83c_cond,
n16_low_MUX_uxn_opcodes_h_l1594_c7_a83c_iftrue,
n16_low_MUX_uxn_opcodes_h_l1594_c7_a83c_iffalse,
n16_low_MUX_uxn_opcodes_h_l1594_c7_a83c_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1594_c7_a83c
n16_high_MUX_uxn_opcodes_h_l1594_c7_a83c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1594_c7_a83c_cond,
n16_high_MUX_uxn_opcodes_h_l1594_c7_a83c_iftrue,
n16_high_MUX_uxn_opcodes_h_l1594_c7_a83c_iffalse,
n16_high_MUX_uxn_opcodes_h_l1594_c7_a83c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1594_c7_a83c
result_u16_value_MUX_uxn_opcodes_h_l1594_c7_a83c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1594_c7_a83c_cond,
result_u16_value_MUX_uxn_opcodes_h_l1594_c7_a83c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1594_c7_a83c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1594_c7_a83c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_a83c
result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_a83c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_a83c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_a83c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_a83c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_a83c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_a83c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_a83c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_a83c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_a83c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_a83c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_a83c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1594_c7_a83c
result_u8_value_MUX_uxn_opcodes_h_l1594_c7_a83c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1594_c7_a83c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1594_c7_a83c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1594_c7_a83c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1594_c7_a83c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_a83c
result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_a83c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_a83c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_a83c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_a83c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_a83c_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1596_c30_e339
sp_relative_shift_uxn_opcodes_h_l1596_c30_e339 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1596_c30_e339_ins,
sp_relative_shift_uxn_opcodes_h_l1596_c30_e339_x,
sp_relative_shift_uxn_opcodes_h_l1596_c30_e339_y,
sp_relative_shift_uxn_opcodes_h_l1596_c30_e339_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1601_c11_c135
BIN_OP_EQ_uxn_opcodes_h_l1601_c11_c135 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1601_c11_c135_left,
BIN_OP_EQ_uxn_opcodes_h_l1601_c11_c135_right,
BIN_OP_EQ_uxn_opcodes_h_l1601_c11_c135_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1601_c7_4e44
n16_low_MUX_uxn_opcodes_h_l1601_c7_4e44 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1601_c7_4e44_cond,
n16_low_MUX_uxn_opcodes_h_l1601_c7_4e44_iftrue,
n16_low_MUX_uxn_opcodes_h_l1601_c7_4e44_iffalse,
n16_low_MUX_uxn_opcodes_h_l1601_c7_4e44_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1601_c7_4e44
result_u16_value_MUX_uxn_opcodes_h_l1601_c7_4e44 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1601_c7_4e44_cond,
result_u16_value_MUX_uxn_opcodes_h_l1601_c7_4e44_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1601_c7_4e44_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1601_c7_4e44_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_4e44
result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_4e44 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_4e44_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_4e44_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_4e44_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_4e44_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1601_c7_4e44
result_u8_value_MUX_uxn_opcodes_h_l1601_c7_4e44 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1601_c7_4e44_cond,
result_u8_value_MUX_uxn_opcodes_h_l1601_c7_4e44_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1601_c7_4e44_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1601_c7_4e44_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_4e44
result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_4e44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_4e44_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_4e44_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_4e44_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_4e44_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1604_c33_a725
BIN_OP_PLUS_uxn_opcodes_h_l1604_c33_a725 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1604_c33_a725_left,
BIN_OP_PLUS_uxn_opcodes_h_l1604_c33_a725_right,
BIN_OP_PLUS_uxn_opcodes_h_l1604_c33_a725_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n16_low,
 n16_high,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1574_c6_00aa_return_output,
 n16_low_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output,
 t8_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output,
 n16_high_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1587_c11_633b_return_output,
 n16_low_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output,
 t8_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output,
 n16_high_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1590_c11_8303_return_output,
 n16_low_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output,
 t8_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output,
 n16_high_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1594_c11_7831_return_output,
 n16_low_MUX_uxn_opcodes_h_l1594_c7_a83c_return_output,
 n16_high_MUX_uxn_opcodes_h_l1594_c7_a83c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1594_c7_a83c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_a83c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_a83c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1594_c7_a83c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_a83c_return_output,
 sp_relative_shift_uxn_opcodes_h_l1596_c30_e339_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1601_c11_c135_return_output,
 n16_low_MUX_uxn_opcodes_h_l1601_c7_4e44_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1601_c7_4e44_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_4e44_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1601_c7_4e44_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_4e44_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1604_c33_a725_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c6_00aa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c6_00aa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c6_00aa_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1574_c2_8b1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1574_c2_8b1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1574_c2_8b1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1579_c3_9a2e : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1574_c2_8b1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1584_c3_b9d3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_633b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_633b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_633b_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1587_c7_ce44_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1587_c7_ce44_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1587_c7_ce44_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1587_c7_ce44_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1587_c7_ce44_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1588_c3_5e92 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_ce44_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_ce44_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1587_c7_ce44_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_ce44_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_8303_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_8303_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_8303_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1594_c7_a83c_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1594_c7_a83c_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1594_c7_a83c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_a83c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1592_c3_adc1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1590_c7_dcdc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_a83c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1594_c7_a83c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_a83c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_7831_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_7831_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_7831_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1594_c7_a83c_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1594_c7_a83c_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1601_c7_4e44_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1594_c7_a83c_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1594_c7_a83c_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1594_c7_a83c_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1594_c7_a83c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1594_c7_a83c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1594_c7_a83c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1601_c7_4e44_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1594_c7_a83c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_a83c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_a83c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_a83c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_a83c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_a83c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_4e44_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_a83c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1594_c7_a83c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1594_c7_a83c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1601_c7_4e44_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1594_c7_a83c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_a83c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_a83c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_4e44_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_a83c_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1596_c30_e339_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1596_c30_e339_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1596_c30_e339_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1596_c30_e339_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1598_c22_b0ed_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1601_c11_c135_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1601_c11_c135_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1601_c11_c135_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1601_c7_4e44_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1601_c7_4e44_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1601_c7_4e44_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1601_c7_4e44_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1601_c7_4e44_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1601_c7_4e44_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_4e44_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1603_c3_caa3 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_4e44_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_4e44_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1601_c7_4e44_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1601_c7_4e44_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1601_c7_4e44_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_4e44_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_4e44_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_4e44_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1604_c33_a725_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1604_c33_a725_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1604_c33_a725_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1604_c22_f7eb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1587_l1601_l1590_l1574_DUPLICATE_1125_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1587_l1601_l1590_l1574_DUPLICATE_ca01_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1587_l1590_l1594_DUPLICATE_04bb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1587_l1601_l1590_DUPLICATE_63b1_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1587_l1601_l1590_l1594_DUPLICATE_6712_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l1569_l1609_DUPLICATE_27f9_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n16_low : unsigned(7 downto 0);
variable REG_VAR_n16_high : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n16_low := n16_low;
  REG_VAR_n16_high := n16_high;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1603_c3_caa3 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_4e44_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1603_c3_caa3;
     VAR_sp_relative_shift_uxn_opcodes_h_l1596_c30_e339_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1579_c3_9a2e := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1579_c3_9a2e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1601_c11_c135_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1604_c33_a725_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_8303_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c6_00aa_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_7831_right := to_unsigned(3, 2);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1592_c3_adc1 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1592_c3_adc1;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_4e44_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1596_c30_e339_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_a83c_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1588_c3_5e92 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1588_c3_5e92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_633b_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1584_c3_b9d3 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1584_c3_b9d3;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1596_c30_e339_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1594_c7_a83c_iffalse := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1594_c7_a83c_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1601_c7_4e44_iffalse := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c6_00aa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_633b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_8303_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_7831_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1601_c11_c135_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l1594_c7_a83c_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l1601_c7_4e44_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1594_c7_a83c_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1601_c7_4e44_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1604_c33_a725_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse := t8;
     -- BIN_OP_PLUS[uxn_opcodes_h_l1604_c33_a725] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1604_c33_a725_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1604_c33_a725_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1604_c33_a725_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1604_c33_a725_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1604_c33_a725_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1604_c33_a725_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1587_c11_633b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1587_c11_633b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_633b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1587_c11_633b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_633b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_633b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1587_c11_633b_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1587_l1601_l1590_l1574_DUPLICATE_1125 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1587_l1601_l1590_l1574_DUPLICATE_1125_return_output := result.u8_value;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l1574_c2_8b1d] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1574_c2_8b1d_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1587_l1590_l1594_DUPLICATE_04bb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1587_l1590_l1594_DUPLICATE_04bb_return_output := result.is_ram_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1574_c2_8b1d] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1574_c2_8b1d_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1587_l1601_l1590_l1574_DUPLICATE_ca01 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1587_l1601_l1590_l1574_DUPLICATE_ca01_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1594_c11_7831] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1594_c11_7831_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_7831_left;
     BIN_OP_EQ_uxn_opcodes_h_l1594_c11_7831_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_7831_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_7831_return_output := BIN_OP_EQ_uxn_opcodes_h_l1594_c11_7831_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1598_c22_b0ed] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1598_c22_b0ed_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1574_c2_8b1d] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1574_c2_8b1d_return_output := result.is_pc_updated;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1590_c7_dcdc] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1590_c7_dcdc_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1574_c6_00aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1574_c6_00aa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c6_00aa_left;
     BIN_OP_EQ_uxn_opcodes_h_l1574_c6_00aa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c6_00aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c6_00aa_return_output := BIN_OP_EQ_uxn_opcodes_h_l1574_c6_00aa_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1574_c2_8b1d] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1574_c2_8b1d_return_output := result.is_vram_write;

     -- sp_relative_shift[uxn_opcodes_h_l1596_c30_e339] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1596_c30_e339_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1596_c30_e339_ins;
     sp_relative_shift_uxn_opcodes_h_l1596_c30_e339_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1596_c30_e339_x;
     sp_relative_shift_uxn_opcodes_h_l1596_c30_e339_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1596_c30_e339_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1596_c30_e339_return_output := sp_relative_shift_uxn_opcodes_h_l1596_c30_e339_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1590_c11_8303] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1590_c11_8303_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_8303_left;
     BIN_OP_EQ_uxn_opcodes_h_l1590_c11_8303_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_8303_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_8303_return_output := BIN_OP_EQ_uxn_opcodes_h_l1590_c11_8303_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1587_l1601_l1590_DUPLICATE_63b1 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1587_l1601_l1590_DUPLICATE_63b1_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1601_c11_c135] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1601_c11_c135_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1601_c11_c135_left;
     BIN_OP_EQ_uxn_opcodes_h_l1601_c11_c135_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1601_c11_c135_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1601_c11_c135_return_output := BIN_OP_EQ_uxn_opcodes_h_l1601_c11_c135_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1587_l1601_l1590_l1594_DUPLICATE_6712 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1587_l1601_l1590_l1594_DUPLICATE_6712_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c6_00aa_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c6_00aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c6_00aa_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c6_00aa_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c6_00aa_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c6_00aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c6_00aa_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c6_00aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c6_00aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c6_00aa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c6_00aa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c6_00aa_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c6_00aa_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1587_c7_ce44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_633b_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1587_c7_ce44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_633b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_ce44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_633b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1587_c7_ce44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_633b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_ce44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_633b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_ce44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_633b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1587_c7_ce44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_633b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1587_c7_ce44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_633b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1587_c7_ce44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1587_c11_633b_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_8303_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_8303_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_8303_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_8303_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_8303_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_8303_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_8303_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_8303_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c11_8303_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1594_c7_a83c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_7831_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1594_c7_a83c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_7831_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_a83c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_7831_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_a83c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_7831_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_a83c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_7831_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1594_c7_a83c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_7831_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1594_c7_a83c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c11_7831_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1601_c7_4e44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1601_c11_c135_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_4e44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1601_c11_c135_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_4e44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1601_c11_c135_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1601_c7_4e44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1601_c11_c135_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1601_c7_4e44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1601_c11_c135_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1594_c7_a83c_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1598_c22_b0ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1587_l1601_l1590_DUPLICATE_63b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1587_l1601_l1590_DUPLICATE_63b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_4e44_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1587_l1601_l1590_DUPLICATE_63b1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1587_l1601_l1590_l1574_DUPLICATE_ca01_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1587_l1601_l1590_l1574_DUPLICATE_ca01_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1587_l1601_l1590_l1574_DUPLICATE_ca01_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1601_c7_4e44_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1587_l1601_l1590_l1574_DUPLICATE_ca01_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1587_l1601_l1590_l1594_DUPLICATE_6712_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1587_l1601_l1590_l1594_DUPLICATE_6712_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_a83c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1587_l1601_l1590_l1594_DUPLICATE_6712_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_4e44_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1587_l1601_l1590_l1594_DUPLICATE_6712_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1587_l1590_l1594_DUPLICATE_04bb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1587_l1590_l1594_DUPLICATE_04bb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_a83c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1587_l1590_l1594_DUPLICATE_04bb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1587_l1601_l1590_l1574_DUPLICATE_1125_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1587_l1601_l1590_l1574_DUPLICATE_1125_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1587_l1601_l1590_l1574_DUPLICATE_1125_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1601_c7_4e44_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1587_l1601_l1590_l1574_DUPLICATE_1125_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1574_c2_8b1d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1574_c2_8b1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1574_c2_8b1d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1574_c2_8b1d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1590_c7_dcdc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_a83c_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1596_c30_e339_return_output;
     -- n16_high_MUX[uxn_opcodes_h_l1594_c7_a83c] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1594_c7_a83c_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1594_c7_a83c_cond;
     n16_high_MUX_uxn_opcodes_h_l1594_c7_a83c_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1594_c7_a83c_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1594_c7_a83c_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1594_c7_a83c_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1594_c7_a83c_return_output := n16_high_MUX_uxn_opcodes_h_l1594_c7_a83c_return_output;

     -- t8_MUX[uxn_opcodes_h_l1590_c7_dcdc] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond <= VAR_t8_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond;
     t8_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue;
     t8_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output := t8_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1601_c7_4e44] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1601_c7_4e44_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1601_c7_4e44_cond;
     n16_low_MUX_uxn_opcodes_h_l1601_c7_4e44_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1601_c7_4e44_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1601_c7_4e44_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1601_c7_4e44_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1601_c7_4e44_return_output := n16_low_MUX_uxn_opcodes_h_l1601_c7_4e44_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1574_c2_8b1d] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1590_c7_dcdc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1601_c7_4e44] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1601_c7_4e44_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1601_c7_4e44_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1601_c7_4e44_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1601_c7_4e44_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1601_c7_4e44_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1601_c7_4e44_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1601_c7_4e44_return_output := result_u8_value_MUX_uxn_opcodes_h_l1601_c7_4e44_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1574_c2_8b1d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1601_c7_4e44] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_4e44_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_4e44_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_4e44_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_4e44_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_4e44_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_4e44_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_4e44_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_4e44_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1604_c22_f7eb] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1604_c22_f7eb_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1604_c33_a725_return_output);

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1574_c2_8b1d] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1594_c7_a83c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_a83c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_a83c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_a83c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_a83c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_a83c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_a83c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_a83c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_a83c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1601_c7_4e44] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_4e44_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_4e44_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_4e44_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_4e44_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_4e44_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_4e44_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_4e44_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_4e44_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1574_c2_8b1d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1601_c7_4e44_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1604_c22_f7eb_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1594_c7_a83c_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1594_c7_a83c_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1601_c7_4e44_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_a83c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1601_c7_4e44_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1594_c7_a83c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_a83c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1601_c7_4e44_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1594_c7_a83c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1601_c7_4e44_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1594_c7_a83c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_a83c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_a83c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_a83c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_a83c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_a83c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_a83c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_a83c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_a83c_return_output;

     -- t8_MUX[uxn_opcodes_h_l1587_c7_ce44] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1587_c7_ce44_cond <= VAR_t8_MUX_uxn_opcodes_h_l1587_c7_ce44_cond;
     t8_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue;
     t8_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output := t8_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1587_c7_ce44] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_ce44_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_ce44_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1590_c7_dcdc] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond;
     n16_high_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output := n16_high_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1590_c7_dcdc] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1594_c7_a83c] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1594_c7_a83c_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1594_c7_a83c_cond;
     n16_low_MUX_uxn_opcodes_h_l1594_c7_a83c_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1594_c7_a83c_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1594_c7_a83c_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1594_c7_a83c_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1594_c7_a83c_return_output := n16_low_MUX_uxn_opcodes_h_l1594_c7_a83c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1594_c7_a83c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_a83c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_a83c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_a83c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_a83c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_a83c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_a83c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_a83c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_a83c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1601_c7_4e44] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1601_c7_4e44_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1601_c7_4e44_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1601_c7_4e44_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1601_c7_4e44_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1601_c7_4e44_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1601_c7_4e44_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1601_c7_4e44_return_output := result_u16_value_MUX_uxn_opcodes_h_l1601_c7_4e44_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1594_c7_a83c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1594_c7_a83c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1594_c7_a83c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1594_c7_a83c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1594_c7_a83c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1594_c7_a83c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1594_c7_a83c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1594_c7_a83c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1594_c7_a83c_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1594_c7_a83c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c7_a83c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c7_a83c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1594_c7_a83c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1601_c7_4e44_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1594_c7_a83c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1594_c7_a83c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1594_c7_a83c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1594_c7_a83c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1594_c7_a83c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1594_c7_a83c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1594_c7_a83c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1594_c7_a83c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1594_c7_a83c_return_output := result_u16_value_MUX_uxn_opcodes_h_l1594_c7_a83c_return_output;

     -- t8_MUX[uxn_opcodes_h_l1574_c2_8b1d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond <= VAR_t8_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond;
     t8_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue;
     t8_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output := t8_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1587_c7_ce44] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1587_c7_ce44_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1587_c7_ce44_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1574_c2_8b1d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1590_c7_dcdc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1590_c7_dcdc] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond;
     n16_low_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output := n16_low_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1587_c7_ce44] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1587_c7_ce44_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1587_c7_ce44_cond;
     n16_high_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output := n16_high_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1590_c7_dcdc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1590_c7_dcdc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output := result_u8_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1594_c7_a83c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output;
     -- n16_high_MUX[uxn_opcodes_h_l1574_c2_8b1d] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond;
     n16_high_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output := n16_high_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1574_c2_8b1d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1587_c7_ce44] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_ce44_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_ce44_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1587_c7_ce44] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1587_c7_ce44_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1587_c7_ce44_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output := result_u8_value_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1590_c7_dcdc] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output := result_u16_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1587_c7_ce44] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1587_c7_ce44_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1587_c7_ce44_cond;
     n16_low_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output := n16_low_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1587_c7_ce44] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_ce44_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_ce44_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output;

     -- Submodule level 5
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1590_c7_dcdc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1574_c2_8b1d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1574_c2_8b1d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1574_c2_8b1d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1587_c7_ce44] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1587_c7_ce44_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1587_c7_ce44_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1587_c7_ce44_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1587_c7_ce44_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output := result_u16_value_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1574_c2_8b1d] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond;
     n16_low_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output := n16_low_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output;

     -- Submodule level 6
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1587_c7_ce44_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1574_c2_8b1d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output := result_u16_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l1569_l1609_DUPLICATE_27f9 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l1569_l1609_DUPLICATE_27f9_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_775a(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1574_c2_8b1d_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l1569_l1609_DUPLICATE_27f9_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l1569_l1609_DUPLICATE_27f9_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n16_low <= REG_VAR_n16_low;
REG_COMB_n16_high <= REG_VAR_n16_high;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n16_low <= REG_COMB_n16_low;
     n16_high <= REG_COMB_n16_high;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
