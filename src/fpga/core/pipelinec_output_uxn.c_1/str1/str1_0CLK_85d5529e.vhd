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
-- Submodules: 41
entity str1_0CLK_85d5529e is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end str1_0CLK_85d5529e;
architecture arch of str1_0CLK_85d5529e is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1700_c6_66c6]
signal BIN_OP_EQ_uxn_opcodes_h_l1700_c6_66c6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1700_c6_66c6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1700_c6_66c6_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1700_c2_a399]
signal t8_MUX_uxn_opcodes_h_l1700_c2_a399_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1700_c2_a399_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1700_c2_a399]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_a399_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_a399_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1700_c2_a399]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1700_c2_a399_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1700_c2_a399_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1700_c2_a399]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1700_c2_a399_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1700_c2_a399_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1700_c2_a399]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_a399_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_a399_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1700_c2_a399]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_a399_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_a399_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1700_c2_a399]
signal result_u8_value_MUX_uxn_opcodes_h_l1700_c2_a399_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1700_c2_a399_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1700_c2_a399]
signal result_u16_value_MUX_uxn_opcodes_h_l1700_c2_a399_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1700_c2_a399_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1700_c2_a399]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_a399_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_a399_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1700_c2_a399]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1700_c2_a399_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1700_c2_a399_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1700_c2_a399]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1700_c2_a399_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1700_c2_a399_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1700_c2_a399]
signal n8_MUX_uxn_opcodes_h_l1700_c2_a399_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1700_c2_a399_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1713_c11_1cda]
signal BIN_OP_EQ_uxn_opcodes_h_l1713_c11_1cda_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1713_c11_1cda_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1713_c11_1cda_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1713_c7_724a]
signal t8_MUX_uxn_opcodes_h_l1713_c7_724a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1713_c7_724a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1713_c7_724a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1713_c7_724a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1713_c7_724a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_724a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_724a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_724a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_724a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1713_c7_724a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_724a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_724a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_724a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_724a_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1713_c7_724a]
signal result_u8_value_MUX_uxn_opcodes_h_l1713_c7_724a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1713_c7_724a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1713_c7_724a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1713_c7_724a_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1713_c7_724a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_724a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_724a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_724a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_724a_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1713_c7_724a]
signal result_u16_value_MUX_uxn_opcodes_h_l1713_c7_724a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1713_c7_724a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1713_c7_724a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1713_c7_724a_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1713_c7_724a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_724a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_724a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_724a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_724a_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l1713_c7_724a]
signal n8_MUX_uxn_opcodes_h_l1713_c7_724a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1713_c7_724a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1713_c7_724a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1713_c7_724a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1716_c11_d89f]
signal BIN_OP_EQ_uxn_opcodes_h_l1716_c11_d89f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1716_c11_d89f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1716_c11_d89f_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1716_c7_550e]
signal t8_MUX_uxn_opcodes_h_l1716_c7_550e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1716_c7_550e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1716_c7_550e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1716_c7_550e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1716_c7_550e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_550e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_550e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_550e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_550e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1716_c7_550e]
signal result_u8_value_MUX_uxn_opcodes_h_l1716_c7_550e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1716_c7_550e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1716_c7_550e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1716_c7_550e_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1716_c7_550e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_550e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_550e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_550e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_550e_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1716_c7_550e]
signal result_u16_value_MUX_uxn_opcodes_h_l1716_c7_550e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1716_c7_550e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1716_c7_550e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1716_c7_550e_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1716_c7_550e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1716_c7_550e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1716_c7_550e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1716_c7_550e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1716_c7_550e_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l1716_c7_550e]
signal n8_MUX_uxn_opcodes_h_l1716_c7_550e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1716_c7_550e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1716_c7_550e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1716_c7_550e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1719_c11_e956]
signal BIN_OP_EQ_uxn_opcodes_h_l1719_c11_e956_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1719_c11_e956_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1719_c11_e956_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1719_c7_8eb2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_8eb2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_8eb2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_8eb2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_8eb2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1719_c7_8eb2]
signal result_u8_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1719_c7_8eb2]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1719_c7_8eb2_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1719_c7_8eb2_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1719_c7_8eb2_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1719_c7_8eb2_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1719_c7_8eb2]
signal result_u16_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1719_c7_8eb2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1719_c7_8eb2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1719_c7_8eb2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1719_c7_8eb2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1719_c7_8eb2_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l1719_c7_8eb2]
signal n8_MUX_uxn_opcodes_h_l1719_c7_8eb2_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1719_c7_8eb2_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1719_c7_8eb2_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1719_c7_8eb2_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1721_c30_79d5]
signal sp_relative_shift_uxn_opcodes_h_l1721_c30_79d5_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1721_c30_79d5_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1721_c30_79d5_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1721_c30_79d5_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1723_c22_a40e]
signal BIN_OP_PLUS_uxn_opcodes_h_l1723_c22_a40e_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1723_c22_a40e_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1723_c22_a40e_return_output : signed(17 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1700_c6_66c6
BIN_OP_EQ_uxn_opcodes_h_l1700_c6_66c6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1700_c6_66c6_left,
BIN_OP_EQ_uxn_opcodes_h_l1700_c6_66c6_right,
BIN_OP_EQ_uxn_opcodes_h_l1700_c6_66c6_return_output);

-- t8_MUX_uxn_opcodes_h_l1700_c2_a399
t8_MUX_uxn_opcodes_h_l1700_c2_a399 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1700_c2_a399_cond,
t8_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue,
t8_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse,
t8_MUX_uxn_opcodes_h_l1700_c2_a399_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_a399
result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_a399 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_a399_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_a399_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1700_c2_a399
result_is_vram_write_MUX_uxn_opcodes_h_l1700_c2_a399 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1700_c2_a399_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1700_c2_a399_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1700_c2_a399
result_is_ram_write_MUX_uxn_opcodes_h_l1700_c2_a399 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1700_c2_a399_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1700_c2_a399_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_a399
result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_a399 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_a399_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_a399_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_a399
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_a399 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_a399_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_a399_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1700_c2_a399
result_u8_value_MUX_uxn_opcodes_h_l1700_c2_a399 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1700_c2_a399_cond,
result_u8_value_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1700_c2_a399_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1700_c2_a399
result_u16_value_MUX_uxn_opcodes_h_l1700_c2_a399 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1700_c2_a399_cond,
result_u16_value_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1700_c2_a399_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_a399
result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_a399 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_a399_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_a399_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1700_c2_a399
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1700_c2_a399 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1700_c2_a399_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1700_c2_a399_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1700_c2_a399
result_is_pc_updated_MUX_uxn_opcodes_h_l1700_c2_a399 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1700_c2_a399_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1700_c2_a399_return_output);

-- n8_MUX_uxn_opcodes_h_l1700_c2_a399
n8_MUX_uxn_opcodes_h_l1700_c2_a399 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1700_c2_a399_cond,
n8_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue,
n8_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse,
n8_MUX_uxn_opcodes_h_l1700_c2_a399_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1713_c11_1cda
BIN_OP_EQ_uxn_opcodes_h_l1713_c11_1cda : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1713_c11_1cda_left,
BIN_OP_EQ_uxn_opcodes_h_l1713_c11_1cda_right,
BIN_OP_EQ_uxn_opcodes_h_l1713_c11_1cda_return_output);

-- t8_MUX_uxn_opcodes_h_l1713_c7_724a
t8_MUX_uxn_opcodes_h_l1713_c7_724a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1713_c7_724a_cond,
t8_MUX_uxn_opcodes_h_l1713_c7_724a_iftrue,
t8_MUX_uxn_opcodes_h_l1713_c7_724a_iffalse,
t8_MUX_uxn_opcodes_h_l1713_c7_724a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_724a
result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_724a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_724a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_724a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_724a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_724a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_724a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_724a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_724a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_724a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_724a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_724a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1713_c7_724a
result_u8_value_MUX_uxn_opcodes_h_l1713_c7_724a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1713_c7_724a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1713_c7_724a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1713_c7_724a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1713_c7_724a_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_724a
result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_724a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_724a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_724a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_724a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_724a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1713_c7_724a
result_u16_value_MUX_uxn_opcodes_h_l1713_c7_724a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1713_c7_724a_cond,
result_u16_value_MUX_uxn_opcodes_h_l1713_c7_724a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1713_c7_724a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1713_c7_724a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_724a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_724a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_724a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_724a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_724a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_724a_return_output);

-- n8_MUX_uxn_opcodes_h_l1713_c7_724a
n8_MUX_uxn_opcodes_h_l1713_c7_724a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1713_c7_724a_cond,
n8_MUX_uxn_opcodes_h_l1713_c7_724a_iftrue,
n8_MUX_uxn_opcodes_h_l1713_c7_724a_iffalse,
n8_MUX_uxn_opcodes_h_l1713_c7_724a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1716_c11_d89f
BIN_OP_EQ_uxn_opcodes_h_l1716_c11_d89f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1716_c11_d89f_left,
BIN_OP_EQ_uxn_opcodes_h_l1716_c11_d89f_right,
BIN_OP_EQ_uxn_opcodes_h_l1716_c11_d89f_return_output);

-- t8_MUX_uxn_opcodes_h_l1716_c7_550e
t8_MUX_uxn_opcodes_h_l1716_c7_550e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1716_c7_550e_cond,
t8_MUX_uxn_opcodes_h_l1716_c7_550e_iftrue,
t8_MUX_uxn_opcodes_h_l1716_c7_550e_iffalse,
t8_MUX_uxn_opcodes_h_l1716_c7_550e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_550e
result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_550e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_550e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_550e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_550e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_550e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1716_c7_550e
result_u8_value_MUX_uxn_opcodes_h_l1716_c7_550e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1716_c7_550e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1716_c7_550e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1716_c7_550e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1716_c7_550e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_550e
result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_550e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_550e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_550e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_550e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_550e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1716_c7_550e
result_u16_value_MUX_uxn_opcodes_h_l1716_c7_550e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1716_c7_550e_cond,
result_u16_value_MUX_uxn_opcodes_h_l1716_c7_550e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1716_c7_550e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1716_c7_550e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1716_c7_550e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1716_c7_550e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1716_c7_550e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1716_c7_550e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1716_c7_550e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1716_c7_550e_return_output);

-- n8_MUX_uxn_opcodes_h_l1716_c7_550e
n8_MUX_uxn_opcodes_h_l1716_c7_550e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1716_c7_550e_cond,
n8_MUX_uxn_opcodes_h_l1716_c7_550e_iftrue,
n8_MUX_uxn_opcodes_h_l1716_c7_550e_iffalse,
n8_MUX_uxn_opcodes_h_l1716_c7_550e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1719_c11_e956
BIN_OP_EQ_uxn_opcodes_h_l1719_c11_e956 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1719_c11_e956_left,
BIN_OP_EQ_uxn_opcodes_h_l1719_c11_e956_right,
BIN_OP_EQ_uxn_opcodes_h_l1719_c11_e956_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_8eb2
result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_8eb2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_8eb2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_8eb2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_8eb2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_8eb2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1719_c7_8eb2
result_u8_value_MUX_uxn_opcodes_h_l1719_c7_8eb2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1719_c7_8eb2
result_is_ram_write_MUX_uxn_opcodes_h_l1719_c7_8eb2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1719_c7_8eb2_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1719_c7_8eb2_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1719_c7_8eb2_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1719_c7_8eb2_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1719_c7_8eb2
result_u16_value_MUX_uxn_opcodes_h_l1719_c7_8eb2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_cond,
result_u16_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1719_c7_8eb2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1719_c7_8eb2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1719_c7_8eb2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1719_c7_8eb2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1719_c7_8eb2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1719_c7_8eb2_return_output);

-- n8_MUX_uxn_opcodes_h_l1719_c7_8eb2
n8_MUX_uxn_opcodes_h_l1719_c7_8eb2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1719_c7_8eb2_cond,
n8_MUX_uxn_opcodes_h_l1719_c7_8eb2_iftrue,
n8_MUX_uxn_opcodes_h_l1719_c7_8eb2_iffalse,
n8_MUX_uxn_opcodes_h_l1719_c7_8eb2_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1721_c30_79d5
sp_relative_shift_uxn_opcodes_h_l1721_c30_79d5 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1721_c30_79d5_ins,
sp_relative_shift_uxn_opcodes_h_l1721_c30_79d5_x,
sp_relative_shift_uxn_opcodes_h_l1721_c30_79d5_y,
sp_relative_shift_uxn_opcodes_h_l1721_c30_79d5_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1723_c22_a40e
BIN_OP_PLUS_uxn_opcodes_h_l1723_c22_a40e : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1723_c22_a40e_left,
BIN_OP_PLUS_uxn_opcodes_h_l1723_c22_a40e_right,
BIN_OP_PLUS_uxn_opcodes_h_l1723_c22_a40e_return_output);



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
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1700_c6_66c6_return_output,
 t8_MUX_uxn_opcodes_h_l1700_c2_a399_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_a399_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1700_c2_a399_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1700_c2_a399_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_a399_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_a399_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1700_c2_a399_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1700_c2_a399_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_a399_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1700_c2_a399_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1700_c2_a399_return_output,
 n8_MUX_uxn_opcodes_h_l1700_c2_a399_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1713_c11_1cda_return_output,
 t8_MUX_uxn_opcodes_h_l1713_c7_724a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_724a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_724a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1713_c7_724a_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_724a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1713_c7_724a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_724a_return_output,
 n8_MUX_uxn_opcodes_h_l1713_c7_724a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1716_c11_d89f_return_output,
 t8_MUX_uxn_opcodes_h_l1716_c7_550e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_550e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1716_c7_550e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_550e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1716_c7_550e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1716_c7_550e_return_output,
 n8_MUX_uxn_opcodes_h_l1716_c7_550e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1719_c11_e956_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_8eb2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1719_c7_8eb2_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1719_c7_8eb2_return_output,
 n8_MUX_uxn_opcodes_h_l1719_c7_8eb2_return_output,
 sp_relative_shift_uxn_opcodes_h_l1721_c30_79d5_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1723_c22_a40e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c6_66c6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c6_66c6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c6_66c6_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1713_c7_724a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1700_c2_a399_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1700_c2_a399_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_724a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_a399_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_a399_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1700_c2_a399_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1700_c2_a399_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1700_c2_a399_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_724a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1700_c2_a399_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1700_c2_a399_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1700_c2_a399_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_a399_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_a399_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1710_c3_65e0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_724a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_a399_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_a399_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1713_c7_724a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c2_a399_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c2_a399_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1713_c7_724a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1700_c2_a399_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1700_c2_a399_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1705_c3_3516 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_724a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_a399_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_a399_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1700_c2_a399_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1700_c2_a399_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1700_c2_a399_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1700_c2_a399_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1700_c2_a399_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1700_c2_a399_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1713_c7_724a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1700_c2_a399_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1700_c2_a399_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_1cda_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_1cda_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_1cda_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1713_c7_724a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1713_c7_724a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1716_c7_550e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1713_c7_724a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_724a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_724a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_550e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_724a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_724a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1714_c3_fb5d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_724a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1713_c7_724a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_724a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1713_c7_724a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1713_c7_724a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1716_c7_550e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1713_c7_724a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_724a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_724a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_550e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_724a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1713_c7_724a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1713_c7_724a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1716_c7_550e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1713_c7_724a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_724a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_724a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1716_c7_550e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_724a_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1713_c7_724a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1713_c7_724a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1716_c7_550e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1713_c7_724a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1716_c11_d89f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1716_c11_d89f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1716_c11_d89f_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1716_c7_550e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1716_c7_550e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1716_c7_550e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_550e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_550e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_8eb2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_550e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1716_c7_550e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1716_c7_550e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1716_c7_550e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_550e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_550e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1719_c7_8eb2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_550e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1716_c7_550e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1716_c7_550e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1716_c7_550e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1716_c7_550e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1716_c7_550e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1719_c7_8eb2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1716_c7_550e_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1716_c7_550e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1716_c7_550e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1719_c7_8eb2_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1716_c7_550e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_e956_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_e956_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_e956_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_8eb2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_8eb2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_8eb2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1719_c7_8eb2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1719_c7_8eb2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1719_c7_8eb2_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1723_c3_5be0 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1719_c7_8eb2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1719_c7_8eb2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1719_c7_8eb2_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1719_c7_8eb2_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1719_c7_8eb2_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1719_c7_8eb2_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1721_c30_79d5_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1721_c30_79d5_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1721_c30_79d5_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1721_c30_79d5_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1723_c22_a40e_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1723_c27_b2f1_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1723_c22_a40e_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1723_c22_a40e_return_output : signed(17 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1716_l1700_l1719_l1713_DUPLICATE_fa0c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1716_l1700_l1719_l1713_DUPLICATE_3c19_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1716_l1719_l1713_DUPLICATE_cddc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1716_l1719_l1713_DUPLICATE_4155_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1716_l1719_l1713_DUPLICATE_c22d_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l1696_l1728_DUPLICATE_f6b3_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_e956_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1705_c3_3516 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1705_c3_3516;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c6_66c6_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1721_c30_79d5_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1710_c3_65e0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1710_c3_65e0;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1719_c7_8eb2_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1714_c3_fb5d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_724a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1714_c3_fb5d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1716_c11_d89f_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_1cda_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1721_c30_79d5_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_8eb2_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1721_c30_79d5_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1713_c7_724a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1716_c7_550e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1719_c7_8eb2_iffalse := n8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1723_c22_a40e_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c6_66c6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_1cda_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1716_c11_d89f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_e956_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1719_c7_8eb2_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1716_c7_550e_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1713_c7_724a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1716_c7_550e_iffalse := t8;
     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1713_c7_724a] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1713_c7_724a_return_output := result.stack_address_sp_offset;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1700_c2_a399] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1700_c2_a399_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1716_c11_d89f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1716_c11_d89f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1716_c11_d89f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1716_c11_d89f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1716_c11_d89f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1716_c11_d89f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1716_c11_d89f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1713_c11_1cda] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1713_c11_1cda_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_1cda_left;
     BIN_OP_EQ_uxn_opcodes_h_l1713_c11_1cda_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_1cda_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_1cda_return_output := BIN_OP_EQ_uxn_opcodes_h_l1713_c11_1cda_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1716_l1700_l1719_l1713_DUPLICATE_fa0c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1716_l1700_l1719_l1713_DUPLICATE_fa0c_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1716_l1719_l1713_DUPLICATE_4155 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1716_l1719_l1713_DUPLICATE_4155_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1716_l1719_l1713_DUPLICATE_cddc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1716_l1719_l1713_DUPLICATE_cddc_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1719_c11_e956] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1719_c11_e956_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_e956_left;
     BIN_OP_EQ_uxn_opcodes_h_l1719_c11_e956_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_e956_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_e956_return_output := BIN_OP_EQ_uxn_opcodes_h_l1719_c11_e956_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1700_c6_66c6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1700_c6_66c6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c6_66c6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1700_c6_66c6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c6_66c6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c6_66c6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1700_c6_66c6_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1700_c2_a399] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1700_c2_a399_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1716_l1700_l1719_l1713_DUPLICATE_3c19 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1716_l1700_l1719_l1713_DUPLICATE_3c19_return_output := result.u16_value;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l1700_c2_a399] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1700_c2_a399_return_output := result.is_stack_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1700_c2_a399] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1700_c2_a399_return_output := result.is_stack_index_flipped;

     -- sp_relative_shift[uxn_opcodes_h_l1721_c30_79d5] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1721_c30_79d5_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1721_c30_79d5_ins;
     sp_relative_shift_uxn_opcodes_h_l1721_c30_79d5_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1721_c30_79d5_x;
     sp_relative_shift_uxn_opcodes_h_l1721_c30_79d5_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1721_c30_79d5_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1721_c30_79d5_return_output := sp_relative_shift_uxn_opcodes_h_l1721_c30_79d5_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1723_c27_b2f1] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1723_c27_b2f1_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1716_l1719_l1713_DUPLICATE_c22d LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1716_l1719_l1713_DUPLICATE_c22d_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l1700_c2_a399_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c6_66c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_a399_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c6_66c6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1700_c2_a399_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c6_66c6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1700_c2_a399_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c6_66c6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1700_c2_a399_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c6_66c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_a399_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c6_66c6_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1700_c2_a399_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c6_66c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_a399_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c6_66c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_a399_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c6_66c6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1700_c2_a399_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c6_66c6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c2_a399_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c6_66c6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1700_c2_a399_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c6_66c6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1713_c7_724a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_1cda_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_724a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_1cda_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_724a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_1cda_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_724a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_1cda_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_724a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_1cda_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1713_c7_724a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_1cda_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1713_c7_724a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_1cda_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1713_c7_724a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1713_c11_1cda_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1716_c7_550e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1716_c11_d89f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_550e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1716_c11_d89f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_550e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1716_c11_d89f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1716_c7_550e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1716_c11_d89f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1716_c7_550e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1716_c11_d89f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1716_c7_550e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1716_c11_d89f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1716_c7_550e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1716_c11_d89f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1719_c7_8eb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_e956_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_8eb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_e956_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1719_c7_8eb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_e956_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1719_c7_8eb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_e956_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_e956_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1719_c11_e956_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1723_c22_a40e_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1723_c27_b2f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_724a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1716_l1719_l1713_DUPLICATE_c22d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1716_c7_550e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1716_l1719_l1713_DUPLICATE_c22d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1719_c7_8eb2_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1716_l1719_l1713_DUPLICATE_c22d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1716_l1700_l1719_l1713_DUPLICATE_3c19_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1713_c7_724a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1716_l1700_l1719_l1713_DUPLICATE_3c19_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1716_c7_550e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1716_l1700_l1719_l1713_DUPLICATE_3c19_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1716_l1700_l1719_l1713_DUPLICATE_3c19_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_724a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1716_l1719_l1713_DUPLICATE_cddc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_550e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1716_l1719_l1713_DUPLICATE_cddc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_8eb2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1716_l1719_l1713_DUPLICATE_cddc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_724a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1716_l1719_l1713_DUPLICATE_4155_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_550e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1716_l1719_l1713_DUPLICATE_4155_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1719_c7_8eb2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1716_l1719_l1713_DUPLICATE_4155_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1716_l1700_l1719_l1713_DUPLICATE_fa0c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1713_c7_724a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1716_l1700_l1719_l1713_DUPLICATE_fa0c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1716_c7_550e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1716_l1700_l1719_l1713_DUPLICATE_fa0c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1716_l1700_l1719_l1713_DUPLICATE_fa0c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1700_c2_a399_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1700_c2_a399_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1700_c2_a399_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1700_c2_a399_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_724a_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1713_c7_724a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1719_c7_8eb2_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1721_c30_79d5_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1700_c2_a399] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1700_c2_a399_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1700_c2_a399_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1700_c2_a399_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1700_c2_a399_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1700_c2_a399] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1700_c2_a399_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1700_c2_a399_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1700_c2_a399_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1700_c2_a399_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1713_c7_724a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_724a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_724a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_724a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_724a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_724a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_724a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_724a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_724a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1719_c7_8eb2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1723_c22_a40e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1723_c22_a40e_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1723_c22_a40e_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1723_c22_a40e_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1723_c22_a40e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1723_c22_a40e_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1723_c22_a40e_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1700_c2_a399] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1700_c2_a399_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1700_c2_a399_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1700_c2_a399_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1700_c2_a399_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1719_c7_8eb2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1719_c7_8eb2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1719_c7_8eb2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1719_c7_8eb2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1719_c7_8eb2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1719_c7_8eb2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1719_c7_8eb2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1719_c7_8eb2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1719_c7_8eb2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1700_c2_a399] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_a399_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_a399_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_a399_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_a399_return_output;

     -- t8_MUX[uxn_opcodes_h_l1716_c7_550e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1716_c7_550e_cond <= VAR_t8_MUX_uxn_opcodes_h_l1716_c7_550e_cond;
     t8_MUX_uxn_opcodes_h_l1716_c7_550e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1716_c7_550e_iftrue;
     t8_MUX_uxn_opcodes_h_l1716_c7_550e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1716_c7_550e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1716_c7_550e_return_output := t8_MUX_uxn_opcodes_h_l1716_c7_550e_return_output;

     -- n8_MUX[uxn_opcodes_h_l1719_c7_8eb2] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1719_c7_8eb2_cond <= VAR_n8_MUX_uxn_opcodes_h_l1719_c7_8eb2_cond;
     n8_MUX_uxn_opcodes_h_l1719_c7_8eb2_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1719_c7_8eb2_iftrue;
     n8_MUX_uxn_opcodes_h_l1719_c7_8eb2_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1719_c7_8eb2_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1719_c7_8eb2_return_output := n8_MUX_uxn_opcodes_h_l1719_c7_8eb2_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1719_c7_8eb2] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1719_c7_8eb2_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1719_c7_8eb2_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1719_c7_8eb2_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1719_c7_8eb2_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1719_c7_8eb2_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1719_c7_8eb2_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1719_c7_8eb2_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1719_c7_8eb2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1719_c7_8eb2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_8eb2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_8eb2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_8eb2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_8eb2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_8eb2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_8eb2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_8eb2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_8eb2_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l1723_c3_5be0 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1723_c22_a40e_return_output)),16);
     VAR_n8_MUX_uxn_opcodes_h_l1716_c7_550e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1719_c7_8eb2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_550e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1719_c7_8eb2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_550e_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1719_c7_8eb2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1716_c7_550e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1719_c7_8eb2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1713_c7_724a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1716_c7_550e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1713_c7_724a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1716_c7_550e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1723_c3_5be0;
     -- n8_MUX[uxn_opcodes_h_l1716_c7_550e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1716_c7_550e_cond <= VAR_n8_MUX_uxn_opcodes_h_l1716_c7_550e_cond;
     n8_MUX_uxn_opcodes_h_l1716_c7_550e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1716_c7_550e_iftrue;
     n8_MUX_uxn_opcodes_h_l1716_c7_550e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1716_c7_550e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1716_c7_550e_return_output := n8_MUX_uxn_opcodes_h_l1716_c7_550e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1716_c7_550e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_550e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_550e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_550e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_550e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_550e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_550e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_550e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_550e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1700_c2_a399] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_a399_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_a399_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_a399_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_a399_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1716_c7_550e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1716_c7_550e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1716_c7_550e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1716_c7_550e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1716_c7_550e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1716_c7_550e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1716_c7_550e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1716_c7_550e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1716_c7_550e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1716_c7_550e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1716_c7_550e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1716_c7_550e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1716_c7_550e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1716_c7_550e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1716_c7_550e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1716_c7_550e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1716_c7_550e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1716_c7_550e_return_output;

     -- t8_MUX[uxn_opcodes_h_l1713_c7_724a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1713_c7_724a_cond <= VAR_t8_MUX_uxn_opcodes_h_l1713_c7_724a_cond;
     t8_MUX_uxn_opcodes_h_l1713_c7_724a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1713_c7_724a_iftrue;
     t8_MUX_uxn_opcodes_h_l1713_c7_724a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1713_c7_724a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1713_c7_724a_return_output := t8_MUX_uxn_opcodes_h_l1713_c7_724a_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1716_c7_550e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_550e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_550e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_550e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_550e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_550e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_550e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_550e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_550e_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1719_c7_8eb2] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_return_output := result_u16_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l1713_c7_724a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1716_c7_550e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_724a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_550e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_724a_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_550e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_724a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1716_c7_550e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1716_c7_550e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1719_c7_8eb2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1713_c7_724a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1716_c7_550e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1713_c7_724a_return_output;
     -- t8_MUX[uxn_opcodes_h_l1700_c2_a399] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1700_c2_a399_cond <= VAR_t8_MUX_uxn_opcodes_h_l1700_c2_a399_cond;
     t8_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue;
     t8_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1700_c2_a399_return_output := t8_MUX_uxn_opcodes_h_l1700_c2_a399_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1713_c7_724a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_724a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_724a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_724a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_724a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_724a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_724a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_724a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_724a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1713_c7_724a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_724a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_724a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_724a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_724a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_724a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_724a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_724a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_724a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1716_c7_550e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1716_c7_550e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1716_c7_550e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1716_c7_550e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1716_c7_550e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1716_c7_550e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1716_c7_550e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1716_c7_550e_return_output := result_u16_value_MUX_uxn_opcodes_h_l1716_c7_550e_return_output;

     -- n8_MUX[uxn_opcodes_h_l1713_c7_724a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1713_c7_724a_cond <= VAR_n8_MUX_uxn_opcodes_h_l1713_c7_724a_cond;
     n8_MUX_uxn_opcodes_h_l1713_c7_724a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1713_c7_724a_iftrue;
     n8_MUX_uxn_opcodes_h_l1713_c7_724a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1713_c7_724a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1713_c7_724a_return_output := n8_MUX_uxn_opcodes_h_l1713_c7_724a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1713_c7_724a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_724a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_724a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_724a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_724a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_724a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_724a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_724a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_724a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1713_c7_724a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1713_c7_724a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1713_c7_724a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1713_c7_724a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1713_c7_724a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1713_c7_724a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1713_c7_724a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1713_c7_724a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1713_c7_724a_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1713_c7_724a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1713_c7_724a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1713_c7_724a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1713_c7_724a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1713_c7_724a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1716_c7_550e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1713_c7_724a_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1700_c2_a399_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1713_c7_724a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1713_c7_724a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1713_c7_724a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1713_c7_724a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1713_c7_724a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1713_c7_724a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1713_c7_724a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1713_c7_724a_return_output := result_u16_value_MUX_uxn_opcodes_h_l1713_c7_724a_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1700_c2_a399] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1700_c2_a399_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1700_c2_a399_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1700_c2_a399_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1700_c2_a399_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1700_c2_a399] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1700_c2_a399_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c2_a399_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c2_a399_return_output := result_u8_value_MUX_uxn_opcodes_h_l1700_c2_a399_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1700_c2_a399] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_a399_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_a399_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_a399_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_a399_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1700_c2_a399] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_a399_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_a399_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_a399_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_a399_return_output;

     -- n8_MUX[uxn_opcodes_h_l1700_c2_a399] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1700_c2_a399_cond <= VAR_n8_MUX_uxn_opcodes_h_l1700_c2_a399_cond;
     n8_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue;
     n8_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1700_c2_a399_return_output := n8_MUX_uxn_opcodes_h_l1700_c2_a399_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1700_c2_a399_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1713_c7_724a_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1700_c2_a399] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1700_c2_a399_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1700_c2_a399_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1700_c2_a399_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1700_c2_a399_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1700_c2_a399_return_output := result_u16_value_MUX_uxn_opcodes_h_l1700_c2_a399_return_output;

     -- Submodule level 6
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l1696_l1728_DUPLICATE_f6b3 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l1696_l1728_DUPLICATE_f6b3_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_9f32(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c2_a399_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1700_c2_a399_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1700_c2_a399_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c2_a399_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c2_a399_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c2_a399_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1700_c2_a399_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c2_a399_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1700_c2_a399_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1700_c2_a399_return_output);

     -- Submodule level 7
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l1696_l1728_DUPLICATE_f6b3_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l1696_l1728_DUPLICATE_f6b3_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
