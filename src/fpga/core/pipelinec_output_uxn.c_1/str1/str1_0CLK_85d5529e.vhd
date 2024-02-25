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
-- BIN_OP_EQ[uxn_opcodes_h_l1682_c6_9f06]
signal BIN_OP_EQ_uxn_opcodes_h_l1682_c6_9f06_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1682_c6_9f06_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1682_c6_9f06_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1682_c2_a3a0]
signal t8_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1682_c2_a3a0]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1682_c2_a3a0]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1682_c2_a3a0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1682_c2_a3a0]
signal result_u8_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1682_c2_a3a0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1682_c2_a3a0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1682_c2_a3a0]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1682_c2_a3a0]
signal result_u16_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1682_c2_a3a0]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1682_c2_a3a0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output : unsigned(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l1682_c2_a3a0]
signal n8_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1695_c11_0ff5]
signal BIN_OP_EQ_uxn_opcodes_h_l1695_c11_0ff5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1695_c11_0ff5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1695_c11_0ff5_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1695_c7_5109]
signal t8_MUX_uxn_opcodes_h_l1695_c7_5109_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1695_c7_5109_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1695_c7_5109_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1695_c7_5109_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1695_c7_5109]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_5109_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_5109_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_5109_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_5109_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1695_c7_5109]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_5109_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_5109_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_5109_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_5109_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1695_c7_5109]
signal result_u8_value_MUX_uxn_opcodes_h_l1695_c7_5109_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1695_c7_5109_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1695_c7_5109_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1695_c7_5109_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1695_c7_5109]
signal result_u16_value_MUX_uxn_opcodes_h_l1695_c7_5109_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1695_c7_5109_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1695_c7_5109_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1695_c7_5109_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1695_c7_5109]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_5109_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_5109_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_5109_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_5109_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1695_c7_5109]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_5109_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_5109_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_5109_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_5109_return_output : unsigned(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l1695_c7_5109]
signal n8_MUX_uxn_opcodes_h_l1695_c7_5109_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1695_c7_5109_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1695_c7_5109_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1695_c7_5109_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1698_c11_2eb2]
signal BIN_OP_EQ_uxn_opcodes_h_l1698_c11_2eb2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1698_c11_2eb2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1698_c11_2eb2_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1698_c7_cbbd]
signal t8_MUX_uxn_opcodes_h_l1698_c7_cbbd_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1698_c7_cbbd_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1698_c7_cbbd_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1698_c7_cbbd_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1698_c7_cbbd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_cbbd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_cbbd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_cbbd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_cbbd_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1698_c7_cbbd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_cbbd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_cbbd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_cbbd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_cbbd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1698_c7_cbbd]
signal result_u8_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1698_c7_cbbd]
signal result_u16_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1698_c7_cbbd]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_cbbd_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_cbbd_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_cbbd_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_cbbd_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1698_c7_cbbd]
signal n8_MUX_uxn_opcodes_h_l1698_c7_cbbd_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1698_c7_cbbd_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1698_c7_cbbd_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1698_c7_cbbd_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1701_c11_eba2]
signal BIN_OP_EQ_uxn_opcodes_h_l1701_c11_eba2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1701_c11_eba2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1701_c11_eba2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1701_c7_003e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_003e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_003e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_003e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_003e_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1701_c7_003e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_003e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_003e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_003e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_003e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1701_c7_003e]
signal result_u8_value_MUX_uxn_opcodes_h_l1701_c7_003e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1701_c7_003e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1701_c7_003e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1701_c7_003e_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1701_c7_003e]
signal result_u16_value_MUX_uxn_opcodes_h_l1701_c7_003e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1701_c7_003e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1701_c7_003e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1701_c7_003e_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1701_c7_003e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_003e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_003e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_003e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_003e_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1701_c7_003e]
signal n8_MUX_uxn_opcodes_h_l1701_c7_003e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1701_c7_003e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1701_c7_003e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1701_c7_003e_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1703_c30_7fce]
signal sp_relative_shift_uxn_opcodes_h_l1703_c30_7fce_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1703_c30_7fce_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1703_c30_7fce_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1703_c30_7fce_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1705_c22_5465]
signal BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_5465_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_5465_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_5465_return_output : signed(17 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_1899( ref_toks_0 : opcode_result_t;
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
      base.is_stack_index_flipped := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.u16_value := ref_toks_8;
      base.is_ram_write := ref_toks_9;
      base.stack_address_sp_offset := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1682_c6_9f06
BIN_OP_EQ_uxn_opcodes_h_l1682_c6_9f06 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1682_c6_9f06_left,
BIN_OP_EQ_uxn_opcodes_h_l1682_c6_9f06_right,
BIN_OP_EQ_uxn_opcodes_h_l1682_c6_9f06_return_output);

-- t8_MUX_uxn_opcodes_h_l1682_c2_a3a0
t8_MUX_uxn_opcodes_h_l1682_c2_a3a0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond,
t8_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue,
t8_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse,
t8_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_a3a0
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_a3a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_a3a0
result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_a3a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_a3a0
result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_a3a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1682_c2_a3a0
result_u8_value_MUX_uxn_opcodes_h_l1682_c2_a3a0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_a3a0
result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_a3a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_a3a0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_a3a0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0
result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1682_c2_a3a0
result_u16_value_MUX_uxn_opcodes_h_l1682_c2_a3a0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond,
result_u16_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0
result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_a3a0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_a3a0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output);

-- n8_MUX_uxn_opcodes_h_l1682_c2_a3a0
n8_MUX_uxn_opcodes_h_l1682_c2_a3a0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond,
n8_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue,
n8_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse,
n8_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1695_c11_0ff5
BIN_OP_EQ_uxn_opcodes_h_l1695_c11_0ff5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1695_c11_0ff5_left,
BIN_OP_EQ_uxn_opcodes_h_l1695_c11_0ff5_right,
BIN_OP_EQ_uxn_opcodes_h_l1695_c11_0ff5_return_output);

-- t8_MUX_uxn_opcodes_h_l1695_c7_5109
t8_MUX_uxn_opcodes_h_l1695_c7_5109 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1695_c7_5109_cond,
t8_MUX_uxn_opcodes_h_l1695_c7_5109_iftrue,
t8_MUX_uxn_opcodes_h_l1695_c7_5109_iffalse,
t8_MUX_uxn_opcodes_h_l1695_c7_5109_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_5109
result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_5109 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_5109_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_5109_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_5109_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_5109_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_5109
result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_5109 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_5109_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_5109_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_5109_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_5109_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1695_c7_5109
result_u8_value_MUX_uxn_opcodes_h_l1695_c7_5109 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1695_c7_5109_cond,
result_u8_value_MUX_uxn_opcodes_h_l1695_c7_5109_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1695_c7_5109_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1695_c7_5109_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1695_c7_5109
result_u16_value_MUX_uxn_opcodes_h_l1695_c7_5109 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1695_c7_5109_cond,
result_u16_value_MUX_uxn_opcodes_h_l1695_c7_5109_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1695_c7_5109_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1695_c7_5109_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_5109
result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_5109 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_5109_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_5109_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_5109_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_5109_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_5109
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_5109 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_5109_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_5109_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_5109_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_5109_return_output);

-- n8_MUX_uxn_opcodes_h_l1695_c7_5109
n8_MUX_uxn_opcodes_h_l1695_c7_5109 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1695_c7_5109_cond,
n8_MUX_uxn_opcodes_h_l1695_c7_5109_iftrue,
n8_MUX_uxn_opcodes_h_l1695_c7_5109_iffalse,
n8_MUX_uxn_opcodes_h_l1695_c7_5109_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1698_c11_2eb2
BIN_OP_EQ_uxn_opcodes_h_l1698_c11_2eb2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1698_c11_2eb2_left,
BIN_OP_EQ_uxn_opcodes_h_l1698_c11_2eb2_right,
BIN_OP_EQ_uxn_opcodes_h_l1698_c11_2eb2_return_output);

-- t8_MUX_uxn_opcodes_h_l1698_c7_cbbd
t8_MUX_uxn_opcodes_h_l1698_c7_cbbd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1698_c7_cbbd_cond,
t8_MUX_uxn_opcodes_h_l1698_c7_cbbd_iftrue,
t8_MUX_uxn_opcodes_h_l1698_c7_cbbd_iffalse,
t8_MUX_uxn_opcodes_h_l1698_c7_cbbd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_cbbd
result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_cbbd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_cbbd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_cbbd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_cbbd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_cbbd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_cbbd
result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_cbbd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_cbbd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_cbbd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_cbbd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_cbbd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1698_c7_cbbd
result_u8_value_MUX_uxn_opcodes_h_l1698_c7_cbbd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_cond,
result_u8_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1698_c7_cbbd
result_u16_value_MUX_uxn_opcodes_h_l1698_c7_cbbd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_cond,
result_u16_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_cbbd
result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_cbbd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_cbbd_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_cbbd_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_cbbd_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_cbbd_return_output);

-- n8_MUX_uxn_opcodes_h_l1698_c7_cbbd
n8_MUX_uxn_opcodes_h_l1698_c7_cbbd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1698_c7_cbbd_cond,
n8_MUX_uxn_opcodes_h_l1698_c7_cbbd_iftrue,
n8_MUX_uxn_opcodes_h_l1698_c7_cbbd_iffalse,
n8_MUX_uxn_opcodes_h_l1698_c7_cbbd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1701_c11_eba2
BIN_OP_EQ_uxn_opcodes_h_l1701_c11_eba2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1701_c11_eba2_left,
BIN_OP_EQ_uxn_opcodes_h_l1701_c11_eba2_right,
BIN_OP_EQ_uxn_opcodes_h_l1701_c11_eba2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_003e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_003e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_003e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_003e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_003e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_003e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_003e
result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_003e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_003e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_003e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_003e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_003e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1701_c7_003e
result_u8_value_MUX_uxn_opcodes_h_l1701_c7_003e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1701_c7_003e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1701_c7_003e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1701_c7_003e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1701_c7_003e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1701_c7_003e
result_u16_value_MUX_uxn_opcodes_h_l1701_c7_003e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1701_c7_003e_cond,
result_u16_value_MUX_uxn_opcodes_h_l1701_c7_003e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1701_c7_003e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1701_c7_003e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_003e
result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_003e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_003e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_003e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_003e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_003e_return_output);

-- n8_MUX_uxn_opcodes_h_l1701_c7_003e
n8_MUX_uxn_opcodes_h_l1701_c7_003e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1701_c7_003e_cond,
n8_MUX_uxn_opcodes_h_l1701_c7_003e_iftrue,
n8_MUX_uxn_opcodes_h_l1701_c7_003e_iffalse,
n8_MUX_uxn_opcodes_h_l1701_c7_003e_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1703_c30_7fce
sp_relative_shift_uxn_opcodes_h_l1703_c30_7fce : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1703_c30_7fce_ins,
sp_relative_shift_uxn_opcodes_h_l1703_c30_7fce_x,
sp_relative_shift_uxn_opcodes_h_l1703_c30_7fce_y,
sp_relative_shift_uxn_opcodes_h_l1703_c30_7fce_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_5465
BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_5465 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_5465_left,
BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_5465_right,
BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_5465_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1682_c6_9f06_return_output,
 t8_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output,
 n8_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1695_c11_0ff5_return_output,
 t8_MUX_uxn_opcodes_h_l1695_c7_5109_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_5109_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_5109_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1695_c7_5109_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1695_c7_5109_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_5109_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_5109_return_output,
 n8_MUX_uxn_opcodes_h_l1695_c7_5109_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1698_c11_2eb2_return_output,
 t8_MUX_uxn_opcodes_h_l1698_c7_cbbd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_cbbd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_cbbd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_cbbd_return_output,
 n8_MUX_uxn_opcodes_h_l1698_c7_cbbd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1701_c11_eba2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_003e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_003e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1701_c7_003e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1701_c7_003e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_003e_return_output,
 n8_MUX_uxn_opcodes_h_l1701_c7_003e_return_output,
 sp_relative_shift_uxn_opcodes_h_l1703_c30_7fce_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_5465_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_9f06_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_9f06_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_9f06_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1695_c7_5109_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1682_c2_a3a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1682_c2_a3a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1682_c2_a3a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1695_c7_5109_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_5109_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1687_c3_8c1f : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_5109_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1682_c2_a3a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1695_c7_5109_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_5109_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1692_c3_fa3b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_5109_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1695_c7_5109_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_0ff5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_0ff5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_0ff5_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1695_c7_5109_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1695_c7_5109_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1698_c7_cbbd_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1695_c7_5109_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_5109_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_5109_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_cbbd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_5109_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_5109_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_5109_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_cbbd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_5109_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1695_c7_5109_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1695_c7_5109_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1695_c7_5109_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1695_c7_5109_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1695_c7_5109_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1695_c7_5109_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_5109_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_5109_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_cbbd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_5109_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_5109_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1696_c3_1124 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_5109_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1695_c7_5109_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_5109_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1695_c7_5109_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1695_c7_5109_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1698_c7_cbbd_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1695_c7_5109_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_2eb2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_2eb2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_2eb2_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1698_c7_cbbd_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1698_c7_cbbd_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1698_c7_cbbd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_cbbd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_cbbd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_003e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_cbbd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_cbbd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_cbbd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_003e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_cbbd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1701_c7_003e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1701_c7_003e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_cbbd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_cbbd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_003e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_cbbd_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1698_c7_cbbd_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1698_c7_cbbd_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1701_c7_003e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1698_c7_cbbd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_eba2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_eba2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_eba2_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_003e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_003e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_003e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_003e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_003e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_003e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1701_c7_003e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1701_c7_003e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1701_c7_003e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1701_c7_003e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1705_c3_5e7a : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1701_c7_003e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1701_c7_003e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_003e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_003e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_003e_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1701_c7_003e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1701_c7_003e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1701_c7_003e_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1703_c30_7fce_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1703_c30_7fce_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1703_c30_7fce_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1703_c30_7fce_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_5465_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1705_c27_3ba6_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_5465_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_5465_return_output : signed(17 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1698_l1682_l1701_l1695_DUPLICATE_f793_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1698_l1682_l1701_l1695_DUPLICATE_8960_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1698_l1701_l1695_DUPLICATE_d962_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1698_l1701_l1695_DUPLICATE_95b1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1698_l1701_l1695_DUPLICATE_a4a4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1899_uxn_opcodes_h_l1710_l1678_DUPLICATE_39f1_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_9f06_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_0ff5_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1703_c30_7fce_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1687_c3_8c1f := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1687_c3_8c1f;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_eba2_right := to_unsigned(3, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1696_c3_1124 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_5109_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1696_c3_1124;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_2eb2_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1692_c3_fa3b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1692_c3_fa3b;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_003e_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_003e_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1703_c30_7fce_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1703_c30_7fce_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1695_c7_5109_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1698_c7_cbbd_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1701_c7_003e_iffalse := n8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_5465_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_9f06_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_0ff5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_2eb2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_eba2_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1701_c7_003e_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1701_c7_003e_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1698_c7_cbbd_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1695_c7_5109_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1698_c7_cbbd_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1698_l1701_l1695_DUPLICATE_95b1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1698_l1701_l1695_DUPLICATE_95b1_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1695_c11_0ff5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1695_c11_0ff5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_0ff5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1695_c11_0ff5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_0ff5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_0ff5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1695_c11_0ff5_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1705_c27_3ba6] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1705_c27_3ba6_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- sp_relative_shift[uxn_opcodes_h_l1703_c30_7fce] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1703_c30_7fce_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1703_c30_7fce_ins;
     sp_relative_shift_uxn_opcodes_h_l1703_c30_7fce_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1703_c30_7fce_x;
     sp_relative_shift_uxn_opcodes_h_l1703_c30_7fce_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1703_c30_7fce_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1703_c30_7fce_return_output := sp_relative_shift_uxn_opcodes_h_l1703_c30_7fce_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1698_c11_2eb2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1698_c11_2eb2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_2eb2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1698_c11_2eb2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_2eb2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_2eb2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1698_c11_2eb2_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1695_c7_5109] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1695_c7_5109_return_output := result.stack_address_sp_offset;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1682_c2_a3a0] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1682_c2_a3a0_return_output := result.is_vram_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1682_c2_a3a0] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1682_c2_a3a0_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1698_l1701_l1695_DUPLICATE_a4a4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1698_l1701_l1695_DUPLICATE_a4a4_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1701_c11_eba2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1701_c11_eba2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_eba2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1701_c11_eba2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_eba2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_eba2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1701_c11_eba2_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1698_l1682_l1701_l1695_DUPLICATE_8960 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1698_l1682_l1701_l1695_DUPLICATE_8960_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1682_c6_9f06] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1682_c6_9f06_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_9f06_left;
     BIN_OP_EQ_uxn_opcodes_h_l1682_c6_9f06_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_9f06_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_9f06_return_output := BIN_OP_EQ_uxn_opcodes_h_l1682_c6_9f06_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1698_l1682_l1701_l1695_DUPLICATE_f793 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1698_l1682_l1701_l1695_DUPLICATE_f793_return_output := result.u8_value;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l1682_c2_a3a0] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1682_c2_a3a0_return_output := result.is_stack_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1698_l1701_l1695_DUPLICATE_d962 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1698_l1701_l1695_DUPLICATE_d962_return_output := result.sp_relative_shift;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1682_c2_a3a0] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1682_c2_a3a0_return_output := result.is_pc_updated;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_9f06_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_9f06_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_9f06_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_9f06_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_9f06_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_9f06_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_9f06_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_9f06_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_9f06_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_9f06_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_9f06_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_9f06_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1695_c7_5109_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_0ff5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_5109_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_0ff5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_5109_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_0ff5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_5109_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_0ff5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_5109_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_0ff5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1695_c7_5109_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_0ff5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1695_c7_5109_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_0ff5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1695_c7_5109_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_0ff5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1698_c7_cbbd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_2eb2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_cbbd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_2eb2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_cbbd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_2eb2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_cbbd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_2eb2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_2eb2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_2eb2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1698_c7_cbbd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_2eb2_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1701_c7_003e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_eba2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_003e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_eba2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_003e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_eba2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_003e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_eba2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1701_c7_003e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_eba2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1701_c7_003e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_eba2_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_5465_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1705_c27_3ba6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_5109_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1698_l1701_l1695_DUPLICATE_d962_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_cbbd_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1698_l1701_l1695_DUPLICATE_d962_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_003e_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1698_l1701_l1695_DUPLICATE_d962_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1698_l1682_l1701_l1695_DUPLICATE_8960_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1695_c7_5109_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1698_l1682_l1701_l1695_DUPLICATE_8960_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1698_l1682_l1701_l1695_DUPLICATE_8960_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1701_c7_003e_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1698_l1682_l1701_l1695_DUPLICATE_8960_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_5109_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1698_l1701_l1695_DUPLICATE_95b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_cbbd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1698_l1701_l1695_DUPLICATE_95b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_003e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1698_l1701_l1695_DUPLICATE_95b1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_5109_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1698_l1701_l1695_DUPLICATE_a4a4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_cbbd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1698_l1701_l1695_DUPLICATE_a4a4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_003e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1698_l1701_l1695_DUPLICATE_a4a4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1698_l1682_l1701_l1695_DUPLICATE_f793_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1695_c7_5109_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1698_l1682_l1701_l1695_DUPLICATE_f793_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1698_l1682_l1701_l1695_DUPLICATE_f793_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1701_c7_003e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1698_l1682_l1701_l1695_DUPLICATE_f793_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1682_c2_a3a0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1682_c2_a3a0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1682_c2_a3a0_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1682_c2_a3a0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_5109_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1695_c7_5109_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_003e_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1703_c30_7fce_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1701_c7_003e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_003e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_003e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_003e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_003e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_003e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_003e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_003e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_003e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1701_c7_003e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_003e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_003e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_003e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_003e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_003e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_003e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_003e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_003e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1701_c7_003e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1701_c7_003e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1701_c7_003e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1701_c7_003e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1701_c7_003e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1701_c7_003e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1701_c7_003e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1701_c7_003e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1701_c7_003e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1695_c7_5109] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_5109_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_5109_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_5109_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_5109_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_5109_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_5109_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_5109_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_5109_return_output;

     -- t8_MUX[uxn_opcodes_h_l1698_c7_cbbd] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1698_c7_cbbd_cond <= VAR_t8_MUX_uxn_opcodes_h_l1698_c7_cbbd_cond;
     t8_MUX_uxn_opcodes_h_l1698_c7_cbbd_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1698_c7_cbbd_iftrue;
     t8_MUX_uxn_opcodes_h_l1698_c7_cbbd_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1698_c7_cbbd_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1698_c7_cbbd_return_output := t8_MUX_uxn_opcodes_h_l1698_c7_cbbd_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1705_c22_5465] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_5465_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_5465_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_5465_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_5465_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_5465_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_5465_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1682_c2_a3a0] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1682_c2_a3a0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1682_c2_a3a0] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output;

     -- n8_MUX[uxn_opcodes_h_l1701_c7_003e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1701_c7_003e_cond <= VAR_n8_MUX_uxn_opcodes_h_l1701_c7_003e_cond;
     n8_MUX_uxn_opcodes_h_l1701_c7_003e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1701_c7_003e_iftrue;
     n8_MUX_uxn_opcodes_h_l1701_c7_003e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1701_c7_003e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1701_c7_003e_return_output := n8_MUX_uxn_opcodes_h_l1701_c7_003e_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1682_c2_a3a0] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1701_c7_003e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_003e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_003e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_003e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_003e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_003e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_003e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_003e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_003e_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l1705_c3_5e7a := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_5465_return_output)),16);
     VAR_n8_MUX_uxn_opcodes_h_l1698_c7_cbbd_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1701_c7_003e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_cbbd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_003e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_cbbd_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_003e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_cbbd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_003e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_5109_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1701_c7_003e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1695_c7_5109_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1698_c7_cbbd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1701_c7_003e_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1705_c3_5e7a;
     -- result_u8_value_MUX[uxn_opcodes_h_l1698_c7_cbbd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_return_output := result_u8_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1698_c7_cbbd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_cbbd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_cbbd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_cbbd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_cbbd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_cbbd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_cbbd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_cbbd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_cbbd_return_output;

     -- t8_MUX[uxn_opcodes_h_l1695_c7_5109] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1695_c7_5109_cond <= VAR_t8_MUX_uxn_opcodes_h_l1695_c7_5109_cond;
     t8_MUX_uxn_opcodes_h_l1695_c7_5109_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1695_c7_5109_iftrue;
     t8_MUX_uxn_opcodes_h_l1695_c7_5109_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1695_c7_5109_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1695_c7_5109_return_output := t8_MUX_uxn_opcodes_h_l1695_c7_5109_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1698_c7_cbbd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_cbbd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_cbbd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_cbbd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_cbbd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_cbbd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_cbbd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_cbbd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_cbbd_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1701_c7_003e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1701_c7_003e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1701_c7_003e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1701_c7_003e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1701_c7_003e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1701_c7_003e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1701_c7_003e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1701_c7_003e_return_output := result_u16_value_MUX_uxn_opcodes_h_l1701_c7_003e_return_output;

     -- n8_MUX[uxn_opcodes_h_l1698_c7_cbbd] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1698_c7_cbbd_cond <= VAR_n8_MUX_uxn_opcodes_h_l1698_c7_cbbd_cond;
     n8_MUX_uxn_opcodes_h_l1698_c7_cbbd_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1698_c7_cbbd_iftrue;
     n8_MUX_uxn_opcodes_h_l1698_c7_cbbd_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1698_c7_cbbd_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1698_c7_cbbd_return_output := n8_MUX_uxn_opcodes_h_l1698_c7_cbbd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1682_c2_a3a0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1698_c7_cbbd] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_cbbd_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_cbbd_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_cbbd_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_cbbd_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_cbbd_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_cbbd_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_cbbd_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_cbbd_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l1695_c7_5109_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1698_c7_cbbd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_5109_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_cbbd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_5109_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_cbbd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_5109_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_cbbd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1701_c7_003e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1695_c7_5109_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1695_c7_5109_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1695_c7_5109] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_5109_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_5109_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_5109_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_5109_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_5109_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_5109_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_5109_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_5109_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1695_c7_5109] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_5109_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_5109_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_5109_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_5109_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_5109_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_5109_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_5109_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_5109_return_output;

     -- n8_MUX[uxn_opcodes_h_l1695_c7_5109] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1695_c7_5109_cond <= VAR_n8_MUX_uxn_opcodes_h_l1695_c7_5109_cond;
     n8_MUX_uxn_opcodes_h_l1695_c7_5109_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1695_c7_5109_iftrue;
     n8_MUX_uxn_opcodes_h_l1695_c7_5109_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1695_c7_5109_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1695_c7_5109_return_output := n8_MUX_uxn_opcodes_h_l1695_c7_5109_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1695_c7_5109] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1695_c7_5109_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1695_c7_5109_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1695_c7_5109_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1695_c7_5109_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1695_c7_5109_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1695_c7_5109_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1695_c7_5109_return_output := result_u8_value_MUX_uxn_opcodes_h_l1695_c7_5109_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1698_c7_cbbd] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_return_output := result_u16_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1695_c7_5109] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_5109_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_5109_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_5109_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_5109_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_5109_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_5109_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_5109_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_5109_return_output;

     -- t8_MUX[uxn_opcodes_h_l1682_c2_a3a0] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond <= VAR_t8_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond;
     t8_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue;
     t8_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output := t8_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1695_c7_5109_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_5109_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_5109_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_5109_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1695_c7_5109_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1698_c7_cbbd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1695_c7_5109_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1682_c2_a3a0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1682_c2_a3a0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output;

     -- n8_MUX[uxn_opcodes_h_l1682_c2_a3a0] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond <= VAR_n8_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond;
     n8_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue;
     n8_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output := n8_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1682_c2_a3a0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1695_c7_5109] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1695_c7_5109_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1695_c7_5109_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1695_c7_5109_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1695_c7_5109_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1695_c7_5109_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1695_c7_5109_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1695_c7_5109_return_output := result_u16_value_MUX_uxn_opcodes_h_l1695_c7_5109_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1682_c2_a3a0] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1695_c7_5109_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1682_c2_a3a0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output := result_u16_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output;

     -- Submodule level 6
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1899_uxn_opcodes_h_l1710_l1678_DUPLICATE_39f1 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1899_uxn_opcodes_h_l1710_l1678_DUPLICATE_39f1_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1899(
     result,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_a3a0_return_output);

     -- Submodule level 7
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1899_uxn_opcodes_h_l1710_l1678_DUPLICATE_39f1_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1899_uxn_opcodes_h_l1710_l1678_DUPLICATE_39f1_return_output;
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
