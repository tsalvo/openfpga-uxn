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
entity str2_0CLK_75b4bee3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end str2_0CLK_75b4bee3;
architecture arch of str2_0CLK_75b4bee3 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16_high : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16_low : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n16_high : unsigned(7 downto 0);
signal REG_COMB_n16_low : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1740_c6_e644]
signal BIN_OP_EQ_uxn_opcodes_h_l1740_c6_e644_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1740_c6_e644_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1740_c6_e644_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1740_c2_cc66]
signal t8_MUX_uxn_opcodes_h_l1740_c2_cc66_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1740_c2_cc66]
signal n16_low_MUX_uxn_opcodes_h_l1740_c2_cc66_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1740_c2_cc66]
signal n16_high_MUX_uxn_opcodes_h_l1740_c2_cc66_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1740_c2_cc66]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_cc66_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1740_c2_cc66]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_cc66_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1740_c2_cc66]
signal result_u16_value_MUX_uxn_opcodes_h_l1740_c2_cc66_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1740_c2_cc66]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1740_c2_cc66]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_cc66_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1740_c2_cc66]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_cc66_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1740_c2_cc66]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1740_c2_cc66]
signal result_u8_value_MUX_uxn_opcodes_h_l1740_c2_cc66_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1740_c2_cc66]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_cc66_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1740_c2_cc66]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_cc66_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1753_c11_cdda]
signal BIN_OP_EQ_uxn_opcodes_h_l1753_c11_cdda_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1753_c11_cdda_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1753_c11_cdda_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1753_c7_f232]
signal t8_MUX_uxn_opcodes_h_l1753_c7_f232_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1753_c7_f232_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1753_c7_f232]
signal n16_low_MUX_uxn_opcodes_h_l1753_c7_f232_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1753_c7_f232_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1753_c7_f232]
signal n16_high_MUX_uxn_opcodes_h_l1753_c7_f232_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1753_c7_f232_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1753_c7_f232]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_f232_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_f232_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1753_c7_f232]
signal result_u16_value_MUX_uxn_opcodes_h_l1753_c7_f232_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1753_c7_f232_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1753_c7_f232]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_f232_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_f232_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1753_c7_f232]
signal result_u8_value_MUX_uxn_opcodes_h_l1753_c7_f232_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1753_c7_f232_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1753_c7_f232]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_f232_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_f232_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1753_c7_f232]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_f232_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_f232_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1756_c11_ad17]
signal BIN_OP_EQ_uxn_opcodes_h_l1756_c11_ad17_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1756_c11_ad17_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1756_c11_ad17_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1756_c7_226a]
signal t8_MUX_uxn_opcodes_h_l1756_c7_226a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1756_c7_226a_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1756_c7_226a]
signal n16_low_MUX_uxn_opcodes_h_l1756_c7_226a_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1756_c7_226a_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1756_c7_226a]
signal n16_high_MUX_uxn_opcodes_h_l1756_c7_226a_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1756_c7_226a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1756_c7_226a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_226a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_226a_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1756_c7_226a]
signal result_u16_value_MUX_uxn_opcodes_h_l1756_c7_226a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1756_c7_226a_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1756_c7_226a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_226a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_226a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1756_c7_226a]
signal result_u8_value_MUX_uxn_opcodes_h_l1756_c7_226a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1756_c7_226a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1756_c7_226a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_226a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_226a_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1756_c7_226a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_226a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_226a_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1760_c11_bc75]
signal BIN_OP_EQ_uxn_opcodes_h_l1760_c11_bc75_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1760_c11_bc75_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1760_c11_bc75_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1760_c7_8f95]
signal n16_low_MUX_uxn_opcodes_h_l1760_c7_8f95_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1760_c7_8f95_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1760_c7_8f95_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1760_c7_8f95_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1760_c7_8f95]
signal n16_high_MUX_uxn_opcodes_h_l1760_c7_8f95_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1760_c7_8f95_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1760_c7_8f95_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1760_c7_8f95_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1760_c7_8f95]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_8f95_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_8f95_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_8f95_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_8f95_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1760_c7_8f95]
signal result_u16_value_MUX_uxn_opcodes_h_l1760_c7_8f95_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1760_c7_8f95_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1760_c7_8f95_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1760_c7_8f95_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1760_c7_8f95]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_8f95_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_8f95_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_8f95_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_8f95_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1760_c7_8f95]
signal result_u8_value_MUX_uxn_opcodes_h_l1760_c7_8f95_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1760_c7_8f95_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1760_c7_8f95_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1760_c7_8f95_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1760_c7_8f95]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_8f95_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_8f95_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_8f95_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_8f95_return_output : signed(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1762_c30_78bc]
signal sp_relative_shift_uxn_opcodes_h_l1762_c30_78bc_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1762_c30_78bc_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1762_c30_78bc_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1762_c30_78bc_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1767_c11_3ee9]
signal BIN_OP_EQ_uxn_opcodes_h_l1767_c11_3ee9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1767_c11_3ee9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1767_c11_3ee9_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1767_c7_a288]
signal n16_low_MUX_uxn_opcodes_h_l1767_c7_a288_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1767_c7_a288_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1767_c7_a288_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1767_c7_a288_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1767_c7_a288]
signal result_u8_value_MUX_uxn_opcodes_h_l1767_c7_a288_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1767_c7_a288_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1767_c7_a288_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1767_c7_a288_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1767_c7_a288]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_a288_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_a288_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_a288_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_a288_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1767_c7_a288]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_a288_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_a288_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_a288_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_a288_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1767_c7_a288]
signal result_u16_value_MUX_uxn_opcodes_h_l1767_c7_a288_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1767_c7_a288_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1767_c7_a288_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1767_c7_a288_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1770_c22_c362]
signal BIN_OP_PLUS_uxn_opcodes_h_l1770_c22_c362_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1770_c22_c362_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1770_c22_c362_return_output : signed(18 downto 0);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_992a
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_992a_left : signed(16 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_992a_right : signed(7 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_992a_return_output : signed(17 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_1a75( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_ram_write := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.u8_value := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;
      base.is_pc_updated := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1740_c6_e644
BIN_OP_EQ_uxn_opcodes_h_l1740_c6_e644 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1740_c6_e644_left,
BIN_OP_EQ_uxn_opcodes_h_l1740_c6_e644_right,
BIN_OP_EQ_uxn_opcodes_h_l1740_c6_e644_return_output);

-- t8_MUX_uxn_opcodes_h_l1740_c2_cc66
t8_MUX_uxn_opcodes_h_l1740_c2_cc66 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1740_c2_cc66_cond,
t8_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue,
t8_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse,
t8_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1740_c2_cc66
n16_low_MUX_uxn_opcodes_h_l1740_c2_cc66 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1740_c2_cc66_cond,
n16_low_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue,
n16_low_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse,
n16_low_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1740_c2_cc66
n16_high_MUX_uxn_opcodes_h_l1740_c2_cc66 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1740_c2_cc66_cond,
n16_high_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue,
n16_high_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse,
n16_high_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_cc66
result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_cc66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_cc66_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_cc66
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_cc66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_cc66_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1740_c2_cc66
result_u16_value_MUX_uxn_opcodes_h_l1740_c2_cc66 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1740_c2_cc66_cond,
result_u16_value_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_cc66
result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_cc66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_cc66
result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_cc66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_cc66_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_cc66
result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_cc66 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_cc66_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_cc66
result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_cc66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1740_c2_cc66
result_u8_value_MUX_uxn_opcodes_h_l1740_c2_cc66 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1740_c2_cc66_cond,
result_u8_value_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_cc66
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_cc66 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_cc66_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_cc66
result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_cc66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_cc66_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1753_c11_cdda
BIN_OP_EQ_uxn_opcodes_h_l1753_c11_cdda : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1753_c11_cdda_left,
BIN_OP_EQ_uxn_opcodes_h_l1753_c11_cdda_right,
BIN_OP_EQ_uxn_opcodes_h_l1753_c11_cdda_return_output);

-- t8_MUX_uxn_opcodes_h_l1753_c7_f232
t8_MUX_uxn_opcodes_h_l1753_c7_f232 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1753_c7_f232_cond,
t8_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue,
t8_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse,
t8_MUX_uxn_opcodes_h_l1753_c7_f232_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1753_c7_f232
n16_low_MUX_uxn_opcodes_h_l1753_c7_f232 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1753_c7_f232_cond,
n16_low_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue,
n16_low_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse,
n16_low_MUX_uxn_opcodes_h_l1753_c7_f232_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1753_c7_f232
n16_high_MUX_uxn_opcodes_h_l1753_c7_f232 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1753_c7_f232_cond,
n16_high_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue,
n16_high_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse,
n16_high_MUX_uxn_opcodes_h_l1753_c7_f232_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_f232
result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_f232 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_f232_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_f232_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1753_c7_f232
result_u16_value_MUX_uxn_opcodes_h_l1753_c7_f232 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1753_c7_f232_cond,
result_u16_value_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1753_c7_f232_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_f232
result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_f232 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_f232_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_f232_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1753_c7_f232
result_u8_value_MUX_uxn_opcodes_h_l1753_c7_f232 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1753_c7_f232_cond,
result_u8_value_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1753_c7_f232_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_f232
result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_f232 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_f232_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_f232_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_f232
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_f232 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_f232_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_f232_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1756_c11_ad17
BIN_OP_EQ_uxn_opcodes_h_l1756_c11_ad17 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1756_c11_ad17_left,
BIN_OP_EQ_uxn_opcodes_h_l1756_c11_ad17_right,
BIN_OP_EQ_uxn_opcodes_h_l1756_c11_ad17_return_output);

-- t8_MUX_uxn_opcodes_h_l1756_c7_226a
t8_MUX_uxn_opcodes_h_l1756_c7_226a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1756_c7_226a_cond,
t8_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue,
t8_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse,
t8_MUX_uxn_opcodes_h_l1756_c7_226a_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1756_c7_226a
n16_low_MUX_uxn_opcodes_h_l1756_c7_226a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1756_c7_226a_cond,
n16_low_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue,
n16_low_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse,
n16_low_MUX_uxn_opcodes_h_l1756_c7_226a_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1756_c7_226a
n16_high_MUX_uxn_opcodes_h_l1756_c7_226a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1756_c7_226a_cond,
n16_high_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue,
n16_high_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse,
n16_high_MUX_uxn_opcodes_h_l1756_c7_226a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_226a
result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_226a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_226a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_226a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1756_c7_226a
result_u16_value_MUX_uxn_opcodes_h_l1756_c7_226a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1756_c7_226a_cond,
result_u16_value_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1756_c7_226a_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_226a
result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_226a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_226a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_226a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1756_c7_226a
result_u8_value_MUX_uxn_opcodes_h_l1756_c7_226a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1756_c7_226a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1756_c7_226a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_226a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_226a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_226a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_226a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_226a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_226a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_226a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_226a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1760_c11_bc75
BIN_OP_EQ_uxn_opcodes_h_l1760_c11_bc75 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1760_c11_bc75_left,
BIN_OP_EQ_uxn_opcodes_h_l1760_c11_bc75_right,
BIN_OP_EQ_uxn_opcodes_h_l1760_c11_bc75_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1760_c7_8f95
n16_low_MUX_uxn_opcodes_h_l1760_c7_8f95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1760_c7_8f95_cond,
n16_low_MUX_uxn_opcodes_h_l1760_c7_8f95_iftrue,
n16_low_MUX_uxn_opcodes_h_l1760_c7_8f95_iffalse,
n16_low_MUX_uxn_opcodes_h_l1760_c7_8f95_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1760_c7_8f95
n16_high_MUX_uxn_opcodes_h_l1760_c7_8f95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1760_c7_8f95_cond,
n16_high_MUX_uxn_opcodes_h_l1760_c7_8f95_iftrue,
n16_high_MUX_uxn_opcodes_h_l1760_c7_8f95_iffalse,
n16_high_MUX_uxn_opcodes_h_l1760_c7_8f95_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_8f95
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_8f95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_8f95_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_8f95_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_8f95_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_8f95_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1760_c7_8f95
result_u16_value_MUX_uxn_opcodes_h_l1760_c7_8f95 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1760_c7_8f95_cond,
result_u16_value_MUX_uxn_opcodes_h_l1760_c7_8f95_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1760_c7_8f95_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1760_c7_8f95_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_8f95
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_8f95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_8f95_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_8f95_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_8f95_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_8f95_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1760_c7_8f95
result_u8_value_MUX_uxn_opcodes_h_l1760_c7_8f95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1760_c7_8f95_cond,
result_u8_value_MUX_uxn_opcodes_h_l1760_c7_8f95_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1760_c7_8f95_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1760_c7_8f95_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_8f95
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_8f95 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_8f95_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_8f95_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_8f95_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_8f95_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1762_c30_78bc
sp_relative_shift_uxn_opcodes_h_l1762_c30_78bc : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1762_c30_78bc_ins,
sp_relative_shift_uxn_opcodes_h_l1762_c30_78bc_x,
sp_relative_shift_uxn_opcodes_h_l1762_c30_78bc_y,
sp_relative_shift_uxn_opcodes_h_l1762_c30_78bc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1767_c11_3ee9
BIN_OP_EQ_uxn_opcodes_h_l1767_c11_3ee9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1767_c11_3ee9_left,
BIN_OP_EQ_uxn_opcodes_h_l1767_c11_3ee9_right,
BIN_OP_EQ_uxn_opcodes_h_l1767_c11_3ee9_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1767_c7_a288
n16_low_MUX_uxn_opcodes_h_l1767_c7_a288 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1767_c7_a288_cond,
n16_low_MUX_uxn_opcodes_h_l1767_c7_a288_iftrue,
n16_low_MUX_uxn_opcodes_h_l1767_c7_a288_iffalse,
n16_low_MUX_uxn_opcodes_h_l1767_c7_a288_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1767_c7_a288
result_u8_value_MUX_uxn_opcodes_h_l1767_c7_a288 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1767_c7_a288_cond,
result_u8_value_MUX_uxn_opcodes_h_l1767_c7_a288_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1767_c7_a288_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1767_c7_a288_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_a288
result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_a288 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_a288_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_a288_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_a288_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_a288_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_a288
result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_a288 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_a288_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_a288_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_a288_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_a288_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1767_c7_a288
result_u16_value_MUX_uxn_opcodes_h_l1767_c7_a288 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1767_c7_a288_cond,
result_u16_value_MUX_uxn_opcodes_h_l1767_c7_a288_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1767_c7_a288_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1767_c7_a288_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1770_c22_c362
BIN_OP_PLUS_uxn_opcodes_h_l1770_c22_c362 : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1770_c22_c362_left,
BIN_OP_PLUS_uxn_opcodes_h_l1770_c22_c362_right,
BIN_OP_PLUS_uxn_opcodes_h_l1770_c22_c362_return_output);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_992a
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_992a : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_992a_left,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_992a_right,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_992a_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 -- Registers
 t8,
 n16_high,
 n16_low,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1740_c6_e644_return_output,
 t8_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output,
 n16_low_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output,
 n16_high_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1753_c11_cdda_return_output,
 t8_MUX_uxn_opcodes_h_l1753_c7_f232_return_output,
 n16_low_MUX_uxn_opcodes_h_l1753_c7_f232_return_output,
 n16_high_MUX_uxn_opcodes_h_l1753_c7_f232_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_f232_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1753_c7_f232_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_f232_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1753_c7_f232_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_f232_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_f232_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1756_c11_ad17_return_output,
 t8_MUX_uxn_opcodes_h_l1756_c7_226a_return_output,
 n16_low_MUX_uxn_opcodes_h_l1756_c7_226a_return_output,
 n16_high_MUX_uxn_opcodes_h_l1756_c7_226a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_226a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1756_c7_226a_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_226a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1756_c7_226a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_226a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_226a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1760_c11_bc75_return_output,
 n16_low_MUX_uxn_opcodes_h_l1760_c7_8f95_return_output,
 n16_high_MUX_uxn_opcodes_h_l1760_c7_8f95_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_8f95_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1760_c7_8f95_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_8f95_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1760_c7_8f95_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_8f95_return_output,
 sp_relative_shift_uxn_opcodes_h_l1762_c30_78bc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1767_c11_3ee9_return_output,
 n16_low_MUX_uxn_opcodes_h_l1767_c7_a288_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1767_c7_a288_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_a288_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_a288_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1767_c7_a288_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1770_c22_c362_return_output,
 BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_992a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c6_e644_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c6_e644_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c6_e644_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1753_c7_f232_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1740_c2_cc66_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1753_c7_f232_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1740_c2_cc66_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1753_c7_f232_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1740_c2_cc66_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_f232_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_cc66_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1740_c2_cc66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_cc66_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1753_c7_f232_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1740_c2_cc66_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_f232_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1740_c2_cc66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_cc66_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1745_c3_c4fb : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_f232_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_cc66_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1740_c2_cc66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1753_c7_f232_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1740_c2_cc66_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1750_c3_5685 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_f232_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_cc66_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1740_c2_cc66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_cc66_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_cdda_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_cdda_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_cdda_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1756_c7_226a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1753_c7_f232_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1756_c7_226a_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1753_c7_f232_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1756_c7_226a_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1753_c7_f232_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_226a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_f232_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1756_c7_226a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1753_c7_f232_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_226a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_f232_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1756_c7_226a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1753_c7_f232_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_226a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_f232_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1754_c3_38d5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_226a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_f232_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1756_c11_ad17_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1756_c11_ad17_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1756_c11_ad17_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1756_c7_226a_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1760_c7_8f95_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1756_c7_226a_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1760_c7_8f95_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1756_c7_226a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_8f95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_226a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c7_8f95_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1756_c7_226a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_8f95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_226a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c7_8f95_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1756_c7_226a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_8f95_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_226a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1758_c3_6ae8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1756_c7_226a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_226a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_bc75_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_bc75_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_bc75_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1760_c7_8f95_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1760_c7_8f95_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1767_c7_a288_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1760_c7_8f95_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1760_c7_8f95_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1760_c7_8f95_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1760_c7_8f95_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_8f95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_8f95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_a288_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_8f95_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c7_8f95_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1764_c3_1d57 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c7_8f95_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1767_c7_a288_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c7_8f95_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_8f95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_8f95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_8f95_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c7_8f95_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c7_8f95_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1767_c7_a288_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c7_8f95_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_8f95_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_8f95_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_a288_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_8f95_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1762_c30_78bc_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1762_c30_78bc_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1762_c30_78bc_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1762_c30_78bc_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_3ee9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_3ee9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_3ee9_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1767_c7_a288_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1767_c7_a288_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1767_c7_a288_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1767_c7_a288_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1767_c7_a288_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1767_c7_a288_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_a288_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1769_c3_d556 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_a288_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_a288_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_a288_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_a288_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_a288_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1767_c7_a288_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1770_c3_eaeb : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1767_c7_a288_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1767_c7_a288_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1770_c22_c362_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1770_c22_c362_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1770_c22_c362_return_output : signed(18 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1753_l1767_l1756_l1740_DUPLICATE_3438_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1753_l1767_l1756_l1740_DUPLICATE_42db_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1753_l1767_l1756_l1760_DUPLICATE_ff86_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1753_l1756_l1760_DUPLICATE_f0c3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1753_l1767_l1756_DUPLICATE_0293_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_e418_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_992a_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_992a_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_992a_return_output : signed(17 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a75_uxn_opcodes_h_l1736_l1775_DUPLICATE_bdf2_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n16_high : unsigned(7 downto 0);
variable REG_VAR_n16_low : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n16_high := n16_high;
  REG_VAR_n16_low := n16_low;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_3ee9_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_a288_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1758_c3_6ae8 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1758_c3_6ae8;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_8f95_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1750_c3_5685 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1750_c3_5685;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1756_c11_ad17_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1769_c3_d556 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_a288_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1769_c3_d556;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c6_e644_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_bc75_right := to_unsigned(3, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1762_c30_78bc_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1754_c3_38d5 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1754_c3_38d5;
     VAR_sp_relative_shift_uxn_opcodes_h_l1762_c30_78bc_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1770_c22_c362_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_cdda_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1745_c3_c4fb := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1745_c3_c4fb;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l1762_c30_78bc_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1760_c7_8f95_iffalse := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1760_c7_8f95_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1767_c7_a288_iffalse := n16_low;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_992a_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c6_e644_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_cdda_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1756_c11_ad17_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_bc75_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_3ee9_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l1760_c7_8f95_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l1767_c7_a288_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c7_8f95_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1767_c7_a288_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse := t8;
     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1740_c2_cc66] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1740_c2_cc66_return_output := result.is_vram_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1740_c2_cc66] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1740_c2_cc66_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1756_c11_ad17] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1756_c11_ad17_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1756_c11_ad17_left;
     BIN_OP_EQ_uxn_opcodes_h_l1756_c11_ad17_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1756_c11_ad17_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1756_c11_ad17_return_output := BIN_OP_EQ_uxn_opcodes_h_l1756_c11_ad17_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1753_l1767_l1756_l1740_DUPLICATE_3438 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1753_l1767_l1756_l1740_DUPLICATE_3438_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1740_c6_e644] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1740_c6_e644_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c6_e644_left;
     BIN_OP_EQ_uxn_opcodes_h_l1740_c6_e644_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c6_e644_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c6_e644_return_output := BIN_OP_EQ_uxn_opcodes_h_l1740_c6_e644_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1753_c11_cdda] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1753_c11_cdda_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_cdda_left;
     BIN_OP_EQ_uxn_opcodes_h_l1753_c11_cdda_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_cdda_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_cdda_return_output := BIN_OP_EQ_uxn_opcodes_h_l1753_c11_cdda_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1740_c2_cc66] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1740_c2_cc66_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1753_l1767_l1756_l1760_DUPLICATE_ff86 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1753_l1767_l1756_l1760_DUPLICATE_ff86_return_output := result.is_opc_done;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1756_c7_226a] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1756_c7_226a_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1753_l1767_l1756_DUPLICATE_0293 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1753_l1767_l1756_DUPLICATE_0293_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1753_l1756_l1760_DUPLICATE_f0c3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1753_l1756_l1760_DUPLICATE_f0c3_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1753_l1767_l1756_l1740_DUPLICATE_42db LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1753_l1767_l1756_l1740_DUPLICATE_42db_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1760_c11_bc75] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1760_c11_bc75_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_bc75_left;
     BIN_OP_EQ_uxn_opcodes_h_l1760_c11_bc75_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_bc75_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_bc75_return_output := BIN_OP_EQ_uxn_opcodes_h_l1760_c11_bc75_return_output;

     -- CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_e418 LATENCY=0
     VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_e418_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- sp_relative_shift[uxn_opcodes_h_l1762_c30_78bc] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1762_c30_78bc_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1762_c30_78bc_ins;
     sp_relative_shift_uxn_opcodes_h_l1762_c30_78bc_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1762_c30_78bc_x;
     sp_relative_shift_uxn_opcodes_h_l1762_c30_78bc_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1762_c30_78bc_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1762_c30_78bc_return_output := sp_relative_shift_uxn_opcodes_h_l1762_c30_78bc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1767_c11_3ee9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1767_c11_3ee9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_3ee9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1767_c11_3ee9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_3ee9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_3ee9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1767_c11_3ee9_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l1740_c2_cc66] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1740_c2_cc66_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l1740_c2_cc66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c6_e644_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1740_c2_cc66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c6_e644_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_cc66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c6_e644_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_cc66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c6_e644_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c6_e644_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_cc66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c6_e644_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_cc66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c6_e644_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c6_e644_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_cc66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c6_e644_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_cc66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c6_e644_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1740_c2_cc66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c6_e644_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1740_c2_cc66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c6_e644_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1740_c2_cc66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c6_e644_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1753_c7_f232_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_cdda_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1753_c7_f232_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_cdda_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_f232_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_cdda_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_f232_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_cdda_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_f232_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_cdda_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_f232_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_cdda_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1753_c7_f232_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_cdda_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1753_c7_f232_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_cdda_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1753_c7_f232_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_cdda_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1756_c7_226a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1756_c11_ad17_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1756_c7_226a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1756_c11_ad17_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_226a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1756_c11_ad17_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_226a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1756_c11_ad17_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_226a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1756_c11_ad17_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_226a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1756_c11_ad17_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1756_c7_226a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1756_c11_ad17_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1756_c7_226a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1756_c11_ad17_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1756_c7_226a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1756_c11_ad17_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1760_c7_8f95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_bc75_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1760_c7_8f95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_bc75_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_8f95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_bc75_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_8f95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_bc75_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_8f95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_bc75_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c7_8f95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_bc75_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c7_8f95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_bc75_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1767_c7_a288_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_3ee9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_a288_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_3ee9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_a288_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_3ee9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1767_c7_a288_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_3ee9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1767_c7_a288_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_3ee9_return_output;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_992a_right := VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_e418_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1753_l1767_l1756_DUPLICATE_0293_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1753_l1767_l1756_DUPLICATE_0293_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_a288_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1753_l1767_l1756_DUPLICATE_0293_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1753_l1767_l1756_l1740_DUPLICATE_3438_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1753_l1767_l1756_l1740_DUPLICATE_3438_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1753_l1767_l1756_l1740_DUPLICATE_3438_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1767_c7_a288_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1753_l1767_l1756_l1740_DUPLICATE_3438_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1753_l1767_l1756_l1760_DUPLICATE_ff86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1753_l1767_l1756_l1760_DUPLICATE_ff86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_8f95_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1753_l1767_l1756_l1760_DUPLICATE_ff86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_a288_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1753_l1767_l1756_l1760_DUPLICATE_ff86_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1753_l1756_l1760_DUPLICATE_f0c3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1753_l1756_l1760_DUPLICATE_f0c3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_8f95_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1753_l1756_l1760_DUPLICATE_f0c3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1753_l1767_l1756_l1740_DUPLICATE_42db_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1753_l1767_l1756_l1740_DUPLICATE_42db_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1753_l1767_l1756_l1740_DUPLICATE_42db_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1767_c7_a288_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1753_l1767_l1756_l1740_DUPLICATE_42db_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1740_c2_cc66_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1740_c2_cc66_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1740_c2_cc66_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1740_c2_cc66_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1756_c7_226a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_8f95_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1762_c30_78bc_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l1740_c2_cc66] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1767_c7_a288] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1767_c7_a288_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1767_c7_a288_cond;
     n16_low_MUX_uxn_opcodes_h_l1767_c7_a288_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1767_c7_a288_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1767_c7_a288_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1767_c7_a288_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1767_c7_a288_return_output := n16_low_MUX_uxn_opcodes_h_l1767_c7_a288_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1740_c2_cc66] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_cc66_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_cc66_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1767_c7_a288] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_a288_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_a288_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_a288_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_a288_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_a288_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_a288_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_a288_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_a288_return_output;

     -- t8_MUX[uxn_opcodes_h_l1756_c7_226a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1756_c7_226a_cond <= VAR_t8_MUX_uxn_opcodes_h_l1756_c7_226a_cond;
     t8_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue;
     t8_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1756_c7_226a_return_output := t8_MUX_uxn_opcodes_h_l1756_c7_226a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1767_c7_a288] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_a288_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_a288_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_a288_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_a288_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_a288_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_a288_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_a288_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_a288_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1740_c2_cc66] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_cc66_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_cc66_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output;

     -- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_992a LATENCY=0
     -- Inputs
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_992a_left <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_992a_left;
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_992a_right <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_992a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_992a_return_output := BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_992a_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1760_c7_8f95] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_8f95_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_8f95_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_8f95_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_8f95_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_8f95_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_8f95_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_8f95_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_8f95_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1767_c7_a288] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1767_c7_a288_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1767_c7_a288_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1767_c7_a288_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1767_c7_a288_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1767_c7_a288_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1767_c7_a288_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1767_c7_a288_return_output := result_u8_value_MUX_uxn_opcodes_h_l1767_c7_a288_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1740_c2_cc66] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_cc66_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_cc66_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1760_c7_8f95] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1760_c7_8f95_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1760_c7_8f95_cond;
     n16_high_MUX_uxn_opcodes_h_l1760_c7_8f95_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1760_c7_8f95_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1760_c7_8f95_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1760_c7_8f95_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1760_c7_8f95_return_output := n16_high_MUX_uxn_opcodes_h_l1760_c7_8f95_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1756_c7_226a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_226a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_226a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_226a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_226a_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1770_c22_c362_left := VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_992a_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1764_c3_1d57 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_992a_return_output)),16);
     VAR_n16_high_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1760_c7_8f95_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1760_c7_8f95_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1767_c7_a288_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_8f95_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_a288_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_8f95_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_8f95_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_a288_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_226a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c7_8f95_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1767_c7_a288_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1756_c7_226a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c7_8f95_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1764_c3_1d57;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1760_c7_8f95] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_8f95_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_8f95_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_8f95_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_8f95_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_8f95_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_8f95_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_8f95_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_8f95_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1770_c22_c362] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1770_c22_c362_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1770_c22_c362_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1770_c22_c362_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1770_c22_c362_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1770_c22_c362_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1770_c22_c362_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1760_c7_8f95] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_8f95_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_8f95_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_8f95_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_8f95_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_8f95_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_8f95_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_8f95_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_8f95_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1753_c7_f232] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_f232_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_f232_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_f232_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_f232_return_output;

     -- t8_MUX[uxn_opcodes_h_l1753_c7_f232] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1753_c7_f232_cond <= VAR_t8_MUX_uxn_opcodes_h_l1753_c7_f232_cond;
     t8_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue;
     t8_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1753_c7_f232_return_output := t8_MUX_uxn_opcodes_h_l1753_c7_f232_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1756_c7_226a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_226a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_226a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_226a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_226a_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1756_c7_226a] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1756_c7_226a_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1756_c7_226a_cond;
     n16_high_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1756_c7_226a_return_output := n16_high_MUX_uxn_opcodes_h_l1756_c7_226a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1760_c7_8f95] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1760_c7_8f95_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c7_8f95_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1760_c7_8f95_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c7_8f95_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1760_c7_8f95_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c7_8f95_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c7_8f95_return_output := result_u8_value_MUX_uxn_opcodes_h_l1760_c7_8f95_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1760_c7_8f95] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1760_c7_8f95_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1760_c7_8f95_cond;
     n16_low_MUX_uxn_opcodes_h_l1760_c7_8f95_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1760_c7_8f95_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1760_c7_8f95_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1760_c7_8f95_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1760_c7_8f95_return_output := n16_low_MUX_uxn_opcodes_h_l1760_c7_8f95_return_output;

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1770_c3_eaeb := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1770_c22_c362_return_output)),16);
     VAR_n16_high_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1756_c7_226a_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1760_c7_8f95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_8f95_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_226a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_8f95_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_f232_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c7_8f95_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1753_c7_f232_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1767_c7_a288_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1770_c3_eaeb;
     -- n16_high_MUX[uxn_opcodes_h_l1753_c7_f232] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1753_c7_f232_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1753_c7_f232_cond;
     n16_high_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1753_c7_f232_return_output := n16_high_MUX_uxn_opcodes_h_l1753_c7_f232_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1756_c7_226a] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1756_c7_226a_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1756_c7_226a_cond;
     n16_low_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1756_c7_226a_return_output := n16_low_MUX_uxn_opcodes_h_l1756_c7_226a_return_output;

     -- t8_MUX[uxn_opcodes_h_l1740_c2_cc66] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1740_c2_cc66_cond <= VAR_t8_MUX_uxn_opcodes_h_l1740_c2_cc66_cond;
     t8_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue;
     t8_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output := t8_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1753_c7_f232] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_f232_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_f232_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_f232_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_f232_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1756_c7_226a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_226a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_226a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_226a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_226a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1756_c7_226a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1756_c7_226a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1756_c7_226a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1756_c7_226a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1756_c7_226a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1756_c7_226a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_226a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_226a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_226a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_226a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1740_c2_cc66] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_cc66_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_cc66_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1767_c7_a288] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1767_c7_a288_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1767_c7_a288_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1767_c7_a288_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1767_c7_a288_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1767_c7_a288_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1767_c7_a288_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1767_c7_a288_return_output := result_u16_value_MUX_uxn_opcodes_h_l1767_c7_a288_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1753_c7_f232_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1756_c7_226a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_226a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_f232_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_226a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c7_8f95_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1767_c7_a288_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1756_c7_226a_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l1753_c7_f232] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1753_c7_f232_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1753_c7_f232_cond;
     n16_low_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1753_c7_f232_return_output := n16_low_MUX_uxn_opcodes_h_l1753_c7_f232_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1753_c7_f232] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1753_c7_f232_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1753_c7_f232_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1753_c7_f232_return_output := result_u8_value_MUX_uxn_opcodes_h_l1753_c7_f232_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1753_c7_f232] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_f232_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_f232_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_f232_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_f232_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1753_c7_f232] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_f232_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_f232_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_f232_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_f232_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1740_c2_cc66] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1740_c2_cc66_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1740_c2_cc66_cond;
     n16_high_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output := n16_high_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1760_c7_8f95] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1760_c7_8f95_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c7_8f95_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1760_c7_8f95_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c7_8f95_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1760_c7_8f95_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c7_8f95_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c7_8f95_return_output := result_u16_value_MUX_uxn_opcodes_h_l1760_c7_8f95_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1740_c2_cc66] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output;

     -- Submodule level 5
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1753_c7_f232_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_f232_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_f232_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c7_8f95_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1753_c7_f232_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1756_c7_226a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1756_c7_226a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1756_c7_226a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1756_c7_226a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1756_c7_226a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1756_c7_226a_return_output := result_u16_value_MUX_uxn_opcodes_h_l1756_c7_226a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1740_c2_cc66] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_cc66_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_cc66_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1740_c2_cc66] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_cc66_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_cc66_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1740_c2_cc66] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1740_c2_cc66_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1740_c2_cc66_cond;
     n16_low_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output := n16_low_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1740_c2_cc66] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1740_c2_cc66_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1740_c2_cc66_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output := result_u8_value_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output;

     -- Submodule level 6
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1756_c7_226a_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1753_c7_f232] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1753_c7_f232_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1753_c7_f232_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1753_c7_f232_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1753_c7_f232_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1753_c7_f232_return_output := result_u16_value_MUX_uxn_opcodes_h_l1753_c7_f232_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1753_c7_f232_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1740_c2_cc66] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1740_c2_cc66_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1740_c2_cc66_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1740_c2_cc66_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1740_c2_cc66_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output := result_u16_value_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1a75_uxn_opcodes_h_l1736_l1775_DUPLICATE_bdf2 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a75_uxn_opcodes_h_l1736_l1775_DUPLICATE_bdf2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1a75(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_cc66_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a75_uxn_opcodes_h_l1736_l1775_DUPLICATE_bdf2_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a75_uxn_opcodes_h_l1736_l1775_DUPLICATE_bdf2_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n16_high <= REG_VAR_n16_high;
REG_COMB_n16_low <= REG_VAR_n16_low;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n16_high <= REG_COMB_n16_high;
     n16_low <= REG_COMB_n16_low;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
