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
-- BIN_OP_EQ[uxn_opcodes_h_l1735_c6_ba48]
signal BIN_OP_EQ_uxn_opcodes_h_l1735_c6_ba48_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1735_c6_ba48_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1735_c6_ba48_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1735_c2_1820]
signal t8_MUX_uxn_opcodes_h_l1735_c2_1820_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1735_c2_1820_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1735_c2_1820]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1735_c2_1820_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1735_c2_1820_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1735_c2_1820]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1735_c2_1820_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1735_c2_1820_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1735_c2_1820]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1735_c2_1820_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1735_c2_1820_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1735_c2_1820]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1735_c2_1820_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1735_c2_1820_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1735_c2_1820]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c2_1820_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c2_1820_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1735_c2_1820]
signal result_u8_value_MUX_uxn_opcodes_h_l1735_c2_1820_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1735_c2_1820_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1735_c2_1820]
signal result_u16_value_MUX_uxn_opcodes_h_l1735_c2_1820_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1735_c2_1820_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1735_c2_1820]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c2_1820_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c2_1820_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1735_c2_1820]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1735_c2_1820_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1735_c2_1820_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1735_c2_1820]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1735_c2_1820_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1735_c2_1820_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1735_c2_1820]
signal n16_low_MUX_uxn_opcodes_h_l1735_c2_1820_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1735_c2_1820_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1735_c2_1820]
signal n16_high_MUX_uxn_opcodes_h_l1735_c2_1820_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1735_c2_1820_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1748_c11_43d4]
signal BIN_OP_EQ_uxn_opcodes_h_l1748_c11_43d4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1748_c11_43d4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1748_c11_43d4_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1748_c7_f5bc]
signal t8_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1748_c7_f5bc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1748_c7_f5bc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1748_c7_f5bc]
signal result_u8_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1748_c7_f5bc]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1748_c7_f5bc]
signal result_u16_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1748_c7_f5bc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output : signed(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1748_c7_f5bc]
signal n16_low_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1748_c7_f5bc]
signal n16_high_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1751_c11_10bb]
signal BIN_OP_EQ_uxn_opcodes_h_l1751_c11_10bb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1751_c11_10bb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1751_c11_10bb_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1751_c7_9ae8]
signal t8_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1751_c7_9ae8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1751_c7_9ae8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1751_c7_9ae8]
signal result_u8_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1751_c7_9ae8]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1751_c7_9ae8]
signal result_u16_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1751_c7_9ae8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output : signed(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1751_c7_9ae8]
signal n16_low_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1751_c7_9ae8]
signal n16_high_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1755_c11_520f]
signal BIN_OP_EQ_uxn_opcodes_h_l1755_c11_520f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1755_c11_520f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1755_c11_520f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1755_c7_3023]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_3023_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_3023_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_3023_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_3023_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1755_c7_3023]
signal result_u8_value_MUX_uxn_opcodes_h_l1755_c7_3023_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1755_c7_3023_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1755_c7_3023_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1755_c7_3023_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1755_c7_3023]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1755_c7_3023_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1755_c7_3023_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1755_c7_3023_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1755_c7_3023_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1755_c7_3023]
signal result_u16_value_MUX_uxn_opcodes_h_l1755_c7_3023_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1755_c7_3023_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1755_c7_3023_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1755_c7_3023_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1755_c7_3023]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_3023_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_3023_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_3023_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_3023_return_output : signed(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1755_c7_3023]
signal n16_low_MUX_uxn_opcodes_h_l1755_c7_3023_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1755_c7_3023_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1755_c7_3023_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1755_c7_3023_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1755_c7_3023]
signal n16_high_MUX_uxn_opcodes_h_l1755_c7_3023_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1755_c7_3023_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1755_c7_3023_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1755_c7_3023_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1757_c30_e523]
signal sp_relative_shift_uxn_opcodes_h_l1757_c30_e523_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1757_c30_e523_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1757_c30_e523_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1757_c30_e523_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1762_c11_513d]
signal BIN_OP_EQ_uxn_opcodes_h_l1762_c11_513d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1762_c11_513d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1762_c11_513d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1762_c7_3daf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3daf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3daf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3daf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3daf_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1762_c7_3daf]
signal result_u16_value_MUX_uxn_opcodes_h_l1762_c7_3daf_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1762_c7_3daf_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1762_c7_3daf_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1762_c7_3daf_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1762_c7_3daf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c7_3daf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c7_3daf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c7_3daf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c7_3daf_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1762_c7_3daf]
signal result_u8_value_MUX_uxn_opcodes_h_l1762_c7_3daf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1762_c7_3daf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1762_c7_3daf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1762_c7_3daf_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1762_c7_3daf]
signal n16_low_MUX_uxn_opcodes_h_l1762_c7_3daf_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1762_c7_3daf_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1762_c7_3daf_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1762_c7_3daf_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1765_c22_1d4b]
signal BIN_OP_PLUS_uxn_opcodes_h_l1765_c22_1d4b_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1765_c22_1d4b_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1765_c22_1d4b_return_output : signed(18 downto 0);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1759_l1765_DUPLICATE_7687
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1759_l1765_DUPLICATE_7687_left : signed(16 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1759_l1765_DUPLICATE_7687_right : signed(7 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1759_l1765_DUPLICATE_7687_return_output : signed(17 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_9f32( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.u8_value := ref_toks_6;
      base.u16_value := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.is_stack_index_flipped := ref_toks_9;
      base.is_pc_updated := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1735_c6_ba48
BIN_OP_EQ_uxn_opcodes_h_l1735_c6_ba48 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1735_c6_ba48_left,
BIN_OP_EQ_uxn_opcodes_h_l1735_c6_ba48_right,
BIN_OP_EQ_uxn_opcodes_h_l1735_c6_ba48_return_output);

-- t8_MUX_uxn_opcodes_h_l1735_c2_1820
t8_MUX_uxn_opcodes_h_l1735_c2_1820 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1735_c2_1820_cond,
t8_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue,
t8_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse,
t8_MUX_uxn_opcodes_h_l1735_c2_1820_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1735_c2_1820
result_is_opc_done_MUX_uxn_opcodes_h_l1735_c2_1820 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1735_c2_1820_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1735_c2_1820_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1735_c2_1820
result_is_vram_write_MUX_uxn_opcodes_h_l1735_c2_1820 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1735_c2_1820_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1735_c2_1820_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1735_c2_1820
result_is_ram_write_MUX_uxn_opcodes_h_l1735_c2_1820 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1735_c2_1820_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1735_c2_1820_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1735_c2_1820
result_is_stack_write_MUX_uxn_opcodes_h_l1735_c2_1820 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1735_c2_1820_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1735_c2_1820_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c2_1820
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c2_1820 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c2_1820_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c2_1820_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1735_c2_1820
result_u8_value_MUX_uxn_opcodes_h_l1735_c2_1820 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1735_c2_1820_cond,
result_u8_value_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1735_c2_1820_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1735_c2_1820
result_u16_value_MUX_uxn_opcodes_h_l1735_c2_1820 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1735_c2_1820_cond,
result_u16_value_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1735_c2_1820_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c2_1820
result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c2_1820 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c2_1820_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c2_1820_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1735_c2_1820
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1735_c2_1820 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1735_c2_1820_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1735_c2_1820_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1735_c2_1820
result_is_pc_updated_MUX_uxn_opcodes_h_l1735_c2_1820 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1735_c2_1820_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1735_c2_1820_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1735_c2_1820
n16_low_MUX_uxn_opcodes_h_l1735_c2_1820 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1735_c2_1820_cond,
n16_low_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue,
n16_low_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse,
n16_low_MUX_uxn_opcodes_h_l1735_c2_1820_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1735_c2_1820
n16_high_MUX_uxn_opcodes_h_l1735_c2_1820 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1735_c2_1820_cond,
n16_high_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue,
n16_high_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse,
n16_high_MUX_uxn_opcodes_h_l1735_c2_1820_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1748_c11_43d4
BIN_OP_EQ_uxn_opcodes_h_l1748_c11_43d4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1748_c11_43d4_left,
BIN_OP_EQ_uxn_opcodes_h_l1748_c11_43d4_right,
BIN_OP_EQ_uxn_opcodes_h_l1748_c11_43d4_return_output);

-- t8_MUX_uxn_opcodes_h_l1748_c7_f5bc
t8_MUX_uxn_opcodes_h_l1748_c7_f5bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond,
t8_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue,
t8_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse,
t8_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_f5bc
result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_f5bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_f5bc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_f5bc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1748_c7_f5bc
result_u8_value_MUX_uxn_opcodes_h_l1748_c7_f5bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond,
result_u8_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1748_c7_f5bc
result_is_ram_write_MUX_uxn_opcodes_h_l1748_c7_f5bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1748_c7_f5bc
result_u16_value_MUX_uxn_opcodes_h_l1748_c7_f5bc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond,
result_u16_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_f5bc
result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_f5bc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1748_c7_f5bc
n16_low_MUX_uxn_opcodes_h_l1748_c7_f5bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond,
n16_low_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue,
n16_low_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse,
n16_low_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1748_c7_f5bc
n16_high_MUX_uxn_opcodes_h_l1748_c7_f5bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond,
n16_high_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue,
n16_high_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse,
n16_high_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1751_c11_10bb
BIN_OP_EQ_uxn_opcodes_h_l1751_c11_10bb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1751_c11_10bb_left,
BIN_OP_EQ_uxn_opcodes_h_l1751_c11_10bb_right,
BIN_OP_EQ_uxn_opcodes_h_l1751_c11_10bb_return_output);

-- t8_MUX_uxn_opcodes_h_l1751_c7_9ae8
t8_MUX_uxn_opcodes_h_l1751_c7_9ae8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond,
t8_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue,
t8_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse,
t8_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1751_c7_9ae8
result_is_opc_done_MUX_uxn_opcodes_h_l1751_c7_9ae8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1751_c7_9ae8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1751_c7_9ae8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1751_c7_9ae8
result_u8_value_MUX_uxn_opcodes_h_l1751_c7_9ae8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1751_c7_9ae8
result_is_ram_write_MUX_uxn_opcodes_h_l1751_c7_9ae8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1751_c7_9ae8
result_u16_value_MUX_uxn_opcodes_h_l1751_c7_9ae8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond,
result_u16_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1751_c7_9ae8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1751_c7_9ae8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1751_c7_9ae8
n16_low_MUX_uxn_opcodes_h_l1751_c7_9ae8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond,
n16_low_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue,
n16_low_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse,
n16_low_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1751_c7_9ae8
n16_high_MUX_uxn_opcodes_h_l1751_c7_9ae8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond,
n16_high_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue,
n16_high_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse,
n16_high_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1755_c11_520f
BIN_OP_EQ_uxn_opcodes_h_l1755_c11_520f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1755_c11_520f_left,
BIN_OP_EQ_uxn_opcodes_h_l1755_c11_520f_right,
BIN_OP_EQ_uxn_opcodes_h_l1755_c11_520f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_3023
result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_3023 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_3023_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_3023_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_3023_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_3023_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1755_c7_3023
result_u8_value_MUX_uxn_opcodes_h_l1755_c7_3023 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1755_c7_3023_cond,
result_u8_value_MUX_uxn_opcodes_h_l1755_c7_3023_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1755_c7_3023_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1755_c7_3023_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1755_c7_3023
result_is_ram_write_MUX_uxn_opcodes_h_l1755_c7_3023 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1755_c7_3023_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1755_c7_3023_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1755_c7_3023_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1755_c7_3023_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1755_c7_3023
result_u16_value_MUX_uxn_opcodes_h_l1755_c7_3023 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1755_c7_3023_cond,
result_u16_value_MUX_uxn_opcodes_h_l1755_c7_3023_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1755_c7_3023_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1755_c7_3023_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_3023
result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_3023 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_3023_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_3023_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_3023_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_3023_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1755_c7_3023
n16_low_MUX_uxn_opcodes_h_l1755_c7_3023 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1755_c7_3023_cond,
n16_low_MUX_uxn_opcodes_h_l1755_c7_3023_iftrue,
n16_low_MUX_uxn_opcodes_h_l1755_c7_3023_iffalse,
n16_low_MUX_uxn_opcodes_h_l1755_c7_3023_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1755_c7_3023
n16_high_MUX_uxn_opcodes_h_l1755_c7_3023 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1755_c7_3023_cond,
n16_high_MUX_uxn_opcodes_h_l1755_c7_3023_iftrue,
n16_high_MUX_uxn_opcodes_h_l1755_c7_3023_iffalse,
n16_high_MUX_uxn_opcodes_h_l1755_c7_3023_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1757_c30_e523
sp_relative_shift_uxn_opcodes_h_l1757_c30_e523 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1757_c30_e523_ins,
sp_relative_shift_uxn_opcodes_h_l1757_c30_e523_x,
sp_relative_shift_uxn_opcodes_h_l1757_c30_e523_y,
sp_relative_shift_uxn_opcodes_h_l1757_c30_e523_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1762_c11_513d
BIN_OP_EQ_uxn_opcodes_h_l1762_c11_513d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1762_c11_513d_left,
BIN_OP_EQ_uxn_opcodes_h_l1762_c11_513d_right,
BIN_OP_EQ_uxn_opcodes_h_l1762_c11_513d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3daf
result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3daf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3daf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3daf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3daf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3daf_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1762_c7_3daf
result_u16_value_MUX_uxn_opcodes_h_l1762_c7_3daf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1762_c7_3daf_cond,
result_u16_value_MUX_uxn_opcodes_h_l1762_c7_3daf_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1762_c7_3daf_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1762_c7_3daf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c7_3daf
result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c7_3daf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c7_3daf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c7_3daf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c7_3daf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c7_3daf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1762_c7_3daf
result_u8_value_MUX_uxn_opcodes_h_l1762_c7_3daf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1762_c7_3daf_cond,
result_u8_value_MUX_uxn_opcodes_h_l1762_c7_3daf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1762_c7_3daf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1762_c7_3daf_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1762_c7_3daf
n16_low_MUX_uxn_opcodes_h_l1762_c7_3daf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1762_c7_3daf_cond,
n16_low_MUX_uxn_opcodes_h_l1762_c7_3daf_iftrue,
n16_low_MUX_uxn_opcodes_h_l1762_c7_3daf_iffalse,
n16_low_MUX_uxn_opcodes_h_l1762_c7_3daf_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1765_c22_1d4b
BIN_OP_PLUS_uxn_opcodes_h_l1765_c22_1d4b : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1765_c22_1d4b_left,
BIN_OP_PLUS_uxn_opcodes_h_l1765_c22_1d4b_right,
BIN_OP_PLUS_uxn_opcodes_h_l1765_c22_1d4b_return_output);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1759_l1765_DUPLICATE_7687
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1759_l1765_DUPLICATE_7687 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1759_l1765_DUPLICATE_7687_left,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1759_l1765_DUPLICATE_7687_right,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1759_l1765_DUPLICATE_7687_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1735_c6_ba48_return_output,
 t8_MUX_uxn_opcodes_h_l1735_c2_1820_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1735_c2_1820_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1735_c2_1820_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1735_c2_1820_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1735_c2_1820_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c2_1820_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1735_c2_1820_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1735_c2_1820_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c2_1820_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1735_c2_1820_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1735_c2_1820_return_output,
 n16_low_MUX_uxn_opcodes_h_l1735_c2_1820_return_output,
 n16_high_MUX_uxn_opcodes_h_l1735_c2_1820_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1748_c11_43d4_return_output,
 t8_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output,
 n16_low_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output,
 n16_high_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1751_c11_10bb_return_output,
 t8_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output,
 n16_low_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output,
 n16_high_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1755_c11_520f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_3023_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1755_c7_3023_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1755_c7_3023_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1755_c7_3023_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_3023_return_output,
 n16_low_MUX_uxn_opcodes_h_l1755_c7_3023_return_output,
 n16_high_MUX_uxn_opcodes_h_l1755_c7_3023_return_output,
 sp_relative_shift_uxn_opcodes_h_l1757_c30_e523_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1762_c11_513d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3daf_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1762_c7_3daf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c7_3daf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1762_c7_3daf_return_output,
 n16_low_MUX_uxn_opcodes_h_l1762_c7_3daf_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1765_c22_1d4b_return_output,
 BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1759_l1765_DUPLICATE_7687_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c6_ba48_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c6_ba48_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c6_ba48_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1735_c2_1820_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1735_c2_1820_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1735_c2_1820_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1735_c2_1820_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1735_c2_1820_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1735_c2_1820_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1735_c2_1820_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1735_c2_1820_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1735_c2_1820_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1735_c2_1820_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1735_c2_1820_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1735_c2_1820_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1745_c3_0a70 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c2_1820_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c2_1820_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1735_c2_1820_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1735_c2_1820_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1735_c2_1820_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1735_c2_1820_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1740_c3_751f : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c2_1820_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c2_1820_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1735_c2_1820_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1735_c2_1820_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1735_c2_1820_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1735_c2_1820_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1735_c2_1820_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1735_c2_1820_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1735_c2_1820_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1735_c2_1820_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1735_c2_1820_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1735_c2_1820_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_43d4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_43d4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_43d4_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1749_c3_4763 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1751_c11_10bb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1751_c11_10bb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1751_c11_10bb_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_3023_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1753_c3_09dc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1751_c7_9ae8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1755_c7_3023_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1755_c7_3023_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1755_c7_3023_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_3023_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1755_c7_3023_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1755_c7_3023_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1755_c11_520f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1755_c11_520f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1755_c11_520f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_3023_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_3023_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3daf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_3023_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1755_c7_3023_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1755_c7_3023_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1762_c7_3daf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1755_c7_3023_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1755_c7_3023_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1755_c7_3023_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1755_c7_3023_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1755_c7_3023_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1759_c3_3384 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1755_c7_3023_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1762_c7_3daf_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1755_c7_3023_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_3023_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_3023_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c7_3daf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_3023_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1755_c7_3023_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1755_c7_3023_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1762_c7_3daf_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1755_c7_3023_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1755_c7_3023_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1755_c7_3023_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1755_c7_3023_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1757_c30_e523_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1757_c30_e523_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1757_c30_e523_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1757_c30_e523_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c11_513d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c11_513d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c11_513d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3daf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3daf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3daf_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1762_c7_3daf_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1765_c3_b84e : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1762_c7_3daf_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1762_c7_3daf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c7_3daf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1764_c3_6a4d : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c7_3daf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c7_3daf_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1762_c7_3daf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1762_c7_3daf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1762_c7_3daf_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1762_c7_3daf_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1762_c7_3daf_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1762_c7_3daf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1765_c22_1d4b_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1765_c22_1d4b_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1765_c22_1d4b_return_output : signed(18 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1751_l1735_l1748_l1762_DUPLICATE_2517_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1751_l1735_l1748_l1762_DUPLICATE_ee31_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1751_l1755_l1748_l1762_DUPLICATE_59b6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1751_l1755_l1748_DUPLICATE_bc51_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1751_l1748_l1762_DUPLICATE_d215_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1765_l1759_DUPLICATE_110a_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1759_l1765_DUPLICATE_7687_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1759_l1765_DUPLICATE_7687_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1759_l1765_DUPLICATE_7687_return_output : signed(17 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l1770_l1731_DUPLICATE_6adc_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l1757_c30_e523_y := resize(to_signed(-3, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1745_c3_0a70 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1745_c3_0a70;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c6_ba48_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1764_c3_6a4d := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c7_3daf_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1764_c3_6a4d;
     VAR_sp_relative_shift_uxn_opcodes_h_l1757_c30_e523_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1753_c3_09dc := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1753_c3_09dc;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1755_c7_3023_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1740_c3_751f := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1740_c3_751f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1751_c11_10bb_right := to_unsigned(2, 2);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1755_c11_520f_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c11_513d_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_43d4_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3daf_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1765_c22_1d4b_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1749_c3_4763 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1749_c3_4763;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1757_c30_e523_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1755_c7_3023_iffalse := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1755_c7_3023_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1762_c7_3daf_iffalse := n16_low;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1759_l1765_DUPLICATE_7687_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c6_ba48_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_43d4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1751_c11_10bb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1755_c11_520f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c11_513d_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l1755_c7_3023_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l1762_c7_3daf_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1755_c7_3023_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1762_c7_3daf_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse := t8;
     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1735_c2_1820] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1735_c2_1820_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1735_c6_ba48] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1735_c6_ba48_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c6_ba48_left;
     BIN_OP_EQ_uxn_opcodes_h_l1735_c6_ba48_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c6_ba48_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c6_ba48_return_output := BIN_OP_EQ_uxn_opcodes_h_l1735_c6_ba48_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1751_c7_9ae8] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1751_c7_9ae8_return_output := result.stack_address_sp_offset;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1735_c2_1820] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1735_c2_1820_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1751_l1755_l1748_l1762_DUPLICATE_59b6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1751_l1755_l1748_l1762_DUPLICATE_59b6_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1755_c11_520f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1755_c11_520f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1755_c11_520f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1755_c11_520f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1755_c11_520f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1755_c11_520f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1755_c11_520f_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1751_l1735_l1748_l1762_DUPLICATE_ee31 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1751_l1735_l1748_l1762_DUPLICATE_ee31_return_output := result.u16_value;

     -- sp_relative_shift[uxn_opcodes_h_l1757_c30_e523] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1757_c30_e523_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1757_c30_e523_ins;
     sp_relative_shift_uxn_opcodes_h_l1757_c30_e523_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1757_c30_e523_x;
     sp_relative_shift_uxn_opcodes_h_l1757_c30_e523_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1757_c30_e523_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1757_c30_e523_return_output := sp_relative_shift_uxn_opcodes_h_l1757_c30_e523_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1751_l1755_l1748_DUPLICATE_bc51 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1751_l1755_l1748_DUPLICATE_bc51_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1751_c11_10bb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1751_c11_10bb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1751_c11_10bb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1751_c11_10bb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1751_c11_10bb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1751_c11_10bb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1751_c11_10bb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1748_c11_43d4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1748_c11_43d4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_43d4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1748_c11_43d4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_43d4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_43d4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1748_c11_43d4_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1735_c2_1820] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1735_c2_1820_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1751_l1748_l1762_DUPLICATE_d215 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1751_l1748_l1762_DUPLICATE_d215_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1762_c11_513d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1762_c11_513d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c11_513d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1762_c11_513d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c11_513d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c11_513d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1762_c11_513d_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1751_l1735_l1748_l1762_DUPLICATE_2517 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1751_l1735_l1748_l1762_DUPLICATE_2517_return_output := result.u8_value;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l1735_c2_1820] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1735_c2_1820_return_output := result.is_stack_write;

     -- CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1765_l1759_DUPLICATE_110a LATENCY=0
     VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1765_l1759_DUPLICATE_110a_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l1735_c2_1820_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c6_ba48_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1735_c2_1820_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c6_ba48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1735_c2_1820_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c6_ba48_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1735_c2_1820_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c6_ba48_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1735_c2_1820_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c6_ba48_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1735_c2_1820_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c6_ba48_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1735_c2_1820_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c6_ba48_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1735_c2_1820_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c6_ba48_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c2_1820_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c6_ba48_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c2_1820_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c6_ba48_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1735_c2_1820_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c6_ba48_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1735_c2_1820_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c6_ba48_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1735_c2_1820_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c6_ba48_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_43d4_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_43d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_43d4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_43d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_43d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_43d4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_43d4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_43d4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_43d4_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1751_c11_10bb_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1751_c11_10bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1751_c11_10bb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1751_c11_10bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1751_c11_10bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1751_c11_10bb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1751_c11_10bb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1751_c11_10bb_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1751_c11_10bb_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1755_c7_3023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1755_c11_520f_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1755_c7_3023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1755_c11_520f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_3023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1755_c11_520f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1755_c7_3023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1755_c11_520f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_3023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1755_c11_520f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1755_c7_3023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1755_c11_520f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1755_c7_3023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1755_c11_520f_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1762_c7_3daf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c11_513d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3daf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c11_513d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c7_3daf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c11_513d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1762_c7_3daf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c11_513d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1762_c7_3daf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c11_513d_return_output;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1759_l1765_DUPLICATE_7687_right := VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1765_l1759_DUPLICATE_110a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1751_l1748_l1762_DUPLICATE_d215_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1751_l1748_l1762_DUPLICATE_d215_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c7_3daf_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1751_l1748_l1762_DUPLICATE_d215_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1751_l1735_l1748_l1762_DUPLICATE_ee31_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1751_l1735_l1748_l1762_DUPLICATE_ee31_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1751_l1735_l1748_l1762_DUPLICATE_ee31_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1762_c7_3daf_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1751_l1735_l1748_l1762_DUPLICATE_ee31_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1751_l1755_l1748_l1762_DUPLICATE_59b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1751_l1755_l1748_l1762_DUPLICATE_59b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_3023_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1751_l1755_l1748_l1762_DUPLICATE_59b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3daf_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1751_l1755_l1748_l1762_DUPLICATE_59b6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1751_l1755_l1748_DUPLICATE_bc51_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1751_l1755_l1748_DUPLICATE_bc51_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1755_c7_3023_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1751_l1755_l1748_DUPLICATE_bc51_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1751_l1735_l1748_l1762_DUPLICATE_2517_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1751_l1735_l1748_l1762_DUPLICATE_2517_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1751_l1735_l1748_l1762_DUPLICATE_2517_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1762_c7_3daf_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1751_l1735_l1748_l1762_DUPLICATE_2517_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1735_c2_1820_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1735_c2_1820_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1735_c2_1820_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1735_c2_1820_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1751_c7_9ae8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_3023_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1757_c30_e523_return_output;
     -- n16_high_MUX[uxn_opcodes_h_l1755_c7_3023] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1755_c7_3023_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1755_c7_3023_cond;
     n16_high_MUX_uxn_opcodes_h_l1755_c7_3023_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1755_c7_3023_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1755_c7_3023_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1755_c7_3023_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1755_c7_3023_return_output := n16_high_MUX_uxn_opcodes_h_l1755_c7_3023_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1735_c2_1820] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1735_c2_1820_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1735_c2_1820_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1735_c2_1820_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1735_c2_1820_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1735_c2_1820] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1735_c2_1820_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1735_c2_1820_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1735_c2_1820_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1735_c2_1820_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1762_c7_3daf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1762_c7_3daf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1762_c7_3daf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1762_c7_3daf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1762_c7_3daf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1762_c7_3daf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1762_c7_3daf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1762_c7_3daf_return_output := result_u8_value_MUX_uxn_opcodes_h_l1762_c7_3daf_return_output;

     -- t8_MUX[uxn_opcodes_h_l1751_c7_9ae8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond <= VAR_t8_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond;
     t8_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue;
     t8_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output := t8_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1762_c7_3daf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3daf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3daf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3daf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3daf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3daf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3daf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3daf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3daf_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1755_c7_3023] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1755_c7_3023_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1755_c7_3023_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1755_c7_3023_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1755_c7_3023_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1755_c7_3023_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1755_c7_3023_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1755_c7_3023_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1755_c7_3023_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1762_c7_3daf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c7_3daf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c7_3daf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c7_3daf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c7_3daf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c7_3daf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c7_3daf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c7_3daf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c7_3daf_return_output;

     -- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1759_l1765_DUPLICATE_7687 LATENCY=0
     -- Inputs
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1759_l1765_DUPLICATE_7687_left <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1759_l1765_DUPLICATE_7687_left;
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1759_l1765_DUPLICATE_7687_right <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1759_l1765_DUPLICATE_7687_right;
     -- Outputs
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1759_l1765_DUPLICATE_7687_return_output := BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1759_l1765_DUPLICATE_7687_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1735_c2_1820] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1735_c2_1820_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1735_c2_1820_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1735_c2_1820_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1735_c2_1820_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1751_c7_9ae8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1762_c7_3daf] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1762_c7_3daf_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1762_c7_3daf_cond;
     n16_low_MUX_uxn_opcodes_h_l1762_c7_3daf_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1762_c7_3daf_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1762_c7_3daf_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1762_c7_3daf_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1762_c7_3daf_return_output := n16_low_MUX_uxn_opcodes_h_l1762_c7_3daf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1735_c2_1820] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1735_c2_1820_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1735_c2_1820_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1735_c2_1820_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1735_c2_1820_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1765_c22_1d4b_left := VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1759_l1765_DUPLICATE_7687_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1759_c3_3384 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1759_l1765_DUPLICATE_7687_return_output)),16);
     VAR_n16_high_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1755_c7_3023_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1755_c7_3023_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1762_c7_3daf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_3023_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3daf_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1755_c7_3023_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_3023_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1762_c7_3daf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1755_c7_3023_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1762_c7_3daf_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1755_c7_3023_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1759_c3_3384;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1748_c7_f5bc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1751_c7_9ae8] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond;
     n16_high_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output := n16_high_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1755_c7_3023] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_3023_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_3023_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_3023_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_3023_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_3023_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_3023_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_3023_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_3023_return_output;

     -- t8_MUX[uxn_opcodes_h_l1748_c7_f5bc] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond <= VAR_t8_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond;
     t8_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue;
     t8_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output := t8_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1755_c7_3023] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_3023_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_3023_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_3023_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_3023_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_3023_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_3023_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_3023_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_3023_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1755_c7_3023] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1755_c7_3023_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1755_c7_3023_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1755_c7_3023_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1755_c7_3023_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1755_c7_3023_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1755_c7_3023_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1755_c7_3023_return_output := result_u8_value_MUX_uxn_opcodes_h_l1755_c7_3023_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1751_c7_9ae8] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1755_c7_3023] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1755_c7_3023_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1755_c7_3023_cond;
     n16_low_MUX_uxn_opcodes_h_l1755_c7_3023_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1755_c7_3023_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1755_c7_3023_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1755_c7_3023_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1755_c7_3023_return_output := n16_low_MUX_uxn_opcodes_h_l1755_c7_3023_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1765_c22_1d4b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1765_c22_1d4b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1765_c22_1d4b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1765_c22_1d4b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1765_c22_1d4b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1765_c22_1d4b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1765_c22_1d4b_return_output;

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1765_c3_b84e := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1765_c22_1d4b_return_output)),16);
     VAR_n16_high_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1755_c7_3023_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_3023_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1755_c7_3023_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1755_c7_3023_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1762_c7_3daf_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1765_c3_b84e;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1735_c2_1820] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c2_1820_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c2_1820_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c2_1820_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c2_1820_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1751_c7_9ae8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output;

     -- t8_MUX[uxn_opcodes_h_l1735_c2_1820] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1735_c2_1820_cond <= VAR_t8_MUX_uxn_opcodes_h_l1735_c2_1820_cond;
     t8_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue;
     t8_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1735_c2_1820_return_output := t8_MUX_uxn_opcodes_h_l1735_c2_1820_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1762_c7_3daf] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1762_c7_3daf_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1762_c7_3daf_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1762_c7_3daf_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1762_c7_3daf_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1762_c7_3daf_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1762_c7_3daf_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1762_c7_3daf_return_output := result_u16_value_MUX_uxn_opcodes_h_l1762_c7_3daf_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1751_c7_9ae8] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond;
     n16_low_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output := n16_low_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1748_c7_f5bc] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond;
     n16_high_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output := n16_high_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1751_c7_9ae8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1748_c7_f5bc] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1751_c7_9ae8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1755_c7_3023_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1762_c7_3daf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1735_c2_1820_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1735_c2_1820] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1735_c2_1820_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1735_c2_1820_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1735_c2_1820_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1735_c2_1820_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1735_c2_1820] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1735_c2_1820_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1735_c2_1820_cond;
     n16_high_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1735_c2_1820_return_output := n16_high_MUX_uxn_opcodes_h_l1735_c2_1820_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1748_c7_f5bc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1748_c7_f5bc] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond;
     n16_low_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output := n16_low_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1748_c7_f5bc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1755_c7_3023] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1755_c7_3023_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1755_c7_3023_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1755_c7_3023_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1755_c7_3023_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1755_c7_3023_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1755_c7_3023_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1755_c7_3023_return_output := result_u16_value_MUX_uxn_opcodes_h_l1755_c7_3023_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1748_c7_f5bc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output := result_u8_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output;

     -- Submodule level 5
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l1735_c2_1820_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1755_c7_3023_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1735_c2_1820] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1735_c2_1820_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1735_c2_1820_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1735_c2_1820_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1735_c2_1820_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1735_c2_1820] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1735_c2_1820_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1735_c2_1820_cond;
     n16_low_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1735_c2_1820_return_output := n16_low_MUX_uxn_opcodes_h_l1735_c2_1820_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1735_c2_1820] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1735_c2_1820_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1735_c2_1820_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1735_c2_1820_return_output := result_u8_value_MUX_uxn_opcodes_h_l1735_c2_1820_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1751_c7_9ae8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output := result_u16_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1735_c2_1820] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c2_1820_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c2_1820_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c2_1820_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c2_1820_return_output;

     -- Submodule level 6
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l1735_c2_1820_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1751_c7_9ae8_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1748_c7_f5bc] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output := result_u16_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1748_c7_f5bc_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1735_c2_1820] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1735_c2_1820_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1735_c2_1820_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1735_c2_1820_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1735_c2_1820_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1735_c2_1820_return_output := result_u16_value_MUX_uxn_opcodes_h_l1735_c2_1820_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l1770_l1731_DUPLICATE_6adc LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l1770_l1731_DUPLICATE_6adc_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_9f32(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1735_c2_1820_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1735_c2_1820_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1735_c2_1820_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1735_c2_1820_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c2_1820_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1735_c2_1820_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1735_c2_1820_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c2_1820_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1735_c2_1820_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1735_c2_1820_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l1770_l1731_DUPLICATE_6adc_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l1770_l1731_DUPLICATE_6adc_return_output;
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
