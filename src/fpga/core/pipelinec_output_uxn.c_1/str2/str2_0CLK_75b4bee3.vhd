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
-- BIN_OP_EQ[uxn_opcodes_h_l1717_c6_e898]
signal BIN_OP_EQ_uxn_opcodes_h_l1717_c6_e898_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1717_c6_e898_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1717_c6_e898_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1717_c2_f827]
signal n16_low_MUX_uxn_opcodes_h_l1717_c2_f827_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1717_c2_f827_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1717_c2_f827]
signal n16_high_MUX_uxn_opcodes_h_l1717_c2_f827_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1717_c2_f827_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1717_c2_f827]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_f827_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_f827_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1717_c2_f827]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_f827_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_f827_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1717_c2_f827]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_f827_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_f827_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1717_c2_f827]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_f827_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_f827_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1717_c2_f827]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_f827_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_f827_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1717_c2_f827]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_f827_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_f827_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1717_c2_f827]
signal result_u16_value_MUX_uxn_opcodes_h_l1717_c2_f827_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1717_c2_f827_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1717_c2_f827]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_f827_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_f827_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1717_c2_f827]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_f827_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_f827_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1717_c2_f827]
signal result_u8_value_MUX_uxn_opcodes_h_l1717_c2_f827_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1717_c2_f827_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1717_c2_f827]
signal t8_MUX_uxn_opcodes_h_l1717_c2_f827_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1717_c2_f827_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1730_c11_a6a9]
signal BIN_OP_EQ_uxn_opcodes_h_l1730_c11_a6a9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1730_c11_a6a9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1730_c11_a6a9_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1730_c7_c894]
signal n16_low_MUX_uxn_opcodes_h_l1730_c7_c894_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1730_c7_c894_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1730_c7_c894]
signal n16_high_MUX_uxn_opcodes_h_l1730_c7_c894_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1730_c7_c894_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1730_c7_c894]
signal result_u16_value_MUX_uxn_opcodes_h_l1730_c7_c894_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1730_c7_c894_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1730_c7_c894]
signal result_u8_value_MUX_uxn_opcodes_h_l1730_c7_c894_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1730_c7_c894_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1730_c7_c894]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_c894_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_c894_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1730_c7_c894]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_c894_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_c894_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1730_c7_c894]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_c894_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_c894_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1730_c7_c894]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_c894_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_c894_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1730_c7_c894]
signal t8_MUX_uxn_opcodes_h_l1730_c7_c894_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1730_c7_c894_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1733_c11_2f28]
signal BIN_OP_EQ_uxn_opcodes_h_l1733_c11_2f28_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1733_c11_2f28_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1733_c11_2f28_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1733_c7_8324]
signal n16_low_MUX_uxn_opcodes_h_l1733_c7_8324_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1733_c7_8324_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1733_c7_8324]
signal n16_high_MUX_uxn_opcodes_h_l1733_c7_8324_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1733_c7_8324_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1733_c7_8324]
signal result_u16_value_MUX_uxn_opcodes_h_l1733_c7_8324_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1733_c7_8324_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1733_c7_8324]
signal result_u8_value_MUX_uxn_opcodes_h_l1733_c7_8324_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1733_c7_8324_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1733_c7_8324]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_8324_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_8324_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1733_c7_8324]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_8324_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_8324_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1733_c7_8324]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_8324_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_8324_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1733_c7_8324]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_8324_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_8324_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1733_c7_8324]
signal t8_MUX_uxn_opcodes_h_l1733_c7_8324_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1733_c7_8324_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1737_c11_bd95]
signal BIN_OP_EQ_uxn_opcodes_h_l1737_c11_bd95_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1737_c11_bd95_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1737_c11_bd95_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1737_c7_2eda]
signal n16_low_MUX_uxn_opcodes_h_l1737_c7_2eda_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1737_c7_2eda_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1737_c7_2eda_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1737_c7_2eda_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1737_c7_2eda]
signal n16_high_MUX_uxn_opcodes_h_l1737_c7_2eda_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1737_c7_2eda_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1737_c7_2eda_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1737_c7_2eda_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1737_c7_2eda]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_2eda_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_2eda_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_2eda_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_2eda_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1737_c7_2eda]
signal result_u16_value_MUX_uxn_opcodes_h_l1737_c7_2eda_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1737_c7_2eda_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1737_c7_2eda_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1737_c7_2eda_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1737_c7_2eda]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_2eda_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_2eda_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_2eda_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_2eda_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1737_c7_2eda]
signal result_u8_value_MUX_uxn_opcodes_h_l1737_c7_2eda_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1737_c7_2eda_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1737_c7_2eda_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1737_c7_2eda_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1737_c7_2eda]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_2eda_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_2eda_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_2eda_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_2eda_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1739_c30_5ee3]
signal sp_relative_shift_uxn_opcodes_h_l1739_c30_5ee3_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1739_c30_5ee3_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1739_c30_5ee3_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1739_c30_5ee3_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1744_c11_e9ad]
signal BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e9ad_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e9ad_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e9ad_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1744_c7_976e]
signal n16_low_MUX_uxn_opcodes_h_l1744_c7_976e_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1744_c7_976e_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1744_c7_976e_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1744_c7_976e_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1744_c7_976e]
signal result_u16_value_MUX_uxn_opcodes_h_l1744_c7_976e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1744_c7_976e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1744_c7_976e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1744_c7_976e_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1744_c7_976e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_976e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_976e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_976e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_976e_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1744_c7_976e]
signal result_u8_value_MUX_uxn_opcodes_h_l1744_c7_976e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1744_c7_976e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1744_c7_976e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1744_c7_976e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1744_c7_976e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_976e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_976e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_976e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_976e_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1747_c22_d8fc]
signal BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_d8fc_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_d8fc_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_d8fc_return_output : signed(18 downto 0);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_ce44
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_ce44_left : signed(16 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_ce44_right : signed(7 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_ce44_return_output : signed(17 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_d736( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
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
      base.sp_relative_shift := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.u16_value := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.is_vram_write := ref_toks_9;
      base.u8_value := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1717_c6_e898
BIN_OP_EQ_uxn_opcodes_h_l1717_c6_e898 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1717_c6_e898_left,
BIN_OP_EQ_uxn_opcodes_h_l1717_c6_e898_right,
BIN_OP_EQ_uxn_opcodes_h_l1717_c6_e898_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1717_c2_f827
n16_low_MUX_uxn_opcodes_h_l1717_c2_f827 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1717_c2_f827_cond,
n16_low_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue,
n16_low_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse,
n16_low_MUX_uxn_opcodes_h_l1717_c2_f827_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1717_c2_f827
n16_high_MUX_uxn_opcodes_h_l1717_c2_f827 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1717_c2_f827_cond,
n16_high_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue,
n16_high_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse,
n16_high_MUX_uxn_opcodes_h_l1717_c2_f827_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_f827
result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_f827 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_f827_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_f827_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_f827
result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_f827 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_f827_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_f827_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_f827
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_f827 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_f827_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_f827_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_f827
result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_f827 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_f827_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_f827_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_f827
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_f827 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_f827_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_f827_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_f827
result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_f827 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_f827_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_f827_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1717_c2_f827
result_u16_value_MUX_uxn_opcodes_h_l1717_c2_f827 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1717_c2_f827_cond,
result_u16_value_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1717_c2_f827_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_f827
result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_f827 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_f827_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_f827_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_f827
result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_f827 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_f827_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_f827_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1717_c2_f827
result_u8_value_MUX_uxn_opcodes_h_l1717_c2_f827 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1717_c2_f827_cond,
result_u8_value_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1717_c2_f827_return_output);

-- t8_MUX_uxn_opcodes_h_l1717_c2_f827
t8_MUX_uxn_opcodes_h_l1717_c2_f827 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1717_c2_f827_cond,
t8_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue,
t8_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse,
t8_MUX_uxn_opcodes_h_l1717_c2_f827_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1730_c11_a6a9
BIN_OP_EQ_uxn_opcodes_h_l1730_c11_a6a9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1730_c11_a6a9_left,
BIN_OP_EQ_uxn_opcodes_h_l1730_c11_a6a9_right,
BIN_OP_EQ_uxn_opcodes_h_l1730_c11_a6a9_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1730_c7_c894
n16_low_MUX_uxn_opcodes_h_l1730_c7_c894 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1730_c7_c894_cond,
n16_low_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue,
n16_low_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse,
n16_low_MUX_uxn_opcodes_h_l1730_c7_c894_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1730_c7_c894
n16_high_MUX_uxn_opcodes_h_l1730_c7_c894 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1730_c7_c894_cond,
n16_high_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue,
n16_high_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse,
n16_high_MUX_uxn_opcodes_h_l1730_c7_c894_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1730_c7_c894
result_u16_value_MUX_uxn_opcodes_h_l1730_c7_c894 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1730_c7_c894_cond,
result_u16_value_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1730_c7_c894_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1730_c7_c894
result_u8_value_MUX_uxn_opcodes_h_l1730_c7_c894 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1730_c7_c894_cond,
result_u8_value_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1730_c7_c894_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_c894
result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_c894 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_c894_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_c894_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_c894
result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_c894 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_c894_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_c894_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_c894
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_c894 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_c894_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_c894_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_c894
result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_c894 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_c894_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_c894_return_output);

-- t8_MUX_uxn_opcodes_h_l1730_c7_c894
t8_MUX_uxn_opcodes_h_l1730_c7_c894 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1730_c7_c894_cond,
t8_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue,
t8_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse,
t8_MUX_uxn_opcodes_h_l1730_c7_c894_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1733_c11_2f28
BIN_OP_EQ_uxn_opcodes_h_l1733_c11_2f28 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1733_c11_2f28_left,
BIN_OP_EQ_uxn_opcodes_h_l1733_c11_2f28_right,
BIN_OP_EQ_uxn_opcodes_h_l1733_c11_2f28_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1733_c7_8324
n16_low_MUX_uxn_opcodes_h_l1733_c7_8324 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1733_c7_8324_cond,
n16_low_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue,
n16_low_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse,
n16_low_MUX_uxn_opcodes_h_l1733_c7_8324_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1733_c7_8324
n16_high_MUX_uxn_opcodes_h_l1733_c7_8324 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1733_c7_8324_cond,
n16_high_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue,
n16_high_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse,
n16_high_MUX_uxn_opcodes_h_l1733_c7_8324_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1733_c7_8324
result_u16_value_MUX_uxn_opcodes_h_l1733_c7_8324 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1733_c7_8324_cond,
result_u16_value_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1733_c7_8324_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1733_c7_8324
result_u8_value_MUX_uxn_opcodes_h_l1733_c7_8324 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1733_c7_8324_cond,
result_u8_value_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1733_c7_8324_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_8324
result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_8324 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_8324_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_8324_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_8324
result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_8324 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_8324_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_8324_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_8324
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_8324 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_8324_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_8324_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_8324
result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_8324 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_8324_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_8324_return_output);

-- t8_MUX_uxn_opcodes_h_l1733_c7_8324
t8_MUX_uxn_opcodes_h_l1733_c7_8324 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1733_c7_8324_cond,
t8_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue,
t8_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse,
t8_MUX_uxn_opcodes_h_l1733_c7_8324_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1737_c11_bd95
BIN_OP_EQ_uxn_opcodes_h_l1737_c11_bd95 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1737_c11_bd95_left,
BIN_OP_EQ_uxn_opcodes_h_l1737_c11_bd95_right,
BIN_OP_EQ_uxn_opcodes_h_l1737_c11_bd95_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1737_c7_2eda
n16_low_MUX_uxn_opcodes_h_l1737_c7_2eda : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1737_c7_2eda_cond,
n16_low_MUX_uxn_opcodes_h_l1737_c7_2eda_iftrue,
n16_low_MUX_uxn_opcodes_h_l1737_c7_2eda_iffalse,
n16_low_MUX_uxn_opcodes_h_l1737_c7_2eda_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1737_c7_2eda
n16_high_MUX_uxn_opcodes_h_l1737_c7_2eda : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1737_c7_2eda_cond,
n16_high_MUX_uxn_opcodes_h_l1737_c7_2eda_iftrue,
n16_high_MUX_uxn_opcodes_h_l1737_c7_2eda_iffalse,
n16_high_MUX_uxn_opcodes_h_l1737_c7_2eda_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_2eda
result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_2eda : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_2eda_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_2eda_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_2eda_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_2eda_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1737_c7_2eda
result_u16_value_MUX_uxn_opcodes_h_l1737_c7_2eda : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1737_c7_2eda_cond,
result_u16_value_MUX_uxn_opcodes_h_l1737_c7_2eda_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1737_c7_2eda_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1737_c7_2eda_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_2eda
result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_2eda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_2eda_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_2eda_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_2eda_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_2eda_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1737_c7_2eda
result_u8_value_MUX_uxn_opcodes_h_l1737_c7_2eda : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1737_c7_2eda_cond,
result_u8_value_MUX_uxn_opcodes_h_l1737_c7_2eda_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1737_c7_2eda_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1737_c7_2eda_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_2eda
result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_2eda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_2eda_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_2eda_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_2eda_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_2eda_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1739_c30_5ee3
sp_relative_shift_uxn_opcodes_h_l1739_c30_5ee3 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1739_c30_5ee3_ins,
sp_relative_shift_uxn_opcodes_h_l1739_c30_5ee3_x,
sp_relative_shift_uxn_opcodes_h_l1739_c30_5ee3_y,
sp_relative_shift_uxn_opcodes_h_l1739_c30_5ee3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e9ad
BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e9ad : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e9ad_left,
BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e9ad_right,
BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e9ad_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1744_c7_976e
n16_low_MUX_uxn_opcodes_h_l1744_c7_976e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1744_c7_976e_cond,
n16_low_MUX_uxn_opcodes_h_l1744_c7_976e_iftrue,
n16_low_MUX_uxn_opcodes_h_l1744_c7_976e_iffalse,
n16_low_MUX_uxn_opcodes_h_l1744_c7_976e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1744_c7_976e
result_u16_value_MUX_uxn_opcodes_h_l1744_c7_976e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1744_c7_976e_cond,
result_u16_value_MUX_uxn_opcodes_h_l1744_c7_976e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1744_c7_976e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1744_c7_976e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_976e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_976e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_976e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_976e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_976e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_976e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1744_c7_976e
result_u8_value_MUX_uxn_opcodes_h_l1744_c7_976e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1744_c7_976e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1744_c7_976e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1744_c7_976e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1744_c7_976e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_976e
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_976e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_976e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_976e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_976e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_976e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_d8fc
BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_d8fc : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_d8fc_left,
BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_d8fc_right,
BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_d8fc_return_output);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_ce44
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_ce44 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_ce44_left,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_ce44_right,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_ce44_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1717_c6_e898_return_output,
 n16_low_MUX_uxn_opcodes_h_l1717_c2_f827_return_output,
 n16_high_MUX_uxn_opcodes_h_l1717_c2_f827_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_f827_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_f827_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_f827_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_f827_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_f827_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_f827_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1717_c2_f827_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_f827_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_f827_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1717_c2_f827_return_output,
 t8_MUX_uxn_opcodes_h_l1717_c2_f827_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1730_c11_a6a9_return_output,
 n16_low_MUX_uxn_opcodes_h_l1730_c7_c894_return_output,
 n16_high_MUX_uxn_opcodes_h_l1730_c7_c894_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1730_c7_c894_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1730_c7_c894_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_c894_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_c894_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_c894_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_c894_return_output,
 t8_MUX_uxn_opcodes_h_l1730_c7_c894_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1733_c11_2f28_return_output,
 n16_low_MUX_uxn_opcodes_h_l1733_c7_8324_return_output,
 n16_high_MUX_uxn_opcodes_h_l1733_c7_8324_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1733_c7_8324_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1733_c7_8324_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_8324_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_8324_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_8324_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_8324_return_output,
 t8_MUX_uxn_opcodes_h_l1733_c7_8324_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1737_c11_bd95_return_output,
 n16_low_MUX_uxn_opcodes_h_l1737_c7_2eda_return_output,
 n16_high_MUX_uxn_opcodes_h_l1737_c7_2eda_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_2eda_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1737_c7_2eda_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_2eda_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1737_c7_2eda_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_2eda_return_output,
 sp_relative_shift_uxn_opcodes_h_l1739_c30_5ee3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e9ad_return_output,
 n16_low_MUX_uxn_opcodes_h_l1744_c7_976e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1744_c7_976e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_976e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1744_c7_976e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_976e_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_d8fc_return_output,
 BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_ce44_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_e898_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_e898_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_e898_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1730_c7_c894_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1717_c2_f827_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1717_c2_f827_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1730_c7_c894_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1717_c2_f827_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1717_c2_f827_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1722_c3_8f11 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_c894_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_f827_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_f827_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1717_c2_f827_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_f827_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_f827_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1717_c2_f827_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_f827_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_f827_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1717_c2_f827_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_f827_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_f827_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1727_c3_1b8f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_c894_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_f827_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_f827_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_c894_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_f827_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_f827_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1730_c7_c894_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c2_f827_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c2_f827_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_c894_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_f827_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_f827_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1717_c2_f827_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_f827_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_f827_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1730_c7_c894_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c2_f827_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c2_f827_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1730_c7_c894_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1717_c2_f827_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1717_c2_f827_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_a6a9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_a6a9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_a6a9_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1733_c7_8324_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1730_c7_c894_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1733_c7_8324_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1730_c7_c894_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1733_c7_8324_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1730_c7_c894_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1733_c7_8324_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1730_c7_c894_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_8324_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_c894_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_8324_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_c894_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1731_c3_18ac : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_8324_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_c894_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_8324_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_c894_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1733_c7_8324_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1730_c7_c894_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_2f28_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_2f28_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_2f28_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1737_c7_2eda_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1733_c7_8324_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1737_c7_2eda_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1733_c7_8324_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_2eda_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1733_c7_8324_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_2eda_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1733_c7_8324_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_2eda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_8324_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_2eda_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_8324_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1735_c3_3cbb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1733_c7_8324_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_8324_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_2eda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_8324_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1733_c7_8324_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_bd95_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_bd95_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_bd95_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1737_c7_2eda_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1737_c7_2eda_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1744_c7_976e_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1737_c7_2eda_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1737_c7_2eda_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1737_c7_2eda_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1737_c7_2eda_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_2eda_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_2eda_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_976e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_2eda_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_2eda_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1741_c3_6995 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_2eda_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_976e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_2eda_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_2eda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_2eda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_2eda_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_2eda_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_2eda_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_976e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_2eda_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_2eda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_2eda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_976e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_2eda_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1739_c30_5ee3_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1739_c30_5ee3_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1739_c30_5ee3_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1739_c30_5ee3_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e9ad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e9ad_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e9ad_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1744_c7_976e_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1744_c7_976e_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1744_c7_976e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_976e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1747_c3_b772 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_976e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_976e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_976e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1746_c3_beaf : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_976e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_976e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_976e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_976e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_976e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_976e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_976e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_976e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_d8fc_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_d8fc_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_d8fc_return_output : signed(18 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1717_DUPLICATE_d6e1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1717_DUPLICATE_56e7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1730_l1733_l1737_DUPLICATE_dac1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1730_l1744_l1733_DUPLICATE_d4ae_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1737_DUPLICATE_9f45_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_c677_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_ce44_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_ce44_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_ce44_return_output : signed(17 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d736_uxn_opcodes_h_l1713_l1752_DUPLICATE_caf7_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1731_c3_18ac := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1731_c3_18ac;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_976e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_2f28_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1722_c3_8f11 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1722_c3_8f11;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1746_c3_beaf := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_976e_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1746_c3_beaf;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_d8fc_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1727_c3_1b8f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1727_c3_1b8f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e9ad_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1739_c30_5ee3_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_bd95_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1739_c30_5ee3_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_a6a9_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1735_c3_3cbb := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1735_c3_3cbb;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_2eda_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_e898_right := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1739_c30_5ee3_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1737_c7_2eda_iffalse := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1737_c7_2eda_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1744_c7_976e_iffalse := n16_low;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_ce44_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_e898_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_a6a9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_2f28_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_bd95_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e9ad_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l1737_c7_2eda_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l1744_c7_976e_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_2eda_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_976e_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse := t8;
     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1717_c2_f827] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1717_c2_f827_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1744_c11_e9ad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e9ad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e9ad_left;
     BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e9ad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e9ad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e9ad_return_output := BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e9ad_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1730_l1733_l1737_DUPLICATE_dac1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1730_l1733_l1737_DUPLICATE_dac1_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1737_DUPLICATE_9f45 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1737_DUPLICATE_9f45_return_output := result.is_opc_done;

     -- CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_c677 LATENCY=0
     VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_c677_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1717_c2_f827] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1717_c2_f827_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1737_c11_bd95] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1737_c11_bd95_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_bd95_left;
     BIN_OP_EQ_uxn_opcodes_h_l1737_c11_bd95_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_bd95_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_bd95_return_output := BIN_OP_EQ_uxn_opcodes_h_l1737_c11_bd95_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1717_c2_f827] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1717_c2_f827_return_output := result.is_pc_updated;

     -- sp_relative_shift[uxn_opcodes_h_l1739_c30_5ee3] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1739_c30_5ee3_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1739_c30_5ee3_ins;
     sp_relative_shift_uxn_opcodes_h_l1739_c30_5ee3_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1739_c30_5ee3_x;
     sp_relative_shift_uxn_opcodes_h_l1739_c30_5ee3_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1739_c30_5ee3_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1739_c30_5ee3_return_output := sp_relative_shift_uxn_opcodes_h_l1739_c30_5ee3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1730_c11_a6a9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1730_c11_a6a9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_a6a9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1730_c11_a6a9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_a6a9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_a6a9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1730_c11_a6a9_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l1717_c2_f827] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1717_c2_f827_return_output := result.is_stack_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1730_l1744_l1733_DUPLICATE_d4ae LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1730_l1744_l1733_DUPLICATE_d4ae_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1717_DUPLICATE_d6e1 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1717_DUPLICATE_d6e1_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1733_c11_2f28] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1733_c11_2f28_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_2f28_left;
     BIN_OP_EQ_uxn_opcodes_h_l1733_c11_2f28_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_2f28_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_2f28_return_output := BIN_OP_EQ_uxn_opcodes_h_l1733_c11_2f28_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1717_c6_e898] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1717_c6_e898_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_e898_left;
     BIN_OP_EQ_uxn_opcodes_h_l1717_c6_e898_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_e898_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_e898_return_output := BIN_OP_EQ_uxn_opcodes_h_l1717_c6_e898_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1717_DUPLICATE_56e7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1717_DUPLICATE_56e7_return_output := result.u8_value;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1733_c7_8324] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1733_c7_8324_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l1717_c2_f827_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_e898_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1717_c2_f827_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_e898_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_f827_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_e898_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_f827_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_e898_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_f827_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_e898_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_f827_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_e898_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_f827_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_e898_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_f827_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_e898_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_f827_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_e898_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_f827_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_e898_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c2_f827_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_e898_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c2_f827_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_e898_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1717_c2_f827_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_e898_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1730_c7_c894_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_a6a9_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1730_c7_c894_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_a6a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_c894_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_a6a9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_c894_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_a6a9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_c894_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_a6a9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_c894_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_a6a9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1730_c7_c894_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_a6a9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1730_c7_c894_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_a6a9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1730_c7_c894_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_a6a9_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1733_c7_8324_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_2f28_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1733_c7_8324_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_2f28_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_8324_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_2f28_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_8324_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_2f28_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_8324_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_2f28_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_8324_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_2f28_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1733_c7_8324_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_2f28_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1733_c7_8324_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_2f28_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1733_c7_8324_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_2f28_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1737_c7_2eda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_bd95_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1737_c7_2eda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_bd95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_2eda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_bd95_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_2eda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_bd95_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_2eda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_bd95_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_2eda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_bd95_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_2eda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_bd95_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1744_c7_976e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e9ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_976e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e9ad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_976e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e9ad_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_976e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e9ad_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_976e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e9ad_return_output;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_ce44_right := VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_c677_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1730_l1744_l1733_DUPLICATE_d4ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1730_l1744_l1733_DUPLICATE_d4ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_976e_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1730_l1744_l1733_DUPLICATE_d4ae_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1717_DUPLICATE_d6e1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1717_DUPLICATE_d6e1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1717_DUPLICATE_d6e1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_976e_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1717_DUPLICATE_d6e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1737_DUPLICATE_9f45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1737_DUPLICATE_9f45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_2eda_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1737_DUPLICATE_9f45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_976e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1737_DUPLICATE_9f45_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1730_l1733_l1737_DUPLICATE_dac1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1730_l1733_l1737_DUPLICATE_dac1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_2eda_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1730_l1733_l1737_DUPLICATE_dac1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1717_DUPLICATE_56e7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1717_DUPLICATE_56e7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1717_DUPLICATE_56e7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_976e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1717_DUPLICATE_56e7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1717_c2_f827_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1717_c2_f827_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1717_c2_f827_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1717_c2_f827_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1733_c7_8324_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_2eda_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1739_c30_5ee3_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1737_c7_2eda] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_2eda_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_2eda_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_2eda_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_2eda_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_2eda_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_2eda_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_2eda_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_2eda_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1733_c7_8324] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_8324_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_8324_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_8324_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_8324_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1744_c7_976e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1744_c7_976e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_976e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1744_c7_976e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_976e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1744_c7_976e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_976e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_976e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1744_c7_976e_return_output;

     -- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_ce44 LATENCY=0
     -- Inputs
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_ce44_left <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_ce44_left;
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_ce44_right <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_ce44_right;
     -- Outputs
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_ce44_return_output := BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_ce44_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1737_c7_2eda] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1737_c7_2eda_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1737_c7_2eda_cond;
     n16_high_MUX_uxn_opcodes_h_l1737_c7_2eda_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1737_c7_2eda_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1737_c7_2eda_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1737_c7_2eda_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1737_c7_2eda_return_output := n16_high_MUX_uxn_opcodes_h_l1737_c7_2eda_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1744_c7_976e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_976e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_976e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_976e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_976e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_976e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_976e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_976e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_976e_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1744_c7_976e] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1744_c7_976e_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1744_c7_976e_cond;
     n16_low_MUX_uxn_opcodes_h_l1744_c7_976e_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1744_c7_976e_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1744_c7_976e_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1744_c7_976e_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1744_c7_976e_return_output := n16_low_MUX_uxn_opcodes_h_l1744_c7_976e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1717_c2_f827] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_f827_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_f827_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_f827_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_f827_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1717_c2_f827] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_f827_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_f827_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_f827_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_f827_return_output;

     -- t8_MUX[uxn_opcodes_h_l1733_c7_8324] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1733_c7_8324_cond <= VAR_t8_MUX_uxn_opcodes_h_l1733_c7_8324_cond;
     t8_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue;
     t8_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1733_c7_8324_return_output := t8_MUX_uxn_opcodes_h_l1733_c7_8324_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1717_c2_f827] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_f827_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_f827_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_f827_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_f827_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1744_c7_976e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_976e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_976e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_976e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_976e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_976e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_976e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_976e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_976e_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1717_c2_f827] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_f827_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_f827_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_f827_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_f827_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_d8fc_left := VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_ce44_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1741_c3_6995 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_ce44_return_output)),16);
     VAR_n16_high_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1737_c7_2eda_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1737_c7_2eda_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1744_c7_976e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_2eda_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_976e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_2eda_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_2eda_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_976e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_8324_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_2eda_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_976e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1733_c7_8324_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_2eda_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1741_c3_6995;
     -- t8_MUX[uxn_opcodes_h_l1730_c7_c894] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1730_c7_c894_cond <= VAR_t8_MUX_uxn_opcodes_h_l1730_c7_c894_cond;
     t8_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue;
     t8_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1730_c7_c894_return_output := t8_MUX_uxn_opcodes_h_l1730_c7_c894_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1730_c7_c894] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_c894_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_c894_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_c894_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_c894_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1737_c7_2eda] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_2eda_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_2eda_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_2eda_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_2eda_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_2eda_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_2eda_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_2eda_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_2eda_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1733_c7_8324] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1733_c7_8324_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1733_c7_8324_cond;
     n16_high_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1733_c7_8324_return_output := n16_high_MUX_uxn_opcodes_h_l1733_c7_8324_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1747_c22_d8fc] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_d8fc_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_d8fc_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_d8fc_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_d8fc_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_d8fc_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_d8fc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1737_c7_2eda] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_2eda_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_2eda_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_2eda_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_2eda_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_2eda_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_2eda_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_2eda_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_2eda_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1737_c7_2eda] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1737_c7_2eda_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_2eda_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1737_c7_2eda_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_2eda_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1737_c7_2eda_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_2eda_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_2eda_return_output := result_u8_value_MUX_uxn_opcodes_h_l1737_c7_2eda_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1733_c7_8324] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_8324_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_8324_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_8324_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_8324_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1737_c7_2eda] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1737_c7_2eda_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1737_c7_2eda_cond;
     n16_low_MUX_uxn_opcodes_h_l1737_c7_2eda_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1737_c7_2eda_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1737_c7_2eda_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1737_c7_2eda_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1737_c7_2eda_return_output := n16_low_MUX_uxn_opcodes_h_l1737_c7_2eda_return_output;

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1747_c3_b772 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_d8fc_return_output)),16);
     VAR_n16_high_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1733_c7_8324_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1737_c7_2eda_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_2eda_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_8324_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_2eda_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_c894_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_2eda_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1730_c7_c894_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_976e_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1747_c3_b772;
     -- t8_MUX[uxn_opcodes_h_l1717_c2_f827] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1717_c2_f827_cond <= VAR_t8_MUX_uxn_opcodes_h_l1717_c2_f827_cond;
     t8_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue;
     t8_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1717_c2_f827_return_output := t8_MUX_uxn_opcodes_h_l1717_c2_f827_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1730_c7_c894] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1730_c7_c894_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1730_c7_c894_cond;
     n16_high_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1730_c7_c894_return_output := n16_high_MUX_uxn_opcodes_h_l1730_c7_c894_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1717_c2_f827] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_f827_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_f827_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_f827_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_f827_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1744_c7_976e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1744_c7_976e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_976e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1744_c7_976e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_976e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1744_c7_976e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_976e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_976e_return_output := result_u16_value_MUX_uxn_opcodes_h_l1744_c7_976e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1730_c7_c894] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_c894_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_c894_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_c894_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_c894_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1733_c7_8324] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1733_c7_8324_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1733_c7_8324_cond;
     n16_low_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1733_c7_8324_return_output := n16_low_MUX_uxn_opcodes_h_l1733_c7_8324_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1733_c7_8324] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1733_c7_8324_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1733_c7_8324_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1733_c7_8324_return_output := result_u8_value_MUX_uxn_opcodes_h_l1733_c7_8324_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1733_c7_8324] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_8324_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_8324_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_8324_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_8324_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1733_c7_8324] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_8324_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_8324_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_8324_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_8324_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1730_c7_c894_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1733_c7_8324_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_8324_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_c894_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_8324_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_2eda_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_976e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1733_c7_8324_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1717_c2_f827_return_output;
     -- n16_high_MUX[uxn_opcodes_h_l1717_c2_f827] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1717_c2_f827_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1717_c2_f827_cond;
     n16_high_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1717_c2_f827_return_output := n16_high_MUX_uxn_opcodes_h_l1717_c2_f827_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1730_c7_c894] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_c894_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_c894_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_c894_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_c894_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1717_c2_f827] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_f827_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_f827_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_f827_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_f827_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1730_c7_c894] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1730_c7_c894_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1730_c7_c894_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1730_c7_c894_return_output := result_u8_value_MUX_uxn_opcodes_h_l1730_c7_c894_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1730_c7_c894] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1730_c7_c894_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1730_c7_c894_cond;
     n16_low_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1730_c7_c894_return_output := n16_low_MUX_uxn_opcodes_h_l1730_c7_c894_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1730_c7_c894] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_c894_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_c894_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_c894_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_c894_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1737_c7_2eda] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1737_c7_2eda_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_2eda_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1737_c7_2eda_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_2eda_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1737_c7_2eda_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_2eda_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_2eda_return_output := result_u16_value_MUX_uxn_opcodes_h_l1737_c7_2eda_return_output;

     -- Submodule level 5
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l1717_c2_f827_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1730_c7_c894_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_c894_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_c894_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_2eda_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1730_c7_c894_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1733_c7_8324] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1733_c7_8324_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1733_c7_8324_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1733_c7_8324_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1733_c7_8324_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1733_c7_8324_return_output := result_u16_value_MUX_uxn_opcodes_h_l1733_c7_8324_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1717_c2_f827] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1717_c2_f827_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1717_c2_f827_cond;
     n16_low_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1717_c2_f827_return_output := n16_low_MUX_uxn_opcodes_h_l1717_c2_f827_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1717_c2_f827] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1717_c2_f827_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c2_f827_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c2_f827_return_output := result_u8_value_MUX_uxn_opcodes_h_l1717_c2_f827_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1717_c2_f827] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_f827_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_f827_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_f827_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_f827_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1717_c2_f827] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_f827_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_f827_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_f827_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_f827_return_output;

     -- Submodule level 6
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l1717_c2_f827_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1733_c7_8324_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1730_c7_c894] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1730_c7_c894_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1730_c7_c894_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1730_c7_c894_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1730_c7_c894_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1730_c7_c894_return_output := result_u16_value_MUX_uxn_opcodes_h_l1730_c7_c894_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1730_c7_c894_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1717_c2_f827] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1717_c2_f827_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c2_f827_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c2_f827_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c2_f827_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c2_f827_return_output := result_u16_value_MUX_uxn_opcodes_h_l1717_c2_f827_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d736_uxn_opcodes_h_l1713_l1752_DUPLICATE_caf7 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d736_uxn_opcodes_h_l1713_l1752_DUPLICATE_caf7_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d736(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_f827_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_f827_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_f827_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_f827_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_f827_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_f827_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c2_f827_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_f827_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_f827_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c2_f827_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d736_uxn_opcodes_h_l1713_l1752_DUPLICATE_caf7_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d736_uxn_opcodes_h_l1713_l1752_DUPLICATE_caf7_return_output;
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
