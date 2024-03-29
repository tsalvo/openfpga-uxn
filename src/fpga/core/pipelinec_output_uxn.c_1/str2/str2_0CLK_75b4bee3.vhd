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
-- BIN_OP_EQ[uxn_opcodes_h_l1718_c6_d6f8]
signal BIN_OP_EQ_uxn_opcodes_h_l1718_c6_d6f8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1718_c6_d6f8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1718_c6_d6f8_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1718_c2_3afc]
signal n16_low_MUX_uxn_opcodes_h_l1718_c2_3afc_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1718_c2_3afc]
signal n16_high_MUX_uxn_opcodes_h_l1718_c2_3afc_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1718_c2_3afc]
signal result_u16_value_MUX_uxn_opcodes_h_l1718_c2_3afc_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1718_c2_3afc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_3afc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1718_c2_3afc]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1718_c2_3afc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_3afc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1718_c2_3afc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_3afc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1718_c2_3afc]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_3afc_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1718_c2_3afc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_3afc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1718_c2_3afc]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1718_c2_3afc]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_3afc_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1718_c2_3afc]
signal result_u8_value_MUX_uxn_opcodes_h_l1718_c2_3afc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1718_c2_3afc]
signal t8_MUX_uxn_opcodes_h_l1718_c2_3afc_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1731_c11_89e2]
signal BIN_OP_EQ_uxn_opcodes_h_l1731_c11_89e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1731_c11_89e2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1731_c11_89e2_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1731_c7_b65b]
signal n16_low_MUX_uxn_opcodes_h_l1731_c7_b65b_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1731_c7_b65b]
signal n16_high_MUX_uxn_opcodes_h_l1731_c7_b65b_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1731_c7_b65b]
signal result_u16_value_MUX_uxn_opcodes_h_l1731_c7_b65b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1731_c7_b65b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_b65b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1731_c7_b65b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_b65b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1731_c7_b65b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_b65b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1731_c7_b65b]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_b65b_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1731_c7_b65b]
signal result_u8_value_MUX_uxn_opcodes_h_l1731_c7_b65b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1731_c7_b65b]
signal t8_MUX_uxn_opcodes_h_l1731_c7_b65b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1734_c11_7a6d]
signal BIN_OP_EQ_uxn_opcodes_h_l1734_c11_7a6d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1734_c11_7a6d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1734_c11_7a6d_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1734_c7_e92f]
signal n16_low_MUX_uxn_opcodes_h_l1734_c7_e92f_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1734_c7_e92f]
signal n16_high_MUX_uxn_opcodes_h_l1734_c7_e92f_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1734_c7_e92f]
signal result_u16_value_MUX_uxn_opcodes_h_l1734_c7_e92f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1734_c7_e92f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_e92f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1734_c7_e92f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_e92f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1734_c7_e92f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_e92f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1734_c7_e92f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_e92f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1734_c7_e92f]
signal result_u8_value_MUX_uxn_opcodes_h_l1734_c7_e92f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1734_c7_e92f]
signal t8_MUX_uxn_opcodes_h_l1734_c7_e92f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1738_c11_217b]
signal BIN_OP_EQ_uxn_opcodes_h_l1738_c11_217b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1738_c11_217b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1738_c11_217b_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1738_c7_3be8]
signal n16_low_MUX_uxn_opcodes_h_l1738_c7_3be8_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1738_c7_3be8_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1738_c7_3be8_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1738_c7_3be8_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1738_c7_3be8]
signal n16_high_MUX_uxn_opcodes_h_l1738_c7_3be8_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1738_c7_3be8_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1738_c7_3be8_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1738_c7_3be8_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1738_c7_3be8]
signal result_u16_value_MUX_uxn_opcodes_h_l1738_c7_3be8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1738_c7_3be8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1738_c7_3be8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1738_c7_3be8_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1738_c7_3be8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_3be8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_3be8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_3be8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_3be8_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1738_c7_3be8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_3be8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_3be8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_3be8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_3be8_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1738_c7_3be8]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_3be8_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_3be8_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_3be8_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_3be8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1738_c7_3be8]
signal result_u8_value_MUX_uxn_opcodes_h_l1738_c7_3be8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1738_c7_3be8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1738_c7_3be8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1738_c7_3be8_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1740_c30_47ea]
signal sp_relative_shift_uxn_opcodes_h_l1740_c30_47ea_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1740_c30_47ea_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1740_c30_47ea_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1740_c30_47ea_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1745_c11_a5cd]
signal BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5cd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5cd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5cd_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1745_c7_4340]
signal n16_low_MUX_uxn_opcodes_h_l1745_c7_4340_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1745_c7_4340_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1745_c7_4340_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1745_c7_4340_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1745_c7_4340]
signal result_u16_value_MUX_uxn_opcodes_h_l1745_c7_4340_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1745_c7_4340_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1745_c7_4340_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1745_c7_4340_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1745_c7_4340]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_4340_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_4340_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_4340_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_4340_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1745_c7_4340]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_4340_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_4340_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_4340_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_4340_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1745_c7_4340]
signal result_u8_value_MUX_uxn_opcodes_h_l1745_c7_4340_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1745_c7_4340_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1745_c7_4340_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1745_c7_4340_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1748_c22_b661]
signal BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_b661_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_b661_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_b661_return_output : signed(18 downto 0);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_ec4c
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_ec4c_left : signed(16 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_ec4c_right : signed(7 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_ec4c_return_output : signed(17 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_a906( ref_toks_0 : opcode_result_t;
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
      base.u16_value := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_vram_write := ref_toks_8;
      base.is_pc_updated := ref_toks_9;
      base.u8_value := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1718_c6_d6f8
BIN_OP_EQ_uxn_opcodes_h_l1718_c6_d6f8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1718_c6_d6f8_left,
BIN_OP_EQ_uxn_opcodes_h_l1718_c6_d6f8_right,
BIN_OP_EQ_uxn_opcodes_h_l1718_c6_d6f8_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1718_c2_3afc
n16_low_MUX_uxn_opcodes_h_l1718_c2_3afc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1718_c2_3afc_cond,
n16_low_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue,
n16_low_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse,
n16_low_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1718_c2_3afc
n16_high_MUX_uxn_opcodes_h_l1718_c2_3afc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1718_c2_3afc_cond,
n16_high_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue,
n16_high_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse,
n16_high_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1718_c2_3afc
result_u16_value_MUX_uxn_opcodes_h_l1718_c2_3afc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1718_c2_3afc_cond,
result_u16_value_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_3afc
result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_3afc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_3afc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_3afc
result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_3afc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_3afc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_3afc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_3afc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_3afc
result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_3afc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_3afc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_3afc
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_3afc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_3afc_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_3afc
result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_3afc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_3afc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_3afc
result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_3afc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_3afc
result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_3afc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_3afc_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1718_c2_3afc
result_u8_value_MUX_uxn_opcodes_h_l1718_c2_3afc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1718_c2_3afc_cond,
result_u8_value_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output);

-- t8_MUX_uxn_opcodes_h_l1718_c2_3afc
t8_MUX_uxn_opcodes_h_l1718_c2_3afc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1718_c2_3afc_cond,
t8_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue,
t8_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse,
t8_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1731_c11_89e2
BIN_OP_EQ_uxn_opcodes_h_l1731_c11_89e2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1731_c11_89e2_left,
BIN_OP_EQ_uxn_opcodes_h_l1731_c11_89e2_right,
BIN_OP_EQ_uxn_opcodes_h_l1731_c11_89e2_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1731_c7_b65b
n16_low_MUX_uxn_opcodes_h_l1731_c7_b65b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1731_c7_b65b_cond,
n16_low_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue,
n16_low_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse,
n16_low_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1731_c7_b65b
n16_high_MUX_uxn_opcodes_h_l1731_c7_b65b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1731_c7_b65b_cond,
n16_high_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue,
n16_high_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse,
n16_high_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1731_c7_b65b
result_u16_value_MUX_uxn_opcodes_h_l1731_c7_b65b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1731_c7_b65b_cond,
result_u16_value_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_b65b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_b65b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_b65b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_b65b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_b65b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_b65b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_b65b
result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_b65b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_b65b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_b65b
result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_b65b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_b65b_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1731_c7_b65b
result_u8_value_MUX_uxn_opcodes_h_l1731_c7_b65b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1731_c7_b65b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output);

-- t8_MUX_uxn_opcodes_h_l1731_c7_b65b
t8_MUX_uxn_opcodes_h_l1731_c7_b65b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1731_c7_b65b_cond,
t8_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue,
t8_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse,
t8_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1734_c11_7a6d
BIN_OP_EQ_uxn_opcodes_h_l1734_c11_7a6d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1734_c11_7a6d_left,
BIN_OP_EQ_uxn_opcodes_h_l1734_c11_7a6d_right,
BIN_OP_EQ_uxn_opcodes_h_l1734_c11_7a6d_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1734_c7_e92f
n16_low_MUX_uxn_opcodes_h_l1734_c7_e92f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1734_c7_e92f_cond,
n16_low_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue,
n16_low_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse,
n16_low_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1734_c7_e92f
n16_high_MUX_uxn_opcodes_h_l1734_c7_e92f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1734_c7_e92f_cond,
n16_high_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue,
n16_high_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse,
n16_high_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1734_c7_e92f
result_u16_value_MUX_uxn_opcodes_h_l1734_c7_e92f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1734_c7_e92f_cond,
result_u16_value_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_e92f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_e92f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_e92f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_e92f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_e92f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_e92f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_e92f
result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_e92f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_e92f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_e92f
result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_e92f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_e92f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1734_c7_e92f
result_u8_value_MUX_uxn_opcodes_h_l1734_c7_e92f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1734_c7_e92f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output);

-- t8_MUX_uxn_opcodes_h_l1734_c7_e92f
t8_MUX_uxn_opcodes_h_l1734_c7_e92f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1734_c7_e92f_cond,
t8_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue,
t8_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse,
t8_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1738_c11_217b
BIN_OP_EQ_uxn_opcodes_h_l1738_c11_217b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1738_c11_217b_left,
BIN_OP_EQ_uxn_opcodes_h_l1738_c11_217b_right,
BIN_OP_EQ_uxn_opcodes_h_l1738_c11_217b_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1738_c7_3be8
n16_low_MUX_uxn_opcodes_h_l1738_c7_3be8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1738_c7_3be8_cond,
n16_low_MUX_uxn_opcodes_h_l1738_c7_3be8_iftrue,
n16_low_MUX_uxn_opcodes_h_l1738_c7_3be8_iffalse,
n16_low_MUX_uxn_opcodes_h_l1738_c7_3be8_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1738_c7_3be8
n16_high_MUX_uxn_opcodes_h_l1738_c7_3be8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1738_c7_3be8_cond,
n16_high_MUX_uxn_opcodes_h_l1738_c7_3be8_iftrue,
n16_high_MUX_uxn_opcodes_h_l1738_c7_3be8_iffalse,
n16_high_MUX_uxn_opcodes_h_l1738_c7_3be8_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1738_c7_3be8
result_u16_value_MUX_uxn_opcodes_h_l1738_c7_3be8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1738_c7_3be8_cond,
result_u16_value_MUX_uxn_opcodes_h_l1738_c7_3be8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1738_c7_3be8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1738_c7_3be8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_3be8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_3be8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_3be8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_3be8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_3be8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_3be8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_3be8
result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_3be8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_3be8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_3be8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_3be8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_3be8_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_3be8
result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_3be8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_3be8_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_3be8_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_3be8_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_3be8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1738_c7_3be8
result_u8_value_MUX_uxn_opcodes_h_l1738_c7_3be8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1738_c7_3be8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1738_c7_3be8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1738_c7_3be8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1738_c7_3be8_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1740_c30_47ea
sp_relative_shift_uxn_opcodes_h_l1740_c30_47ea : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1740_c30_47ea_ins,
sp_relative_shift_uxn_opcodes_h_l1740_c30_47ea_x,
sp_relative_shift_uxn_opcodes_h_l1740_c30_47ea_y,
sp_relative_shift_uxn_opcodes_h_l1740_c30_47ea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5cd
BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5cd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5cd_left,
BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5cd_right,
BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5cd_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1745_c7_4340
n16_low_MUX_uxn_opcodes_h_l1745_c7_4340 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1745_c7_4340_cond,
n16_low_MUX_uxn_opcodes_h_l1745_c7_4340_iftrue,
n16_low_MUX_uxn_opcodes_h_l1745_c7_4340_iffalse,
n16_low_MUX_uxn_opcodes_h_l1745_c7_4340_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1745_c7_4340
result_u16_value_MUX_uxn_opcodes_h_l1745_c7_4340 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1745_c7_4340_cond,
result_u16_value_MUX_uxn_opcodes_h_l1745_c7_4340_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1745_c7_4340_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1745_c7_4340_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_4340
result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_4340 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_4340_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_4340_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_4340_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_4340_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_4340
result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_4340 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_4340_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_4340_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_4340_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_4340_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1745_c7_4340
result_u8_value_MUX_uxn_opcodes_h_l1745_c7_4340 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1745_c7_4340_cond,
result_u8_value_MUX_uxn_opcodes_h_l1745_c7_4340_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1745_c7_4340_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1745_c7_4340_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_b661
BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_b661 : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_b661_left,
BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_b661_right,
BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_b661_return_output);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_ec4c
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_ec4c : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_ec4c_left,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_ec4c_right,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_ec4c_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1718_c6_d6f8_return_output,
 n16_low_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output,
 n16_high_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output,
 t8_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1731_c11_89e2_return_output,
 n16_low_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output,
 n16_high_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output,
 t8_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1734_c11_7a6d_return_output,
 n16_low_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output,
 n16_high_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output,
 t8_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1738_c11_217b_return_output,
 n16_low_MUX_uxn_opcodes_h_l1738_c7_3be8_return_output,
 n16_high_MUX_uxn_opcodes_h_l1738_c7_3be8_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1738_c7_3be8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_3be8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_3be8_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_3be8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1738_c7_3be8_return_output,
 sp_relative_shift_uxn_opcodes_h_l1740_c30_47ea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5cd_return_output,
 n16_low_MUX_uxn_opcodes_h_l1745_c7_4340_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1745_c7_4340_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_4340_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_4340_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1745_c7_4340_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_b661_return_output,
 BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_ec4c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_d6f8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_d6f8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_d6f8_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1718_c2_3afc_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1718_c2_3afc_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c2_3afc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_3afc_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1728_c3_968a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_3afc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1718_c2_3afc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_3afc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1718_c2_3afc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_3afc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1723_c3_1c4c : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_3afc_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1718_c2_3afc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1718_c2_3afc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_3afc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c2_3afc_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1718_c2_3afc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_89e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_89e2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_89e2_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1731_c7_b65b_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1731_c7_b65b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_b65b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_b65b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1732_c3_da25 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_b65b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_b65b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_b65b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_b65b_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1731_c7_b65b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_7a6d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_7a6d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_7a6d_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_3be8_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1734_c7_e92f_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_3be8_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1734_c7_e92f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_3be8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_e92f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_3be8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_e92f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1736_c3_10a9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1734_c7_e92f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_e92f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_3be8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_e92f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_3be8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_e92f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_3be8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_e92f_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1734_c7_e92f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_217b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_217b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_217b_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_3be8_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_3be8_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1745_c7_4340_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_3be8_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_3be8_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_3be8_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_3be8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_3be8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1742_c3_be19 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_3be8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_4340_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_3be8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_3be8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_3be8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_4340_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_3be8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_3be8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_3be8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_4340_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_3be8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_3be8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_3be8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_3be8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_3be8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_3be8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_4340_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_3be8_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_47ea_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_47ea_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_47ea_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_47ea_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5cd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5cd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5cd_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1745_c7_4340_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1745_c7_4340_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1745_c7_4340_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_4340_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1748_c3_0595 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_4340_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_4340_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_4340_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_4340_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_4340_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_4340_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1747_c3_9b90 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_4340_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_4340_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_4340_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_4340_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_4340_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_b661_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_b661_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_b661_return_output : signed(18 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1718_l1731_l1745_l1734_DUPLICATE_93df_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1718_l1731_l1745_l1734_DUPLICATE_8111_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1731_l1745_l1734_DUPLICATE_3bec_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1738_l1731_l1745_l1734_DUPLICATE_24ab_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1738_l1731_l1734_DUPLICATE_3b9f_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_4837_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_ec4c_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_ec4c_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_ec4c_return_output : signed(17 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l1753_l1714_DUPLICATE_e799_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_89e2_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_7a6d_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_47ea_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_d6f8_right := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1747_c3_9b90 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_4340_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1747_c3_9b90;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_b661_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_4340_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_47ea_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_3be8_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1728_c3_968a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1728_c3_968a;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5cd_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1736_c3_10a9 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1736_c3_10a9;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_217b_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1732_c3_da25 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1732_c3_da25;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1723_c3_1c4c := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1723_c3_1c4c;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_47ea_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_3be8_iffalse := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_3be8_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1745_c7_4340_iffalse := n16_low;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_ec4c_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_d6f8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_89e2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_7a6d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_217b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5cd_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_3be8_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l1745_c7_4340_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_3be8_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_4340_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1734_c11_7a6d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1734_c11_7a6d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_7a6d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1734_c11_7a6d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_7a6d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_7a6d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1734_c11_7a6d_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1740_c30_47ea] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1740_c30_47ea_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_47ea_ins;
     sp_relative_shift_uxn_opcodes_h_l1740_c30_47ea_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_47ea_x;
     sp_relative_shift_uxn_opcodes_h_l1740_c30_47ea_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_47ea_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_47ea_return_output := sp_relative_shift_uxn_opcodes_h_l1740_c30_47ea_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1738_l1731_l1745_l1734_DUPLICATE_24ab LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1738_l1731_l1745_l1734_DUPLICATE_24ab_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1718_l1731_l1745_l1734_DUPLICATE_8111 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1718_l1731_l1745_l1734_DUPLICATE_8111_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1738_c11_217b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1738_c11_217b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_217b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1738_c11_217b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_217b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_217b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1738_c11_217b_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1718_c2_3afc] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1718_c2_3afc_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1738_l1731_l1734_DUPLICATE_3b9f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1738_l1731_l1734_DUPLICATE_3b9f_return_output := result.is_ram_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1718_c2_3afc] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1718_c2_3afc_return_output := result.is_vram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1731_l1745_l1734_DUPLICATE_3bec LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1731_l1745_l1734_DUPLICATE_3bec_return_output := result.sp_relative_shift;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1718_c2_3afc] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1718_c2_3afc_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1731_c11_89e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1731_c11_89e2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_89e2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1731_c11_89e2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_89e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_89e2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1731_c11_89e2_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1718_l1731_l1745_l1734_DUPLICATE_93df LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1718_l1731_l1745_l1734_DUPLICATE_93df_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1745_c11_a5cd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5cd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5cd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5cd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5cd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5cd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5cd_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l1718_c2_3afc] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1718_c2_3afc_return_output := result.is_stack_write;

     -- CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_4837 LATENCY=0
     VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_4837_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l1718_c6_d6f8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1718_c6_d6f8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_d6f8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1718_c6_d6f8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_d6f8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_d6f8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1718_c6_d6f8_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1734_c7_e92f] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1734_c7_e92f_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l1718_c2_3afc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_d6f8_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1718_c2_3afc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_d6f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_3afc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_d6f8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_3afc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_d6f8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_d6f8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_3afc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_d6f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_3afc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_d6f8_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_d6f8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_3afc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_d6f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_3afc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_d6f8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c2_3afc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_d6f8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c2_3afc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_d6f8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1718_c2_3afc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_d6f8_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1731_c7_b65b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_89e2_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1731_c7_b65b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_89e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_b65b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_89e2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_b65b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_89e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_b65b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_89e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_b65b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_89e2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_b65b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_89e2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_b65b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_89e2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1731_c7_b65b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_89e2_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1734_c7_e92f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_7a6d_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1734_c7_e92f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_7a6d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_e92f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_7a6d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_e92f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_7a6d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_e92f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_7a6d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_e92f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_7a6d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_e92f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_7a6d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_e92f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_7a6d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1734_c7_e92f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_7a6d_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_3be8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_217b_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_3be8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_217b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_3be8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_217b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_3be8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_217b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_3be8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_217b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_3be8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_217b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_3be8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_217b_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1745_c7_4340_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_4340_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_4340_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5cd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_4340_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5cd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_4340_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5cd_return_output;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_ec4c_right := VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_4837_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1731_l1745_l1734_DUPLICATE_3bec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1731_l1745_l1734_DUPLICATE_3bec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_4340_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1731_l1745_l1734_DUPLICATE_3bec_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1718_l1731_l1745_l1734_DUPLICATE_93df_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1718_l1731_l1745_l1734_DUPLICATE_93df_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1718_l1731_l1745_l1734_DUPLICATE_93df_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_4340_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1718_l1731_l1745_l1734_DUPLICATE_93df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1738_l1731_l1745_l1734_DUPLICATE_24ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1738_l1731_l1745_l1734_DUPLICATE_24ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_3be8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1738_l1731_l1745_l1734_DUPLICATE_24ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_4340_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1738_l1731_l1745_l1734_DUPLICATE_24ab_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1738_l1731_l1734_DUPLICATE_3b9f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1738_l1731_l1734_DUPLICATE_3b9f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_3be8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1738_l1731_l1734_DUPLICATE_3b9f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1718_l1731_l1745_l1734_DUPLICATE_8111_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1718_l1731_l1745_l1734_DUPLICATE_8111_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1718_l1731_l1745_l1734_DUPLICATE_8111_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_4340_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1718_l1731_l1745_l1734_DUPLICATE_8111_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1718_c2_3afc_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1718_c2_3afc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1718_c2_3afc_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1718_c2_3afc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1734_c7_e92f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_3be8_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_47ea_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l1718_c2_3afc] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1718_c2_3afc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_3afc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_3afc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1738_c7_3be8] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1738_c7_3be8_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_3be8_cond;
     n16_high_MUX_uxn_opcodes_h_l1738_c7_3be8_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_3be8_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1738_c7_3be8_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_3be8_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_3be8_return_output := n16_high_MUX_uxn_opcodes_h_l1738_c7_3be8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1745_c7_4340] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_4340_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_4340_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_4340_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_4340_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_4340_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_4340_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_4340_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_4340_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1734_c7_e92f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_e92f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_e92f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1718_c2_3afc] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_3afc_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_3afc_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1718_c2_3afc] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_3afc_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_3afc_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1745_c7_4340] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_4340_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_4340_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_4340_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_4340_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_4340_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_4340_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_4340_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_4340_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1745_c7_4340] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1745_c7_4340_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1745_c7_4340_cond;
     n16_low_MUX_uxn_opcodes_h_l1745_c7_4340_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1745_c7_4340_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1745_c7_4340_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1745_c7_4340_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1745_c7_4340_return_output := n16_low_MUX_uxn_opcodes_h_l1745_c7_4340_return_output;

     -- t8_MUX[uxn_opcodes_h_l1734_c7_e92f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1734_c7_e92f_cond <= VAR_t8_MUX_uxn_opcodes_h_l1734_c7_e92f_cond;
     t8_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue;
     t8_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output := t8_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output;

     -- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_ec4c LATENCY=0
     -- Inputs
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_ec4c_left <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_ec4c_left;
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_ec4c_right <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_ec4c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_ec4c_return_output := BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_ec4c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1745_c7_4340] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1745_c7_4340_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_4340_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1745_c7_4340_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_4340_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1745_c7_4340_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_4340_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_4340_return_output := result_u8_value_MUX_uxn_opcodes_h_l1745_c7_4340_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1738_c7_3be8] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_3be8_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_3be8_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_3be8_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_3be8_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_3be8_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_3be8_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_3be8_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_3be8_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_b661_left := VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_ec4c_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1742_c3_be19 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_ec4c_return_output)),16);
     VAR_n16_high_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_3be8_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_3be8_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1745_c7_4340_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_3be8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_4340_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_3be8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_3be8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_4340_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_3be8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_4340_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_3be8_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1742_c3_be19;
     -- BIN_OP_PLUS[uxn_opcodes_h_l1748_c22_b661] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_b661_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_b661_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_b661_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_b661_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_b661_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_b661_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1738_c7_3be8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1738_c7_3be8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_3be8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1738_c7_3be8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_3be8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1738_c7_3be8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_3be8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_3be8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1738_c7_3be8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1731_c7_b65b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_b65b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_b65b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1734_c7_e92f] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1734_c7_e92f_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1734_c7_e92f_cond;
     n16_high_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output := n16_high_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1738_c7_3be8] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1738_c7_3be8_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_3be8_cond;
     n16_low_MUX_uxn_opcodes_h_l1738_c7_3be8_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_3be8_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1738_c7_3be8_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_3be8_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_3be8_return_output := n16_low_MUX_uxn_opcodes_h_l1738_c7_3be8_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1734_c7_e92f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_e92f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_e92f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output;

     -- t8_MUX[uxn_opcodes_h_l1731_c7_b65b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1731_c7_b65b_cond <= VAR_t8_MUX_uxn_opcodes_h_l1731_c7_b65b_cond;
     t8_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue;
     t8_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output := t8_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1738_c7_3be8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_3be8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_3be8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_3be8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_3be8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_3be8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_3be8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_3be8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_3be8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1738_c7_3be8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_3be8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_3be8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_3be8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_3be8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_3be8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_3be8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_3be8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_3be8_return_output;

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1748_c3_0595 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_b661_return_output)),16);
     VAR_n16_high_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_3be8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_3be8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_3be8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_3be8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_4340_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1748_c3_0595;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1718_c2_3afc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_3afc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_3afc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1745_c7_4340] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1745_c7_4340_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_4340_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1745_c7_4340_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_4340_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1745_c7_4340_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_4340_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_4340_return_output := result_u16_value_MUX_uxn_opcodes_h_l1745_c7_4340_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1731_c7_b65b] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_b65b_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_b65b_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1731_c7_b65b] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1731_c7_b65b_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1731_c7_b65b_cond;
     n16_high_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output := n16_high_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1734_c7_e92f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_e92f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_e92f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1734_c7_e92f] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1734_c7_e92f_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1734_c7_e92f_cond;
     n16_low_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output := n16_low_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1734_c7_e92f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_e92f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_e92f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1734_c7_e92f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1734_c7_e92f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_e92f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output;

     -- t8_MUX[uxn_opcodes_h_l1718_c2_3afc] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1718_c2_3afc_cond <= VAR_t8_MUX_uxn_opcodes_h_l1718_c2_3afc_cond;
     t8_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue;
     t8_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output := t8_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_3be8_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_4340_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l1731_c7_b65b] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1731_c7_b65b_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1731_c7_b65b_cond;
     n16_low_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output := n16_low_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1718_c2_3afc] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1731_c7_b65b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_b65b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_b65b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1738_c7_3be8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1738_c7_3be8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_3be8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1738_c7_3be8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_3be8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1738_c7_3be8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_3be8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_3be8_return_output := result_u16_value_MUX_uxn_opcodes_h_l1738_c7_3be8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1731_c7_b65b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1731_c7_b65b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_b65b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1718_c2_3afc] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1718_c2_3afc_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1718_c2_3afc_cond;
     n16_high_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output := n16_high_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1731_c7_b65b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_b65b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_b65b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output;

     -- Submodule level 5
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_3be8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1718_c2_3afc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_3afc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_3afc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1718_c2_3afc] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1718_c2_3afc_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1718_c2_3afc_cond;
     n16_low_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output := n16_low_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1718_c2_3afc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_3afc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_3afc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1718_c2_3afc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1718_c2_3afc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c2_3afc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output := result_u8_value_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1734_c7_e92f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1734_c7_e92f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_e92f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_e92f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_e92f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output := result_u16_value_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output;

     -- Submodule level 6
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_e92f_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1731_c7_b65b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1731_c7_b65b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_b65b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_b65b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_b65b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output := result_u16_value_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_b65b_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1718_c2_3afc] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1718_c2_3afc_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c2_3afc_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c2_3afc_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c2_3afc_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output := result_u16_value_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l1753_l1714_DUPLICATE_e799 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l1753_l1714_DUPLICATE_e799_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a906(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c2_3afc_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l1753_l1714_DUPLICATE_e799_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l1753_l1714_DUPLICATE_e799_return_output;
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
