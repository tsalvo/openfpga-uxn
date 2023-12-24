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
-- BIN_OP_EQ[uxn_opcodes_h_l1734_c6_5fdc]
signal BIN_OP_EQ_uxn_opcodes_h_l1734_c6_5fdc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1734_c6_5fdc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1734_c6_5fdc_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1734_c2_6333]
signal n16_low_MUX_uxn_opcodes_h_l1734_c2_6333_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1734_c2_6333_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1734_c2_6333]
signal t8_MUX_uxn_opcodes_h_l1734_c2_6333_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1734_c2_6333_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1734_c2_6333]
signal n16_high_MUX_uxn_opcodes_h_l1734_c2_6333_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1734_c2_6333_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1734_c2_6333]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_6333_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_6333_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1734_c2_6333]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1734_c2_6333_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1734_c2_6333_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1734_c2_6333]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1734_c2_6333_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1734_c2_6333_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1734_c2_6333]
signal result_u8_value_MUX_uxn_opcodes_h_l1734_c2_6333_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1734_c2_6333_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1734_c2_6333]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_6333_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_6333_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1734_c2_6333]
signal result_u16_value_MUX_uxn_opcodes_h_l1734_c2_6333_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1734_c2_6333_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1734_c2_6333]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_6333_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_6333_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1734_c2_6333]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1734_c2_6333_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1734_c2_6333_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1734_c2_6333]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_6333_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_6333_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1734_c2_6333]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1734_c2_6333_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1734_c2_6333_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1747_c11_e744]
signal BIN_OP_EQ_uxn_opcodes_h_l1747_c11_e744_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1747_c11_e744_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1747_c11_e744_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1747_c7_b595]
signal n16_low_MUX_uxn_opcodes_h_l1747_c7_b595_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1747_c7_b595_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1747_c7_b595]
signal t8_MUX_uxn_opcodes_h_l1747_c7_b595_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1747_c7_b595_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1747_c7_b595]
signal n16_high_MUX_uxn_opcodes_h_l1747_c7_b595_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1747_c7_b595_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1747_c7_b595]
signal result_u16_value_MUX_uxn_opcodes_h_l1747_c7_b595_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1747_c7_b595_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1747_c7_b595]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_b595_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_b595_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1747_c7_b595]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_b595_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_b595_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1747_c7_b595]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1747_c7_b595_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1747_c7_b595_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1747_c7_b595]
signal result_u8_value_MUX_uxn_opcodes_h_l1747_c7_b595_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1747_c7_b595_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1747_c7_b595]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_b595_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_b595_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1750_c11_37e5]
signal BIN_OP_EQ_uxn_opcodes_h_l1750_c11_37e5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1750_c11_37e5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1750_c11_37e5_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1750_c7_4360]
signal n16_low_MUX_uxn_opcodes_h_l1750_c7_4360_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1750_c7_4360_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1750_c7_4360]
signal t8_MUX_uxn_opcodes_h_l1750_c7_4360_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1750_c7_4360_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1750_c7_4360]
signal n16_high_MUX_uxn_opcodes_h_l1750_c7_4360_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1750_c7_4360_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1750_c7_4360]
signal result_u16_value_MUX_uxn_opcodes_h_l1750_c7_4360_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1750_c7_4360_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1750_c7_4360]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_4360_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_4360_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1750_c7_4360]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_4360_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_4360_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1750_c7_4360]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_4360_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_4360_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1750_c7_4360]
signal result_u8_value_MUX_uxn_opcodes_h_l1750_c7_4360_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1750_c7_4360_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1750_c7_4360]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_4360_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_4360_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1754_c11_225a]
signal BIN_OP_EQ_uxn_opcodes_h_l1754_c11_225a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1754_c11_225a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1754_c11_225a_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1754_c7_cccf]
signal n16_low_MUX_uxn_opcodes_h_l1754_c7_cccf_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1754_c7_cccf_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1754_c7_cccf_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1754_c7_cccf_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1754_c7_cccf]
signal n16_high_MUX_uxn_opcodes_h_l1754_c7_cccf_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1754_c7_cccf_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1754_c7_cccf_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1754_c7_cccf_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1754_c7_cccf]
signal result_u16_value_MUX_uxn_opcodes_h_l1754_c7_cccf_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1754_c7_cccf_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1754_c7_cccf_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1754_c7_cccf_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1754_c7_cccf]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1754_c7_cccf_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1754_c7_cccf_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1754_c7_cccf_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1754_c7_cccf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1754_c7_cccf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_cccf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_cccf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_cccf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_cccf_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1754_c7_cccf]
signal result_u8_value_MUX_uxn_opcodes_h_l1754_c7_cccf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1754_c7_cccf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1754_c7_cccf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1754_c7_cccf_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1754_c7_cccf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_cccf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_cccf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_cccf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_cccf_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1756_c30_bd81]
signal sp_relative_shift_uxn_opcodes_h_l1756_c30_bd81_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1756_c30_bd81_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1756_c30_bd81_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1756_c30_bd81_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1761_c11_4741]
signal BIN_OP_EQ_uxn_opcodes_h_l1761_c11_4741_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1761_c11_4741_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1761_c11_4741_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1761_c7_0f71]
signal n16_low_MUX_uxn_opcodes_h_l1761_c7_0f71_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1761_c7_0f71_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1761_c7_0f71_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1761_c7_0f71_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1761_c7_0f71]
signal result_u16_value_MUX_uxn_opcodes_h_l1761_c7_0f71_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1761_c7_0f71_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1761_c7_0f71_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1761_c7_0f71_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1761_c7_0f71]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c7_0f71_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c7_0f71_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c7_0f71_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c7_0f71_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1761_c7_0f71]
signal result_u8_value_MUX_uxn_opcodes_h_l1761_c7_0f71_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1761_c7_0f71_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1761_c7_0f71_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1761_c7_0f71_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1761_c7_0f71]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_0f71_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_0f71_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_0f71_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_0f71_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1764_c22_5774]
signal BIN_OP_PLUS_uxn_opcodes_h_l1764_c22_5774_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1764_c22_5774_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1764_c22_5774_return_output : signed(18 downto 0);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1758_l1764_DUPLICATE_1333
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1758_l1764_DUPLICATE_1333_left : signed(16 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1758_l1764_DUPLICATE_1333_right : signed(7 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1758_l1764_DUPLICATE_1333_return_output : signed(17 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
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
-- BIN_OP_EQ_uxn_opcodes_h_l1734_c6_5fdc
BIN_OP_EQ_uxn_opcodes_h_l1734_c6_5fdc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1734_c6_5fdc_left,
BIN_OP_EQ_uxn_opcodes_h_l1734_c6_5fdc_right,
BIN_OP_EQ_uxn_opcodes_h_l1734_c6_5fdc_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1734_c2_6333
n16_low_MUX_uxn_opcodes_h_l1734_c2_6333 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1734_c2_6333_cond,
n16_low_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue,
n16_low_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse,
n16_low_MUX_uxn_opcodes_h_l1734_c2_6333_return_output);

-- t8_MUX_uxn_opcodes_h_l1734_c2_6333
t8_MUX_uxn_opcodes_h_l1734_c2_6333 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1734_c2_6333_cond,
t8_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue,
t8_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse,
t8_MUX_uxn_opcodes_h_l1734_c2_6333_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1734_c2_6333
n16_high_MUX_uxn_opcodes_h_l1734_c2_6333 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1734_c2_6333_cond,
n16_high_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue,
n16_high_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse,
n16_high_MUX_uxn_opcodes_h_l1734_c2_6333_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_6333
result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_6333 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_6333_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_6333_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1734_c2_6333
result_is_vram_write_MUX_uxn_opcodes_h_l1734_c2_6333 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1734_c2_6333_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1734_c2_6333_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1734_c2_6333
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1734_c2_6333 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1734_c2_6333_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1734_c2_6333_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1734_c2_6333
result_u8_value_MUX_uxn_opcodes_h_l1734_c2_6333 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1734_c2_6333_cond,
result_u8_value_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1734_c2_6333_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_6333
result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_6333 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_6333_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_6333_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1734_c2_6333
result_u16_value_MUX_uxn_opcodes_h_l1734_c2_6333 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1734_c2_6333_cond,
result_u16_value_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1734_c2_6333_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_6333
result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_6333 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_6333_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_6333_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1734_c2_6333
result_is_pc_updated_MUX_uxn_opcodes_h_l1734_c2_6333 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1734_c2_6333_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1734_c2_6333_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_6333
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_6333 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_6333_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_6333_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1734_c2_6333
result_is_ram_write_MUX_uxn_opcodes_h_l1734_c2_6333 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1734_c2_6333_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1734_c2_6333_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1747_c11_e744
BIN_OP_EQ_uxn_opcodes_h_l1747_c11_e744 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1747_c11_e744_left,
BIN_OP_EQ_uxn_opcodes_h_l1747_c11_e744_right,
BIN_OP_EQ_uxn_opcodes_h_l1747_c11_e744_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1747_c7_b595
n16_low_MUX_uxn_opcodes_h_l1747_c7_b595 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1747_c7_b595_cond,
n16_low_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue,
n16_low_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse,
n16_low_MUX_uxn_opcodes_h_l1747_c7_b595_return_output);

-- t8_MUX_uxn_opcodes_h_l1747_c7_b595
t8_MUX_uxn_opcodes_h_l1747_c7_b595 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1747_c7_b595_cond,
t8_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue,
t8_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse,
t8_MUX_uxn_opcodes_h_l1747_c7_b595_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1747_c7_b595
n16_high_MUX_uxn_opcodes_h_l1747_c7_b595 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1747_c7_b595_cond,
n16_high_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue,
n16_high_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse,
n16_high_MUX_uxn_opcodes_h_l1747_c7_b595_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1747_c7_b595
result_u16_value_MUX_uxn_opcodes_h_l1747_c7_b595 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1747_c7_b595_cond,
result_u16_value_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1747_c7_b595_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_b595
result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_b595 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_b595_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_b595_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_b595
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_b595 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_b595_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_b595_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1747_c7_b595
result_sp_relative_shift_MUX_uxn_opcodes_h_l1747_c7_b595 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1747_c7_b595_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1747_c7_b595_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1747_c7_b595
result_u8_value_MUX_uxn_opcodes_h_l1747_c7_b595 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1747_c7_b595_cond,
result_u8_value_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1747_c7_b595_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_b595
result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_b595 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_b595_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_b595_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1750_c11_37e5
BIN_OP_EQ_uxn_opcodes_h_l1750_c11_37e5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1750_c11_37e5_left,
BIN_OP_EQ_uxn_opcodes_h_l1750_c11_37e5_right,
BIN_OP_EQ_uxn_opcodes_h_l1750_c11_37e5_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1750_c7_4360
n16_low_MUX_uxn_opcodes_h_l1750_c7_4360 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1750_c7_4360_cond,
n16_low_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue,
n16_low_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse,
n16_low_MUX_uxn_opcodes_h_l1750_c7_4360_return_output);

-- t8_MUX_uxn_opcodes_h_l1750_c7_4360
t8_MUX_uxn_opcodes_h_l1750_c7_4360 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1750_c7_4360_cond,
t8_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue,
t8_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse,
t8_MUX_uxn_opcodes_h_l1750_c7_4360_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1750_c7_4360
n16_high_MUX_uxn_opcodes_h_l1750_c7_4360 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1750_c7_4360_cond,
n16_high_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue,
n16_high_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse,
n16_high_MUX_uxn_opcodes_h_l1750_c7_4360_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1750_c7_4360
result_u16_value_MUX_uxn_opcodes_h_l1750_c7_4360 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1750_c7_4360_cond,
result_u16_value_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1750_c7_4360_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_4360
result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_4360 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_4360_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_4360_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_4360
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_4360 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_4360_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_4360_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_4360
result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_4360 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_4360_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_4360_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1750_c7_4360
result_u8_value_MUX_uxn_opcodes_h_l1750_c7_4360 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1750_c7_4360_cond,
result_u8_value_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1750_c7_4360_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_4360
result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_4360 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_4360_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_4360_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1754_c11_225a
BIN_OP_EQ_uxn_opcodes_h_l1754_c11_225a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1754_c11_225a_left,
BIN_OP_EQ_uxn_opcodes_h_l1754_c11_225a_right,
BIN_OP_EQ_uxn_opcodes_h_l1754_c11_225a_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1754_c7_cccf
n16_low_MUX_uxn_opcodes_h_l1754_c7_cccf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1754_c7_cccf_cond,
n16_low_MUX_uxn_opcodes_h_l1754_c7_cccf_iftrue,
n16_low_MUX_uxn_opcodes_h_l1754_c7_cccf_iffalse,
n16_low_MUX_uxn_opcodes_h_l1754_c7_cccf_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1754_c7_cccf
n16_high_MUX_uxn_opcodes_h_l1754_c7_cccf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1754_c7_cccf_cond,
n16_high_MUX_uxn_opcodes_h_l1754_c7_cccf_iftrue,
n16_high_MUX_uxn_opcodes_h_l1754_c7_cccf_iffalse,
n16_high_MUX_uxn_opcodes_h_l1754_c7_cccf_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1754_c7_cccf
result_u16_value_MUX_uxn_opcodes_h_l1754_c7_cccf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1754_c7_cccf_cond,
result_u16_value_MUX_uxn_opcodes_h_l1754_c7_cccf_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1754_c7_cccf_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1754_c7_cccf_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1754_c7_cccf
result_is_ram_write_MUX_uxn_opcodes_h_l1754_c7_cccf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1754_c7_cccf_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1754_c7_cccf_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1754_c7_cccf_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1754_c7_cccf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_cccf
result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_cccf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_cccf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_cccf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_cccf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_cccf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1754_c7_cccf
result_u8_value_MUX_uxn_opcodes_h_l1754_c7_cccf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1754_c7_cccf_cond,
result_u8_value_MUX_uxn_opcodes_h_l1754_c7_cccf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1754_c7_cccf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1754_c7_cccf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_cccf
result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_cccf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_cccf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_cccf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_cccf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_cccf_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1756_c30_bd81
sp_relative_shift_uxn_opcodes_h_l1756_c30_bd81 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1756_c30_bd81_ins,
sp_relative_shift_uxn_opcodes_h_l1756_c30_bd81_x,
sp_relative_shift_uxn_opcodes_h_l1756_c30_bd81_y,
sp_relative_shift_uxn_opcodes_h_l1756_c30_bd81_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1761_c11_4741
BIN_OP_EQ_uxn_opcodes_h_l1761_c11_4741 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1761_c11_4741_left,
BIN_OP_EQ_uxn_opcodes_h_l1761_c11_4741_right,
BIN_OP_EQ_uxn_opcodes_h_l1761_c11_4741_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1761_c7_0f71
n16_low_MUX_uxn_opcodes_h_l1761_c7_0f71 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1761_c7_0f71_cond,
n16_low_MUX_uxn_opcodes_h_l1761_c7_0f71_iftrue,
n16_low_MUX_uxn_opcodes_h_l1761_c7_0f71_iffalse,
n16_low_MUX_uxn_opcodes_h_l1761_c7_0f71_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1761_c7_0f71
result_u16_value_MUX_uxn_opcodes_h_l1761_c7_0f71 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1761_c7_0f71_cond,
result_u16_value_MUX_uxn_opcodes_h_l1761_c7_0f71_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1761_c7_0f71_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1761_c7_0f71_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c7_0f71
result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c7_0f71 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c7_0f71_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c7_0f71_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c7_0f71_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c7_0f71_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1761_c7_0f71
result_u8_value_MUX_uxn_opcodes_h_l1761_c7_0f71 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1761_c7_0f71_cond,
result_u8_value_MUX_uxn_opcodes_h_l1761_c7_0f71_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1761_c7_0f71_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1761_c7_0f71_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_0f71
result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_0f71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_0f71_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_0f71_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_0f71_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_0f71_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1764_c22_5774
BIN_OP_PLUS_uxn_opcodes_h_l1764_c22_5774 : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1764_c22_5774_left,
BIN_OP_PLUS_uxn_opcodes_h_l1764_c22_5774_right,
BIN_OP_PLUS_uxn_opcodes_h_l1764_c22_5774_return_output);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1758_l1764_DUPLICATE_1333
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1758_l1764_DUPLICATE_1333 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1758_l1764_DUPLICATE_1333_left,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1758_l1764_DUPLICATE_1333_right,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1758_l1764_DUPLICATE_1333_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1734_c6_5fdc_return_output,
 n16_low_MUX_uxn_opcodes_h_l1734_c2_6333_return_output,
 t8_MUX_uxn_opcodes_h_l1734_c2_6333_return_output,
 n16_high_MUX_uxn_opcodes_h_l1734_c2_6333_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_6333_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1734_c2_6333_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1734_c2_6333_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1734_c2_6333_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_6333_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1734_c2_6333_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_6333_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1734_c2_6333_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_6333_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1734_c2_6333_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1747_c11_e744_return_output,
 n16_low_MUX_uxn_opcodes_h_l1747_c7_b595_return_output,
 t8_MUX_uxn_opcodes_h_l1747_c7_b595_return_output,
 n16_high_MUX_uxn_opcodes_h_l1747_c7_b595_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1747_c7_b595_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_b595_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_b595_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1747_c7_b595_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1747_c7_b595_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_b595_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1750_c11_37e5_return_output,
 n16_low_MUX_uxn_opcodes_h_l1750_c7_4360_return_output,
 t8_MUX_uxn_opcodes_h_l1750_c7_4360_return_output,
 n16_high_MUX_uxn_opcodes_h_l1750_c7_4360_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1750_c7_4360_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_4360_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_4360_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_4360_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1750_c7_4360_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_4360_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1754_c11_225a_return_output,
 n16_low_MUX_uxn_opcodes_h_l1754_c7_cccf_return_output,
 n16_high_MUX_uxn_opcodes_h_l1754_c7_cccf_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1754_c7_cccf_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1754_c7_cccf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_cccf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1754_c7_cccf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_cccf_return_output,
 sp_relative_shift_uxn_opcodes_h_l1756_c30_bd81_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1761_c11_4741_return_output,
 n16_low_MUX_uxn_opcodes_h_l1761_c7_0f71_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1761_c7_0f71_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c7_0f71_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1761_c7_0f71_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_0f71_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1764_c22_5774_return_output,
 BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1758_l1764_DUPLICATE_1333_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c6_5fdc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c6_5fdc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c6_5fdc_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1747_c7_b595_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1734_c2_6333_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1734_c2_6333_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1747_c7_b595_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1734_c2_6333_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1734_c2_6333_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1747_c7_b595_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1734_c2_6333_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1734_c2_6333_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1734_c2_6333_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_6333_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_6333_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1734_c2_6333_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1734_c2_6333_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1734_c2_6333_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1734_c2_6333_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1734_c2_6333_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1734_c2_6333_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1747_c7_b595_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c2_6333_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c2_6333_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_b595_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_6333_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_6333_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1747_c7_b595_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c2_6333_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c2_6333_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1739_c3_bf55 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1747_c7_b595_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_6333_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_6333_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1734_c2_6333_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1734_c2_6333_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1734_c2_6333_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1744_c3_0b6e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_b595_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_6333_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_6333_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_b595_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c2_6333_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c2_6333_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_e744_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_e744_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_e744_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1750_c7_4360_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1747_c7_b595_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1750_c7_4360_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1747_c7_b595_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1750_c7_4360_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1747_c7_b595_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1750_c7_4360_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1747_c7_b595_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_4360_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_b595_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1748_c3_969c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_4360_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_b595_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_4360_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1747_c7_b595_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1750_c7_4360_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1747_c7_b595_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_4360_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_b595_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c11_37e5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c11_37e5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c11_37e5_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1754_c7_cccf_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1750_c7_4360_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1750_c7_4360_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1754_c7_cccf_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1750_c7_4360_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1754_c7_cccf_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1750_c7_4360_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1754_c7_cccf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_4360_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1752_c3_e291 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1750_c7_4360_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_4360_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_cccf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_4360_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1754_c7_cccf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1750_c7_4360_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_cccf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_4360_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_225a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_225a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_225a_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1754_c7_cccf_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1754_c7_cccf_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1761_c7_0f71_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1754_c7_cccf_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1754_c7_cccf_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1754_c7_cccf_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1754_c7_cccf_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1754_c7_cccf_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1758_c3_8654 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1754_c7_cccf_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c7_0f71_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1754_c7_cccf_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1754_c7_cccf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1754_c7_cccf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1754_c7_cccf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_cccf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_cccf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c7_0f71_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_cccf_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1754_c7_cccf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1754_c7_cccf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c7_0f71_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1754_c7_cccf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_cccf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_cccf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_0f71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_cccf_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1756_c30_bd81_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1756_c30_bd81_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1756_c30_bd81_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1756_c30_bd81_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c11_4741_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c11_4741_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c11_4741_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1761_c7_0f71_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1761_c7_0f71_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1761_c7_0f71_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c7_0f71_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1764_c3_28d3 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c7_0f71_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c7_0f71_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c7_0f71_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1763_c3_b1ba : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c7_0f71_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c7_0f71_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c7_0f71_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c7_0f71_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c7_0f71_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_0f71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_0f71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_0f71_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1764_c22_5774_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1764_c22_5774_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1764_c22_5774_return_output : signed(18 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1750_l1734_l1747_l1761_DUPLICATE_1f03_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1750_l1734_l1747_l1761_DUPLICATE_4d54_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1750_l1754_l1747_DUPLICATE_1c67_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1750_l1747_l1761_DUPLICATE_58a8_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1750_l1754_l1747_l1761_DUPLICATE_bf2d_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1758_l1764_DUPLICATE_8b06_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1758_l1764_DUPLICATE_1333_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1758_l1764_DUPLICATE_1333_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1758_l1764_DUPLICATE_1333_return_output : signed(17 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l1769_l1730_DUPLICATE_6c37_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c11_4741_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1744_c3_0b6e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1744_c3_0b6e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c11_37e5_right := to_unsigned(2, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_0f71_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1764_c22_5774_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c6_5fdc_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1748_c3_969c := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1748_c3_969c;
     VAR_sp_relative_shift_uxn_opcodes_h_l1756_c30_bd81_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1752_c3_e291 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1752_c3_e291;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1739_c3_bf55 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1739_c3_bf55;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_e744_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1756_c30_bd81_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_225a_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1763_c3_b1ba := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c7_0f71_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1763_c3_b1ba;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1754_c7_cccf_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1756_c30_bd81_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1754_c7_cccf_iffalse := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1754_c7_cccf_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1761_c7_0f71_iffalse := n16_low;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1758_l1764_DUPLICATE_1333_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c6_5fdc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_e744_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c11_37e5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_225a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c11_4741_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l1754_c7_cccf_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l1761_c7_0f71_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1754_c7_cccf_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c7_0f71_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse := t8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1750_l1734_l1747_l1761_DUPLICATE_1f03 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1750_l1734_l1747_l1761_DUPLICATE_1f03_return_output := result.u8_value;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1750_l1734_l1747_l1761_DUPLICATE_4d54 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1750_l1734_l1747_l1761_DUPLICATE_4d54_return_output := result.u16_value;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1734_c2_6333] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1734_c2_6333_return_output := result.is_stack_index_flipped;

     -- sp_relative_shift[uxn_opcodes_h_l1756_c30_bd81] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1756_c30_bd81_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1756_c30_bd81_ins;
     sp_relative_shift_uxn_opcodes_h_l1756_c30_bd81_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1756_c30_bd81_x;
     sp_relative_shift_uxn_opcodes_h_l1756_c30_bd81_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1756_c30_bd81_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1756_c30_bd81_return_output := sp_relative_shift_uxn_opcodes_h_l1756_c30_bd81_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1750_l1754_l1747_l1761_DUPLICATE_bf2d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1750_l1754_l1747_l1761_DUPLICATE_bf2d_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1754_c11_225a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1754_c11_225a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_225a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1754_c11_225a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_225a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_225a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1754_c11_225a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1761_c11_4741] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1761_c11_4741_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c11_4741_left;
     BIN_OP_EQ_uxn_opcodes_h_l1761_c11_4741_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c11_4741_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c11_4741_return_output := BIN_OP_EQ_uxn_opcodes_h_l1761_c11_4741_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1750_c7_4360] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1750_c7_4360_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1750_l1754_l1747_DUPLICATE_1c67 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1750_l1754_l1747_DUPLICATE_1c67_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1734_c6_5fdc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1734_c6_5fdc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c6_5fdc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1734_c6_5fdc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c6_5fdc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c6_5fdc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1734_c6_5fdc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1750_c11_37e5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1750_c11_37e5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c11_37e5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1750_c11_37e5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c11_37e5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c11_37e5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1750_c11_37e5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1747_c11_e744] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1747_c11_e744_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_e744_left;
     BIN_OP_EQ_uxn_opcodes_h_l1747_c11_e744_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_e744_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_e744_return_output := BIN_OP_EQ_uxn_opcodes_h_l1747_c11_e744_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1750_l1747_l1761_DUPLICATE_58a8 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1750_l1747_l1761_DUPLICATE_58a8_return_output := result.sp_relative_shift;

     -- CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1758_l1764_DUPLICATE_8b06 LATENCY=0
     VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1758_l1764_DUPLICATE_8b06_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l1734_c2_6333] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1734_c2_6333_return_output := result.is_stack_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1734_c2_6333] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1734_c2_6333_return_output := result.is_vram_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1734_c2_6333] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1734_c2_6333_return_output := result.is_pc_updated;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l1734_c2_6333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c6_5fdc_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1734_c2_6333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c6_5fdc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_6333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c6_5fdc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1734_c2_6333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c6_5fdc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c2_6333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c6_5fdc_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1734_c2_6333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c6_5fdc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_6333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c6_5fdc_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1734_c2_6333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c6_5fdc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_6333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c6_5fdc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_6333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c6_5fdc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c2_6333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c6_5fdc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c2_6333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c6_5fdc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1734_c2_6333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c6_5fdc_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1747_c7_b595_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_e744_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1747_c7_b595_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_e744_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_b595_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_e744_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_b595_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_e744_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1747_c7_b595_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_e744_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_b595_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_e744_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1747_c7_b595_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_e744_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1747_c7_b595_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_e744_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1747_c7_b595_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_e744_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1750_c7_4360_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c11_37e5_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1750_c7_4360_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c11_37e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_4360_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c11_37e5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_4360_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c11_37e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_4360_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c11_37e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_4360_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c11_37e5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1750_c7_4360_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c11_37e5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1750_c7_4360_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c11_37e5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1750_c7_4360_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c11_37e5_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1754_c7_cccf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_225a_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1754_c7_cccf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_225a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_cccf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_225a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1754_c7_cccf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_225a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_cccf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_225a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1754_c7_cccf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_225a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1754_c7_cccf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_225a_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1761_c7_0f71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c11_4741_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_0f71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c11_4741_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c7_0f71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c11_4741_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c7_0f71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c11_4741_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c7_0f71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c11_4741_return_output;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1758_l1764_DUPLICATE_1333_right := VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1758_l1764_DUPLICATE_8b06_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1750_l1747_l1761_DUPLICATE_58a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1750_l1747_l1761_DUPLICATE_58a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c7_0f71_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1750_l1747_l1761_DUPLICATE_58a8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1750_l1734_l1747_l1761_DUPLICATE_4d54_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1750_l1734_l1747_l1761_DUPLICATE_4d54_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1750_l1734_l1747_l1761_DUPLICATE_4d54_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c7_0f71_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1750_l1734_l1747_l1761_DUPLICATE_4d54_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1750_l1754_l1747_l1761_DUPLICATE_bf2d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1750_l1754_l1747_l1761_DUPLICATE_bf2d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_cccf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1750_l1754_l1747_l1761_DUPLICATE_bf2d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_0f71_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1750_l1754_l1747_l1761_DUPLICATE_bf2d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1750_l1754_l1747_DUPLICATE_1c67_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1750_l1754_l1747_DUPLICATE_1c67_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1754_c7_cccf_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1750_l1754_l1747_DUPLICATE_1c67_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1750_l1734_l1747_l1761_DUPLICATE_1f03_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1750_l1734_l1747_l1761_DUPLICATE_1f03_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1750_l1734_l1747_l1761_DUPLICATE_1f03_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c7_0f71_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1750_l1734_l1747_l1761_DUPLICATE_1f03_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1734_c2_6333_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1734_c2_6333_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1734_c2_6333_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1734_c2_6333_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1750_c7_4360_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_cccf_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1756_c30_bd81_return_output;
     -- t8_MUX[uxn_opcodes_h_l1750_c7_4360] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1750_c7_4360_cond <= VAR_t8_MUX_uxn_opcodes_h_l1750_c7_4360_cond;
     t8_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue;
     t8_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1750_c7_4360_return_output := t8_MUX_uxn_opcodes_h_l1750_c7_4360_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1734_c2_6333] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_6333_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_6333_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_6333_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_6333_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1734_c2_6333] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1734_c2_6333_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1734_c2_6333_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1734_c2_6333_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1734_c2_6333_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1754_c7_cccf] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1754_c7_cccf_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1754_c7_cccf_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1754_c7_cccf_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1754_c7_cccf_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1754_c7_cccf_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1754_c7_cccf_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1754_c7_cccf_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1754_c7_cccf_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1761_c7_0f71] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1761_c7_0f71_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1761_c7_0f71_cond;
     n16_low_MUX_uxn_opcodes_h_l1761_c7_0f71_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1761_c7_0f71_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1761_c7_0f71_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1761_c7_0f71_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1761_c7_0f71_return_output := n16_low_MUX_uxn_opcodes_h_l1761_c7_0f71_return_output;

     -- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1758_l1764_DUPLICATE_1333 LATENCY=0
     -- Inputs
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1758_l1764_DUPLICATE_1333_left <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1758_l1764_DUPLICATE_1333_left;
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1758_l1764_DUPLICATE_1333_right <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1758_l1764_DUPLICATE_1333_right;
     -- Outputs
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1758_l1764_DUPLICATE_1333_return_output := BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1758_l1764_DUPLICATE_1333_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1754_c7_cccf] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1754_c7_cccf_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1754_c7_cccf_cond;
     n16_high_MUX_uxn_opcodes_h_l1754_c7_cccf_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1754_c7_cccf_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1754_c7_cccf_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1754_c7_cccf_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1754_c7_cccf_return_output := n16_high_MUX_uxn_opcodes_h_l1754_c7_cccf_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1734_c2_6333] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1734_c2_6333_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1734_c2_6333_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1734_c2_6333_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1734_c2_6333_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1750_c7_4360] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_4360_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_4360_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_4360_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_4360_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1761_c7_0f71] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_0f71_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_0f71_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_0f71_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_0f71_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_0f71_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_0f71_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_0f71_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_0f71_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1761_c7_0f71] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c7_0f71_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c7_0f71_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c7_0f71_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c7_0f71_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c7_0f71_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c7_0f71_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c7_0f71_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c7_0f71_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1761_c7_0f71] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1761_c7_0f71_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c7_0f71_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1761_c7_0f71_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c7_0f71_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1761_c7_0f71_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c7_0f71_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c7_0f71_return_output := result_u8_value_MUX_uxn_opcodes_h_l1761_c7_0f71_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1734_c2_6333] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1734_c2_6333_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1734_c2_6333_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1734_c2_6333_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1734_c2_6333_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1764_c22_5774_left := VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1758_l1764_DUPLICATE_1333_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1758_c3_8654 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1758_l1764_DUPLICATE_1333_return_output)),16);
     VAR_n16_high_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1754_c7_cccf_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1754_c7_cccf_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1761_c7_0f71_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_cccf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_0f71_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1754_c7_cccf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_cccf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c7_0f71_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_4360_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1754_c7_cccf_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c7_0f71_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1750_c7_4360_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1754_c7_cccf_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1758_c3_8654;
     -- BIN_OP_PLUS[uxn_opcodes_h_l1764_c22_5774] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1764_c22_5774_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1764_c22_5774_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1764_c22_5774_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1764_c22_5774_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1764_c22_5774_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1764_c22_5774_return_output;

     -- t8_MUX[uxn_opcodes_h_l1747_c7_b595] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1747_c7_b595_cond <= VAR_t8_MUX_uxn_opcodes_h_l1747_c7_b595_cond;
     t8_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue;
     t8_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1747_c7_b595_return_output := t8_MUX_uxn_opcodes_h_l1747_c7_b595_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1747_c7_b595] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_b595_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_b595_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_b595_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_b595_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1754_c7_cccf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_cccf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_cccf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_cccf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_cccf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_cccf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_cccf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_cccf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_cccf_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1754_c7_cccf] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1754_c7_cccf_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1754_c7_cccf_cond;
     n16_low_MUX_uxn_opcodes_h_l1754_c7_cccf_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1754_c7_cccf_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1754_c7_cccf_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1754_c7_cccf_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1754_c7_cccf_return_output := n16_low_MUX_uxn_opcodes_h_l1754_c7_cccf_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1750_c7_4360] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1750_c7_4360_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1750_c7_4360_cond;
     n16_high_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1750_c7_4360_return_output := n16_high_MUX_uxn_opcodes_h_l1750_c7_4360_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1750_c7_4360] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_4360_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_4360_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_4360_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_4360_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1754_c7_cccf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_cccf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_cccf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_cccf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_cccf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_cccf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_cccf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_cccf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_cccf_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1754_c7_cccf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1754_c7_cccf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1754_c7_cccf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1754_c7_cccf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1754_c7_cccf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1754_c7_cccf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1754_c7_cccf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1754_c7_cccf_return_output := result_u8_value_MUX_uxn_opcodes_h_l1754_c7_cccf_return_output;

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1764_c3_28d3 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1764_c22_5774_return_output)),16);
     VAR_n16_high_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1750_c7_4360_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1754_c7_cccf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_cccf_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_4360_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_cccf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_b595_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1754_c7_cccf_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1747_c7_b595_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c7_0f71_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1764_c3_28d3;
     -- n16_low_MUX[uxn_opcodes_h_l1750_c7_4360] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1750_c7_4360_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1750_c7_4360_cond;
     n16_low_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1750_c7_4360_return_output := n16_low_MUX_uxn_opcodes_h_l1750_c7_4360_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1750_c7_4360] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_4360_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_4360_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_4360_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_4360_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1750_c7_4360] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_4360_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_4360_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_4360_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_4360_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1734_c2_6333] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_6333_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_6333_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_6333_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_6333_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1761_c7_0f71] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1761_c7_0f71_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c7_0f71_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1761_c7_0f71_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c7_0f71_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1761_c7_0f71_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c7_0f71_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c7_0f71_return_output := result_u16_value_MUX_uxn_opcodes_h_l1761_c7_0f71_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1747_c7_b595] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_b595_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_b595_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_b595_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_b595_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1747_c7_b595] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1747_c7_b595_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1747_c7_b595_cond;
     n16_high_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1747_c7_b595_return_output := n16_high_MUX_uxn_opcodes_h_l1747_c7_b595_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1750_c7_4360] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1750_c7_4360_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1750_c7_4360_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1750_c7_4360_return_output := result_u8_value_MUX_uxn_opcodes_h_l1750_c7_4360_return_output;

     -- t8_MUX[uxn_opcodes_h_l1734_c2_6333] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1734_c2_6333_cond <= VAR_t8_MUX_uxn_opcodes_h_l1734_c2_6333_cond;
     t8_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue;
     t8_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1734_c2_6333_return_output := t8_MUX_uxn_opcodes_h_l1734_c2_6333_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1747_c7_b595_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1750_c7_4360_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_4360_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1747_c7_b595_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_4360_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1754_c7_cccf_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c7_0f71_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1750_c7_4360_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1734_c2_6333_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l1747_c7_b595] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1747_c7_b595_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1747_c7_b595_cond;
     n16_low_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1747_c7_b595_return_output := n16_low_MUX_uxn_opcodes_h_l1747_c7_b595_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1747_c7_b595] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1747_c7_b595_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1747_c7_b595_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1747_c7_b595_return_output := result_u8_value_MUX_uxn_opcodes_h_l1747_c7_b595_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1734_c2_6333] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1734_c2_6333_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1734_c2_6333_cond;
     n16_high_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1734_c2_6333_return_output := n16_high_MUX_uxn_opcodes_h_l1734_c2_6333_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1747_c7_b595] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1747_c7_b595_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1747_c7_b595_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1747_c7_b595_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1747_c7_b595_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1754_c7_cccf] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1754_c7_cccf_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1754_c7_cccf_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1754_c7_cccf_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1754_c7_cccf_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1754_c7_cccf_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1754_c7_cccf_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1754_c7_cccf_return_output := result_u16_value_MUX_uxn_opcodes_h_l1754_c7_cccf_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1734_c2_6333] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1734_c2_6333_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c2_6333_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c2_6333_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1734_c2_6333_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1747_c7_b595] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_b595_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_b595_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_b595_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_b595_return_output;

     -- Submodule level 5
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l1734_c2_6333_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1747_c7_b595_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_b595_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1747_c7_b595_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1754_c7_cccf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1747_c7_b595_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l1734_c2_6333] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1734_c2_6333_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1734_c2_6333_cond;
     n16_low_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1734_c2_6333_return_output := n16_low_MUX_uxn_opcodes_h_l1734_c2_6333_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1734_c2_6333] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_6333_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_6333_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_6333_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_6333_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1750_c7_4360] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1750_c7_4360_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1750_c7_4360_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1750_c7_4360_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1750_c7_4360_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1750_c7_4360_return_output := result_u16_value_MUX_uxn_opcodes_h_l1750_c7_4360_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1734_c2_6333] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_6333_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_6333_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_6333_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_6333_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1734_c2_6333] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1734_c2_6333_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c2_6333_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c2_6333_return_output := result_u8_value_MUX_uxn_opcodes_h_l1734_c2_6333_return_output;

     -- Submodule level 6
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l1734_c2_6333_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1750_c7_4360_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1747_c7_b595] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1747_c7_b595_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1747_c7_b595_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1747_c7_b595_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1747_c7_b595_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1747_c7_b595_return_output := result_u16_value_MUX_uxn_opcodes_h_l1747_c7_b595_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1747_c7_b595_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1734_c2_6333] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1734_c2_6333_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c2_6333_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c2_6333_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c2_6333_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c2_6333_return_output := result_u16_value_MUX_uxn_opcodes_h_l1734_c2_6333_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l1769_l1730_DUPLICATE_6c37 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l1769_l1730_DUPLICATE_6c37_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_775a(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_6333_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1734_c2_6333_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1734_c2_6333_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c2_6333_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_6333_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c2_6333_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_6333_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1734_c2_6333_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_6333_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c2_6333_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l1769_l1730_DUPLICATE_6c37_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l1769_l1730_DUPLICATE_6c37_return_output;
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
