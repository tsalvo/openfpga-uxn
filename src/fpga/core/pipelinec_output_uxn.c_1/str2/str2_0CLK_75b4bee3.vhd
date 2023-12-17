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
-- BIN_OP_EQ[uxn_opcodes_h_l1740_c6_925d]
signal BIN_OP_EQ_uxn_opcodes_h_l1740_c6_925d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1740_c6_925d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1740_c6_925d_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1740_c2_8b7a]
signal t8_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1740_c2_8b7a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1740_c2_8b7a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1740_c2_8b7a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1740_c2_8b7a]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1740_c2_8b7a]
signal result_u8_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1740_c2_8b7a]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1740_c2_8b7a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1740_c2_8b7a]
signal result_u16_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1740_c2_8b7a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1740_c2_8b7a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1740_c2_8b7a]
signal n16_low_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1740_c2_8b7a]
signal n16_high_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1753_c11_fd45]
signal BIN_OP_EQ_uxn_opcodes_h_l1753_c11_fd45_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1753_c11_fd45_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1753_c11_fd45_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1753_c7_d555]
signal t8_MUX_uxn_opcodes_h_l1753_c7_d555_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1753_c7_d555_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1753_c7_d555]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_d555_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_d555_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1753_c7_d555]
signal result_u16_value_MUX_uxn_opcodes_h_l1753_c7_d555_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1753_c7_d555_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1753_c7_d555]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_d555_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_d555_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1753_c7_d555]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_d555_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_d555_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1753_c7_d555]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_d555_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_d555_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1753_c7_d555]
signal result_u8_value_MUX_uxn_opcodes_h_l1753_c7_d555_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1753_c7_d555_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1753_c7_d555]
signal n16_low_MUX_uxn_opcodes_h_l1753_c7_d555_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1753_c7_d555_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1753_c7_d555]
signal n16_high_MUX_uxn_opcodes_h_l1753_c7_d555_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1753_c7_d555_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1756_c11_72d8]
signal BIN_OP_EQ_uxn_opcodes_h_l1756_c11_72d8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1756_c11_72d8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1756_c11_72d8_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1756_c7_d873]
signal t8_MUX_uxn_opcodes_h_l1756_c7_d873_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1756_c7_d873_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1756_c7_d873]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_d873_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_d873_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1756_c7_d873]
signal result_u16_value_MUX_uxn_opcodes_h_l1756_c7_d873_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1756_c7_d873_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1756_c7_d873]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_d873_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_d873_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1756_c7_d873]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_d873_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_d873_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1756_c7_d873]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_d873_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_d873_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1756_c7_d873]
signal result_u8_value_MUX_uxn_opcodes_h_l1756_c7_d873_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1756_c7_d873_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1756_c7_d873]
signal n16_low_MUX_uxn_opcodes_h_l1756_c7_d873_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1756_c7_d873_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1756_c7_d873]
signal n16_high_MUX_uxn_opcodes_h_l1756_c7_d873_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1756_c7_d873_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1760_c11_b764]
signal BIN_OP_EQ_uxn_opcodes_h_l1760_c11_b764_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1760_c11_b764_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1760_c11_b764_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1760_c7_b7ab]
signal result_u16_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1760_c7_b7ab]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_b7ab_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_b7ab_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_b7ab_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_b7ab_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1760_c7_b7ab]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_b7ab_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_b7ab_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_b7ab_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_b7ab_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1760_c7_b7ab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_b7ab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_b7ab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_b7ab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_b7ab_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1760_c7_b7ab]
signal result_u8_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1760_c7_b7ab]
signal n16_low_MUX_uxn_opcodes_h_l1760_c7_b7ab_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1760_c7_b7ab_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1760_c7_b7ab_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1760_c7_b7ab_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1760_c7_b7ab]
signal n16_high_MUX_uxn_opcodes_h_l1760_c7_b7ab_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1760_c7_b7ab_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1760_c7_b7ab_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1760_c7_b7ab_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1762_c30_7124]
signal sp_relative_shift_uxn_opcodes_h_l1762_c30_7124_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1762_c30_7124_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1762_c30_7124_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1762_c30_7124_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1767_c11_dd6b]
signal BIN_OP_EQ_uxn_opcodes_h_l1767_c11_dd6b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1767_c11_dd6b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1767_c11_dd6b_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1767_c7_0101]
signal result_u16_value_MUX_uxn_opcodes_h_l1767_c7_0101_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1767_c7_0101_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1767_c7_0101_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1767_c7_0101_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1767_c7_0101]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_0101_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_0101_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_0101_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_0101_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1767_c7_0101]
signal result_u8_value_MUX_uxn_opcodes_h_l1767_c7_0101_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1767_c7_0101_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1767_c7_0101_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1767_c7_0101_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1767_c7_0101]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_0101_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_0101_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_0101_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_0101_return_output : signed(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1767_c7_0101]
signal n16_low_MUX_uxn_opcodes_h_l1767_c7_0101_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1767_c7_0101_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1767_c7_0101_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1767_c7_0101_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1770_c22_f4fd]
signal BIN_OP_PLUS_uxn_opcodes_h_l1770_c22_f4fd_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1770_c22_f4fd_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1770_c22_f4fd_return_output : signed(18 downto 0);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_3362
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_3362_left : signed(16 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_3362_right : signed(7 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_3362_return_output : signed(17 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.u16_value := ref_toks_8;
      base.is_pc_updated := ref_toks_9;
      base.is_opc_done := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1740_c6_925d
BIN_OP_EQ_uxn_opcodes_h_l1740_c6_925d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1740_c6_925d_left,
BIN_OP_EQ_uxn_opcodes_h_l1740_c6_925d_right,
BIN_OP_EQ_uxn_opcodes_h_l1740_c6_925d_return_output);

-- t8_MUX_uxn_opcodes_h_l1740_c2_8b7a
t8_MUX_uxn_opcodes_h_l1740_c2_8b7a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond,
t8_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue,
t8_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse,
t8_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_8b7a
result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_8b7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a
result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_8b7a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_8b7a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a
result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1740_c2_8b7a
result_u8_value_MUX_uxn_opcodes_h_l1740_c2_8b7a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_8b7a
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_8b7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_8b7a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_8b7a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1740_c2_8b7a
result_u16_value_MUX_uxn_opcodes_h_l1740_c2_8b7a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond,
result_u16_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_8b7a
result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_8b7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_8b7a
result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_8b7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1740_c2_8b7a
n16_low_MUX_uxn_opcodes_h_l1740_c2_8b7a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond,
n16_low_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue,
n16_low_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse,
n16_low_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1740_c2_8b7a
n16_high_MUX_uxn_opcodes_h_l1740_c2_8b7a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond,
n16_high_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue,
n16_high_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse,
n16_high_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1753_c11_fd45
BIN_OP_EQ_uxn_opcodes_h_l1753_c11_fd45 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1753_c11_fd45_left,
BIN_OP_EQ_uxn_opcodes_h_l1753_c11_fd45_right,
BIN_OP_EQ_uxn_opcodes_h_l1753_c11_fd45_return_output);

-- t8_MUX_uxn_opcodes_h_l1753_c7_d555
t8_MUX_uxn_opcodes_h_l1753_c7_d555 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1753_c7_d555_cond,
t8_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue,
t8_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse,
t8_MUX_uxn_opcodes_h_l1753_c7_d555_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_d555
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_d555 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_d555_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_d555_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1753_c7_d555
result_u16_value_MUX_uxn_opcodes_h_l1753_c7_d555 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1753_c7_d555_cond,
result_u16_value_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1753_c7_d555_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_d555
result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_d555 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_d555_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_d555_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_d555
result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_d555 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_d555_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_d555_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_d555
result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_d555 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_d555_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_d555_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1753_c7_d555
result_u8_value_MUX_uxn_opcodes_h_l1753_c7_d555 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1753_c7_d555_cond,
result_u8_value_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1753_c7_d555_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1753_c7_d555
n16_low_MUX_uxn_opcodes_h_l1753_c7_d555 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1753_c7_d555_cond,
n16_low_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue,
n16_low_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse,
n16_low_MUX_uxn_opcodes_h_l1753_c7_d555_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1753_c7_d555
n16_high_MUX_uxn_opcodes_h_l1753_c7_d555 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1753_c7_d555_cond,
n16_high_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue,
n16_high_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse,
n16_high_MUX_uxn_opcodes_h_l1753_c7_d555_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1756_c11_72d8
BIN_OP_EQ_uxn_opcodes_h_l1756_c11_72d8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1756_c11_72d8_left,
BIN_OP_EQ_uxn_opcodes_h_l1756_c11_72d8_right,
BIN_OP_EQ_uxn_opcodes_h_l1756_c11_72d8_return_output);

-- t8_MUX_uxn_opcodes_h_l1756_c7_d873
t8_MUX_uxn_opcodes_h_l1756_c7_d873 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1756_c7_d873_cond,
t8_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue,
t8_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse,
t8_MUX_uxn_opcodes_h_l1756_c7_d873_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_d873
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_d873 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_d873_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_d873_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1756_c7_d873
result_u16_value_MUX_uxn_opcodes_h_l1756_c7_d873 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1756_c7_d873_cond,
result_u16_value_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1756_c7_d873_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_d873
result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_d873 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_d873_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_d873_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_d873
result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_d873 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_d873_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_d873_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_d873
result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_d873 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_d873_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_d873_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1756_c7_d873
result_u8_value_MUX_uxn_opcodes_h_l1756_c7_d873 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1756_c7_d873_cond,
result_u8_value_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1756_c7_d873_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1756_c7_d873
n16_low_MUX_uxn_opcodes_h_l1756_c7_d873 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1756_c7_d873_cond,
n16_low_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue,
n16_low_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse,
n16_low_MUX_uxn_opcodes_h_l1756_c7_d873_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1756_c7_d873
n16_high_MUX_uxn_opcodes_h_l1756_c7_d873 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1756_c7_d873_cond,
n16_high_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue,
n16_high_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse,
n16_high_MUX_uxn_opcodes_h_l1756_c7_d873_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1760_c11_b764
BIN_OP_EQ_uxn_opcodes_h_l1760_c11_b764 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1760_c11_b764_left,
BIN_OP_EQ_uxn_opcodes_h_l1760_c11_b764_right,
BIN_OP_EQ_uxn_opcodes_h_l1760_c11_b764_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1760_c7_b7ab
result_u16_value_MUX_uxn_opcodes_h_l1760_c7_b7ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_cond,
result_u16_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_b7ab
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_b7ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_b7ab_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_b7ab_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_b7ab_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_b7ab_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_b7ab
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_b7ab : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_b7ab_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_b7ab_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_b7ab_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_b7ab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_b7ab
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_b7ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_b7ab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_b7ab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_b7ab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_b7ab_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1760_c7_b7ab
result_u8_value_MUX_uxn_opcodes_h_l1760_c7_b7ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_cond,
result_u8_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1760_c7_b7ab
n16_low_MUX_uxn_opcodes_h_l1760_c7_b7ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1760_c7_b7ab_cond,
n16_low_MUX_uxn_opcodes_h_l1760_c7_b7ab_iftrue,
n16_low_MUX_uxn_opcodes_h_l1760_c7_b7ab_iffalse,
n16_low_MUX_uxn_opcodes_h_l1760_c7_b7ab_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1760_c7_b7ab
n16_high_MUX_uxn_opcodes_h_l1760_c7_b7ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1760_c7_b7ab_cond,
n16_high_MUX_uxn_opcodes_h_l1760_c7_b7ab_iftrue,
n16_high_MUX_uxn_opcodes_h_l1760_c7_b7ab_iffalse,
n16_high_MUX_uxn_opcodes_h_l1760_c7_b7ab_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1762_c30_7124
sp_relative_shift_uxn_opcodes_h_l1762_c30_7124 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1762_c30_7124_ins,
sp_relative_shift_uxn_opcodes_h_l1762_c30_7124_x,
sp_relative_shift_uxn_opcodes_h_l1762_c30_7124_y,
sp_relative_shift_uxn_opcodes_h_l1762_c30_7124_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1767_c11_dd6b
BIN_OP_EQ_uxn_opcodes_h_l1767_c11_dd6b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1767_c11_dd6b_left,
BIN_OP_EQ_uxn_opcodes_h_l1767_c11_dd6b_right,
BIN_OP_EQ_uxn_opcodes_h_l1767_c11_dd6b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1767_c7_0101
result_u16_value_MUX_uxn_opcodes_h_l1767_c7_0101 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1767_c7_0101_cond,
result_u16_value_MUX_uxn_opcodes_h_l1767_c7_0101_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1767_c7_0101_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1767_c7_0101_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_0101
result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_0101 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_0101_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_0101_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_0101_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_0101_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1767_c7_0101
result_u8_value_MUX_uxn_opcodes_h_l1767_c7_0101 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1767_c7_0101_cond,
result_u8_value_MUX_uxn_opcodes_h_l1767_c7_0101_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1767_c7_0101_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1767_c7_0101_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_0101
result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_0101 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_0101_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_0101_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_0101_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_0101_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1767_c7_0101
n16_low_MUX_uxn_opcodes_h_l1767_c7_0101 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1767_c7_0101_cond,
n16_low_MUX_uxn_opcodes_h_l1767_c7_0101_iftrue,
n16_low_MUX_uxn_opcodes_h_l1767_c7_0101_iffalse,
n16_low_MUX_uxn_opcodes_h_l1767_c7_0101_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1770_c22_f4fd
BIN_OP_PLUS_uxn_opcodes_h_l1770_c22_f4fd : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1770_c22_f4fd_left,
BIN_OP_PLUS_uxn_opcodes_h_l1770_c22_f4fd_right,
BIN_OP_PLUS_uxn_opcodes_h_l1770_c22_f4fd_return_output);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_3362
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_3362 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_3362_left,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_3362_right,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_3362_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1740_c6_925d_return_output,
 t8_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output,
 n16_low_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output,
 n16_high_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1753_c11_fd45_return_output,
 t8_MUX_uxn_opcodes_h_l1753_c7_d555_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_d555_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1753_c7_d555_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_d555_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_d555_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_d555_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1753_c7_d555_return_output,
 n16_low_MUX_uxn_opcodes_h_l1753_c7_d555_return_output,
 n16_high_MUX_uxn_opcodes_h_l1753_c7_d555_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1756_c11_72d8_return_output,
 t8_MUX_uxn_opcodes_h_l1756_c7_d873_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_d873_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1756_c7_d873_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_d873_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_d873_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_d873_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1756_c7_d873_return_output,
 n16_low_MUX_uxn_opcodes_h_l1756_c7_d873_return_output,
 n16_high_MUX_uxn_opcodes_h_l1756_c7_d873_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1760_c11_b764_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_b7ab_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_b7ab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_b7ab_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_return_output,
 n16_low_MUX_uxn_opcodes_h_l1760_c7_b7ab_return_output,
 n16_high_MUX_uxn_opcodes_h_l1760_c7_b7ab_return_output,
 sp_relative_shift_uxn_opcodes_h_l1762_c30_7124_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1767_c11_dd6b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1767_c7_0101_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_0101_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1767_c7_0101_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_0101_return_output,
 n16_low_MUX_uxn_opcodes_h_l1767_c7_0101_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1770_c22_f4fd_return_output,
 BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_3362_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c6_925d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c6_925d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c6_925d_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1753_c7_d555_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1740_c2_8b7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_d555_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1745_c3_cd53 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_d555_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1740_c2_8b7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1753_c7_d555_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1740_c2_8b7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1750_c3_61bf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_d555_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1753_c7_d555_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1740_c2_8b7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_d555_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1753_c7_d555_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1753_c7_d555_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_fd45_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_fd45_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_fd45_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1756_c7_d873_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1753_c7_d555_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1754_c3_e463 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_d873_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_d555_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1756_c7_d873_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1753_c7_d555_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_d873_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_d555_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_d873_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_d555_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_d873_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_d555_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1756_c7_d873_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1753_c7_d555_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1756_c7_d873_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1753_c7_d555_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1756_c7_d873_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1753_c7_d555_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1756_c11_72d8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1756_c11_72d8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1756_c11_72d8_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1756_c7_d873_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1758_c3_2c5b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1756_c7_d873_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_d873_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1756_c7_d873_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_b7ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_d873_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_b7ab_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_d873_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_b7ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_d873_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1756_c7_d873_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1760_c7_b7ab_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1756_c7_d873_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1760_c7_b7ab_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1756_c7_d873_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_b764_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_b764_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_b764_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1764_c3_d7b4 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1767_c7_0101_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_b7ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_b7ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_b7ab_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_b7ab_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_b7ab_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_0101_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_b7ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_b7ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_b7ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_0101_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_b7ab_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1767_c7_0101_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1760_c7_b7ab_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1760_c7_b7ab_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1767_c7_0101_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1760_c7_b7ab_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1760_c7_b7ab_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1760_c7_b7ab_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1760_c7_b7ab_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1762_c30_7124_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1762_c30_7124_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1762_c30_7124_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1762_c30_7124_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_dd6b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_dd6b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_dd6b_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1767_c7_0101_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1770_c3_0260 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1767_c7_0101_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1767_c7_0101_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_0101_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_0101_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_0101_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1767_c7_0101_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1767_c7_0101_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1767_c7_0101_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_0101_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1769_c3_7ef6 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_0101_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_0101_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1767_c7_0101_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1767_c7_0101_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1767_c7_0101_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1770_c22_f4fd_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1770_c22_f4fd_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1770_c22_f4fd_return_output : signed(18 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1756_l1740_l1753_l1767_DUPLICATE_ca09_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1756_l1740_l1753_l1767_DUPLICATE_4559_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1756_l1760_l1753_DUPLICATE_7a18_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1756_l1753_l1767_DUPLICATE_bd59_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1756_l1760_l1753_l1767_DUPLICATE_0e0f_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_db7e_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_3362_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_3362_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_3362_return_output : signed(17 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4_uxn_opcodes_h_l1775_l1736_DUPLICATE_9352_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_dd6b_right := to_unsigned(4, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1762_c30_7124_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1770_c22_f4fd_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1769_c3_7ef6 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_0101_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1769_c3_7ef6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c6_925d_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1756_c11_72d8_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1762_c30_7124_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1754_c3_e463 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1754_c3_e463;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1750_c3_61bf := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1750_c3_61bf;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_0101_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_b764_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1758_c3_2c5b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1758_c3_2c5b;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_fd45_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1745_c3_cd53 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1745_c3_cd53;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_b7ab_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1762_c30_7124_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1760_c7_b7ab_iffalse := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1760_c7_b7ab_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1767_c7_0101_iffalse := n16_low;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_3362_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c6_925d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_fd45_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1756_c11_72d8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_b764_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_dd6b_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l1760_c7_b7ab_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l1767_c7_0101_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1767_c7_0101_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1756_c11_72d8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1756_c11_72d8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1756_c11_72d8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1756_c11_72d8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1756_c11_72d8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1756_c11_72d8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1756_c11_72d8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1767_c11_dd6b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1767_c11_dd6b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_dd6b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1767_c11_dd6b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_dd6b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_dd6b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1767_c11_dd6b_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l1740_c2_8b7a] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1740_c2_8b7a_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1756_l1740_l1753_l1767_DUPLICATE_ca09 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1756_l1740_l1753_l1767_DUPLICATE_ca09_return_output := result.u8_value;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1756_l1740_l1753_l1767_DUPLICATE_4559 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1756_l1740_l1753_l1767_DUPLICATE_4559_return_output := result.u16_value;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1756_c7_d873] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1756_c7_d873_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1756_l1753_l1767_DUPLICATE_bd59 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1756_l1753_l1767_DUPLICATE_bd59_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1740_c6_925d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1740_c6_925d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c6_925d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1740_c6_925d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c6_925d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c6_925d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1740_c6_925d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1753_c11_fd45] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1753_c11_fd45_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_fd45_left;
     BIN_OP_EQ_uxn_opcodes_h_l1753_c11_fd45_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_fd45_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_fd45_return_output := BIN_OP_EQ_uxn_opcodes_h_l1753_c11_fd45_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1756_l1760_l1753_l1767_DUPLICATE_0e0f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1756_l1760_l1753_l1767_DUPLICATE_0e0f_return_output := result.is_opc_done;

     -- sp_relative_shift[uxn_opcodes_h_l1762_c30_7124] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1762_c30_7124_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1762_c30_7124_ins;
     sp_relative_shift_uxn_opcodes_h_l1762_c30_7124_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1762_c30_7124_x;
     sp_relative_shift_uxn_opcodes_h_l1762_c30_7124_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1762_c30_7124_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1762_c30_7124_return_output := sp_relative_shift_uxn_opcodes_h_l1762_c30_7124_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1760_c11_b764] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1760_c11_b764_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_b764_left;
     BIN_OP_EQ_uxn_opcodes_h_l1760_c11_b764_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_b764_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_b764_return_output := BIN_OP_EQ_uxn_opcodes_h_l1760_c11_b764_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1740_c2_8b7a] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1740_c2_8b7a_return_output := result.is_pc_updated;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1740_c2_8b7a] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1740_c2_8b7a_return_output := result.is_stack_index_flipped;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1740_c2_8b7a] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1740_c2_8b7a_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1756_l1760_l1753_DUPLICATE_7a18 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1756_l1760_l1753_DUPLICATE_7a18_return_output := result.is_ram_write;

     -- CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_db7e LATENCY=0
     VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_db7e_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c6_925d_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c6_925d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c6_925d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c6_925d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c6_925d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c6_925d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c6_925d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c6_925d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c6_925d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c6_925d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c6_925d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c6_925d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c6_925d_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1753_c7_d555_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_fd45_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1753_c7_d555_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_fd45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_d555_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_fd45_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_d555_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_fd45_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_d555_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_fd45_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_d555_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_fd45_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1753_c7_d555_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_fd45_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1753_c7_d555_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_fd45_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1753_c7_d555_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_fd45_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1756_c7_d873_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1756_c11_72d8_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1756_c7_d873_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1756_c11_72d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_d873_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1756_c11_72d8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_d873_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1756_c11_72d8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_d873_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1756_c11_72d8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_d873_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1756_c11_72d8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1756_c7_d873_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1756_c11_72d8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1756_c7_d873_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1756_c11_72d8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1756_c7_d873_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1756_c11_72d8_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1760_c7_b7ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_b764_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1760_c7_b7ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_b764_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_b7ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_b764_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_b7ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_b764_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_b7ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_b764_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_b764_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_b764_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1767_c7_0101_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_dd6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_0101_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_dd6b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_0101_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_dd6b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1767_c7_0101_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_dd6b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1767_c7_0101_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_dd6b_return_output;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_3362_right := VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_db7e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1756_l1753_l1767_DUPLICATE_bd59_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1756_l1753_l1767_DUPLICATE_bd59_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_0101_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1756_l1753_l1767_DUPLICATE_bd59_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1756_l1740_l1753_l1767_DUPLICATE_4559_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1756_l1740_l1753_l1767_DUPLICATE_4559_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1756_l1740_l1753_l1767_DUPLICATE_4559_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1767_c7_0101_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1756_l1740_l1753_l1767_DUPLICATE_4559_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1756_l1760_l1753_l1767_DUPLICATE_0e0f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1756_l1760_l1753_l1767_DUPLICATE_0e0f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_b7ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1756_l1760_l1753_l1767_DUPLICATE_0e0f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_0101_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1756_l1760_l1753_l1767_DUPLICATE_0e0f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1756_l1760_l1753_DUPLICATE_7a18_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1756_l1760_l1753_DUPLICATE_7a18_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_b7ab_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1756_l1760_l1753_DUPLICATE_7a18_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1756_l1740_l1753_l1767_DUPLICATE_ca09_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1756_l1740_l1753_l1767_DUPLICATE_ca09_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1756_l1740_l1753_l1767_DUPLICATE_ca09_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1767_c7_0101_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1756_l1740_l1753_l1767_DUPLICATE_ca09_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1740_c2_8b7a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1740_c2_8b7a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1740_c2_8b7a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1740_c2_8b7a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1756_c7_d873_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_b7ab_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1762_c30_7124_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1767_c7_0101] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1767_c7_0101_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1767_c7_0101_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1767_c7_0101_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1767_c7_0101_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1767_c7_0101_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1767_c7_0101_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1767_c7_0101_return_output := result_u8_value_MUX_uxn_opcodes_h_l1767_c7_0101_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1740_c2_8b7a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1760_c7_b7ab] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_b7ab_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_b7ab_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_b7ab_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_b7ab_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_b7ab_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_b7ab_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_b7ab_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_b7ab_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1740_c2_8b7a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output;

     -- t8_MUX[uxn_opcodes_h_l1756_c7_d873] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1756_c7_d873_cond <= VAR_t8_MUX_uxn_opcodes_h_l1756_c7_d873_cond;
     t8_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue;
     t8_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1756_c7_d873_return_output := t8_MUX_uxn_opcodes_h_l1756_c7_d873_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1756_c7_d873] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_d873_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_d873_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_d873_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_d873_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1767_c7_0101] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_0101_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_0101_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_0101_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_0101_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_0101_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_0101_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_0101_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_0101_return_output;

     -- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_3362 LATENCY=0
     -- Inputs
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_3362_left <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_3362_left;
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_3362_right <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_3362_right;
     -- Outputs
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_3362_return_output := BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_3362_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1740_c2_8b7a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1760_c7_b7ab] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1760_c7_b7ab_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1760_c7_b7ab_cond;
     n16_high_MUX_uxn_opcodes_h_l1760_c7_b7ab_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1760_c7_b7ab_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1760_c7_b7ab_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1760_c7_b7ab_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1760_c7_b7ab_return_output := n16_high_MUX_uxn_opcodes_h_l1760_c7_b7ab_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1767_c7_0101] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_0101_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_0101_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_0101_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_0101_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_0101_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_0101_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_0101_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_0101_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1740_c2_8b7a] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1767_c7_0101] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1767_c7_0101_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1767_c7_0101_cond;
     n16_low_MUX_uxn_opcodes_h_l1767_c7_0101_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1767_c7_0101_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1767_c7_0101_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1767_c7_0101_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1767_c7_0101_return_output := n16_low_MUX_uxn_opcodes_h_l1767_c7_0101_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1770_c22_f4fd_left := VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_3362_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1764_c3_d7b4 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1764_l1770_DUPLICATE_3362_return_output)),16);
     VAR_n16_high_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1760_c7_b7ab_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1760_c7_b7ab_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1767_c7_0101_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_b7ab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_0101_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_b7ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_b7ab_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_0101_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1756_c7_d873_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1767_c7_0101_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1756_c7_d873_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1764_c3_d7b4;
     -- n16_high_MUX[uxn_opcodes_h_l1756_c7_d873] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1756_c7_d873_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1756_c7_d873_cond;
     n16_high_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1756_c7_d873_return_output := n16_high_MUX_uxn_opcodes_h_l1756_c7_d873_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1760_c7_b7ab] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1760_c7_b7ab_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1760_c7_b7ab_cond;
     n16_low_MUX_uxn_opcodes_h_l1760_c7_b7ab_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1760_c7_b7ab_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1760_c7_b7ab_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1760_c7_b7ab_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1760_c7_b7ab_return_output := n16_low_MUX_uxn_opcodes_h_l1760_c7_b7ab_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1760_c7_b7ab] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_b7ab_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_b7ab_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_b7ab_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_b7ab_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_b7ab_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_b7ab_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_b7ab_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_b7ab_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1760_c7_b7ab] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_return_output := result_u8_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1760_c7_b7ab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_b7ab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_b7ab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_b7ab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_b7ab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_b7ab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_b7ab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_b7ab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_b7ab_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1770_c22_f4fd] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1770_c22_f4fd_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1770_c22_f4fd_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1770_c22_f4fd_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1770_c22_f4fd_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1770_c22_f4fd_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1770_c22_f4fd_return_output;

     -- t8_MUX[uxn_opcodes_h_l1753_c7_d555] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1753_c7_d555_cond <= VAR_t8_MUX_uxn_opcodes_h_l1753_c7_d555_cond;
     t8_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue;
     t8_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1753_c7_d555_return_output := t8_MUX_uxn_opcodes_h_l1753_c7_d555_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1753_c7_d555] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_d555_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_d555_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_d555_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_d555_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1756_c7_d873] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_d873_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_d873_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_d873_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_d873_return_output;

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1770_c3_0260 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1770_c22_f4fd_return_output)),16);
     VAR_n16_high_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1756_c7_d873_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1760_c7_b7ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_b7ab_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1756_c7_d873_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_b7ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_d555_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1753_c7_d555_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1767_c7_0101_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1770_c3_0260;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1740_c2_8b7a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1753_c7_d555] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_d555_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_d555_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_d555_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_d555_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1756_c7_d873] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1756_c7_d873_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1756_c7_d873_cond;
     n16_low_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1756_c7_d873_return_output := n16_low_MUX_uxn_opcodes_h_l1756_c7_d873_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1753_c7_d555] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1753_c7_d555_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1753_c7_d555_cond;
     n16_high_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1753_c7_d555_return_output := n16_high_MUX_uxn_opcodes_h_l1753_c7_d555_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1756_c7_d873] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1756_c7_d873_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1756_c7_d873_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1756_c7_d873_return_output := result_u8_value_MUX_uxn_opcodes_h_l1756_c7_d873_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1767_c7_0101] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1767_c7_0101_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1767_c7_0101_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1767_c7_0101_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1767_c7_0101_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1767_c7_0101_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1767_c7_0101_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1767_c7_0101_return_output := result_u16_value_MUX_uxn_opcodes_h_l1767_c7_0101_return_output;

     -- t8_MUX[uxn_opcodes_h_l1740_c2_8b7a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond <= VAR_t8_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond;
     t8_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue;
     t8_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output := t8_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1756_c7_d873] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_d873_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_d873_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_d873_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_d873_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1756_c7_d873] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_d873_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_d873_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_d873_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_d873_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1753_c7_d555_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1756_c7_d873_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1756_c7_d873_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_d555_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1756_c7_d873_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1767_c7_0101_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1756_c7_d873_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1740_c2_8b7a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1753_c7_d555] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1753_c7_d555_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1753_c7_d555_cond;
     n16_low_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1753_c7_d555_return_output := n16_low_MUX_uxn_opcodes_h_l1753_c7_d555_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1740_c2_8b7a] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond;
     n16_high_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output := n16_high_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1760_c7_b7ab] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_return_output := result_u16_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1753_c7_d555] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_d555_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_d555_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_d555_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_d555_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1753_c7_d555] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_d555_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_d555_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_d555_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_d555_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1753_c7_d555] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1753_c7_d555_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1753_c7_d555_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1753_c7_d555_return_output := result_u8_value_MUX_uxn_opcodes_h_l1753_c7_d555_return_output;

     -- Submodule level 5
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1753_c7_d555_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_d555_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_d555_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c7_b7ab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1753_c7_d555_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1740_c2_8b7a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1740_c2_8b7a] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond;
     n16_low_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output := n16_low_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1756_c7_d873] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1756_c7_d873_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1756_c7_d873_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1756_c7_d873_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1756_c7_d873_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1756_c7_d873_return_output := result_u16_value_MUX_uxn_opcodes_h_l1756_c7_d873_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1740_c2_8b7a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1740_c2_8b7a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output;

     -- Submodule level 6
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1756_c7_d873_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1753_c7_d555] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1753_c7_d555_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1753_c7_d555_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1753_c7_d555_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1753_c7_d555_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1753_c7_d555_return_output := result_u16_value_MUX_uxn_opcodes_h_l1753_c7_d555_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1753_c7_d555_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1740_c2_8b7a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output := result_u16_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4_uxn_opcodes_h_l1775_l1736_DUPLICATE_9352 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4_uxn_opcodes_h_l1775_l1736_DUPLICATE_9352_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c2_8b7a_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4_uxn_opcodes_h_l1775_l1736_DUPLICATE_9352_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4_uxn_opcodes_h_l1775_l1736_DUPLICATE_9352_return_output;
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
