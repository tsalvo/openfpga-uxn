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
-- BIN_OP_EQ[uxn_opcodes_h_l1717_c6_ac9e]
signal BIN_OP_EQ_uxn_opcodes_h_l1717_c6_ac9e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1717_c6_ac9e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1717_c6_ac9e_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1717_c2_7e57]
signal t8_MUX_uxn_opcodes_h_l1717_c2_7e57_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1717_c2_7e57]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_7e57_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1717_c2_7e57]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1717_c2_7e57]
signal result_u16_value_MUX_uxn_opcodes_h_l1717_c2_7e57_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1717_c2_7e57]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_7e57_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1717_c2_7e57]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_7e57_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1717_c2_7e57]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_7e57_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1717_c2_7e57]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_7e57_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1717_c2_7e57]
signal result_u8_value_MUX_uxn_opcodes_h_l1717_c2_7e57_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1717_c2_7e57]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_7e57_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1717_c2_7e57]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1717_c2_7e57]
signal n16_high_MUX_uxn_opcodes_h_l1717_c2_7e57_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1717_c2_7e57]
signal n16_low_MUX_uxn_opcodes_h_l1717_c2_7e57_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1730_c11_d29d]
signal BIN_OP_EQ_uxn_opcodes_h_l1730_c11_d29d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1730_c11_d29d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1730_c11_d29d_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1730_c7_3713]
signal t8_MUX_uxn_opcodes_h_l1730_c7_3713_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1730_c7_3713_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1730_c7_3713]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_3713_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_3713_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1730_c7_3713]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_3713_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_3713_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1730_c7_3713]
signal result_u16_value_MUX_uxn_opcodes_h_l1730_c7_3713_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1730_c7_3713_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1730_c7_3713]
signal result_u8_value_MUX_uxn_opcodes_h_l1730_c7_3713_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1730_c7_3713_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1730_c7_3713]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_3713_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_3713_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1730_c7_3713]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_3713_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_3713_return_output : unsigned(3 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1730_c7_3713]
signal n16_high_MUX_uxn_opcodes_h_l1730_c7_3713_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1730_c7_3713_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1730_c7_3713]
signal n16_low_MUX_uxn_opcodes_h_l1730_c7_3713_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1730_c7_3713_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1733_c11_ddb0]
signal BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ddb0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ddb0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ddb0_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1733_c7_f5e4]
signal t8_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1733_c7_f5e4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1733_c7_f5e4]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1733_c7_f5e4]
signal result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1733_c7_f5e4]
signal result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1733_c7_f5e4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1733_c7_f5e4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output : unsigned(3 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1733_c7_f5e4]
signal n16_high_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1733_c7_f5e4]
signal n16_low_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1737_c11_d62f]
signal BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d62f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d62f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d62f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1737_c7_5fc1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_5fc1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_5fc1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_5fc1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_5fc1_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1737_c7_5fc1]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_5fc1_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_5fc1_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_5fc1_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_5fc1_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1737_c7_5fc1]
signal result_u16_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1737_c7_5fc1]
signal result_u8_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1737_c7_5fc1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_5fc1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_5fc1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_5fc1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_5fc1_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1737_c7_5fc1]
signal n16_high_MUX_uxn_opcodes_h_l1737_c7_5fc1_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1737_c7_5fc1_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1737_c7_5fc1_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1737_c7_5fc1_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1737_c7_5fc1]
signal n16_low_MUX_uxn_opcodes_h_l1737_c7_5fc1_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1737_c7_5fc1_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1737_c7_5fc1_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1737_c7_5fc1_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1739_c30_8b0d]
signal sp_relative_shift_uxn_opcodes_h_l1739_c30_8b0d_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1739_c30_8b0d_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1739_c30_8b0d_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1739_c30_8b0d_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1744_c11_92bb]
signal BIN_OP_EQ_uxn_opcodes_h_l1744_c11_92bb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1744_c11_92bb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1744_c11_92bb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1744_c7_1c45]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_1c45_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_1c45_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_1c45_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_1c45_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1744_c7_1c45]
signal result_u16_value_MUX_uxn_opcodes_h_l1744_c7_1c45_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1744_c7_1c45_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1744_c7_1c45_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1744_c7_1c45_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1744_c7_1c45]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_1c45_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_1c45_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_1c45_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_1c45_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1744_c7_1c45]
signal result_u8_value_MUX_uxn_opcodes_h_l1744_c7_1c45_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1744_c7_1c45_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1744_c7_1c45_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1744_c7_1c45_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1744_c7_1c45]
signal n16_low_MUX_uxn_opcodes_h_l1744_c7_1c45_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1744_c7_1c45_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1744_c7_1c45_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1744_c7_1c45_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1747_c22_a57f]
signal BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_a57f_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_a57f_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_a57f_return_output : signed(18 downto 0);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_7dbb
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_7dbb_left : signed(16 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_7dbb_right : signed(7 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_7dbb_return_output : signed(17 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_c942( ref_toks_0 : opcode_result_t;
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
      base.is_ram_write := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_stack_index_flipped := ref_toks_7;
      base.u8_value := ref_toks_8;
      base.is_pc_updated := ref_toks_9;
      base.is_vram_write := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1717_c6_ac9e
BIN_OP_EQ_uxn_opcodes_h_l1717_c6_ac9e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1717_c6_ac9e_left,
BIN_OP_EQ_uxn_opcodes_h_l1717_c6_ac9e_right,
BIN_OP_EQ_uxn_opcodes_h_l1717_c6_ac9e_return_output);

-- t8_MUX_uxn_opcodes_h_l1717_c2_7e57
t8_MUX_uxn_opcodes_h_l1717_c2_7e57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1717_c2_7e57_cond,
t8_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue,
t8_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse,
t8_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_7e57
result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_7e57 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_7e57_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_7e57
result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_7e57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1717_c2_7e57
result_u16_value_MUX_uxn_opcodes_h_l1717_c2_7e57 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1717_c2_7e57_cond,
result_u16_value_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_7e57
result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_7e57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_7e57_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_7e57
result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_7e57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_7e57_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_7e57
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_7e57 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_7e57_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_7e57
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_7e57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_7e57_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1717_c2_7e57
result_u8_value_MUX_uxn_opcodes_h_l1717_c2_7e57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1717_c2_7e57_cond,
result_u8_value_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_7e57
result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_7e57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_7e57_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_7e57
result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_7e57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1717_c2_7e57
n16_high_MUX_uxn_opcodes_h_l1717_c2_7e57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1717_c2_7e57_cond,
n16_high_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue,
n16_high_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse,
n16_high_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1717_c2_7e57
n16_low_MUX_uxn_opcodes_h_l1717_c2_7e57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1717_c2_7e57_cond,
n16_low_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue,
n16_low_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse,
n16_low_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1730_c11_d29d
BIN_OP_EQ_uxn_opcodes_h_l1730_c11_d29d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1730_c11_d29d_left,
BIN_OP_EQ_uxn_opcodes_h_l1730_c11_d29d_right,
BIN_OP_EQ_uxn_opcodes_h_l1730_c11_d29d_return_output);

-- t8_MUX_uxn_opcodes_h_l1730_c7_3713
t8_MUX_uxn_opcodes_h_l1730_c7_3713 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1730_c7_3713_cond,
t8_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue,
t8_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse,
t8_MUX_uxn_opcodes_h_l1730_c7_3713_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_3713
result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_3713 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_3713_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_3713_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_3713
result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_3713 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_3713_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_3713_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1730_c7_3713
result_u16_value_MUX_uxn_opcodes_h_l1730_c7_3713 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1730_c7_3713_cond,
result_u16_value_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1730_c7_3713_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1730_c7_3713
result_u8_value_MUX_uxn_opcodes_h_l1730_c7_3713 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1730_c7_3713_cond,
result_u8_value_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1730_c7_3713_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_3713
result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_3713 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_3713_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_3713_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_3713
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_3713 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_3713_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_3713_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1730_c7_3713
n16_high_MUX_uxn_opcodes_h_l1730_c7_3713 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1730_c7_3713_cond,
n16_high_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue,
n16_high_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse,
n16_high_MUX_uxn_opcodes_h_l1730_c7_3713_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1730_c7_3713
n16_low_MUX_uxn_opcodes_h_l1730_c7_3713 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1730_c7_3713_cond,
n16_low_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue,
n16_low_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse,
n16_low_MUX_uxn_opcodes_h_l1730_c7_3713_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ddb0
BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ddb0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ddb0_left,
BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ddb0_right,
BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ddb0_return_output);

-- t8_MUX_uxn_opcodes_h_l1733_c7_f5e4
t8_MUX_uxn_opcodes_h_l1733_c7_f5e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond,
t8_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue,
t8_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse,
t8_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f5e4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f5e4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f5e4
result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f5e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f5e4
result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f5e4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond,
result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f5e4
result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f5e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f5e4
result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f5e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f5e4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f5e4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1733_c7_f5e4
n16_high_MUX_uxn_opcodes_h_l1733_c7_f5e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond,
n16_high_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue,
n16_high_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse,
n16_high_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1733_c7_f5e4
n16_low_MUX_uxn_opcodes_h_l1733_c7_f5e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond,
n16_low_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue,
n16_low_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse,
n16_low_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d62f
BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d62f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d62f_left,
BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d62f_right,
BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d62f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_5fc1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_5fc1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_5fc1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_5fc1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_5fc1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_5fc1_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_5fc1
result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_5fc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_5fc1_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_5fc1_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_5fc1_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_5fc1_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1737_c7_5fc1
result_u16_value_MUX_uxn_opcodes_h_l1737_c7_5fc1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_cond,
result_u16_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1737_c7_5fc1
result_u8_value_MUX_uxn_opcodes_h_l1737_c7_5fc1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_cond,
result_u8_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_5fc1
result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_5fc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_5fc1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_5fc1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_5fc1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_5fc1_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1737_c7_5fc1
n16_high_MUX_uxn_opcodes_h_l1737_c7_5fc1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1737_c7_5fc1_cond,
n16_high_MUX_uxn_opcodes_h_l1737_c7_5fc1_iftrue,
n16_high_MUX_uxn_opcodes_h_l1737_c7_5fc1_iffalse,
n16_high_MUX_uxn_opcodes_h_l1737_c7_5fc1_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1737_c7_5fc1
n16_low_MUX_uxn_opcodes_h_l1737_c7_5fc1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1737_c7_5fc1_cond,
n16_low_MUX_uxn_opcodes_h_l1737_c7_5fc1_iftrue,
n16_low_MUX_uxn_opcodes_h_l1737_c7_5fc1_iffalse,
n16_low_MUX_uxn_opcodes_h_l1737_c7_5fc1_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1739_c30_8b0d
sp_relative_shift_uxn_opcodes_h_l1739_c30_8b0d : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1739_c30_8b0d_ins,
sp_relative_shift_uxn_opcodes_h_l1739_c30_8b0d_x,
sp_relative_shift_uxn_opcodes_h_l1739_c30_8b0d_y,
sp_relative_shift_uxn_opcodes_h_l1739_c30_8b0d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1744_c11_92bb
BIN_OP_EQ_uxn_opcodes_h_l1744_c11_92bb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1744_c11_92bb_left,
BIN_OP_EQ_uxn_opcodes_h_l1744_c11_92bb_right,
BIN_OP_EQ_uxn_opcodes_h_l1744_c11_92bb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_1c45
result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_1c45 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_1c45_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_1c45_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_1c45_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_1c45_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1744_c7_1c45
result_u16_value_MUX_uxn_opcodes_h_l1744_c7_1c45 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1744_c7_1c45_cond,
result_u16_value_MUX_uxn_opcodes_h_l1744_c7_1c45_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1744_c7_1c45_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1744_c7_1c45_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_1c45
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_1c45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_1c45_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_1c45_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_1c45_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_1c45_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1744_c7_1c45
result_u8_value_MUX_uxn_opcodes_h_l1744_c7_1c45 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1744_c7_1c45_cond,
result_u8_value_MUX_uxn_opcodes_h_l1744_c7_1c45_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1744_c7_1c45_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1744_c7_1c45_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1744_c7_1c45
n16_low_MUX_uxn_opcodes_h_l1744_c7_1c45 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1744_c7_1c45_cond,
n16_low_MUX_uxn_opcodes_h_l1744_c7_1c45_iftrue,
n16_low_MUX_uxn_opcodes_h_l1744_c7_1c45_iffalse,
n16_low_MUX_uxn_opcodes_h_l1744_c7_1c45_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_a57f
BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_a57f : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_a57f_left,
BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_a57f_right,
BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_a57f_return_output);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_7dbb
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_7dbb : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_7dbb_left,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_7dbb_right,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_7dbb_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1717_c6_ac9e_return_output,
 t8_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output,
 n16_high_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output,
 n16_low_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1730_c11_d29d_return_output,
 t8_MUX_uxn_opcodes_h_l1730_c7_3713_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_3713_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_3713_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1730_c7_3713_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1730_c7_3713_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_3713_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_3713_return_output,
 n16_high_MUX_uxn_opcodes_h_l1730_c7_3713_return_output,
 n16_low_MUX_uxn_opcodes_h_l1730_c7_3713_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ddb0_return_output,
 t8_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output,
 n16_high_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output,
 n16_low_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d62f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_5fc1_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_5fc1_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_5fc1_return_output,
 n16_high_MUX_uxn_opcodes_h_l1737_c7_5fc1_return_output,
 n16_low_MUX_uxn_opcodes_h_l1737_c7_5fc1_return_output,
 sp_relative_shift_uxn_opcodes_h_l1739_c30_8b0d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1744_c11_92bb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_1c45_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1744_c7_1c45_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_1c45_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1744_c7_1c45_return_output,
 n16_low_MUX_uxn_opcodes_h_l1744_c7_1c45_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_a57f_return_output,
 BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_7dbb_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_ac9e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_ac9e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_ac9e_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1730_c7_3713_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1717_c2_7e57_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1722_c3_4e5f : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_3713_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_7e57_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_3713_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1730_c7_3713_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c2_7e57_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1717_c2_7e57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_7e57_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_3713_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_7e57_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1727_c3_a8dd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_3713_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_7e57_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1717_c2_7e57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_7e57_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1730_c7_3713_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c2_7e57_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1717_c2_7e57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_7e57_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1717_c2_7e57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1730_c7_3713_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1717_c2_7e57_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1730_c7_3713_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1717_c2_7e57_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_d29d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_d29d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_d29d_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1730_c7_3713_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_3713_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_3713_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1730_c7_3713_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1730_c7_3713_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_3713_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1731_c3_f123 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_3713_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1730_c7_3713_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1730_c7_3713_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ddb0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ddb0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ddb0_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_5fc1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_5fc1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_5fc1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1735_c3_b5c8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1733_c7_f5e4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1737_c7_5fc1_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1737_c7_5fc1_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d62f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d62f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d62f_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_5fc1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_5fc1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_1c45_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_5fc1_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_5fc1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_5fc1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_5fc1_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1741_c3_12fe : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_1c45_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_1c45_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_5fc1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_5fc1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_1c45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_5fc1_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1737_c7_5fc1_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1737_c7_5fc1_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1737_c7_5fc1_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1737_c7_5fc1_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1737_c7_5fc1_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1744_c7_1c45_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1737_c7_5fc1_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1739_c30_8b0d_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1739_c30_8b0d_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1739_c30_8b0d_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1739_c30_8b0d_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_92bb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_92bb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_92bb_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_1c45_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1746_c3_daa1 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_1c45_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_1c45_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_1c45_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1747_c3_20da : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_1c45_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_1c45_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_1c45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_1c45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_1c45_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_1c45_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_1c45_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_1c45_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1744_c7_1c45_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1744_c7_1c45_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1744_c7_1c45_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_a57f_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_a57f_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_a57f_return_output : signed(18 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1717_l1730_l1733_l1744_DUPLICATE_1505_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1717_l1730_l1733_l1744_DUPLICATE_8f13_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1730_l1733_l1744_DUPLICATE_2c9a_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1730_l1737_l1733_DUPLICATE_9cdd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1730_l1737_l1733_l1744_DUPLICATE_8535_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1747_l1741_DUPLICATE_576c_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_7dbb_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_7dbb_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_7dbb_return_output : signed(17 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l1752_l1713_DUPLICATE_51ed_return_output : opcode_result_t;
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
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_5fc1_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1739_c30_8b0d_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_a57f_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1727_c3_a8dd := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1727_c3_a8dd;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1746_c3_daa1 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_1c45_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1746_c3_daa1;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ddb0_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1722_c3_4e5f := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1722_c3_4e5f;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_ac9e_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_1c45_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1735_c3_b5c8 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1735_c3_b5c8;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1739_c30_8b0d_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1731_c3_f123 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1731_c3_f123;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_d29d_right := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_92bb_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d62f_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1739_c30_8b0d_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1737_c7_5fc1_iffalse := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1737_c7_5fc1_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1744_c7_1c45_iffalse := n16_low;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_7dbb_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_ac9e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_d29d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ddb0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d62f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_92bb_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l1737_c7_5fc1_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l1744_c7_1c45_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_1c45_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse := t8;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1730_l1733_l1744_DUPLICATE_2c9a LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1730_l1733_l1744_DUPLICATE_2c9a_return_output := result.sp_relative_shift;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1717_c2_7e57] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1717_c2_7e57_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1730_c11_d29d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1730_c11_d29d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_d29d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1730_c11_d29d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_d29d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_d29d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1730_c11_d29d_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1717_c2_7e57] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1717_c2_7e57_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1730_l1737_l1733_DUPLICATE_9cdd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1730_l1737_l1733_DUPLICATE_9cdd_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1744_c11_92bb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1744_c11_92bb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_92bb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1744_c11_92bb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_92bb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_92bb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1744_c11_92bb_return_output;

     -- CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1747_l1741_DUPLICATE_576c LATENCY=0
     VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1747_l1741_DUPLICATE_576c_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l1717_c6_ac9e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1717_c6_ac9e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_ac9e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1717_c6_ac9e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_ac9e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_ac9e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1717_c6_ac9e_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1717_c2_7e57] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1717_c2_7e57_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1730_l1737_l1733_l1744_DUPLICATE_8535 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1730_l1737_l1733_l1744_DUPLICATE_8535_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1733_c11_ddb0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ddb0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ddb0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ddb0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ddb0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ddb0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ddb0_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1717_l1730_l1733_l1744_DUPLICATE_8f13 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1717_l1730_l1733_l1744_DUPLICATE_8f13_return_output := result.u8_value;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1717_l1730_l1733_l1744_DUPLICATE_1505 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1717_l1730_l1733_l1744_DUPLICATE_1505_return_output := result.u16_value;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l1717_c2_7e57] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1717_c2_7e57_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1737_c11_d62f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d62f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d62f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d62f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d62f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d62f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d62f_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1739_c30_8b0d] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1739_c30_8b0d_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1739_c30_8b0d_ins;
     sp_relative_shift_uxn_opcodes_h_l1739_c30_8b0d_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1739_c30_8b0d_x;
     sp_relative_shift_uxn_opcodes_h_l1739_c30_8b0d_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1739_c30_8b0d_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1739_c30_8b0d_return_output := sp_relative_shift_uxn_opcodes_h_l1739_c30_8b0d_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1733_c7_f5e4] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1733_c7_f5e4_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l1717_c2_7e57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_ac9e_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1717_c2_7e57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_ac9e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_7e57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_ac9e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_7e57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_ac9e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_ac9e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_7e57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_ac9e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_7e57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_ac9e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_ac9e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_7e57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_ac9e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_7e57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_ac9e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c2_7e57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_ac9e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c2_7e57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_ac9e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1717_c2_7e57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_ac9e_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1730_c7_3713_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_d29d_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1730_c7_3713_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_d29d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_3713_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_d29d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_3713_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_d29d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_3713_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_d29d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_3713_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_d29d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1730_c7_3713_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_d29d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1730_c7_3713_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_d29d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1730_c7_3713_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_d29d_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ddb0_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ddb0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ddb0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ddb0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ddb0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ddb0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ddb0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ddb0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ddb0_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1737_c7_5fc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d62f_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1737_c7_5fc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d62f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_5fc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d62f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_5fc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d62f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_5fc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d62f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d62f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d62f_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1744_c7_1c45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_92bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_1c45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_92bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_1c45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_92bb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_1c45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_92bb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_1c45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_92bb_return_output;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_7dbb_right := VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1747_l1741_DUPLICATE_576c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1730_l1733_l1744_DUPLICATE_2c9a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1730_l1733_l1744_DUPLICATE_2c9a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_1c45_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1730_l1733_l1744_DUPLICATE_2c9a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1717_l1730_l1733_l1744_DUPLICATE_1505_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1717_l1730_l1733_l1744_DUPLICATE_1505_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1717_l1730_l1733_l1744_DUPLICATE_1505_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_1c45_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1717_l1730_l1733_l1744_DUPLICATE_1505_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1730_l1737_l1733_l1744_DUPLICATE_8535_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1730_l1737_l1733_l1744_DUPLICATE_8535_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_5fc1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1730_l1737_l1733_l1744_DUPLICATE_8535_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_1c45_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1730_l1737_l1733_l1744_DUPLICATE_8535_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1730_l1737_l1733_DUPLICATE_9cdd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1730_l1737_l1733_DUPLICATE_9cdd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_5fc1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1730_l1737_l1733_DUPLICATE_9cdd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1717_l1730_l1733_l1744_DUPLICATE_8f13_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1717_l1730_l1733_l1744_DUPLICATE_8f13_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1717_l1730_l1733_l1744_DUPLICATE_8f13_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_1c45_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1717_l1730_l1733_l1744_DUPLICATE_8f13_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1717_c2_7e57_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1717_c2_7e57_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1717_c2_7e57_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1717_c2_7e57_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1733_c7_f5e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_5fc1_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1739_c30_8b0d_return_output;
     -- n16_high_MUX[uxn_opcodes_h_l1737_c7_5fc1] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1737_c7_5fc1_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1737_c7_5fc1_cond;
     n16_high_MUX_uxn_opcodes_h_l1737_c7_5fc1_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1737_c7_5fc1_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1737_c7_5fc1_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1737_c7_5fc1_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1737_c7_5fc1_return_output := n16_high_MUX_uxn_opcodes_h_l1737_c7_5fc1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1744_c7_1c45] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1744_c7_1c45_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_1c45_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1744_c7_1c45_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_1c45_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1744_c7_1c45_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_1c45_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_1c45_return_output := result_u8_value_MUX_uxn_opcodes_h_l1744_c7_1c45_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1717_c2_7e57] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_7e57_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_7e57_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1744_c7_1c45] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_1c45_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_1c45_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_1c45_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_1c45_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_1c45_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_1c45_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_1c45_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_1c45_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1717_c2_7e57] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1733_c7_f5e4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1717_c2_7e57] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_7e57_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_7e57_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1744_c7_1c45] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1744_c7_1c45_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1744_c7_1c45_cond;
     n16_low_MUX_uxn_opcodes_h_l1744_c7_1c45_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1744_c7_1c45_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1744_c7_1c45_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1744_c7_1c45_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1744_c7_1c45_return_output := n16_low_MUX_uxn_opcodes_h_l1744_c7_1c45_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1737_c7_5fc1] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_5fc1_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_5fc1_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_5fc1_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_5fc1_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_5fc1_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_5fc1_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_5fc1_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_5fc1_return_output;

     -- t8_MUX[uxn_opcodes_h_l1733_c7_f5e4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond <= VAR_t8_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond;
     t8_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue;
     t8_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output := t8_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1717_c2_7e57] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_7e57_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_7e57_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1744_c7_1c45] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_1c45_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_1c45_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_1c45_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_1c45_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_1c45_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_1c45_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_1c45_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_1c45_return_output;

     -- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_7dbb LATENCY=0
     -- Inputs
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_7dbb_left <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_7dbb_left;
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_7dbb_right <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_7dbb_right;
     -- Outputs
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_7dbb_return_output := BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_7dbb_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_a57f_left := VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_7dbb_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1741_c3_12fe := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_7dbb_return_output)),16);
     VAR_n16_high_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1737_c7_5fc1_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1737_c7_5fc1_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1744_c7_1c45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_5fc1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_1c45_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_5fc1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_5fc1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_1c45_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_1c45_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1741_c3_12fe;
     -- n16_high_MUX[uxn_opcodes_h_l1733_c7_f5e4] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond;
     n16_high_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output := n16_high_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1737_c7_5fc1] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1737_c7_5fc1_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1737_c7_5fc1_cond;
     n16_low_MUX_uxn_opcodes_h_l1737_c7_5fc1_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1737_c7_5fc1_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1737_c7_5fc1_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1737_c7_5fc1_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1737_c7_5fc1_return_output := n16_low_MUX_uxn_opcodes_h_l1737_c7_5fc1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1737_c7_5fc1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_return_output := result_u8_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1737_c7_5fc1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_5fc1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_5fc1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_5fc1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_5fc1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_5fc1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_5fc1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_5fc1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_5fc1_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1747_c22_a57f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_a57f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_a57f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_a57f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_a57f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_a57f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_a57f_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1733_c7_f5e4] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1730_c7_3713] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_3713_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_3713_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_3713_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_3713_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1737_c7_5fc1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_5fc1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_5fc1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_5fc1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_5fc1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_5fc1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_5fc1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_5fc1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_5fc1_return_output;

     -- t8_MUX[uxn_opcodes_h_l1730_c7_3713] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1730_c7_3713_cond <= VAR_t8_MUX_uxn_opcodes_h_l1730_c7_3713_cond;
     t8_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue;
     t8_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1730_c7_3713_return_output := t8_MUX_uxn_opcodes_h_l1730_c7_3713_return_output;

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1747_c3_20da := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_a57f_return_output)),16);
     VAR_n16_high_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1737_c7_5fc1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_5fc1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_5fc1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_3713_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1730_c7_3713_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_1c45_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1747_c3_20da;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1730_c7_3713] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_3713_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_3713_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_3713_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_3713_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1717_c2_7e57] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_7e57_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_7e57_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1730_c7_3713] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1730_c7_3713_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1730_c7_3713_cond;
     n16_high_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1730_c7_3713_return_output := n16_high_MUX_uxn_opcodes_h_l1730_c7_3713_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1733_c7_f5e4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output;

     -- t8_MUX[uxn_opcodes_h_l1717_c2_7e57] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1717_c2_7e57_cond <= VAR_t8_MUX_uxn_opcodes_h_l1717_c2_7e57_cond;
     t8_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue;
     t8_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output := t8_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1744_c7_1c45] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1744_c7_1c45_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_1c45_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1744_c7_1c45_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_1c45_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1744_c7_1c45_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_1c45_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_1c45_return_output := result_u16_value_MUX_uxn_opcodes_h_l1744_c7_1c45_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1733_c7_f5e4] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond;
     n16_low_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output := n16_low_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1733_c7_f5e4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1733_c7_f5e4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1730_c7_3713_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_3713_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_1c45_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1737_c7_5fc1] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_return_output := result_u16_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1730_c7_3713] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_3713_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_3713_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_3713_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_3713_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1730_c7_3713] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1730_c7_3713_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1730_c7_3713_cond;
     n16_low_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1730_c7_3713_return_output := n16_low_MUX_uxn_opcodes_h_l1730_c7_3713_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1717_c2_7e57] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1717_c2_7e57_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1717_c2_7e57_cond;
     n16_high_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output := n16_high_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1730_c7_3713] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_3713_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_3713_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_3713_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_3713_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1730_c7_3713] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1730_c7_3713_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1730_c7_3713_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1730_c7_3713_return_output := result_u8_value_MUX_uxn_opcodes_h_l1730_c7_3713_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1717_c2_7e57] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output;

     -- Submodule level 5
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1730_c7_3713_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_3713_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_3713_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_5fc1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1730_c7_3713_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1717_c2_7e57] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1717_c2_7e57_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c2_7e57_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output := result_u8_value_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1717_c2_7e57] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_7e57_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_7e57_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1717_c2_7e57] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_7e57_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_7e57_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1733_c7_f5e4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output := result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1717_c2_7e57] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1717_c2_7e57_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1717_c2_7e57_cond;
     n16_low_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output := n16_low_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output;

     -- Submodule level 6
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f5e4_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1730_c7_3713] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1730_c7_3713_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1730_c7_3713_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1730_c7_3713_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1730_c7_3713_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1730_c7_3713_return_output := result_u16_value_MUX_uxn_opcodes_h_l1730_c7_3713_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1730_c7_3713_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1717_c2_7e57] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1717_c2_7e57_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c2_7e57_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c2_7e57_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c2_7e57_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output := result_u16_value_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l1752_l1713_DUPLICATE_51ed LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l1752_l1713_DUPLICATE_51ed_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c942(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_7e57_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l1752_l1713_DUPLICATE_51ed_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l1752_l1713_DUPLICATE_51ed_return_output;
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
