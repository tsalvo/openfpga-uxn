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
-- Submodules: 52
entity str2_0CLK_de602816 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end str2_0CLK_de602816;
architecture arch of str2_0CLK_de602816 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1722_c6_42d7]
signal BIN_OP_EQ_uxn_opcodes_h_l1722_c6_42d7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1722_c6_42d7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1722_c6_42d7_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1722_c2_9f92]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1722_c2_9f92]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_9f92_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1722_c2_9f92]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_9f92_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1722_c2_9f92]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_9f92_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1722_c2_9f92]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1722_c2_9f92_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1722_c2_9f92]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1722_c2_9f92]
signal result_u8_value_MUX_uxn_opcodes_h_l1722_c2_9f92_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1722_c2_9f92]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1722_c2_9f92_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1722_c2_9f92]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1722_c2_9f92_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1722_c2_9f92]
signal result_u16_value_MUX_uxn_opcodes_h_l1722_c2_9f92_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1722_c2_9f92]
signal t8_MUX_uxn_opcodes_h_l1722_c2_9f92_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1722_c2_9f92]
signal n16_high_MUX_uxn_opcodes_h_l1722_c2_9f92_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1722_c2_9f92]
signal n16_low_MUX_uxn_opcodes_h_l1722_c2_9f92_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1735_c11_6040]
signal BIN_OP_EQ_uxn_opcodes_h_l1735_c11_6040_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1735_c11_6040_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1735_c11_6040_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1735_c7_e06e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_e06e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1735_c7_e06e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_e06e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1735_c7_e06e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_e06e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1735_c7_e06e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_e06e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1735_c7_e06e]
signal result_u8_value_MUX_uxn_opcodes_h_l1735_c7_e06e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1735_c7_e06e]
signal result_u16_value_MUX_uxn_opcodes_h_l1735_c7_e06e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1735_c7_e06e]
signal t8_MUX_uxn_opcodes_h_l1735_c7_e06e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1735_c7_e06e]
signal n16_high_MUX_uxn_opcodes_h_l1735_c7_e06e_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1735_c7_e06e]
signal n16_low_MUX_uxn_opcodes_h_l1735_c7_e06e_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1738_c11_e77b]
signal BIN_OP_EQ_uxn_opcodes_h_l1738_c11_e77b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1738_c11_e77b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1738_c11_e77b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1738_c7_5cee]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_5cee_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1738_c7_5cee]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5cee_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1738_c7_5cee]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5cee_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1738_c7_5cee]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5cee_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1738_c7_5cee]
signal result_u8_value_MUX_uxn_opcodes_h_l1738_c7_5cee_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1738_c7_5cee]
signal result_u16_value_MUX_uxn_opcodes_h_l1738_c7_5cee_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1738_c7_5cee]
signal t8_MUX_uxn_opcodes_h_l1738_c7_5cee_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1738_c7_5cee]
signal n16_high_MUX_uxn_opcodes_h_l1738_c7_5cee_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1738_c7_5cee]
signal n16_low_MUX_uxn_opcodes_h_l1738_c7_5cee_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1742_c11_263f]
signal BIN_OP_EQ_uxn_opcodes_h_l1742_c11_263f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1742_c11_263f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1742_c11_263f_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1742_c7_f526]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1742_c7_f526_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1742_c7_f526_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1742_c7_f526_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1742_c7_f526_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1742_c7_f526]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1742_c7_f526_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1742_c7_f526_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1742_c7_f526_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1742_c7_f526_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1742_c7_f526]
signal result_u8_value_MUX_uxn_opcodes_h_l1742_c7_f526_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1742_c7_f526_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1742_c7_f526_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1742_c7_f526_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1742_c7_f526]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f526_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f526_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f526_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f526_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1742_c7_f526]
signal result_u16_value_MUX_uxn_opcodes_h_l1742_c7_f526_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1742_c7_f526_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1742_c7_f526_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1742_c7_f526_return_output : unsigned(15 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1742_c7_f526]
signal n16_high_MUX_uxn_opcodes_h_l1742_c7_f526_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1742_c7_f526_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1742_c7_f526_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1742_c7_f526_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1742_c7_f526]
signal n16_low_MUX_uxn_opcodes_h_l1742_c7_f526_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1742_c7_f526_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1742_c7_f526_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1742_c7_f526_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1744_c30_c349]
signal sp_relative_shift_uxn_opcodes_h_l1744_c30_c349_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1744_c30_c349_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1744_c30_c349_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1744_c30_c349_return_output : signed(3 downto 0);

-- u16_add_u8_as_i8[uxn_opcodes_h_l1746_c22_8fca]
signal u16_add_u8_as_i8_uxn_opcodes_h_l1746_c22_8fca_u16 : unsigned(15 downto 0);
signal u16_add_u8_as_i8_uxn_opcodes_h_l1746_c22_8fca_u8 : unsigned(7 downto 0);
signal u16_add_u8_as_i8_uxn_opcodes_h_l1746_c22_8fca_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1749_c11_f36e]
signal BIN_OP_EQ_uxn_opcodes_h_l1749_c11_f36e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1749_c11_f36e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1749_c11_f36e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1749_c7_9e93]
signal result_u8_value_MUX_uxn_opcodes_h_l1749_c7_9e93_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1749_c7_9e93_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1749_c7_9e93_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1749_c7_9e93_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1749_c7_9e93]
signal result_u16_value_MUX_uxn_opcodes_h_l1749_c7_9e93_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1749_c7_9e93_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1749_c7_9e93_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1749_c7_9e93_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1749_c7_9e93]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1749_c7_9e93_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1749_c7_9e93_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1749_c7_9e93_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1749_c7_9e93_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1749_c7_9e93]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_9e93_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_9e93_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_9e93_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_9e93_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1749_c7_9e93]
signal n16_low_MUX_uxn_opcodes_h_l1749_c7_9e93_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1749_c7_9e93_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1749_c7_9e93_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1749_c7_9e93_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1752_c3_1d90]
signal BIN_OP_PLUS_uxn_opcodes_h_l1752_c3_1d90_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1752_c3_1d90_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1752_c3_1d90_return_output : unsigned(16 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_dd3d( ref_toks_0 : opcode_result_t;
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
      base.is_vram_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_ram_write := ref_toks_6;
      base.u8_value := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_stack_index_flipped := ref_toks_9;
      base.u16_value := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1722_c6_42d7
BIN_OP_EQ_uxn_opcodes_h_l1722_c6_42d7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1722_c6_42d7_left,
BIN_OP_EQ_uxn_opcodes_h_l1722_c6_42d7_right,
BIN_OP_EQ_uxn_opcodes_h_l1722_c6_42d7_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1722_c2_9f92
result_is_vram_write_MUX_uxn_opcodes_h_l1722_c2_9f92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_9f92
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_9f92 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_9f92_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_9f92
result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_9f92 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_9f92_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_9f92
result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_9f92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_9f92_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1722_c2_9f92
result_is_stack_write_MUX_uxn_opcodes_h_l1722_c2_9f92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1722_c2_9f92_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_9f92
result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_9f92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1722_c2_9f92
result_u8_value_MUX_uxn_opcodes_h_l1722_c2_9f92 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1722_c2_9f92_cond,
result_u8_value_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1722_c2_9f92
result_is_pc_updated_MUX_uxn_opcodes_h_l1722_c2_9f92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1722_c2_9f92_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1722_c2_9f92
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1722_c2_9f92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1722_c2_9f92_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1722_c2_9f92
result_u16_value_MUX_uxn_opcodes_h_l1722_c2_9f92 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1722_c2_9f92_cond,
result_u16_value_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output);

-- t8_MUX_uxn_opcodes_h_l1722_c2_9f92
t8_MUX_uxn_opcodes_h_l1722_c2_9f92 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1722_c2_9f92_cond,
t8_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue,
t8_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse,
t8_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1722_c2_9f92
n16_high_MUX_uxn_opcodes_h_l1722_c2_9f92 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1722_c2_9f92_cond,
n16_high_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue,
n16_high_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse,
n16_high_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1722_c2_9f92
n16_low_MUX_uxn_opcodes_h_l1722_c2_9f92 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1722_c2_9f92_cond,
n16_low_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue,
n16_low_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse,
n16_low_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1735_c11_6040
BIN_OP_EQ_uxn_opcodes_h_l1735_c11_6040 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1735_c11_6040_left,
BIN_OP_EQ_uxn_opcodes_h_l1735_c11_6040_right,
BIN_OP_EQ_uxn_opcodes_h_l1735_c11_6040_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_e06e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_e06e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_e06e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_e06e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_e06e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_e06e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_e06e
result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_e06e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_e06e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_e06e
result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_e06e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_e06e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1735_c7_e06e
result_u8_value_MUX_uxn_opcodes_h_l1735_c7_e06e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1735_c7_e06e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1735_c7_e06e
result_u16_value_MUX_uxn_opcodes_h_l1735_c7_e06e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1735_c7_e06e_cond,
result_u16_value_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output);

-- t8_MUX_uxn_opcodes_h_l1735_c7_e06e
t8_MUX_uxn_opcodes_h_l1735_c7_e06e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1735_c7_e06e_cond,
t8_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue,
t8_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse,
t8_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1735_c7_e06e
n16_high_MUX_uxn_opcodes_h_l1735_c7_e06e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1735_c7_e06e_cond,
n16_high_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue,
n16_high_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse,
n16_high_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1735_c7_e06e
n16_low_MUX_uxn_opcodes_h_l1735_c7_e06e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1735_c7_e06e_cond,
n16_low_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue,
n16_low_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse,
n16_low_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1738_c11_e77b
BIN_OP_EQ_uxn_opcodes_h_l1738_c11_e77b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1738_c11_e77b_left,
BIN_OP_EQ_uxn_opcodes_h_l1738_c11_e77b_right,
BIN_OP_EQ_uxn_opcodes_h_l1738_c11_e77b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_5cee
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_5cee : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_5cee_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5cee
result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5cee : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5cee_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5cee
result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5cee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5cee_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5cee
result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5cee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5cee_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1738_c7_5cee
result_u8_value_MUX_uxn_opcodes_h_l1738_c7_5cee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1738_c7_5cee_cond,
result_u8_value_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1738_c7_5cee
result_u16_value_MUX_uxn_opcodes_h_l1738_c7_5cee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1738_c7_5cee_cond,
result_u16_value_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output);

-- t8_MUX_uxn_opcodes_h_l1738_c7_5cee
t8_MUX_uxn_opcodes_h_l1738_c7_5cee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1738_c7_5cee_cond,
t8_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue,
t8_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse,
t8_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1738_c7_5cee
n16_high_MUX_uxn_opcodes_h_l1738_c7_5cee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1738_c7_5cee_cond,
n16_high_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue,
n16_high_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse,
n16_high_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1738_c7_5cee
n16_low_MUX_uxn_opcodes_h_l1738_c7_5cee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1738_c7_5cee_cond,
n16_low_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue,
n16_low_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse,
n16_low_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1742_c11_263f
BIN_OP_EQ_uxn_opcodes_h_l1742_c11_263f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1742_c11_263f_left,
BIN_OP_EQ_uxn_opcodes_h_l1742_c11_263f_right,
BIN_OP_EQ_uxn_opcodes_h_l1742_c11_263f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1742_c7_f526
result_is_ram_write_MUX_uxn_opcodes_h_l1742_c7_f526 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1742_c7_f526_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1742_c7_f526_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1742_c7_f526_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1742_c7_f526_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1742_c7_f526
result_sp_relative_shift_MUX_uxn_opcodes_h_l1742_c7_f526 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1742_c7_f526_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1742_c7_f526_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1742_c7_f526_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1742_c7_f526_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1742_c7_f526
result_u8_value_MUX_uxn_opcodes_h_l1742_c7_f526 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1742_c7_f526_cond,
result_u8_value_MUX_uxn_opcodes_h_l1742_c7_f526_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1742_c7_f526_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1742_c7_f526_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f526
result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f526 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f526_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f526_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f526_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f526_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1742_c7_f526
result_u16_value_MUX_uxn_opcodes_h_l1742_c7_f526 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1742_c7_f526_cond,
result_u16_value_MUX_uxn_opcodes_h_l1742_c7_f526_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1742_c7_f526_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1742_c7_f526_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1742_c7_f526
n16_high_MUX_uxn_opcodes_h_l1742_c7_f526 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1742_c7_f526_cond,
n16_high_MUX_uxn_opcodes_h_l1742_c7_f526_iftrue,
n16_high_MUX_uxn_opcodes_h_l1742_c7_f526_iffalse,
n16_high_MUX_uxn_opcodes_h_l1742_c7_f526_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1742_c7_f526
n16_low_MUX_uxn_opcodes_h_l1742_c7_f526 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1742_c7_f526_cond,
n16_low_MUX_uxn_opcodes_h_l1742_c7_f526_iftrue,
n16_low_MUX_uxn_opcodes_h_l1742_c7_f526_iffalse,
n16_low_MUX_uxn_opcodes_h_l1742_c7_f526_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1744_c30_c349
sp_relative_shift_uxn_opcodes_h_l1744_c30_c349 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1744_c30_c349_ins,
sp_relative_shift_uxn_opcodes_h_l1744_c30_c349_x,
sp_relative_shift_uxn_opcodes_h_l1744_c30_c349_y,
sp_relative_shift_uxn_opcodes_h_l1744_c30_c349_return_output);

-- u16_add_u8_as_i8_uxn_opcodes_h_l1746_c22_8fca
u16_add_u8_as_i8_uxn_opcodes_h_l1746_c22_8fca : entity work.u16_add_u8_as_i8_0CLK_e595f783 port map (
u16_add_u8_as_i8_uxn_opcodes_h_l1746_c22_8fca_u16,
u16_add_u8_as_i8_uxn_opcodes_h_l1746_c22_8fca_u8,
u16_add_u8_as_i8_uxn_opcodes_h_l1746_c22_8fca_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1749_c11_f36e
BIN_OP_EQ_uxn_opcodes_h_l1749_c11_f36e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1749_c11_f36e_left,
BIN_OP_EQ_uxn_opcodes_h_l1749_c11_f36e_right,
BIN_OP_EQ_uxn_opcodes_h_l1749_c11_f36e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1749_c7_9e93
result_u8_value_MUX_uxn_opcodes_h_l1749_c7_9e93 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1749_c7_9e93_cond,
result_u8_value_MUX_uxn_opcodes_h_l1749_c7_9e93_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1749_c7_9e93_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1749_c7_9e93_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1749_c7_9e93
result_u16_value_MUX_uxn_opcodes_h_l1749_c7_9e93 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1749_c7_9e93_cond,
result_u16_value_MUX_uxn_opcodes_h_l1749_c7_9e93_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1749_c7_9e93_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1749_c7_9e93_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1749_c7_9e93
result_sp_relative_shift_MUX_uxn_opcodes_h_l1749_c7_9e93 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1749_c7_9e93_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1749_c7_9e93_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1749_c7_9e93_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1749_c7_9e93_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_9e93
result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_9e93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_9e93_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_9e93_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_9e93_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_9e93_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1749_c7_9e93
n16_low_MUX_uxn_opcodes_h_l1749_c7_9e93 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1749_c7_9e93_cond,
n16_low_MUX_uxn_opcodes_h_l1749_c7_9e93_iftrue,
n16_low_MUX_uxn_opcodes_h_l1749_c7_9e93_iffalse,
n16_low_MUX_uxn_opcodes_h_l1749_c7_9e93_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1752_c3_1d90
BIN_OP_PLUS_uxn_opcodes_h_l1752_c3_1d90 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1752_c3_1d90_left,
BIN_OP_PLUS_uxn_opcodes_h_l1752_c3_1d90_right,
BIN_OP_PLUS_uxn_opcodes_h_l1752_c3_1d90_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1722_c6_42d7_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output,
 t8_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output,
 n16_high_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output,
 n16_low_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1735_c11_6040_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output,
 t8_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output,
 n16_high_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output,
 n16_low_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1738_c11_e77b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output,
 t8_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output,
 n16_high_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output,
 n16_low_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1742_c11_263f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1742_c7_f526_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1742_c7_f526_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1742_c7_f526_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f526_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1742_c7_f526_return_output,
 n16_high_MUX_uxn_opcodes_h_l1742_c7_f526_return_output,
 n16_low_MUX_uxn_opcodes_h_l1742_c7_f526_return_output,
 sp_relative_shift_uxn_opcodes_h_l1744_c30_c349_return_output,
 u16_add_u8_as_i8_uxn_opcodes_h_l1746_c22_8fca_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1749_c11_f36e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1749_c7_9e93_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1749_c7_9e93_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1749_c7_9e93_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_9e93_return_output,
 n16_low_MUX_uxn_opcodes_h_l1749_c7_9e93_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1752_c3_1d90_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c6_42d7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c6_42d7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c6_42d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1722_c2_9f92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1732_c3_09c4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_9f92_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1727_c3_e970 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_9f92_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_9f92_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1722_c2_9f92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1722_c2_9f92_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1722_c2_9f92_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1722_c2_9f92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1722_c2_9f92_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1722_c2_9f92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1722_c2_9f92_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1722_c2_9f92_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1722_c2_9f92_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1722_c2_9f92_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1722_c2_9f92_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c11_6040_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c11_6040_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c11_6040_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1736_c3_0a93 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_e06e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_e06e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_e06e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_e06e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1735_c7_e06e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1735_c7_e06e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1735_c7_e06e_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1735_c7_e06e_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1735_c7_e06e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_e77b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_e77b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_e77b_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1740_c3_ed48 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1738_c7_5cee_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_5cee_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1742_c7_f526_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5cee_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f526_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5cee_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1742_c7_f526_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5cee_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1742_c7_f526_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_5cee_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1742_c7_f526_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_5cee_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1738_c7_5cee_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1742_c7_f526_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_5cee_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1742_c7_f526_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_5cee_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_263f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_263f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_263f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1742_c7_f526_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1742_c7_f526_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1742_c7_f526_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1742_c7_f526_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1742_c7_f526_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1749_c7_9e93_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1742_c7_f526_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1742_c7_f526_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1742_c7_f526_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1749_c7_9e93_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1742_c7_f526_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f526_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f526_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_9e93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f526_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1742_c7_f526_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1742_c7_f526_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1749_c7_9e93_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1742_c7_f526_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1742_c7_f526_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1742_c7_f526_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1742_c7_f526_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1742_c7_f526_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1742_c7_f526_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1749_c7_9e93_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1742_c7_f526_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1744_c30_c349_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1744_c30_c349_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1744_c30_c349_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1744_c30_c349_return_output : signed(3 downto 0);
 variable VAR_u16_add_u8_as_i8_uxn_opcodes_h_l1746_c22_8fca_u16 : unsigned(15 downto 0);
 variable VAR_u16_add_u8_as_i8_uxn_opcodes_h_l1746_c22_8fca_u8 : unsigned(7 downto 0);
 variable VAR_u16_add_u8_as_i8_uxn_opcodes_h_l1746_c22_8fca_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_f36e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_f36e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_f36e_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1749_c7_9e93_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1749_c7_9e93_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1749_c7_9e93_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1749_c7_9e93_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1752_c3_c62a : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1749_c7_9e93_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1749_c7_9e93_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1749_c7_9e93_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1751_c3_d8ce : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1749_c7_9e93_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1749_c7_9e93_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_9e93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_9e93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_9e93_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1749_c7_9e93_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1749_c7_9e93_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1749_c7_9e93_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1752_c3_1d90_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1752_c3_1d90_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1752_c3_1d90_return_output : unsigned(16 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1749_l1738_l1722_l1735_DUPLICATE_60cc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1749_l1752_l1738_l1735_l1722_DUPLICATE_68e5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1749_l1738_l1735_DUPLICATE_2589_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1749_l1738_l1742_l1735_DUPLICATE_70ce_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1738_l1742_l1735_DUPLICATE_fc48_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_dd3d_uxn_opcodes_h_l1718_l1757_DUPLICATE_1965_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1732_c3_09c4 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1732_c3_09c4;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1742_c7_f526_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_9e93_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1727_c3_e970 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1727_c3_e970;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1752_c3_1d90_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_263f_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1736_c3_0a93 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1736_c3_0a93;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_f36e_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_e77b_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c6_42d7_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1740_c3_ed48 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1740_c3_ed48;
     VAR_sp_relative_shift_uxn_opcodes_h_l1744_c30_c349_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1744_c30_c349_y := resize(to_signed(-3, 3), 4);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1751_c3_d8ce := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1749_c7_9e93_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1751_c3_d8ce;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c11_6040_right := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1744_c30_c349_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1742_c7_f526_iffalse := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1742_c7_f526_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1749_c7_9e93_iffalse := n16_low;
     VAR_u16_add_u8_as_i8_uxn_opcodes_h_l1746_c22_8fca_u16 := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c6_42d7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c11_6040_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_e77b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_263f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_f36e_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l1742_c7_f526_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l1749_c7_9e93_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1742_c7_f526_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1749_c7_9e93_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse := t8;
     VAR_u16_add_u8_as_i8_uxn_opcodes_h_l1746_c22_8fca_u8 := t8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1749_l1738_l1722_l1735_DUPLICATE_60cc LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1749_l1738_l1722_l1735_DUPLICATE_60cc_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1749_c11_f36e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1749_c11_f36e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_f36e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1749_c11_f36e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_f36e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_f36e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1749_c11_f36e_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1722_c2_9f92] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1722_c2_9f92_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1742_c11_263f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1742_c11_263f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_263f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1742_c11_263f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_263f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_263f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1742_c11_263f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1735_c11_6040] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1735_c11_6040_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c11_6040_left;
     BIN_OP_EQ_uxn_opcodes_h_l1735_c11_6040_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c11_6040_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c11_6040_return_output := BIN_OP_EQ_uxn_opcodes_h_l1735_c11_6040_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1722_c2_9f92] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1722_c2_9f92_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1749_l1738_l1742_l1735_DUPLICATE_70ce LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1749_l1738_l1742_l1735_DUPLICATE_70ce_return_output := result.is_opc_done;

     -- u16_add_u8_as_i8[uxn_opcodes_h_l1746_c22_8fca] LATENCY=0
     -- Inputs
     u16_add_u8_as_i8_uxn_opcodes_h_l1746_c22_8fca_u16 <= VAR_u16_add_u8_as_i8_uxn_opcodes_h_l1746_c22_8fca_u16;
     u16_add_u8_as_i8_uxn_opcodes_h_l1746_c22_8fca_u8 <= VAR_u16_add_u8_as_i8_uxn_opcodes_h_l1746_c22_8fca_u8;
     -- Outputs
     VAR_u16_add_u8_as_i8_uxn_opcodes_h_l1746_c22_8fca_return_output := u16_add_u8_as_i8_uxn_opcodes_h_l1746_c22_8fca_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1749_l1738_l1735_DUPLICATE_2589 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1749_l1738_l1735_DUPLICATE_2589_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1738_l1742_l1735_DUPLICATE_fc48 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1738_l1742_l1735_DUPLICATE_fc48_return_output := result.is_ram_write;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1738_c7_5cee] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1738_c7_5cee_return_output := result.stack_address_sp_offset;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1722_c2_9f92] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1722_c2_9f92_return_output := result.is_vram_write;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l1722_c2_9f92] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1722_c2_9f92_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1749_l1752_l1738_l1735_l1722_DUPLICATE_68e5 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1749_l1752_l1738_l1735_l1722_DUPLICATE_68e5_return_output := result.u16_value;

     -- sp_relative_shift[uxn_opcodes_h_l1744_c30_c349] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1744_c30_c349_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1744_c30_c349_ins;
     sp_relative_shift_uxn_opcodes_h_l1744_c30_c349_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1744_c30_c349_x;
     sp_relative_shift_uxn_opcodes_h_l1744_c30_c349_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1744_c30_c349_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1744_c30_c349_return_output := sp_relative_shift_uxn_opcodes_h_l1744_c30_c349_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1722_c6_42d7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1722_c6_42d7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c6_42d7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1722_c6_42d7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c6_42d7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c6_42d7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1722_c6_42d7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1738_c11_e77b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1738_c11_e77b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_e77b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1738_c11_e77b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_e77b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_e77b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1738_c11_e77b_return_output;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l1722_c2_9f92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c6_42d7_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1722_c2_9f92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c6_42d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_9f92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c6_42d7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1722_c2_9f92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c6_42d7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c6_42d7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1722_c2_9f92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c6_42d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1722_c2_9f92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c6_42d7_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c6_42d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_9f92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c6_42d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_9f92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c6_42d7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1722_c2_9f92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c6_42d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1722_c2_9f92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c6_42d7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1722_c2_9f92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c6_42d7_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1735_c7_e06e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c11_6040_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1735_c7_e06e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c11_6040_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_e06e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c11_6040_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_e06e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c11_6040_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_e06e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c11_6040_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_e06e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c11_6040_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1735_c7_e06e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c11_6040_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1735_c7_e06e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c11_6040_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1735_c7_e06e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1735_c11_6040_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_5cee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_e77b_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_5cee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_e77b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5cee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_e77b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5cee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_e77b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5cee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_e77b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_5cee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_e77b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_5cee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_e77b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_5cee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_e77b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1738_c7_5cee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_e77b_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1742_c7_f526_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_263f_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1742_c7_f526_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_263f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f526_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_263f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1742_c7_f526_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_263f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1742_c7_f526_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_263f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1742_c7_f526_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_263f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1742_c7_f526_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_263f_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1749_c7_9e93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_f36e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_9e93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_f36e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1749_c7_9e93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_f36e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1749_c7_9e93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_f36e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1749_c7_9e93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_f36e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1749_l1738_l1735_DUPLICATE_2589_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1749_l1738_l1735_DUPLICATE_2589_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1749_c7_9e93_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1749_l1738_l1735_DUPLICATE_2589_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1752_c3_1d90_left := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1749_l1752_l1738_l1735_l1722_DUPLICATE_68e5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1749_l1752_l1738_l1735_l1722_DUPLICATE_68e5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1749_l1752_l1738_l1735_l1722_DUPLICATE_68e5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1749_l1752_l1738_l1735_l1722_DUPLICATE_68e5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1749_c7_9e93_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1749_l1752_l1738_l1735_l1722_DUPLICATE_68e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1749_l1738_l1742_l1735_DUPLICATE_70ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1749_l1738_l1742_l1735_DUPLICATE_70ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f526_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1749_l1738_l1742_l1735_DUPLICATE_70ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_9e93_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1749_l1738_l1742_l1735_DUPLICATE_70ce_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1738_l1742_l1735_DUPLICATE_fc48_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1738_l1742_l1735_DUPLICATE_fc48_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1742_c7_f526_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1738_l1742_l1735_DUPLICATE_fc48_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1749_l1738_l1722_l1735_DUPLICATE_60cc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1749_l1738_l1722_l1735_DUPLICATE_60cc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1749_l1738_l1722_l1735_DUPLICATE_60cc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1749_c7_9e93_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1749_l1738_l1722_l1735_DUPLICATE_60cc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1722_c2_9f92_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1722_c2_9f92_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1722_c2_9f92_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1722_c2_9f92_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1738_c7_5cee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1742_c7_f526_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1744_c30_c349_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1742_c7_f526_iftrue := VAR_u16_add_u8_as_i8_uxn_opcodes_h_l1746_c22_8fca_return_output;
     -- n16_high_MUX[uxn_opcodes_h_l1742_c7_f526] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1742_c7_f526_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1742_c7_f526_cond;
     n16_high_MUX_uxn_opcodes_h_l1742_c7_f526_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1742_c7_f526_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1742_c7_f526_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1742_c7_f526_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1742_c7_f526_return_output := n16_high_MUX_uxn_opcodes_h_l1742_c7_f526_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1749_c7_9e93] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1749_c7_9e93_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1749_c7_9e93_cond;
     n16_low_MUX_uxn_opcodes_h_l1749_c7_9e93_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1749_c7_9e93_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1749_c7_9e93_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1749_c7_9e93_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1749_c7_9e93_return_output := n16_low_MUX_uxn_opcodes_h_l1749_c7_9e93_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1752_c3_1d90] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1752_c3_1d90_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1752_c3_1d90_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1752_c3_1d90_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1752_c3_1d90_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1752_c3_1d90_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1752_c3_1d90_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1738_c7_5cee] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_5cee_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_5cee_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1749_c7_9e93] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1749_c7_9e93_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1749_c7_9e93_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1749_c7_9e93_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1749_c7_9e93_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1749_c7_9e93_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1749_c7_9e93_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1749_c7_9e93_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1749_c7_9e93_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1722_c2_9f92] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1722_c2_9f92_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1722_c2_9f92_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1722_c2_9f92] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1722_c2_9f92_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1722_c2_9f92_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1749_c7_9e93] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_9e93_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_9e93_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_9e93_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_9e93_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_9e93_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_9e93_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_9e93_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_9e93_return_output;

     -- t8_MUX[uxn_opcodes_h_l1738_c7_5cee] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1738_c7_5cee_cond <= VAR_t8_MUX_uxn_opcodes_h_l1738_c7_5cee_cond;
     t8_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue;
     t8_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output := t8_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1722_c2_9f92] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1749_c7_9e93] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1749_c7_9e93_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1749_c7_9e93_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1749_c7_9e93_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1749_c7_9e93_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1749_c7_9e93_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1749_c7_9e93_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1749_c7_9e93_return_output := result_u8_value_MUX_uxn_opcodes_h_l1749_c7_9e93_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1742_c7_f526] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1742_c7_f526_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1742_c7_f526_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1742_c7_f526_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1742_c7_f526_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1742_c7_f526_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1742_c7_f526_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1742_c7_f526_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1742_c7_f526_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1722_c2_9f92] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1722_c2_9f92_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1722_c2_9f92_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l1752_c3_c62a := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1752_c3_1d90_return_output, 16);
     VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1742_c7_f526_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1742_c7_f526_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1749_c7_9e93_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f526_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_9e93_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1742_c7_f526_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1742_c7_f526_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1749_c7_9e93_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1742_c7_f526_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1749_c7_9e93_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1749_c7_9e93_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1752_c3_c62a;
     -- t8_MUX[uxn_opcodes_h_l1735_c7_e06e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1735_c7_e06e_cond <= VAR_t8_MUX_uxn_opcodes_h_l1735_c7_e06e_cond;
     t8_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue;
     t8_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output := t8_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1749_c7_9e93] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1749_c7_9e93_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1749_c7_9e93_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1749_c7_9e93_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1749_c7_9e93_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1749_c7_9e93_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1749_c7_9e93_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1749_c7_9e93_return_output := result_u16_value_MUX_uxn_opcodes_h_l1749_c7_9e93_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1742_c7_f526] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f526_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f526_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f526_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f526_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f526_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f526_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f526_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f526_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1738_c7_5cee] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5cee_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5cee_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1742_c7_f526] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1742_c7_f526_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1742_c7_f526_cond;
     n16_low_MUX_uxn_opcodes_h_l1742_c7_f526_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1742_c7_f526_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1742_c7_f526_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1742_c7_f526_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1742_c7_f526_return_output := n16_low_MUX_uxn_opcodes_h_l1742_c7_f526_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1735_c7_e06e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_e06e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_e06e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1738_c7_5cee] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1738_c7_5cee_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_5cee_cond;
     n16_high_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output := n16_high_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1742_c7_f526] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1742_c7_f526_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1742_c7_f526_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1742_c7_f526_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1742_c7_f526_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1742_c7_f526_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1742_c7_f526_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1742_c7_f526_return_output := result_u8_value_MUX_uxn_opcodes_h_l1742_c7_f526_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1742_c7_f526] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1742_c7_f526_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1742_c7_f526_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1742_c7_f526_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1742_c7_f526_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1742_c7_f526_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1742_c7_f526_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1742_c7_f526_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1742_c7_f526_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1742_c7_f526_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_f526_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1742_c7_f526_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1742_c7_f526_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1749_c7_9e93_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1742_c7_f526_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l1738_c7_5cee] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1738_c7_5cee_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_5cee_cond;
     n16_low_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output := n16_low_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1722_c2_9f92] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_9f92_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_9f92_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1742_c7_f526] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1742_c7_f526_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1742_c7_f526_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1742_c7_f526_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1742_c7_f526_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1742_c7_f526_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1742_c7_f526_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1742_c7_f526_return_output := result_u16_value_MUX_uxn_opcodes_h_l1742_c7_f526_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1738_c7_5cee] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5cee_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5cee_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1735_c7_e06e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_e06e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_e06e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1738_c7_5cee] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5cee_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5cee_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1735_c7_e06e] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1735_c7_e06e_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1735_c7_e06e_cond;
     n16_high_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output := n16_high_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output;

     -- t8_MUX[uxn_opcodes_h_l1722_c2_9f92] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1722_c2_9f92_cond <= VAR_t8_MUX_uxn_opcodes_h_l1722_c2_9f92_cond;
     t8_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue;
     t8_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output := t8_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1738_c7_5cee] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1738_c7_5cee_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_5cee_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output := result_u8_value_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1742_c7_f526_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l1735_c7_e06e] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1735_c7_e06e_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1735_c7_e06e_cond;
     n16_low_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output := n16_low_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1735_c7_e06e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1735_c7_e06e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1735_c7_e06e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1738_c7_5cee] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1738_c7_5cee_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_5cee_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_5cee_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_5cee_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output := result_u16_value_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1722_c2_9f92] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1735_c7_e06e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_e06e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_e06e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1735_c7_e06e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_e06e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_e06e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1722_c2_9f92] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1722_c2_9f92_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1722_c2_9f92_cond;
     n16_high_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output := n16_high_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output;

     -- Submodule level 5
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_5cee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1722_c2_9f92] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_9f92_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_9f92_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1722_c2_9f92] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1722_c2_9f92_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1722_c2_9f92_cond;
     n16_low_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output := n16_low_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1722_c2_9f92] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_9f92_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_9f92_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1735_c7_e06e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1735_c7_e06e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1735_c7_e06e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1735_c7_e06e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1735_c7_e06e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output := result_u16_value_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1722_c2_9f92] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1722_c2_9f92_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1722_c2_9f92_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output := result_u8_value_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output;

     -- Submodule level 6
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1735_c7_e06e_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1722_c2_9f92] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1722_c2_9f92_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1722_c2_9f92_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1722_c2_9f92_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1722_c2_9f92_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output := result_u16_value_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_dd3d_uxn_opcodes_h_l1718_l1757_DUPLICATE_1965 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_dd3d_uxn_opcodes_h_l1718_l1757_DUPLICATE_1965_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_dd3d(
     result,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1722_c2_9f92_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_dd3d_uxn_opcodes_h_l1718_l1757_DUPLICATE_1965_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_dd3d_uxn_opcodes_h_l1718_l1757_DUPLICATE_1965_return_output;
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
