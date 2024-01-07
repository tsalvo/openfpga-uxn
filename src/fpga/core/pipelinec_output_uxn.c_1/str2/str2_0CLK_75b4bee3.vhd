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
-- BIN_OP_EQ[uxn_opcodes_h_l1717_c6_a0e4]
signal BIN_OP_EQ_uxn_opcodes_h_l1717_c6_a0e4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1717_c6_a0e4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1717_c6_a0e4_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1717_c2_b3fe]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1717_c2_b3fe]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1717_c2_b3fe]
signal result_u8_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1717_c2_b3fe]
signal result_u16_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1717_c2_b3fe]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1717_c2_b3fe]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1717_c2_b3fe]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1717_c2_b3fe]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1717_c2_b3fe]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1717_c2_b3fe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1717_c2_b3fe]
signal n16_high_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1717_c2_b3fe]
signal n16_low_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1717_c2_b3fe]
signal t8_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1730_c11_eb0c]
signal BIN_OP_EQ_uxn_opcodes_h_l1730_c11_eb0c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1730_c11_eb0c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1730_c11_eb0c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1730_c7_59d4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_59d4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1730_c7_59d4]
signal result_u8_value_MUX_uxn_opcodes_h_l1730_c7_59d4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1730_c7_59d4]
signal result_u16_value_MUX_uxn_opcodes_h_l1730_c7_59d4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1730_c7_59d4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_59d4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1730_c7_59d4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_59d4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1730_c7_59d4]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_59d4_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1730_c7_59d4]
signal n16_high_MUX_uxn_opcodes_h_l1730_c7_59d4_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1730_c7_59d4]
signal n16_low_MUX_uxn_opcodes_h_l1730_c7_59d4_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1730_c7_59d4]
signal t8_MUX_uxn_opcodes_h_l1730_c7_59d4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1733_c11_b239]
signal BIN_OP_EQ_uxn_opcodes_h_l1733_c11_b239_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1733_c11_b239_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1733_c11_b239_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1733_c7_2c0e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1733_c7_2c0e]
signal result_u8_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1733_c7_2c0e]
signal result_u16_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1733_c7_2c0e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1733_c7_2c0e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1733_c7_2c0e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1733_c7_2c0e]
signal n16_high_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1733_c7_2c0e]
signal n16_low_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1733_c7_2c0e]
signal t8_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1737_c11_af64]
signal BIN_OP_EQ_uxn_opcodes_h_l1737_c11_af64_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1737_c11_af64_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1737_c11_af64_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1737_c7_0aab]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_0aab_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_0aab_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_0aab_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_0aab_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1737_c7_0aab]
signal result_u8_value_MUX_uxn_opcodes_h_l1737_c7_0aab_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1737_c7_0aab_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1737_c7_0aab_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1737_c7_0aab_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1737_c7_0aab]
signal result_u16_value_MUX_uxn_opcodes_h_l1737_c7_0aab_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1737_c7_0aab_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1737_c7_0aab_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1737_c7_0aab_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1737_c7_0aab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_0aab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_0aab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_0aab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_0aab_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1737_c7_0aab]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_0aab_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_0aab_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_0aab_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_0aab_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1737_c7_0aab]
signal n16_high_MUX_uxn_opcodes_h_l1737_c7_0aab_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1737_c7_0aab_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1737_c7_0aab_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1737_c7_0aab_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1737_c7_0aab]
signal n16_low_MUX_uxn_opcodes_h_l1737_c7_0aab_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1737_c7_0aab_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1737_c7_0aab_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1737_c7_0aab_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1739_c30_9ea8]
signal sp_relative_shift_uxn_opcodes_h_l1739_c30_9ea8_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1739_c30_9ea8_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1739_c30_9ea8_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1739_c30_9ea8_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1744_c11_a271]
signal BIN_OP_EQ_uxn_opcodes_h_l1744_c11_a271_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1744_c11_a271_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1744_c11_a271_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1744_c7_c66d]
signal result_u8_value_MUX_uxn_opcodes_h_l1744_c7_c66d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1744_c7_c66d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1744_c7_c66d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1744_c7_c66d_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1744_c7_c66d]
signal result_u16_value_MUX_uxn_opcodes_h_l1744_c7_c66d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1744_c7_c66d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1744_c7_c66d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1744_c7_c66d_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1744_c7_c66d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_c66d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_c66d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_c66d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_c66d_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1744_c7_c66d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_c66d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_c66d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_c66d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_c66d_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1744_c7_c66d]
signal n16_low_MUX_uxn_opcodes_h_l1744_c7_c66d_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1744_c7_c66d_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1744_c7_c66d_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1744_c7_c66d_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1747_c22_cb29]
signal BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_cb29_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_cb29_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_cb29_return_output : signed(18 downto 0);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_8280
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_8280_left : signed(16 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_8280_right : signed(7 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_8280_return_output : signed(17 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_500b( ref_toks_0 : opcode_result_t;
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
      base.is_pc_updated := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.u16_value := ref_toks_4;
      base.is_ram_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_stack_write := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_stack_index_flipped := ref_toks_9;
      base.is_opc_done := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1717_c6_a0e4
BIN_OP_EQ_uxn_opcodes_h_l1717_c6_a0e4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1717_c6_a0e4_left,
BIN_OP_EQ_uxn_opcodes_h_l1717_c6_a0e4_right,
BIN_OP_EQ_uxn_opcodes_h_l1717_c6_a0e4_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_b3fe
result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_b3fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe
result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1717_c2_b3fe
result_u8_value_MUX_uxn_opcodes_h_l1717_c2_b3fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond,
result_u8_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1717_c2_b3fe
result_u16_value_MUX_uxn_opcodes_h_l1717_c2_b3fe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond,
result_u16_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe
result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_b3fe
result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_b3fe : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_b3fe
result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_b3fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_b3fe
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_b3fe : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_b3fe
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_b3fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_b3fe
result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_b3fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1717_c2_b3fe
n16_high_MUX_uxn_opcodes_h_l1717_c2_b3fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond,
n16_high_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue,
n16_high_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse,
n16_high_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1717_c2_b3fe
n16_low_MUX_uxn_opcodes_h_l1717_c2_b3fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond,
n16_low_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue,
n16_low_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse,
n16_low_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output);

-- t8_MUX_uxn_opcodes_h_l1717_c2_b3fe
t8_MUX_uxn_opcodes_h_l1717_c2_b3fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond,
t8_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue,
t8_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse,
t8_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1730_c11_eb0c
BIN_OP_EQ_uxn_opcodes_h_l1730_c11_eb0c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1730_c11_eb0c_left,
BIN_OP_EQ_uxn_opcodes_h_l1730_c11_eb0c_right,
BIN_OP_EQ_uxn_opcodes_h_l1730_c11_eb0c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_59d4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_59d4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_59d4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1730_c7_59d4
result_u8_value_MUX_uxn_opcodes_h_l1730_c7_59d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1730_c7_59d4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1730_c7_59d4
result_u16_value_MUX_uxn_opcodes_h_l1730_c7_59d4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1730_c7_59d4_cond,
result_u16_value_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_59d4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_59d4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_59d4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_59d4
result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_59d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_59d4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_59d4
result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_59d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_59d4_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1730_c7_59d4
n16_high_MUX_uxn_opcodes_h_l1730_c7_59d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1730_c7_59d4_cond,
n16_high_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue,
n16_high_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse,
n16_high_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1730_c7_59d4
n16_low_MUX_uxn_opcodes_h_l1730_c7_59d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1730_c7_59d4_cond,
n16_low_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue,
n16_low_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse,
n16_low_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output);

-- t8_MUX_uxn_opcodes_h_l1730_c7_59d4
t8_MUX_uxn_opcodes_h_l1730_c7_59d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1730_c7_59d4_cond,
t8_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue,
t8_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse,
t8_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1733_c11_b239
BIN_OP_EQ_uxn_opcodes_h_l1733_c11_b239 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1733_c11_b239_left,
BIN_OP_EQ_uxn_opcodes_h_l1733_c11_b239_right,
BIN_OP_EQ_uxn_opcodes_h_l1733_c11_b239_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_2c0e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_2c0e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1733_c7_2c0e
result_u8_value_MUX_uxn_opcodes_h_l1733_c7_2c0e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1733_c7_2c0e
result_u16_value_MUX_uxn_opcodes_h_l1733_c7_2c0e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond,
result_u16_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_2c0e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_2c0e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_2c0e
result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_2c0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_2c0e
result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_2c0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1733_c7_2c0e
n16_high_MUX_uxn_opcodes_h_l1733_c7_2c0e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond,
n16_high_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue,
n16_high_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse,
n16_high_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1733_c7_2c0e
n16_low_MUX_uxn_opcodes_h_l1733_c7_2c0e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond,
n16_low_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue,
n16_low_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse,
n16_low_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output);

-- t8_MUX_uxn_opcodes_h_l1733_c7_2c0e
t8_MUX_uxn_opcodes_h_l1733_c7_2c0e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond,
t8_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue,
t8_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse,
t8_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1737_c11_af64
BIN_OP_EQ_uxn_opcodes_h_l1737_c11_af64 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1737_c11_af64_left,
BIN_OP_EQ_uxn_opcodes_h_l1737_c11_af64_right,
BIN_OP_EQ_uxn_opcodes_h_l1737_c11_af64_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_0aab
result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_0aab : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_0aab_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_0aab_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_0aab_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_0aab_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1737_c7_0aab
result_u8_value_MUX_uxn_opcodes_h_l1737_c7_0aab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1737_c7_0aab_cond,
result_u8_value_MUX_uxn_opcodes_h_l1737_c7_0aab_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1737_c7_0aab_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1737_c7_0aab_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1737_c7_0aab
result_u16_value_MUX_uxn_opcodes_h_l1737_c7_0aab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1737_c7_0aab_cond,
result_u16_value_MUX_uxn_opcodes_h_l1737_c7_0aab_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1737_c7_0aab_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1737_c7_0aab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_0aab
result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_0aab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_0aab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_0aab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_0aab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_0aab_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_0aab
result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_0aab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_0aab_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_0aab_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_0aab_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_0aab_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1737_c7_0aab
n16_high_MUX_uxn_opcodes_h_l1737_c7_0aab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1737_c7_0aab_cond,
n16_high_MUX_uxn_opcodes_h_l1737_c7_0aab_iftrue,
n16_high_MUX_uxn_opcodes_h_l1737_c7_0aab_iffalse,
n16_high_MUX_uxn_opcodes_h_l1737_c7_0aab_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1737_c7_0aab
n16_low_MUX_uxn_opcodes_h_l1737_c7_0aab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1737_c7_0aab_cond,
n16_low_MUX_uxn_opcodes_h_l1737_c7_0aab_iftrue,
n16_low_MUX_uxn_opcodes_h_l1737_c7_0aab_iffalse,
n16_low_MUX_uxn_opcodes_h_l1737_c7_0aab_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1739_c30_9ea8
sp_relative_shift_uxn_opcodes_h_l1739_c30_9ea8 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1739_c30_9ea8_ins,
sp_relative_shift_uxn_opcodes_h_l1739_c30_9ea8_x,
sp_relative_shift_uxn_opcodes_h_l1739_c30_9ea8_y,
sp_relative_shift_uxn_opcodes_h_l1739_c30_9ea8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1744_c11_a271
BIN_OP_EQ_uxn_opcodes_h_l1744_c11_a271 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1744_c11_a271_left,
BIN_OP_EQ_uxn_opcodes_h_l1744_c11_a271_right,
BIN_OP_EQ_uxn_opcodes_h_l1744_c11_a271_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1744_c7_c66d
result_u8_value_MUX_uxn_opcodes_h_l1744_c7_c66d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1744_c7_c66d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1744_c7_c66d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1744_c7_c66d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1744_c7_c66d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1744_c7_c66d
result_u16_value_MUX_uxn_opcodes_h_l1744_c7_c66d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1744_c7_c66d_cond,
result_u16_value_MUX_uxn_opcodes_h_l1744_c7_c66d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1744_c7_c66d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1744_c7_c66d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_c66d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_c66d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_c66d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_c66d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_c66d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_c66d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_c66d
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_c66d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_c66d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_c66d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_c66d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_c66d_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1744_c7_c66d
n16_low_MUX_uxn_opcodes_h_l1744_c7_c66d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1744_c7_c66d_cond,
n16_low_MUX_uxn_opcodes_h_l1744_c7_c66d_iftrue,
n16_low_MUX_uxn_opcodes_h_l1744_c7_c66d_iffalse,
n16_low_MUX_uxn_opcodes_h_l1744_c7_c66d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_cb29
BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_cb29 : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_cb29_left,
BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_cb29_right,
BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_cb29_return_output);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_8280
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_8280 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_8280_left,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_8280_right,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_8280_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1717_c6_a0e4_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output,
 n16_high_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output,
 n16_low_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output,
 t8_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1730_c11_eb0c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output,
 n16_high_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output,
 n16_low_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output,
 t8_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1733_c11_b239_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output,
 n16_high_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output,
 n16_low_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output,
 t8_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1737_c11_af64_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_0aab_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1737_c7_0aab_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1737_c7_0aab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_0aab_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_0aab_return_output,
 n16_high_MUX_uxn_opcodes_h_l1737_c7_0aab_return_output,
 n16_low_MUX_uxn_opcodes_h_l1737_c7_0aab_return_output,
 sp_relative_shift_uxn_opcodes_h_l1739_c30_9ea8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1744_c11_a271_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1744_c7_c66d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1744_c7_c66d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_c66d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_c66d_return_output,
 n16_low_MUX_uxn_opcodes_h_l1744_c7_c66d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_cb29_return_output,
 BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_8280_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_a0e4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_a0e4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_a0e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1717_c2_b3fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1717_c2_b3fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1722_c3_6451 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1717_c2_b3fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1727_c3_5a27 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1717_c2_b3fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_eb0c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_eb0c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_eb0c_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_59d4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1730_c7_59d4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1730_c7_59d4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1731_c3_a6e3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_59d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_59d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_59d4_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1730_c7_59d4_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1730_c7_59d4_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1730_c7_59d4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_b239_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_b239_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_b239_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_0aab_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_0aab_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_0aab_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1735_c3_f893 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1733_c7_2c0e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_0aab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_0aab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1737_c7_0aab_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1737_c7_0aab_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_af64_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_af64_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_af64_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_0aab_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_0aab_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_c66d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_0aab_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_0aab_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_0aab_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_c66d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_0aab_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_0aab_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1741_c3_6b8a : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_0aab_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_c66d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_0aab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_0aab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_0aab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_c66d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_0aab_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_0aab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_0aab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_0aab_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1737_c7_0aab_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1737_c7_0aab_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1737_c7_0aab_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1737_c7_0aab_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1737_c7_0aab_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1744_c7_c66d_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1737_c7_0aab_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1739_c30_9ea8_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1739_c30_9ea8_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1739_c30_9ea8_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1739_c30_9ea8_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_a271_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_a271_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_a271_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_c66d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_c66d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_c66d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_c66d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1747_c3_9a95 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_c66d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_c66d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_c66d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1746_c3_32fd : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_c66d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_c66d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_c66d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_c66d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_c66d_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1744_c7_c66d_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1744_c7_c66d_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1744_c7_c66d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_cb29_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_cb29_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_cb29_return_output : signed(18 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1717_DUPLICATE_0632_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1717_DUPLICATE_7217_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1730_l1744_l1733_DUPLICATE_7918_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1737_DUPLICATE_de0b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1730_l1733_l1737_DUPLICATE_0e6d_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_f50f_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_8280_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_8280_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_8280_return_output : signed(17 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l1713_l1752_DUPLICATE_5621_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l1739_c30_9ea8_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_cb29_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1727_c3_5a27 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1727_c3_5a27;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1722_c3_6451 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1722_c3_6451;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_0aab_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_c66d_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1746_c3_32fd := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_c66d_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1746_c3_32fd;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_af64_right := to_unsigned(3, 2);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1735_c3_f893 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1735_c3_f893;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_eb0c_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_a0e4_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1731_c3_a6e3 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1731_c3_a6e3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_a271_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1739_c30_9ea8_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_b239_right := to_unsigned(2, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1739_c30_9ea8_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1737_c7_0aab_iffalse := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1737_c7_0aab_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1744_c7_c66d_iffalse := n16_low;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_8280_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_a0e4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_eb0c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_b239_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_af64_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_a271_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l1737_c7_0aab_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l1744_c7_c66d_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_0aab_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_c66d_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse := t8;
     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1733_c7_2c0e] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1733_c7_2c0e_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1717_DUPLICATE_7217 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1717_DUPLICATE_7217_return_output := result.u16_value;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l1717_c2_b3fe] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1717_c2_b3fe_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1717_c6_a0e4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1717_c6_a0e4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_a0e4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1717_c6_a0e4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_a0e4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_a0e4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1717_c6_a0e4_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1717_DUPLICATE_0632 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1717_DUPLICATE_0632_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1733_c11_b239] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1733_c11_b239_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_b239_left;
     BIN_OP_EQ_uxn_opcodes_h_l1733_c11_b239_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_b239_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_b239_return_output := BIN_OP_EQ_uxn_opcodes_h_l1733_c11_b239_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1739_c30_9ea8] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1739_c30_9ea8_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1739_c30_9ea8_ins;
     sp_relative_shift_uxn_opcodes_h_l1739_c30_9ea8_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1739_c30_9ea8_x;
     sp_relative_shift_uxn_opcodes_h_l1739_c30_9ea8_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1739_c30_9ea8_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1739_c30_9ea8_return_output := sp_relative_shift_uxn_opcodes_h_l1739_c30_9ea8_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1730_l1744_l1733_DUPLICATE_7918 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1730_l1744_l1733_DUPLICATE_7918_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1730_l1733_l1737_DUPLICATE_0e6d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1730_l1733_l1737_DUPLICATE_0e6d_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1737_c11_af64] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1737_c11_af64_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_af64_left;
     BIN_OP_EQ_uxn_opcodes_h_l1737_c11_af64_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_af64_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_af64_return_output := BIN_OP_EQ_uxn_opcodes_h_l1737_c11_af64_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1717_c2_b3fe] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1717_c2_b3fe_return_output := result.is_vram_write;

     -- CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_f50f LATENCY=0
     VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_f50f_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l1730_c11_eb0c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1730_c11_eb0c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_eb0c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1730_c11_eb0c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_eb0c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_eb0c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1730_c11_eb0c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1744_c11_a271] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1744_c11_a271_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_a271_left;
     BIN_OP_EQ_uxn_opcodes_h_l1744_c11_a271_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_a271_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_a271_return_output := BIN_OP_EQ_uxn_opcodes_h_l1744_c11_a271_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1717_c2_b3fe] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1717_c2_b3fe_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1737_DUPLICATE_de0b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1737_DUPLICATE_de0b_return_output := result.is_opc_done;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1717_c2_b3fe] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1717_c2_b3fe_return_output := result.is_stack_index_flipped;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_a0e4_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_a0e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_a0e4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_a0e4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_a0e4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_a0e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_a0e4_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_a0e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_a0e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_a0e4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_a0e4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_a0e4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_a0e4_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1730_c7_59d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_eb0c_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1730_c7_59d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_eb0c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_59d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_eb0c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_59d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_eb0c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_59d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_eb0c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_59d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_eb0c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1730_c7_59d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_eb0c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1730_c7_59d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_eb0c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1730_c7_59d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_eb0c_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_b239_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_b239_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_b239_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_b239_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_b239_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_b239_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_b239_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_b239_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_b239_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1737_c7_0aab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_af64_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1737_c7_0aab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_af64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_0aab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_af64_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_0aab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_af64_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_0aab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_af64_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_0aab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_af64_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_0aab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_af64_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1744_c7_c66d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_a271_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_c66d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_a271_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_c66d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_a271_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_c66d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_a271_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_c66d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_a271_return_output;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_8280_right := VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_f50f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1730_l1744_l1733_DUPLICATE_7918_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1730_l1744_l1733_DUPLICATE_7918_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_c66d_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1730_l1744_l1733_DUPLICATE_7918_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1717_DUPLICATE_7217_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1717_DUPLICATE_7217_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1717_DUPLICATE_7217_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_c66d_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1717_DUPLICATE_7217_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1737_DUPLICATE_de0b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1737_DUPLICATE_de0b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_0aab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1737_DUPLICATE_de0b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_c66d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1737_DUPLICATE_de0b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1730_l1733_l1737_DUPLICATE_0e6d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1730_l1733_l1737_DUPLICATE_0e6d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_0aab_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1730_l1733_l1737_DUPLICATE_0e6d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1717_DUPLICATE_0632_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1717_DUPLICATE_0632_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1717_DUPLICATE_0632_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_c66d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1717_DUPLICATE_0632_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1717_c2_b3fe_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1717_c2_b3fe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1717_c2_b3fe_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1717_c2_b3fe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1733_c7_2c0e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_0aab_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1739_c30_9ea8_return_output;
     -- t8_MUX[uxn_opcodes_h_l1733_c7_2c0e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond <= VAR_t8_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond;
     t8_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue;
     t8_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output := t8_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1737_c7_0aab] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1737_c7_0aab_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1737_c7_0aab_cond;
     n16_high_MUX_uxn_opcodes_h_l1737_c7_0aab_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1737_c7_0aab_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1737_c7_0aab_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1737_c7_0aab_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1737_c7_0aab_return_output := n16_high_MUX_uxn_opcodes_h_l1737_c7_0aab_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1744_c7_c66d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1744_c7_c66d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_c66d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1744_c7_c66d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_c66d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1744_c7_c66d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_c66d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_c66d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1744_c7_c66d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1744_c7_c66d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_c66d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_c66d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_c66d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_c66d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_c66d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_c66d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_c66d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_c66d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1717_c2_b3fe] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1717_c2_b3fe] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1744_c7_c66d] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1744_c7_c66d_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1744_c7_c66d_cond;
     n16_low_MUX_uxn_opcodes_h_l1744_c7_c66d_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1744_c7_c66d_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1744_c7_c66d_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1744_c7_c66d_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1744_c7_c66d_return_output := n16_low_MUX_uxn_opcodes_h_l1744_c7_c66d_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1717_c2_b3fe] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1733_c7_2c0e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1737_c7_0aab] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_0aab_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_0aab_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_0aab_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_0aab_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_0aab_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_0aab_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_0aab_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_0aab_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1744_c7_c66d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_c66d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_c66d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_c66d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_c66d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_c66d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_c66d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_c66d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_c66d_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1717_c2_b3fe] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output;

     -- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_8280 LATENCY=0
     -- Inputs
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_8280_left <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_8280_left;
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_8280_right <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_8280_right;
     -- Outputs
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_8280_return_output := BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_8280_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_cb29_left := VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_8280_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1741_c3_6b8a := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_8280_return_output)),16);
     VAR_n16_high_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1737_c7_0aab_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1737_c7_0aab_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1744_c7_c66d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_0aab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_c66d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_0aab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_0aab_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_c66d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_0aab_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_c66d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_0aab_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1741_c3_6b8a;
     -- t8_MUX[uxn_opcodes_h_l1730_c7_59d4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1730_c7_59d4_cond <= VAR_t8_MUX_uxn_opcodes_h_l1730_c7_59d4_cond;
     t8_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue;
     t8_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output := t8_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1747_c22_cb29] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_cb29_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_cb29_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_cb29_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_cb29_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_cb29_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_cb29_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1737_c7_0aab] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1737_c7_0aab_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1737_c7_0aab_cond;
     n16_low_MUX_uxn_opcodes_h_l1737_c7_0aab_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1737_c7_0aab_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1737_c7_0aab_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1737_c7_0aab_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1737_c7_0aab_return_output := n16_low_MUX_uxn_opcodes_h_l1737_c7_0aab_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1737_c7_0aab] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_0aab_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_0aab_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_0aab_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_0aab_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_0aab_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_0aab_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_0aab_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_0aab_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1733_c7_2c0e] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond;
     n16_high_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output := n16_high_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1737_c7_0aab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_0aab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_0aab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_0aab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_0aab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_0aab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_0aab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_0aab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_0aab_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1737_c7_0aab] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1737_c7_0aab_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_0aab_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1737_c7_0aab_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_0aab_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1737_c7_0aab_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_0aab_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_0aab_return_output := result_u8_value_MUX_uxn_opcodes_h_l1737_c7_0aab_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1733_c7_2c0e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1730_c7_59d4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_59d4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_59d4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output;

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1747_c3_9a95 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_cb29_return_output)),16);
     VAR_n16_high_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1737_c7_0aab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_0aab_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_0aab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_0aab_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_c66d_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1747_c3_9a95;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1717_c2_b3fe] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1733_c7_2c0e] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond;
     n16_low_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output := n16_low_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1730_c7_59d4] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_59d4_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_59d4_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1730_c7_59d4] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1730_c7_59d4_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1730_c7_59d4_cond;
     n16_high_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output := n16_high_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output;

     -- t8_MUX[uxn_opcodes_h_l1717_c2_b3fe] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond <= VAR_t8_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond;
     t8_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue;
     t8_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output := t8_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1744_c7_c66d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1744_c7_c66d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_c66d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1744_c7_c66d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_c66d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1744_c7_c66d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_c66d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_c66d_return_output := result_u16_value_MUX_uxn_opcodes_h_l1744_c7_c66d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1733_c7_2c0e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1733_c7_2c0e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1733_c7_2c0e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_0aab_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_c66d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1730_c7_59d4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1730_c7_59d4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1730_c7_59d4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1717_c2_b3fe] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond;
     n16_high_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output := n16_high_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1730_c7_59d4] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1730_c7_59d4_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1730_c7_59d4_cond;
     n16_low_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output := n16_low_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1730_c7_59d4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_59d4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_59d4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1737_c7_0aab] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1737_c7_0aab_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_0aab_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1737_c7_0aab_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_0aab_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1737_c7_0aab_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_0aab_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_0aab_return_output := result_u16_value_MUX_uxn_opcodes_h_l1737_c7_0aab_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1717_c2_b3fe] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1730_c7_59d4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_59d4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_59d4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output;

     -- Submodule level 5
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_0aab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1717_c2_b3fe] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1717_c2_b3fe] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output := result_u8_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1733_c7_2c0e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output := result_u16_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1717_c2_b3fe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1717_c2_b3fe] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond;
     n16_low_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output := n16_low_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output;

     -- Submodule level 6
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1733_c7_2c0e_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1730_c7_59d4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1730_c7_59d4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1730_c7_59d4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1730_c7_59d4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1730_c7_59d4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output := result_u16_value_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1730_c7_59d4_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1717_c2_b3fe] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output := result_u16_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l1713_l1752_DUPLICATE_5621 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l1713_l1752_DUPLICATE_5621_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_500b(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_b3fe_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l1713_l1752_DUPLICATE_5621_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l1713_l1752_DUPLICATE_5621_return_output;
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
