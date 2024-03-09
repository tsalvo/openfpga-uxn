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
-- BIN_OP_EQ[uxn_opcodes_h_l1718_c6_1b9d]
signal BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1b9d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1b9d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1b9d_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1718_c2_d366]
signal n16_high_MUX_uxn_opcodes_h_l1718_c2_d366_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1718_c2_d366_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1718_c2_d366]
signal n16_low_MUX_uxn_opcodes_h_l1718_c2_d366_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1718_c2_d366_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1718_c2_d366]
signal t8_MUX_uxn_opcodes_h_l1718_c2_d366_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1718_c2_d366_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1718_c2_d366]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_d366_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_d366_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1718_c2_d366]
signal result_u16_value_MUX_uxn_opcodes_h_l1718_c2_d366_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1718_c2_d366_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1718_c2_d366]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_d366_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_d366_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1718_c2_d366]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_d366_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_d366_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1718_c2_d366]
signal result_u8_value_MUX_uxn_opcodes_h_l1718_c2_d366_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1718_c2_d366_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1718_c2_d366]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_d366_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_d366_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1718_c2_d366]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_d366_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_d366_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1718_c2_d366]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_d366_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_d366_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1718_c2_d366]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_d366_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_d366_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1718_c2_d366]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_d366_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_d366_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1731_c11_85c7]
signal BIN_OP_EQ_uxn_opcodes_h_l1731_c11_85c7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1731_c11_85c7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1731_c11_85c7_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1731_c7_8f39]
signal n16_high_MUX_uxn_opcodes_h_l1731_c7_8f39_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1731_c7_8f39]
signal n16_low_MUX_uxn_opcodes_h_l1731_c7_8f39_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1731_c7_8f39]
signal t8_MUX_uxn_opcodes_h_l1731_c7_8f39_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1731_c7_8f39]
signal result_u16_value_MUX_uxn_opcodes_h_l1731_c7_8f39_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1731_c7_8f39]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_8f39_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1731_c7_8f39]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_8f39_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1731_c7_8f39]
signal result_u8_value_MUX_uxn_opcodes_h_l1731_c7_8f39_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1731_c7_8f39]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_8f39_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1731_c7_8f39]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_8f39_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1734_c11_88f1]
signal BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88f1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88f1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88f1_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1734_c7_19a3]
signal n16_high_MUX_uxn_opcodes_h_l1734_c7_19a3_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1734_c7_19a3]
signal n16_low_MUX_uxn_opcodes_h_l1734_c7_19a3_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1734_c7_19a3]
signal t8_MUX_uxn_opcodes_h_l1734_c7_19a3_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1734_c7_19a3]
signal result_u16_value_MUX_uxn_opcodes_h_l1734_c7_19a3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1734_c7_19a3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_19a3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1734_c7_19a3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_19a3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1734_c7_19a3]
signal result_u8_value_MUX_uxn_opcodes_h_l1734_c7_19a3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1734_c7_19a3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_19a3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1734_c7_19a3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_19a3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1738_c11_00c0]
signal BIN_OP_EQ_uxn_opcodes_h_l1738_c11_00c0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1738_c11_00c0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1738_c11_00c0_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1738_c7_da33]
signal n16_high_MUX_uxn_opcodes_h_l1738_c7_da33_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1738_c7_da33_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1738_c7_da33_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1738_c7_da33_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1738_c7_da33]
signal n16_low_MUX_uxn_opcodes_h_l1738_c7_da33_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1738_c7_da33_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1738_c7_da33_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1738_c7_da33_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1738_c7_da33]
signal result_u16_value_MUX_uxn_opcodes_h_l1738_c7_da33_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1738_c7_da33_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1738_c7_da33_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1738_c7_da33_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1738_c7_da33]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_da33_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_da33_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_da33_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_da33_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1738_c7_da33]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_da33_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_da33_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_da33_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_da33_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1738_c7_da33]
signal result_u8_value_MUX_uxn_opcodes_h_l1738_c7_da33_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1738_c7_da33_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1738_c7_da33_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1738_c7_da33_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1738_c7_da33]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_da33_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_da33_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_da33_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_da33_return_output : signed(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1740_c30_7cc5]
signal sp_relative_shift_uxn_opcodes_h_l1740_c30_7cc5_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1740_c30_7cc5_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1740_c30_7cc5_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1740_c30_7cc5_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1745_c11_1ef2]
signal BIN_OP_EQ_uxn_opcodes_h_l1745_c11_1ef2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1745_c11_1ef2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1745_c11_1ef2_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1745_c7_e9ee]
signal n16_low_MUX_uxn_opcodes_h_l1745_c7_e9ee_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1745_c7_e9ee_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1745_c7_e9ee_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1745_c7_e9ee_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1745_c7_e9ee]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e9ee_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e9ee_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e9ee_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e9ee_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1745_c7_e9ee]
signal result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1745_c7_e9ee]
signal result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1745_c7_e9ee]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_e9ee_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_e9ee_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_e9ee_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_e9ee_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1748_c22_be90]
signal BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_be90_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_be90_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_be90_return_output : signed(18 downto 0);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_748f
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_748f_left : signed(16 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_748f_right : signed(7 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_748f_return_output : signed(17 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_d9be( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_vram_write := ref_toks_1;
      base.u16_value := ref_toks_2;
      base.is_pc_updated := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.is_stack_index_flipped := ref_toks_9;
      base.sp_relative_shift := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1b9d
BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1b9d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1b9d_left,
BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1b9d_right,
BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1b9d_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1718_c2_d366
n16_high_MUX_uxn_opcodes_h_l1718_c2_d366 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1718_c2_d366_cond,
n16_high_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue,
n16_high_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse,
n16_high_MUX_uxn_opcodes_h_l1718_c2_d366_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1718_c2_d366
n16_low_MUX_uxn_opcodes_h_l1718_c2_d366 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1718_c2_d366_cond,
n16_low_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue,
n16_low_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse,
n16_low_MUX_uxn_opcodes_h_l1718_c2_d366_return_output);

-- t8_MUX_uxn_opcodes_h_l1718_c2_d366
t8_MUX_uxn_opcodes_h_l1718_c2_d366 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1718_c2_d366_cond,
t8_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue,
t8_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse,
t8_MUX_uxn_opcodes_h_l1718_c2_d366_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_d366
result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_d366 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_d366_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_d366_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1718_c2_d366
result_u16_value_MUX_uxn_opcodes_h_l1718_c2_d366 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1718_c2_d366_cond,
result_u16_value_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1718_c2_d366_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_d366
result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_d366 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_d366_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_d366_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_d366
result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_d366 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_d366_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_d366_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1718_c2_d366
result_u8_value_MUX_uxn_opcodes_h_l1718_c2_d366 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1718_c2_d366_cond,
result_u8_value_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1718_c2_d366_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_d366
result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_d366 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_d366_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_d366_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_d366
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_d366 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_d366_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_d366_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_d366
result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_d366 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_d366_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_d366_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_d366
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_d366 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_d366_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_d366_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_d366
result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_d366 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_d366_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_d366_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1731_c11_85c7
BIN_OP_EQ_uxn_opcodes_h_l1731_c11_85c7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1731_c11_85c7_left,
BIN_OP_EQ_uxn_opcodes_h_l1731_c11_85c7_right,
BIN_OP_EQ_uxn_opcodes_h_l1731_c11_85c7_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1731_c7_8f39
n16_high_MUX_uxn_opcodes_h_l1731_c7_8f39 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1731_c7_8f39_cond,
n16_high_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue,
n16_high_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse,
n16_high_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1731_c7_8f39
n16_low_MUX_uxn_opcodes_h_l1731_c7_8f39 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1731_c7_8f39_cond,
n16_low_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue,
n16_low_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse,
n16_low_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output);

-- t8_MUX_uxn_opcodes_h_l1731_c7_8f39
t8_MUX_uxn_opcodes_h_l1731_c7_8f39 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1731_c7_8f39_cond,
t8_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue,
t8_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse,
t8_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1731_c7_8f39
result_u16_value_MUX_uxn_opcodes_h_l1731_c7_8f39 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1731_c7_8f39_cond,
result_u16_value_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_8f39
result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_8f39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_8f39_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_8f39
result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_8f39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_8f39_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1731_c7_8f39
result_u8_value_MUX_uxn_opcodes_h_l1731_c7_8f39 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1731_c7_8f39_cond,
result_u8_value_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_8f39
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_8f39 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_8f39_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_8f39
result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_8f39 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_8f39_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88f1
BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88f1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88f1_left,
BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88f1_right,
BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88f1_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1734_c7_19a3
n16_high_MUX_uxn_opcodes_h_l1734_c7_19a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1734_c7_19a3_cond,
n16_high_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue,
n16_high_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse,
n16_high_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1734_c7_19a3
n16_low_MUX_uxn_opcodes_h_l1734_c7_19a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1734_c7_19a3_cond,
n16_low_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue,
n16_low_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse,
n16_low_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output);

-- t8_MUX_uxn_opcodes_h_l1734_c7_19a3
t8_MUX_uxn_opcodes_h_l1734_c7_19a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1734_c7_19a3_cond,
t8_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue,
t8_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse,
t8_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1734_c7_19a3
result_u16_value_MUX_uxn_opcodes_h_l1734_c7_19a3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1734_c7_19a3_cond,
result_u16_value_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_19a3
result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_19a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_19a3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_19a3
result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_19a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_19a3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1734_c7_19a3
result_u8_value_MUX_uxn_opcodes_h_l1734_c7_19a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1734_c7_19a3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_19a3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_19a3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_19a3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_19a3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_19a3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_19a3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1738_c11_00c0
BIN_OP_EQ_uxn_opcodes_h_l1738_c11_00c0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1738_c11_00c0_left,
BIN_OP_EQ_uxn_opcodes_h_l1738_c11_00c0_right,
BIN_OP_EQ_uxn_opcodes_h_l1738_c11_00c0_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1738_c7_da33
n16_high_MUX_uxn_opcodes_h_l1738_c7_da33 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1738_c7_da33_cond,
n16_high_MUX_uxn_opcodes_h_l1738_c7_da33_iftrue,
n16_high_MUX_uxn_opcodes_h_l1738_c7_da33_iffalse,
n16_high_MUX_uxn_opcodes_h_l1738_c7_da33_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1738_c7_da33
n16_low_MUX_uxn_opcodes_h_l1738_c7_da33 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1738_c7_da33_cond,
n16_low_MUX_uxn_opcodes_h_l1738_c7_da33_iftrue,
n16_low_MUX_uxn_opcodes_h_l1738_c7_da33_iffalse,
n16_low_MUX_uxn_opcodes_h_l1738_c7_da33_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1738_c7_da33
result_u16_value_MUX_uxn_opcodes_h_l1738_c7_da33 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1738_c7_da33_cond,
result_u16_value_MUX_uxn_opcodes_h_l1738_c7_da33_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1738_c7_da33_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1738_c7_da33_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_da33
result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_da33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_da33_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_da33_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_da33_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_da33_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_da33
result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_da33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_da33_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_da33_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_da33_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_da33_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1738_c7_da33
result_u8_value_MUX_uxn_opcodes_h_l1738_c7_da33 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1738_c7_da33_cond,
result_u8_value_MUX_uxn_opcodes_h_l1738_c7_da33_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1738_c7_da33_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1738_c7_da33_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_da33
result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_da33 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_da33_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_da33_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_da33_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_da33_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1740_c30_7cc5
sp_relative_shift_uxn_opcodes_h_l1740_c30_7cc5 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1740_c30_7cc5_ins,
sp_relative_shift_uxn_opcodes_h_l1740_c30_7cc5_x,
sp_relative_shift_uxn_opcodes_h_l1740_c30_7cc5_y,
sp_relative_shift_uxn_opcodes_h_l1740_c30_7cc5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1745_c11_1ef2
BIN_OP_EQ_uxn_opcodes_h_l1745_c11_1ef2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1745_c11_1ef2_left,
BIN_OP_EQ_uxn_opcodes_h_l1745_c11_1ef2_right,
BIN_OP_EQ_uxn_opcodes_h_l1745_c11_1ef2_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1745_c7_e9ee
n16_low_MUX_uxn_opcodes_h_l1745_c7_e9ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1745_c7_e9ee_cond,
n16_low_MUX_uxn_opcodes_h_l1745_c7_e9ee_iftrue,
n16_low_MUX_uxn_opcodes_h_l1745_c7_e9ee_iffalse,
n16_low_MUX_uxn_opcodes_h_l1745_c7_e9ee_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e9ee
result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e9ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e9ee_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e9ee_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e9ee_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e9ee_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e9ee
result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e9ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_cond,
result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e9ee
result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e9ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_cond,
result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_e9ee
result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_e9ee : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_e9ee_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_e9ee_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_e9ee_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_e9ee_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_be90
BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_be90 : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_be90_left,
BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_be90_right,
BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_be90_return_output);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_748f
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_748f : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_748f_left,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_748f_right,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_748f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1b9d_return_output,
 n16_high_MUX_uxn_opcodes_h_l1718_c2_d366_return_output,
 n16_low_MUX_uxn_opcodes_h_l1718_c2_d366_return_output,
 t8_MUX_uxn_opcodes_h_l1718_c2_d366_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_d366_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1718_c2_d366_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_d366_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_d366_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1718_c2_d366_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_d366_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_d366_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_d366_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_d366_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_d366_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1731_c11_85c7_return_output,
 n16_high_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output,
 n16_low_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output,
 t8_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88f1_return_output,
 n16_high_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output,
 n16_low_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output,
 t8_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1738_c11_00c0_return_output,
 n16_high_MUX_uxn_opcodes_h_l1738_c7_da33_return_output,
 n16_low_MUX_uxn_opcodes_h_l1738_c7_da33_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1738_c7_da33_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_da33_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_da33_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1738_c7_da33_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_da33_return_output,
 sp_relative_shift_uxn_opcodes_h_l1740_c30_7cc5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1745_c11_1ef2_return_output,
 n16_low_MUX_uxn_opcodes_h_l1745_c7_e9ee_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e9ee_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_e9ee_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_be90_return_output,
 BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_748f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1b9d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1b9d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1b9d_return_output : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1718_c2_d366_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1718_c2_d366_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1718_c2_d366_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1718_c2_d366_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1718_c2_d366_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1718_c2_d366_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1718_c2_d366_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_d366_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_d366_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c2_d366_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c2_d366_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1718_c2_d366_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_d366_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_d366_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_d366_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_d366_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c2_d366_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c2_d366_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1718_c2_d366_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_d366_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_d366_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1728_c3_7f5f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_d366_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_d366_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_d366_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_d366_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1718_c2_d366_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_d366_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_d366_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1723_c3_7417 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_d366_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_d366_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_85c7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_85c7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_85c7_return_output : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1731_c7_8f39_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1731_c7_8f39_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1731_c7_8f39_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_8f39_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_8f39_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_8f39_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_8f39_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1732_c3_df82 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_8f39_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_8f39_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88f1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88f1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88f1_return_output : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_da33_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1734_c7_19a3_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_da33_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1734_c7_19a3_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1734_c7_19a3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_da33_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_19a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_da33_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_19a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_da33_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_19a3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_da33_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_19a3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1736_c3_7cc3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1734_c7_19a3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_19a3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_da33_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_19a3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_00c0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_00c0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_00c0_return_output : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_da33_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_da33_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_da33_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_da33_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_da33_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1745_c7_e9ee_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_da33_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_da33_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1742_c3_cb2e : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_da33_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_da33_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_da33_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_da33_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_da33_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_da33_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_da33_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e9ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_da33_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_da33_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_da33_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_da33_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_da33_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_da33_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_e9ee_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_da33_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_7cc5_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_7cc5_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_7cc5_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_7cc5_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_1ef2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_1ef2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_1ef2_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1745_c7_e9ee_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1745_c7_e9ee_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1745_c7_e9ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e9ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e9ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e9ee_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1748_c3_38fc : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_e9ee_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1747_c3_5d09 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_e9ee_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_e9ee_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_be90_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_be90_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_be90_return_output : signed(18 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1718_l1731_l1745_l1734_DUPLICATE_5bf7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1718_l1731_l1745_l1734_DUPLICATE_d941_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1738_l1731_l1734_DUPLICATE_b05e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1738_l1731_l1745_l1734_DUPLICATE_6965_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1731_l1745_l1734_DUPLICATE_3a4d_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_7381_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_748f_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_748f_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_748f_return_output : signed(17 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d9be_uxn_opcodes_h_l1753_l1714_DUPLICATE_69e6_return_output : opcode_result_t;
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
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_da33_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1728_c3_7f5f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1728_c3_7f5f;
     VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_7cc5_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1723_c3_7417 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1723_c3_7417;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1747_c3_5d09 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_e9ee_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1747_c3_5d09;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e9ee_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1b9d_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88f1_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1732_c3_df82 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1732_c3_df82;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1736_c3_7cc3 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1736_c3_7cc3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_00c0_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_85c7_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_7cc5_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_be90_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_1ef2_right := to_unsigned(4, 3);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_7cc5_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_da33_iffalse := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_da33_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1745_c7_e9ee_iffalse := n16_low;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_748f_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1b9d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_85c7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88f1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_00c0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_1ef2_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_da33_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l1745_c7_e9ee_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_da33_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1738_l1731_l1745_l1734_DUPLICATE_6965 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1738_l1731_l1745_l1734_DUPLICATE_6965_return_output := result.is_opc_done;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1718_c2_d366] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1718_c2_d366_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1718_l1731_l1745_l1734_DUPLICATE_5bf7 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1718_l1731_l1745_l1734_DUPLICATE_5bf7_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1738_l1731_l1734_DUPLICATE_b05e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1738_l1731_l1734_DUPLICATE_b05e_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1745_c11_1ef2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1745_c11_1ef2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_1ef2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1745_c11_1ef2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_1ef2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_1ef2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1745_c11_1ef2_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1731_l1745_l1734_DUPLICATE_3a4d LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1731_l1745_l1734_DUPLICATE_3a4d_return_output := result.sp_relative_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1734_c7_19a3] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1734_c7_19a3_return_output := result.stack_address_sp_offset;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1718_c2_d366] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1718_c2_d366_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1738_c11_00c0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1738_c11_00c0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_00c0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1738_c11_00c0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_00c0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_00c0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1738_c11_00c0_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l1718_c2_d366] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1718_c2_d366_return_output := result.is_stack_write;

     -- CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_7381 LATENCY=0
     VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_7381_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1718_l1731_l1745_l1734_DUPLICATE_d941 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1718_l1731_l1745_l1734_DUPLICATE_d941_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1731_c11_85c7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1731_c11_85c7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_85c7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1731_c11_85c7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_85c7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_85c7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1731_c11_85c7_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1718_c2_d366] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1718_c2_d366_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1734_c11_88f1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88f1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88f1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88f1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88f1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88f1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88f1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1718_c6_1b9d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1b9d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1b9d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1b9d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1b9d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1b9d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1b9d_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1740_c30_7cc5] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1740_c30_7cc5_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_7cc5_ins;
     sp_relative_shift_uxn_opcodes_h_l1740_c30_7cc5_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_7cc5_x;
     sp_relative_shift_uxn_opcodes_h_l1740_c30_7cc5_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_7cc5_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_7cc5_return_output := sp_relative_shift_uxn_opcodes_h_l1740_c30_7cc5_return_output;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l1718_c2_d366_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1b9d_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1718_c2_d366_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1b9d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_d366_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1b9d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_d366_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1b9d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_d366_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1b9d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_d366_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1b9d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_d366_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1b9d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_d366_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1b9d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_d366_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1b9d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_d366_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1b9d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c2_d366_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1b9d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c2_d366_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1b9d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1718_c2_d366_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_1b9d_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1731_c7_8f39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_85c7_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1731_c7_8f39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_85c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_8f39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_85c7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_8f39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_85c7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_8f39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_85c7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_8f39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_85c7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_8f39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_85c7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_8f39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_85c7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1731_c7_8f39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_85c7_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1734_c7_19a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88f1_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1734_c7_19a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_19a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88f1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_19a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_19a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88f1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_19a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88f1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_19a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88f1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_19a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88f1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1734_c7_19a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88f1_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_da33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_00c0_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_da33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_00c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_da33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_00c0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_da33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_00c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_da33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_00c0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_da33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_00c0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_da33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_00c0_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1745_c7_e9ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_1ef2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e9ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_1ef2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_e9ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_1ef2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_1ef2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_1ef2_return_output;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_748f_right := VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_7381_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1731_l1745_l1734_DUPLICATE_3a4d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1731_l1745_l1734_DUPLICATE_3a4d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_e9ee_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1731_l1745_l1734_DUPLICATE_3a4d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1718_l1731_l1745_l1734_DUPLICATE_5bf7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1718_l1731_l1745_l1734_DUPLICATE_5bf7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1718_l1731_l1745_l1734_DUPLICATE_5bf7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1718_l1731_l1745_l1734_DUPLICATE_5bf7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1738_l1731_l1745_l1734_DUPLICATE_6965_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1738_l1731_l1745_l1734_DUPLICATE_6965_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_da33_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1738_l1731_l1745_l1734_DUPLICATE_6965_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e9ee_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1738_l1731_l1745_l1734_DUPLICATE_6965_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1738_l1731_l1734_DUPLICATE_b05e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1738_l1731_l1734_DUPLICATE_b05e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_da33_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1738_l1731_l1734_DUPLICATE_b05e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1718_l1731_l1745_l1734_DUPLICATE_d941_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1718_l1731_l1745_l1734_DUPLICATE_d941_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1718_l1731_l1745_l1734_DUPLICATE_d941_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1718_l1731_l1745_l1734_DUPLICATE_d941_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1718_c2_d366_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1718_c2_d366_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1718_c2_d366_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1718_c2_d366_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1734_c7_19a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_da33_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_7cc5_return_output;
     -- t8_MUX[uxn_opcodes_h_l1734_c7_19a3] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1734_c7_19a3_cond <= VAR_t8_MUX_uxn_opcodes_h_l1734_c7_19a3_cond;
     t8_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue;
     t8_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output := t8_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1718_c2_d366] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_d366_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_d366_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_d366_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_d366_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1718_c2_d366] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_d366_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_d366_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_d366_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_d366_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1718_c2_d366] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_d366_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_d366_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_d366_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_d366_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1738_c7_da33] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1738_c7_da33_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_da33_cond;
     n16_high_MUX_uxn_opcodes_h_l1738_c7_da33_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_da33_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1738_c7_da33_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_da33_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_da33_return_output := n16_high_MUX_uxn_opcodes_h_l1738_c7_da33_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1745_c7_e9ee] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_e9ee_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_e9ee_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_e9ee_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_e9ee_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_e9ee_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_e9ee_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_e9ee_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_e9ee_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1745_c7_e9ee] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e9ee_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e9ee_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e9ee_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e9ee_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e9ee_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e9ee_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e9ee_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e9ee_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1738_c7_da33] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_da33_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_da33_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_da33_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_da33_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_da33_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_da33_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_da33_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_da33_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1734_c7_19a3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_19a3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_19a3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1745_c7_e9ee] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1745_c7_e9ee_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1745_c7_e9ee_cond;
     n16_low_MUX_uxn_opcodes_h_l1745_c7_e9ee_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1745_c7_e9ee_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1745_c7_e9ee_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1745_c7_e9ee_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1745_c7_e9ee_return_output := n16_low_MUX_uxn_opcodes_h_l1745_c7_e9ee_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1745_c7_e9ee] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_return_output := result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1718_c2_d366] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_d366_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_d366_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_d366_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_d366_return_output;

     -- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_748f LATENCY=0
     -- Inputs
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_748f_left <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_748f_left;
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_748f_right <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_748f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_748f_return_output := BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_748f_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_be90_left := VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_748f_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1742_c3_cb2e := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_748f_return_output)),16);
     VAR_n16_high_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_da33_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_da33_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1745_c7_e9ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_da33_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e9ee_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_da33_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_da33_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_e9ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_da33_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_da33_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1742_c3_cb2e;
     -- n16_low_MUX[uxn_opcodes_h_l1738_c7_da33] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1738_c7_da33_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_da33_cond;
     n16_low_MUX_uxn_opcodes_h_l1738_c7_da33_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_da33_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1738_c7_da33_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_da33_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_da33_return_output := n16_low_MUX_uxn_opcodes_h_l1738_c7_da33_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1748_c22_be90] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_be90_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_be90_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_be90_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_be90_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_be90_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_be90_return_output;

     -- t8_MUX[uxn_opcodes_h_l1731_c7_8f39] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1731_c7_8f39_cond <= VAR_t8_MUX_uxn_opcodes_h_l1731_c7_8f39_cond;
     t8_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue;
     t8_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output := t8_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1738_c7_da33] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1738_c7_da33_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_da33_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1738_c7_da33_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_da33_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1738_c7_da33_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_da33_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_da33_return_output := result_u8_value_MUX_uxn_opcodes_h_l1738_c7_da33_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1731_c7_8f39] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_8f39_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_8f39_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1734_c7_19a3] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1734_c7_19a3_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1734_c7_19a3_cond;
     n16_high_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output := n16_high_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1734_c7_19a3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_19a3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_19a3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1738_c7_da33] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_da33_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_da33_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_da33_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_da33_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_da33_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_da33_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_da33_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_da33_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1738_c7_da33] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_da33_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_da33_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_da33_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_da33_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_da33_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_da33_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_da33_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_da33_return_output;

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1748_c3_38fc := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_be90_return_output)),16);
     VAR_n16_high_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_da33_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_da33_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_da33_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_da33_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1748_c3_38fc;
     -- n16_low_MUX[uxn_opcodes_h_l1734_c7_19a3] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1734_c7_19a3_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1734_c7_19a3_cond;
     n16_low_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output := n16_low_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output;

     -- t8_MUX[uxn_opcodes_h_l1718_c2_d366] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1718_c2_d366_cond <= VAR_t8_MUX_uxn_opcodes_h_l1718_c2_d366_cond;
     t8_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue;
     t8_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1718_c2_d366_return_output := t8_MUX_uxn_opcodes_h_l1718_c2_d366_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1734_c7_19a3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1734_c7_19a3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_19a3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1745_c7_e9ee] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_return_output := result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1734_c7_19a3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_19a3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_19a3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1718_c2_d366] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_d366_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_d366_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_d366_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_d366_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1731_c7_8f39] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1731_c7_8f39_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1731_c7_8f39_cond;
     n16_high_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output := n16_high_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1734_c7_19a3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_19a3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_19a3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1731_c7_8f39] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_8f39_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_8f39_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_da33_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e9ee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1718_c2_d366_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1731_c7_8f39] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_8f39_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_8f39_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1718_c2_d366] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_d366_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_d366_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_d366_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_d366_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1738_c7_da33] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1738_c7_da33_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_da33_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1738_c7_da33_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_da33_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1738_c7_da33_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_da33_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_da33_return_output := result_u16_value_MUX_uxn_opcodes_h_l1738_c7_da33_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1731_c7_8f39] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1731_c7_8f39_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_8f39_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output := result_u8_value_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1718_c2_d366] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1718_c2_d366_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1718_c2_d366_cond;
     n16_high_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1718_c2_d366_return_output := n16_high_MUX_uxn_opcodes_h_l1718_c2_d366_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1731_c7_8f39] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1731_c7_8f39_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1731_c7_8f39_cond;
     n16_low_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output := n16_low_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1731_c7_8f39] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_8f39_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_8f39_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output;

     -- Submodule level 5
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l1718_c2_d366_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_da33_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1734_c7_19a3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1734_c7_19a3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_19a3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_19a3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_19a3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output := result_u16_value_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1718_c2_d366] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_d366_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_d366_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_d366_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_d366_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1718_c2_d366] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_d366_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_d366_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_d366_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_d366_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1718_c2_d366] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1718_c2_d366_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1718_c2_d366_cond;
     n16_low_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1718_c2_d366_return_output := n16_low_MUX_uxn_opcodes_h_l1718_c2_d366_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1718_c2_d366] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1718_c2_d366_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c2_d366_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c2_d366_return_output := result_u8_value_MUX_uxn_opcodes_h_l1718_c2_d366_return_output;

     -- Submodule level 6
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l1718_c2_d366_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_19a3_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1731_c7_8f39] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1731_c7_8f39_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_8f39_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_8f39_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_8f39_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output := result_u16_value_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_8f39_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1718_c2_d366] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1718_c2_d366_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c2_d366_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c2_d366_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c2_d366_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c2_d366_return_output := result_u16_value_MUX_uxn_opcodes_h_l1718_c2_d366_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d9be_uxn_opcodes_h_l1753_l1714_DUPLICATE_69e6 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d9be_uxn_opcodes_h_l1753_l1714_DUPLICATE_69e6_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d9be(
     result,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_d366_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c2_d366_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_d366_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_d366_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c2_d366_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_d366_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_d366_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_d366_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_d366_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_d366_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d9be_uxn_opcodes_h_l1753_l1714_DUPLICATE_69e6_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d9be_uxn_opcodes_h_l1753_l1714_DUPLICATE_69e6_return_output;
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
