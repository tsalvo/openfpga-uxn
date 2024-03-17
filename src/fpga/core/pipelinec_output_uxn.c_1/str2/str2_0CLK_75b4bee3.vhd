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
-- BIN_OP_EQ[uxn_opcodes_h_l1718_c6_1209]
signal BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1209_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1209_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1209_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1718_c2_8949]
signal result_u8_value_MUX_uxn_opcodes_h_l1718_c2_8949_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1718_c2_8949_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1718_c2_8949]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_8949_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_8949_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1718_c2_8949]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_8949_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_8949_return_output : unsigned(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1718_c2_8949]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_8949_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_8949_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1718_c2_8949]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_8949_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_8949_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1718_c2_8949]
signal result_u16_value_MUX_uxn_opcodes_h_l1718_c2_8949_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1718_c2_8949_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1718_c2_8949]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_8949_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_8949_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1718_c2_8949]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_8949_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_8949_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1718_c2_8949]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_8949_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_8949_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1718_c2_8949]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_8949_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_8949_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1718_c2_8949]
signal t8_MUX_uxn_opcodes_h_l1718_c2_8949_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1718_c2_8949_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1718_c2_8949]
signal n16_low_MUX_uxn_opcodes_h_l1718_c2_8949_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1718_c2_8949_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1718_c2_8949]
signal n16_high_MUX_uxn_opcodes_h_l1718_c2_8949_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1718_c2_8949_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1731_c11_b316]
signal BIN_OP_EQ_uxn_opcodes_h_l1731_c11_b316_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1731_c11_b316_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1731_c11_b316_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1731_c7_3b89]
signal result_u8_value_MUX_uxn_opcodes_h_l1731_c7_3b89_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1731_c7_3b89]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_3b89_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1731_c7_3b89]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_3b89_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1731_c7_3b89]
signal result_u16_value_MUX_uxn_opcodes_h_l1731_c7_3b89_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1731_c7_3b89]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_3b89_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1731_c7_3b89]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_3b89_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1731_c7_3b89]
signal t8_MUX_uxn_opcodes_h_l1731_c7_3b89_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1731_c7_3b89]
signal n16_low_MUX_uxn_opcodes_h_l1731_c7_3b89_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1731_c7_3b89]
signal n16_high_MUX_uxn_opcodes_h_l1731_c7_3b89_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1734_c11_a377]
signal BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a377_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a377_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a377_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1734_c7_c84b]
signal result_u8_value_MUX_uxn_opcodes_h_l1734_c7_c84b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1734_c7_c84b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_c84b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1734_c7_c84b]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_c84b_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1734_c7_c84b]
signal result_u16_value_MUX_uxn_opcodes_h_l1734_c7_c84b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1734_c7_c84b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_c84b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1734_c7_c84b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_c84b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1734_c7_c84b]
signal t8_MUX_uxn_opcodes_h_l1734_c7_c84b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1734_c7_c84b]
signal n16_low_MUX_uxn_opcodes_h_l1734_c7_c84b_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1734_c7_c84b]
signal n16_high_MUX_uxn_opcodes_h_l1734_c7_c84b_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1738_c11_9f9c]
signal BIN_OP_EQ_uxn_opcodes_h_l1738_c11_9f9c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1738_c11_9f9c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1738_c11_9f9c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1738_c7_4126]
signal result_u8_value_MUX_uxn_opcodes_h_l1738_c7_4126_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1738_c7_4126_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1738_c7_4126_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1738_c7_4126_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1738_c7_4126]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_4126_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_4126_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_4126_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_4126_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1738_c7_4126]
signal result_u16_value_MUX_uxn_opcodes_h_l1738_c7_4126_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1738_c7_4126_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1738_c7_4126_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1738_c7_4126_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1738_c7_4126]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_4126_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_4126_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_4126_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_4126_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1738_c7_4126]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_4126_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_4126_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_4126_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_4126_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1738_c7_4126]
signal n16_low_MUX_uxn_opcodes_h_l1738_c7_4126_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1738_c7_4126_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1738_c7_4126_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1738_c7_4126_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1738_c7_4126]
signal n16_high_MUX_uxn_opcodes_h_l1738_c7_4126_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1738_c7_4126_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1738_c7_4126_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1738_c7_4126_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1740_c30_8653]
signal sp_relative_shift_uxn_opcodes_h_l1740_c30_8653_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1740_c30_8653_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1740_c30_8653_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1740_c30_8653_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1745_c11_7ea7]
signal BIN_OP_EQ_uxn_opcodes_h_l1745_c11_7ea7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1745_c11_7ea7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1745_c11_7ea7_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1745_c7_15f4]
signal result_u16_value_MUX_uxn_opcodes_h_l1745_c7_15f4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1745_c7_15f4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1745_c7_15f4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1745_c7_15f4_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1745_c7_15f4]
signal result_u8_value_MUX_uxn_opcodes_h_l1745_c7_15f4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1745_c7_15f4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1745_c7_15f4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1745_c7_15f4_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1745_c7_15f4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_15f4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_15f4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_15f4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_15f4_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1745_c7_15f4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_15f4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_15f4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_15f4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_15f4_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1745_c7_15f4]
signal n16_low_MUX_uxn_opcodes_h_l1745_c7_15f4_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1745_c7_15f4_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1745_c7_15f4_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1745_c7_15f4_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1748_c22_6ccc]
signal BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_6ccc_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_6ccc_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_6ccc_return_output : signed(18 downto 0);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_9c12
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_9c12_left : signed(16 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_9c12_right : signed(7 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_9c12_return_output : signed(17 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_2c6d( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : signed;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.is_stack_index_flipped := ref_toks_5;
      base.u16_value := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.sp_relative_shift := ref_toks_9;
      base.is_opc_done := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1209
BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1209 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1209_left,
BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1209_right,
BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1209_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1718_c2_8949
result_u8_value_MUX_uxn_opcodes_h_l1718_c2_8949 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1718_c2_8949_cond,
result_u8_value_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1718_c2_8949_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_8949
result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_8949 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_8949_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_8949_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_8949
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_8949 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_8949_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_8949_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_8949
result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_8949 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_8949_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_8949_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_8949
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_8949 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_8949_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_8949_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1718_c2_8949
result_u16_value_MUX_uxn_opcodes_h_l1718_c2_8949 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1718_c2_8949_cond,
result_u16_value_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1718_c2_8949_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_8949
result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_8949 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_8949_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_8949_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_8949
result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_8949 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_8949_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_8949_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_8949
result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_8949 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_8949_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_8949_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_8949
result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_8949 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_8949_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_8949_return_output);

-- t8_MUX_uxn_opcodes_h_l1718_c2_8949
t8_MUX_uxn_opcodes_h_l1718_c2_8949 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1718_c2_8949_cond,
t8_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue,
t8_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse,
t8_MUX_uxn_opcodes_h_l1718_c2_8949_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1718_c2_8949
n16_low_MUX_uxn_opcodes_h_l1718_c2_8949 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1718_c2_8949_cond,
n16_low_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue,
n16_low_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse,
n16_low_MUX_uxn_opcodes_h_l1718_c2_8949_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1718_c2_8949
n16_high_MUX_uxn_opcodes_h_l1718_c2_8949 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1718_c2_8949_cond,
n16_high_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue,
n16_high_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse,
n16_high_MUX_uxn_opcodes_h_l1718_c2_8949_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1731_c11_b316
BIN_OP_EQ_uxn_opcodes_h_l1731_c11_b316 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1731_c11_b316_left,
BIN_OP_EQ_uxn_opcodes_h_l1731_c11_b316_right,
BIN_OP_EQ_uxn_opcodes_h_l1731_c11_b316_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1731_c7_3b89
result_u8_value_MUX_uxn_opcodes_h_l1731_c7_3b89 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1731_c7_3b89_cond,
result_u8_value_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_3b89
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_3b89 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_3b89_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_3b89
result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_3b89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_3b89_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1731_c7_3b89
result_u16_value_MUX_uxn_opcodes_h_l1731_c7_3b89 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1731_c7_3b89_cond,
result_u16_value_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_3b89
result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_3b89 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_3b89_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_3b89
result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_3b89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_3b89_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output);

-- t8_MUX_uxn_opcodes_h_l1731_c7_3b89
t8_MUX_uxn_opcodes_h_l1731_c7_3b89 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1731_c7_3b89_cond,
t8_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue,
t8_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse,
t8_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1731_c7_3b89
n16_low_MUX_uxn_opcodes_h_l1731_c7_3b89 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1731_c7_3b89_cond,
n16_low_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue,
n16_low_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse,
n16_low_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1731_c7_3b89
n16_high_MUX_uxn_opcodes_h_l1731_c7_3b89 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1731_c7_3b89_cond,
n16_high_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue,
n16_high_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse,
n16_high_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a377
BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a377 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a377_left,
BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a377_right,
BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a377_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1734_c7_c84b
result_u8_value_MUX_uxn_opcodes_h_l1734_c7_c84b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1734_c7_c84b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_c84b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_c84b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_c84b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_c84b
result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_c84b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_c84b_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1734_c7_c84b
result_u16_value_MUX_uxn_opcodes_h_l1734_c7_c84b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1734_c7_c84b_cond,
result_u16_value_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_c84b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_c84b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_c84b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_c84b
result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_c84b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_c84b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output);

-- t8_MUX_uxn_opcodes_h_l1734_c7_c84b
t8_MUX_uxn_opcodes_h_l1734_c7_c84b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1734_c7_c84b_cond,
t8_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue,
t8_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse,
t8_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1734_c7_c84b
n16_low_MUX_uxn_opcodes_h_l1734_c7_c84b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1734_c7_c84b_cond,
n16_low_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue,
n16_low_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse,
n16_low_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1734_c7_c84b
n16_high_MUX_uxn_opcodes_h_l1734_c7_c84b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1734_c7_c84b_cond,
n16_high_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue,
n16_high_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse,
n16_high_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1738_c11_9f9c
BIN_OP_EQ_uxn_opcodes_h_l1738_c11_9f9c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1738_c11_9f9c_left,
BIN_OP_EQ_uxn_opcodes_h_l1738_c11_9f9c_right,
BIN_OP_EQ_uxn_opcodes_h_l1738_c11_9f9c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1738_c7_4126
result_u8_value_MUX_uxn_opcodes_h_l1738_c7_4126 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1738_c7_4126_cond,
result_u8_value_MUX_uxn_opcodes_h_l1738_c7_4126_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1738_c7_4126_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1738_c7_4126_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_4126
result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_4126 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_4126_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_4126_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_4126_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_4126_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1738_c7_4126
result_u16_value_MUX_uxn_opcodes_h_l1738_c7_4126 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1738_c7_4126_cond,
result_u16_value_MUX_uxn_opcodes_h_l1738_c7_4126_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1738_c7_4126_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1738_c7_4126_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_4126
result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_4126 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_4126_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_4126_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_4126_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_4126_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_4126
result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_4126 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_4126_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_4126_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_4126_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_4126_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1738_c7_4126
n16_low_MUX_uxn_opcodes_h_l1738_c7_4126 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1738_c7_4126_cond,
n16_low_MUX_uxn_opcodes_h_l1738_c7_4126_iftrue,
n16_low_MUX_uxn_opcodes_h_l1738_c7_4126_iffalse,
n16_low_MUX_uxn_opcodes_h_l1738_c7_4126_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1738_c7_4126
n16_high_MUX_uxn_opcodes_h_l1738_c7_4126 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1738_c7_4126_cond,
n16_high_MUX_uxn_opcodes_h_l1738_c7_4126_iftrue,
n16_high_MUX_uxn_opcodes_h_l1738_c7_4126_iffalse,
n16_high_MUX_uxn_opcodes_h_l1738_c7_4126_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1740_c30_8653
sp_relative_shift_uxn_opcodes_h_l1740_c30_8653 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1740_c30_8653_ins,
sp_relative_shift_uxn_opcodes_h_l1740_c30_8653_x,
sp_relative_shift_uxn_opcodes_h_l1740_c30_8653_y,
sp_relative_shift_uxn_opcodes_h_l1740_c30_8653_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1745_c11_7ea7
BIN_OP_EQ_uxn_opcodes_h_l1745_c11_7ea7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1745_c11_7ea7_left,
BIN_OP_EQ_uxn_opcodes_h_l1745_c11_7ea7_right,
BIN_OP_EQ_uxn_opcodes_h_l1745_c11_7ea7_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1745_c7_15f4
result_u16_value_MUX_uxn_opcodes_h_l1745_c7_15f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1745_c7_15f4_cond,
result_u16_value_MUX_uxn_opcodes_h_l1745_c7_15f4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1745_c7_15f4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1745_c7_15f4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1745_c7_15f4
result_u8_value_MUX_uxn_opcodes_h_l1745_c7_15f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1745_c7_15f4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1745_c7_15f4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1745_c7_15f4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1745_c7_15f4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_15f4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_15f4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_15f4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_15f4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_15f4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_15f4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_15f4
result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_15f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_15f4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_15f4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_15f4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_15f4_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1745_c7_15f4
n16_low_MUX_uxn_opcodes_h_l1745_c7_15f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1745_c7_15f4_cond,
n16_low_MUX_uxn_opcodes_h_l1745_c7_15f4_iftrue,
n16_low_MUX_uxn_opcodes_h_l1745_c7_15f4_iffalse,
n16_low_MUX_uxn_opcodes_h_l1745_c7_15f4_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_6ccc
BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_6ccc : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_6ccc_left,
BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_6ccc_right,
BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_6ccc_return_output);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_9c12
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_9c12 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_9c12_left,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_9c12_right,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_9c12_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1209_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1718_c2_8949_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_8949_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_8949_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_8949_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_8949_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1718_c2_8949_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_8949_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_8949_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_8949_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_8949_return_output,
 t8_MUX_uxn_opcodes_h_l1718_c2_8949_return_output,
 n16_low_MUX_uxn_opcodes_h_l1718_c2_8949_return_output,
 n16_high_MUX_uxn_opcodes_h_l1718_c2_8949_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1731_c11_b316_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output,
 t8_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output,
 n16_low_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output,
 n16_high_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a377_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output,
 t8_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output,
 n16_low_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output,
 n16_high_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1738_c11_9f9c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1738_c7_4126_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_4126_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1738_c7_4126_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_4126_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_4126_return_output,
 n16_low_MUX_uxn_opcodes_h_l1738_c7_4126_return_output,
 n16_high_MUX_uxn_opcodes_h_l1738_c7_4126_return_output,
 sp_relative_shift_uxn_opcodes_h_l1740_c30_8653_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1745_c11_7ea7_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1745_c7_15f4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1745_c7_15f4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_15f4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_15f4_return_output,
 n16_low_MUX_uxn_opcodes_h_l1745_c7_15f4_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_6ccc_return_output,
 BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_9c12_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1209_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1209_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1209_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c2_8949_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c2_8949_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1718_c2_8949_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_8949_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_8949_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1728_c3_393e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_8949_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_8949_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1718_c2_8949_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_8949_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_8949_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1718_c2_8949_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_8949_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_8949_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c2_8949_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c2_8949_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1718_c2_8949_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_8949_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_8949_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_8949_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_8949_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1723_c3_35c7 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_8949_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_8949_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_8949_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_8949_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1718_c2_8949_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1718_c2_8949_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1718_c2_8949_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1718_c2_8949_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1718_c2_8949_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1718_c2_8949_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_b316_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_b316_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_b316_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_3b89_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1732_c3_8f40 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_3b89_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_3b89_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_3b89_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_3b89_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_3b89_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1731_c7_3b89_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1731_c7_3b89_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1731_c7_3b89_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a377_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a377_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a377_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_4126_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_c84b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1736_c3_0aa2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1734_c7_c84b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_c84b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_4126_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_c84b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_4126_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_c84b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_4126_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_c84b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_4126_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_c84b_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1734_c7_c84b_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_4126_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1734_c7_c84b_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_4126_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1734_c7_c84b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_9f9c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_9f9c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_9f9c_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_4126_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_4126_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_15f4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_4126_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_4126_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_4126_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_4126_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_4126_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1742_c3_874f : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_4126_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_15f4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_4126_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_4126_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_4126_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_15f4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_4126_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_4126_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_4126_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_15f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_4126_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_4126_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_4126_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1745_c7_15f4_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_4126_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_4126_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_4126_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_4126_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_8653_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_8653_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_8653_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_8653_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_7ea7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_7ea7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_7ea7_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_15f4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1748_c3_1b18 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_15f4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_15f4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_15f4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_15f4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_15f4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_15f4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1747_c3_69e9 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_15f4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_15f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_15f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_15f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_15f4_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1745_c7_15f4_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1745_c7_15f4_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1745_c7_15f4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_6ccc_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_6ccc_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_6ccc_return_output : signed(18 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1731_l1745_l1734_l1718_DUPLICATE_2f51_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1731_l1745_l1734_l1718_DUPLICATE_49d8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1731_l1734_l1738_DUPLICATE_a9cb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1731_l1745_l1734_DUPLICATE_ff70_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1731_l1745_l1734_l1738_DUPLICATE_8e71_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1748_l1742_DUPLICATE_35d4_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_9c12_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_9c12_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_9c12_return_output : signed(17 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2c6d_uxn_opcodes_h_l1753_l1714_DUPLICATE_d1e7_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1209_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_4126_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1732_c3_8f40 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1732_c3_8f40;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1728_c3_393e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1728_c3_393e;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_9f9c_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_8653_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1736_c3_0aa2 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1736_c3_0aa2;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a377_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1747_c3_69e9 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_15f4_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1747_c3_69e9;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_b316_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_7ea7_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_15f4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_6ccc_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_8653_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1723_c3_35c7 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1723_c3_35c7;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_8653_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_4126_iffalse := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_4126_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1745_c7_15f4_iffalse := n16_low;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_9c12_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1209_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_b316_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a377_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_9f9c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_7ea7_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_4126_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l1745_c7_15f4_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_4126_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_15f4_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse := t8;
     -- sp_relative_shift[uxn_opcodes_h_l1740_c30_8653] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1740_c30_8653_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_8653_ins;
     sp_relative_shift_uxn_opcodes_h_l1740_c30_8653_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_8653_x;
     sp_relative_shift_uxn_opcodes_h_l1740_c30_8653_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_8653_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_8653_return_output := sp_relative_shift_uxn_opcodes_h_l1740_c30_8653_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1731_l1745_l1734_l1718_DUPLICATE_2f51 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1731_l1745_l1734_l1718_DUPLICATE_2f51_return_output := result.u8_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1731_l1745_l1734_DUPLICATE_ff70 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1731_l1745_l1734_DUPLICATE_ff70_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1734_c11_a377] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a377_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a377_left;
     BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a377_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a377_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a377_return_output := BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a377_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1745_c11_7ea7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1745_c11_7ea7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_7ea7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1745_c11_7ea7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_7ea7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_7ea7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1745_c11_7ea7_return_output;

     -- CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1748_l1742_DUPLICATE_35d4 LATENCY=0
     VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1748_l1742_DUPLICATE_35d4_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1718_c2_8949] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1718_c2_8949_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1738_c11_9f9c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1738_c11_9f9c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_9f9c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1738_c11_9f9c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_9f9c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_9f9c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1738_c11_9f9c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1718_c6_1209] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1209_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1209_left;
     BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1209_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1209_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1209_return_output := BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1209_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1718_c2_8949] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1718_c2_8949_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1731_l1745_l1734_l1718_DUPLICATE_49d8 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1731_l1745_l1734_l1718_DUPLICATE_49d8_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1731_l1734_l1738_DUPLICATE_a9cb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1731_l1734_l1738_DUPLICATE_a9cb_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1731_c11_b316] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1731_c11_b316_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_b316_left;
     BIN_OP_EQ_uxn_opcodes_h_l1731_c11_b316_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_b316_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_b316_return_output := BIN_OP_EQ_uxn_opcodes_h_l1731_c11_b316_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1734_c7_c84b] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1734_c7_c84b_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1731_l1745_l1734_l1738_DUPLICATE_8e71 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1731_l1745_l1734_l1738_DUPLICATE_8e71_return_output := result.is_opc_done;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l1718_c2_8949] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1718_c2_8949_return_output := result.is_stack_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1718_c2_8949] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1718_c2_8949_return_output := result.is_pc_updated;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l1718_c2_8949_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1209_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1718_c2_8949_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1209_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_8949_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1209_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_8949_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1209_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_8949_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1209_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_8949_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1209_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_8949_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1209_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_8949_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1209_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_8949_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1209_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_8949_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1209_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c2_8949_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1209_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c2_8949_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1209_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1718_c2_8949_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1209_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1731_c7_3b89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_b316_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1731_c7_3b89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_b316_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_3b89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_b316_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_3b89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_b316_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_3b89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_b316_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_3b89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_b316_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_3b89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_b316_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_3b89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_b316_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1731_c7_3b89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_b316_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1734_c7_c84b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a377_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1734_c7_c84b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a377_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_c84b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a377_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_c84b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a377_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_c84b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a377_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_c84b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a377_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_c84b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a377_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_c84b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a377_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1734_c7_c84b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a377_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_4126_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_9f9c_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_4126_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_9f9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_4126_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_9f9c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_4126_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_9f9c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_4126_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_9f9c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_4126_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_9f9c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_4126_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_9f9c_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1745_c7_15f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_7ea7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_15f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_7ea7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_15f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_7ea7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_15f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_7ea7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_15f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_7ea7_return_output;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_9c12_right := VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1748_l1742_DUPLICATE_35d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1731_l1745_l1734_DUPLICATE_ff70_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1731_l1745_l1734_DUPLICATE_ff70_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_15f4_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1731_l1745_l1734_DUPLICATE_ff70_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1731_l1745_l1734_l1718_DUPLICATE_49d8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1731_l1745_l1734_l1718_DUPLICATE_49d8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1731_l1745_l1734_l1718_DUPLICATE_49d8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_15f4_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1731_l1745_l1734_l1718_DUPLICATE_49d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1731_l1745_l1734_l1738_DUPLICATE_8e71_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1731_l1745_l1734_l1738_DUPLICATE_8e71_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_4126_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1731_l1745_l1734_l1738_DUPLICATE_8e71_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_15f4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1731_l1745_l1734_l1738_DUPLICATE_8e71_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1731_l1734_l1738_DUPLICATE_a9cb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1731_l1734_l1738_DUPLICATE_a9cb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_4126_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1731_l1734_l1738_DUPLICATE_a9cb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1731_l1745_l1734_l1718_DUPLICATE_2f51_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1731_l1745_l1734_l1718_DUPLICATE_2f51_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1731_l1745_l1734_l1718_DUPLICATE_2f51_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_15f4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1731_l1745_l1734_l1718_DUPLICATE_2f51_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1718_c2_8949_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1718_c2_8949_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1718_c2_8949_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1718_c2_8949_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1734_c7_c84b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_4126_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_8653_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1718_c2_8949] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_8949_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_8949_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_8949_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_8949_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1745_c7_15f4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_15f4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_15f4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_15f4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_15f4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_15f4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_15f4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_15f4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_15f4_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1738_c7_4126] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_4126_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_4126_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_4126_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_4126_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_4126_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_4126_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_4126_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_4126_return_output;

     -- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_9c12 LATENCY=0
     -- Inputs
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_9c12_left <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_9c12_left;
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_9c12_right <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_9c12_right;
     -- Outputs
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_9c12_return_output := BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_9c12_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1745_c7_15f4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1745_c7_15f4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_15f4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1745_c7_15f4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_15f4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1745_c7_15f4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_15f4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_15f4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1745_c7_15f4_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1718_c2_8949] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_8949_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_8949_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_8949_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_8949_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1745_c7_15f4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_15f4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_15f4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_15f4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_15f4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_15f4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_15f4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_15f4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_15f4_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1738_c7_4126] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1738_c7_4126_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_4126_cond;
     n16_high_MUX_uxn_opcodes_h_l1738_c7_4126_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_4126_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1738_c7_4126_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_4126_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_4126_return_output := n16_high_MUX_uxn_opcodes_h_l1738_c7_4126_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1718_c2_8949] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_8949_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_8949_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_8949_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_8949_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1734_c7_c84b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_c84b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_c84b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output;

     -- t8_MUX[uxn_opcodes_h_l1734_c7_c84b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1734_c7_c84b_cond <= VAR_t8_MUX_uxn_opcodes_h_l1734_c7_c84b_cond;
     t8_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue;
     t8_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output := t8_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1718_c2_8949] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_8949_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_8949_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_8949_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_8949_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1745_c7_15f4] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1745_c7_15f4_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1745_c7_15f4_cond;
     n16_low_MUX_uxn_opcodes_h_l1745_c7_15f4_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1745_c7_15f4_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1745_c7_15f4_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1745_c7_15f4_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1745_c7_15f4_return_output := n16_low_MUX_uxn_opcodes_h_l1745_c7_15f4_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_6ccc_left := VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_9c12_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1742_c3_874f := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_9c12_return_output)),16);
     VAR_n16_high_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_4126_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_4126_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1745_c7_15f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_4126_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_15f4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_4126_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_4126_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_15f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_4126_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_15f4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_4126_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1742_c3_874f;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1731_c7_3b89] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_3b89_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_3b89_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1738_c7_4126] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_4126_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_4126_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_4126_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_4126_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_4126_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_4126_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_4126_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_4126_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1734_c7_c84b] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_c84b_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_c84b_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1738_c7_4126] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1738_c7_4126_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_4126_cond;
     n16_low_MUX_uxn_opcodes_h_l1738_c7_4126_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_4126_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1738_c7_4126_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_4126_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_4126_return_output := n16_low_MUX_uxn_opcodes_h_l1738_c7_4126_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1738_c7_4126] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1738_c7_4126_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_4126_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1738_c7_4126_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_4126_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1738_c7_4126_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_4126_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_4126_return_output := result_u8_value_MUX_uxn_opcodes_h_l1738_c7_4126_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1738_c7_4126] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_4126_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_4126_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_4126_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_4126_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_4126_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_4126_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_4126_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_4126_return_output;

     -- t8_MUX[uxn_opcodes_h_l1731_c7_3b89] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1731_c7_3b89_cond <= VAR_t8_MUX_uxn_opcodes_h_l1731_c7_3b89_cond;
     t8_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue;
     t8_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output := t8_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1734_c7_c84b] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1734_c7_c84b_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1734_c7_c84b_cond;
     n16_high_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output := n16_high_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1748_c22_6ccc] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_6ccc_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_6ccc_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_6ccc_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_6ccc_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_6ccc_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_6ccc_return_output;

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1748_c3_1b18 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_6ccc_return_output)),16);
     VAR_n16_high_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_4126_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_4126_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_4126_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_4126_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_15f4_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1748_c3_1b18;
     -- n16_high_MUX[uxn_opcodes_h_l1731_c7_3b89] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1731_c7_3b89_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1731_c7_3b89_cond;
     n16_high_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output := n16_high_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1734_c7_c84b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1734_c7_c84b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_c84b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1731_c7_3b89] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_3b89_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_3b89_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1745_c7_15f4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1745_c7_15f4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_15f4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1745_c7_15f4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_15f4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1745_c7_15f4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_15f4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_15f4_return_output := result_u16_value_MUX_uxn_opcodes_h_l1745_c7_15f4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1718_c2_8949] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_8949_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_8949_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_8949_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_8949_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1734_c7_c84b] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1734_c7_c84b_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1734_c7_c84b_cond;
     n16_low_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output := n16_low_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1734_c7_c84b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_c84b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_c84b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1734_c7_c84b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_c84b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_c84b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output;

     -- t8_MUX[uxn_opcodes_h_l1718_c2_8949] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1718_c2_8949_cond <= VAR_t8_MUX_uxn_opcodes_h_l1718_c2_8949_cond;
     t8_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue;
     t8_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1718_c2_8949_return_output := t8_MUX_uxn_opcodes_h_l1718_c2_8949_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_4126_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_15f4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1718_c2_8949_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1738_c7_4126] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1738_c7_4126_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_4126_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1738_c7_4126_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_4126_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1738_c7_4126_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_4126_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_4126_return_output := result_u16_value_MUX_uxn_opcodes_h_l1738_c7_4126_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1718_c2_8949] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1718_c2_8949_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1718_c2_8949_cond;
     n16_high_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1718_c2_8949_return_output := n16_high_MUX_uxn_opcodes_h_l1718_c2_8949_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1718_c2_8949] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_8949_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_8949_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_8949_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_8949_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1731_c7_3b89] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1731_c7_3b89_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1731_c7_3b89_cond;
     n16_low_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output := n16_low_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1731_c7_3b89] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_3b89_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_3b89_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1731_c7_3b89] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_3b89_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_3b89_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1731_c7_3b89] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1731_c7_3b89_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_3b89_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output := result_u8_value_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output;

     -- Submodule level 5
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l1718_c2_8949_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_4126_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1718_c2_8949] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1718_c2_8949_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c2_8949_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c2_8949_return_output := result_u8_value_MUX_uxn_opcodes_h_l1718_c2_8949_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1718_c2_8949] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_8949_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_8949_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_8949_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_8949_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1718_c2_8949] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_8949_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_8949_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_8949_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_8949_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1718_c2_8949] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1718_c2_8949_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1718_c2_8949_cond;
     n16_low_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1718_c2_8949_return_output := n16_low_MUX_uxn_opcodes_h_l1718_c2_8949_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1734_c7_c84b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1734_c7_c84b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_c84b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_c84b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_c84b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output := result_u16_value_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output;

     -- Submodule level 6
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l1718_c2_8949_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_c84b_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1731_c7_3b89] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1731_c7_3b89_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_3b89_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_3b89_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_3b89_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output := result_u16_value_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_3b89_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1718_c2_8949] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1718_c2_8949_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c2_8949_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c2_8949_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c2_8949_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c2_8949_return_output := result_u16_value_MUX_uxn_opcodes_h_l1718_c2_8949_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_2c6d_uxn_opcodes_h_l1753_l1714_DUPLICATE_d1e7 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2c6d_uxn_opcodes_h_l1753_l1714_DUPLICATE_d1e7_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_2c6d(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c2_8949_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_8949_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_8949_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_8949_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_8949_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c2_8949_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_8949_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_8949_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_8949_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_8949_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2c6d_uxn_opcodes_h_l1753_l1714_DUPLICATE_d1e7_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2c6d_uxn_opcodes_h_l1753_l1714_DUPLICATE_d1e7_return_output;
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
