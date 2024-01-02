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
-- BIN_OP_EQ[uxn_opcodes_h_l1682_c6_f7b5]
signal BIN_OP_EQ_uxn_opcodes_h_l1682_c6_f7b5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1682_c6_f7b5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1682_c6_f7b5_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1682_c2_e4e5]
signal n8_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1682_c2_e4e5]
signal t8_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1682_c2_e4e5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1682_c2_e4e5]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1682_c2_e4e5]
signal result_u16_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1682_c2_e4e5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1682_c2_e4e5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1682_c2_e4e5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1682_c2_e4e5]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1682_c2_e4e5]
signal result_u8_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1682_c2_e4e5]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1682_c2_e4e5]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1695_c11_235e]
signal BIN_OP_EQ_uxn_opcodes_h_l1695_c11_235e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1695_c11_235e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1695_c11_235e_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1695_c7_75b8]
signal n8_MUX_uxn_opcodes_h_l1695_c7_75b8_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1695_c7_75b8_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1695_c7_75b8_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1695_c7_75b8]
signal t8_MUX_uxn_opcodes_h_l1695_c7_75b8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1695_c7_75b8_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1695_c7_75b8_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1695_c7_75b8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_75b8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_75b8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_75b8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1695_c7_75b8]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_75b8_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_75b8_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_75b8_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1695_c7_75b8]
signal result_u16_value_MUX_uxn_opcodes_h_l1695_c7_75b8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1695_c7_75b8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1695_c7_75b8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1695_c7_75b8]
signal result_u8_value_MUX_uxn_opcodes_h_l1695_c7_75b8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1695_c7_75b8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1695_c7_75b8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1695_c7_75b8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_75b8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_75b8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_75b8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1695_c7_75b8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_75b8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_75b8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_75b8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1698_c11_0bc4]
signal BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0bc4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0bc4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0bc4_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1698_c7_e8cb]
signal n8_MUX_uxn_opcodes_h_l1698_c7_e8cb_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1698_c7_e8cb_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1698_c7_e8cb_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1698_c7_e8cb_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1698_c7_e8cb]
signal t8_MUX_uxn_opcodes_h_l1698_c7_e8cb_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1698_c7_e8cb_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1698_c7_e8cb_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1698_c7_e8cb_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1698_c7_e8cb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_e8cb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_e8cb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_e8cb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_e8cb_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1698_c7_e8cb]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_e8cb_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_e8cb_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_e8cb_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_e8cb_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1698_c7_e8cb]
signal result_u16_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1698_c7_e8cb]
signal result_u8_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1698_c7_e8cb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_e8cb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_e8cb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_e8cb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_e8cb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1701_c11_65c6]
signal BIN_OP_EQ_uxn_opcodes_h_l1701_c11_65c6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1701_c11_65c6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1701_c11_65c6_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1701_c7_19b3]
signal n8_MUX_uxn_opcodes_h_l1701_c7_19b3_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1701_c7_19b3_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1701_c7_19b3_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1701_c7_19b3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1701_c7_19b3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_19b3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_19b3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_19b3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_19b3_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1701_c7_19b3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_19b3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_19b3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_19b3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_19b3_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1701_c7_19b3]
signal result_u16_value_MUX_uxn_opcodes_h_l1701_c7_19b3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1701_c7_19b3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1701_c7_19b3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1701_c7_19b3_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1701_c7_19b3]
signal result_u8_value_MUX_uxn_opcodes_h_l1701_c7_19b3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1701_c7_19b3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1701_c7_19b3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1701_c7_19b3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1701_c7_19b3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_19b3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_19b3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_19b3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_19b3_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1703_c30_3f5d]
signal sp_relative_shift_uxn_opcodes_h_l1703_c30_3f5d_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1703_c30_3f5d_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1703_c30_3f5d_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1703_c30_3f5d_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1705_c22_598e]
signal BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_598e_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_598e_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_598e_return_output : signed(17 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1682_c6_f7b5
BIN_OP_EQ_uxn_opcodes_h_l1682_c6_f7b5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1682_c6_f7b5_left,
BIN_OP_EQ_uxn_opcodes_h_l1682_c6_f7b5_right,
BIN_OP_EQ_uxn_opcodes_h_l1682_c6_f7b5_return_output);

-- n8_MUX_uxn_opcodes_h_l1682_c2_e4e5
n8_MUX_uxn_opcodes_h_l1682_c2_e4e5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond,
n8_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue,
n8_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse,
n8_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output);

-- t8_MUX_uxn_opcodes_h_l1682_c2_e4e5
t8_MUX_uxn_opcodes_h_l1682_c2_e4e5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond,
t8_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue,
t8_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse,
t8_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_e4e5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_e4e5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5
result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1682_c2_e4e5
result_u16_value_MUX_uxn_opcodes_h_l1682_c2_e4e5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond,
result_u16_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_e4e5
result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_e4e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_e4e5
result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_e4e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_e4e5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_e4e5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_e4e5
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_e4e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1682_c2_e4e5
result_u8_value_MUX_uxn_opcodes_h_l1682_c2_e4e5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond,
result_u8_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_e4e5
result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_e4e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5
result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1695_c11_235e
BIN_OP_EQ_uxn_opcodes_h_l1695_c11_235e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1695_c11_235e_left,
BIN_OP_EQ_uxn_opcodes_h_l1695_c11_235e_right,
BIN_OP_EQ_uxn_opcodes_h_l1695_c11_235e_return_output);

-- n8_MUX_uxn_opcodes_h_l1695_c7_75b8
n8_MUX_uxn_opcodes_h_l1695_c7_75b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1695_c7_75b8_cond,
n8_MUX_uxn_opcodes_h_l1695_c7_75b8_iftrue,
n8_MUX_uxn_opcodes_h_l1695_c7_75b8_iffalse,
n8_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output);

-- t8_MUX_uxn_opcodes_h_l1695_c7_75b8
t8_MUX_uxn_opcodes_h_l1695_c7_75b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1695_c7_75b8_cond,
t8_MUX_uxn_opcodes_h_l1695_c7_75b8_iftrue,
t8_MUX_uxn_opcodes_h_l1695_c7_75b8_iffalse,
t8_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_75b8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_75b8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_75b8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_75b8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_75b8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_75b8
result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_75b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_75b8_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_75b8_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_75b8_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1695_c7_75b8
result_u16_value_MUX_uxn_opcodes_h_l1695_c7_75b8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1695_c7_75b8_cond,
result_u16_value_MUX_uxn_opcodes_h_l1695_c7_75b8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1695_c7_75b8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1695_c7_75b8
result_u8_value_MUX_uxn_opcodes_h_l1695_c7_75b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1695_c7_75b8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1695_c7_75b8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1695_c7_75b8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_75b8
result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_75b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_75b8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_75b8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_75b8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_75b8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_75b8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_75b8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_75b8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_75b8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0bc4
BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0bc4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0bc4_left,
BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0bc4_right,
BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0bc4_return_output);

-- n8_MUX_uxn_opcodes_h_l1698_c7_e8cb
n8_MUX_uxn_opcodes_h_l1698_c7_e8cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1698_c7_e8cb_cond,
n8_MUX_uxn_opcodes_h_l1698_c7_e8cb_iftrue,
n8_MUX_uxn_opcodes_h_l1698_c7_e8cb_iffalse,
n8_MUX_uxn_opcodes_h_l1698_c7_e8cb_return_output);

-- t8_MUX_uxn_opcodes_h_l1698_c7_e8cb
t8_MUX_uxn_opcodes_h_l1698_c7_e8cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1698_c7_e8cb_cond,
t8_MUX_uxn_opcodes_h_l1698_c7_e8cb_iftrue,
t8_MUX_uxn_opcodes_h_l1698_c7_e8cb_iffalse,
t8_MUX_uxn_opcodes_h_l1698_c7_e8cb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_e8cb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_e8cb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_e8cb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_e8cb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_e8cb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_e8cb_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_e8cb
result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_e8cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_e8cb_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_e8cb_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_e8cb_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_e8cb_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1698_c7_e8cb
result_u16_value_MUX_uxn_opcodes_h_l1698_c7_e8cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_cond,
result_u16_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1698_c7_e8cb
result_u8_value_MUX_uxn_opcodes_h_l1698_c7_e8cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_cond,
result_u8_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_e8cb
result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_e8cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_e8cb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_e8cb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_e8cb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_e8cb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1701_c11_65c6
BIN_OP_EQ_uxn_opcodes_h_l1701_c11_65c6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1701_c11_65c6_left,
BIN_OP_EQ_uxn_opcodes_h_l1701_c11_65c6_right,
BIN_OP_EQ_uxn_opcodes_h_l1701_c11_65c6_return_output);

-- n8_MUX_uxn_opcodes_h_l1701_c7_19b3
n8_MUX_uxn_opcodes_h_l1701_c7_19b3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1701_c7_19b3_cond,
n8_MUX_uxn_opcodes_h_l1701_c7_19b3_iftrue,
n8_MUX_uxn_opcodes_h_l1701_c7_19b3_iffalse,
n8_MUX_uxn_opcodes_h_l1701_c7_19b3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_19b3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_19b3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_19b3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_19b3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_19b3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_19b3_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_19b3
result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_19b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_19b3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_19b3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_19b3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_19b3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1701_c7_19b3
result_u16_value_MUX_uxn_opcodes_h_l1701_c7_19b3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1701_c7_19b3_cond,
result_u16_value_MUX_uxn_opcodes_h_l1701_c7_19b3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1701_c7_19b3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1701_c7_19b3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1701_c7_19b3
result_u8_value_MUX_uxn_opcodes_h_l1701_c7_19b3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1701_c7_19b3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1701_c7_19b3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1701_c7_19b3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1701_c7_19b3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_19b3
result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_19b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_19b3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_19b3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_19b3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_19b3_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1703_c30_3f5d
sp_relative_shift_uxn_opcodes_h_l1703_c30_3f5d : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1703_c30_3f5d_ins,
sp_relative_shift_uxn_opcodes_h_l1703_c30_3f5d_x,
sp_relative_shift_uxn_opcodes_h_l1703_c30_3f5d_y,
sp_relative_shift_uxn_opcodes_h_l1703_c30_3f5d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_598e
BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_598e : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_598e_left,
BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_598e_right,
BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_598e_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1682_c6_f7b5_return_output,
 n8_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output,
 t8_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1695_c11_235e_return_output,
 n8_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output,
 t8_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0bc4_return_output,
 n8_MUX_uxn_opcodes_h_l1698_c7_e8cb_return_output,
 t8_MUX_uxn_opcodes_h_l1698_c7_e8cb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_e8cb_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_e8cb_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_e8cb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1701_c11_65c6_return_output,
 n8_MUX_uxn_opcodes_h_l1701_c7_19b3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_19b3_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_19b3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1701_c7_19b3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1701_c7_19b3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_19b3_return_output,
 sp_relative_shift_uxn_opcodes_h_l1703_c30_3f5d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_598e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_f7b5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_f7b5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_f7b5_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1687_c3_dede : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1682_c2_e4e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1692_c3_68e5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1682_c2_e4e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1682_c2_e4e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1682_c2_e4e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_235e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_235e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_235e_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1695_c7_75b8_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1695_c7_75b8_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1698_c7_e8cb_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1695_c7_75b8_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1695_c7_75b8_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1695_c7_75b8_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1698_c7_e8cb_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1695_c7_75b8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_75b8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_75b8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_e8cb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_75b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_75b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_75b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_e8cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_75b8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1695_c7_75b8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1695_c7_75b8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1695_c7_75b8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1695_c7_75b8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1695_c7_75b8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1695_c7_75b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_75b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_75b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_e8cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_75b8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_75b8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1696_c3_c976 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_75b8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1695_c7_75b8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_75b8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0bc4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0bc4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0bc4_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1698_c7_e8cb_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1698_c7_e8cb_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1701_c7_19b3_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1698_c7_e8cb_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1698_c7_e8cb_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1698_c7_e8cb_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1698_c7_e8cb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_e8cb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_e8cb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_19b3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_e8cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_e8cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_e8cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_19b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_e8cb_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1701_c7_19b3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1701_c7_19b3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_e8cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_e8cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_19b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_e8cb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_65c6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_65c6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_65c6_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1701_c7_19b3_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1701_c7_19b3_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1701_c7_19b3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_19b3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_19b3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_19b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_19b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_19b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_19b3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1701_c7_19b3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1705_c3_d9f2 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1701_c7_19b3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1701_c7_19b3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1701_c7_19b3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1701_c7_19b3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1701_c7_19b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_19b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_19b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_19b3_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1703_c30_3f5d_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1703_c30_3f5d_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1703_c30_3f5d_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1703_c30_3f5d_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_598e_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1705_c27_d051_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_598e_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_598e_return_output : signed(17 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1698_l1682_l1701_l1695_DUPLICATE_769e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1698_l1682_l1701_l1695_DUPLICATE_1a3c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1698_l1701_l1695_DUPLICATE_9203_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1698_l1701_l1695_DUPLICATE_d42a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1698_l1701_l1695_DUPLICATE_1dc1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l1710_l1678_DUPLICATE_6c7d_return_output : opcode_result_t;
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
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1687_c3_dede := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1687_c3_dede;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1696_c3_c976 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_75b8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1696_c3_c976;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1692_c3_68e5 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1692_c3_68e5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_65c6_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1703_c30_3f5d_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1703_c30_3f5d_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0bc4_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_19b3_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_235e_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_f7b5_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_19b3_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1703_c30_3f5d_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1695_c7_75b8_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1698_c7_e8cb_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1701_c7_19b3_iffalse := n8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_598e_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_f7b5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_235e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0bc4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_65c6_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1701_c7_19b3_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1701_c7_19b3_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1698_c7_e8cb_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1695_c7_75b8_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1698_c7_e8cb_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1698_c11_0bc4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0bc4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0bc4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0bc4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0bc4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0bc4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0bc4_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1695_c7_75b8] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1695_c7_75b8_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1682_c6_f7b5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1682_c6_f7b5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_f7b5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1682_c6_f7b5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_f7b5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_f7b5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1682_c6_f7b5_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1682_c2_e4e5] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1682_c2_e4e5_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1698_l1682_l1701_l1695_DUPLICATE_769e LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1698_l1682_l1701_l1695_DUPLICATE_769e_return_output := result.u16_value;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1682_c2_e4e5] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1682_c2_e4e5_return_output := result.is_vram_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1682_c2_e4e5] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1682_c2_e4e5_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1698_l1701_l1695_DUPLICATE_d42a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1698_l1701_l1695_DUPLICATE_d42a_return_output := result.is_ram_write;

     -- sp_relative_shift[uxn_opcodes_h_l1703_c30_3f5d] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1703_c30_3f5d_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1703_c30_3f5d_ins;
     sp_relative_shift_uxn_opcodes_h_l1703_c30_3f5d_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1703_c30_3f5d_x;
     sp_relative_shift_uxn_opcodes_h_l1703_c30_3f5d_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1703_c30_3f5d_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1703_c30_3f5d_return_output := sp_relative_shift_uxn_opcodes_h_l1703_c30_3f5d_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1698_l1701_l1695_DUPLICATE_9203 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1698_l1701_l1695_DUPLICATE_9203_return_output := result.sp_relative_shift;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1705_c27_d051] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1705_c27_d051_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1698_l1701_l1695_DUPLICATE_1dc1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1698_l1701_l1695_DUPLICATE_1dc1_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1698_l1682_l1701_l1695_DUPLICATE_1a3c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1698_l1682_l1701_l1695_DUPLICATE_1a3c_return_output := result.u8_value;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l1682_c2_e4e5] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1682_c2_e4e5_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1701_c11_65c6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1701_c11_65c6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_65c6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1701_c11_65c6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_65c6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_65c6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1701_c11_65c6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1695_c11_235e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1695_c11_235e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_235e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1695_c11_235e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_235e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_235e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1695_c11_235e_return_output;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_f7b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_f7b5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_f7b5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_f7b5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_f7b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_f7b5_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_f7b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_f7b5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_f7b5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_f7b5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_f7b5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c6_f7b5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1695_c7_75b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_235e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_75b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_235e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_75b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_235e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_75b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_235e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_75b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_235e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1695_c7_75b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_235e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1695_c7_75b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_235e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1695_c7_75b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_235e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1698_c7_e8cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0bc4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_e8cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0bc4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_e8cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0bc4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_e8cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0bc4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0bc4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0bc4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1698_c7_e8cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0bc4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1701_c7_19b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_65c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_19b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_65c6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_19b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_65c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_19b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_65c6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1701_c7_19b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_65c6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1701_c7_19b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_65c6_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_598e_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1705_c27_d051_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_75b8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1698_l1701_l1695_DUPLICATE_9203_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_e8cb_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1698_l1701_l1695_DUPLICATE_9203_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_19b3_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1698_l1701_l1695_DUPLICATE_9203_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1698_l1682_l1701_l1695_DUPLICATE_769e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1695_c7_75b8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1698_l1682_l1701_l1695_DUPLICATE_769e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1698_l1682_l1701_l1695_DUPLICATE_769e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1701_c7_19b3_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1698_l1682_l1701_l1695_DUPLICATE_769e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_75b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1698_l1701_l1695_DUPLICATE_1dc1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_e8cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1698_l1701_l1695_DUPLICATE_1dc1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_19b3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1698_l1701_l1695_DUPLICATE_1dc1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_75b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1698_l1701_l1695_DUPLICATE_d42a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_e8cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1698_l1701_l1695_DUPLICATE_d42a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_19b3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1698_l1701_l1695_DUPLICATE_d42a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1698_l1682_l1701_l1695_DUPLICATE_1a3c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1695_c7_75b8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1698_l1682_l1701_l1695_DUPLICATE_1a3c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1698_l1682_l1701_l1695_DUPLICATE_1a3c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1701_c7_19b3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1698_l1682_l1701_l1695_DUPLICATE_1a3c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1682_c2_e4e5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1682_c2_e4e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1682_c2_e4e5_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1682_c2_e4e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_75b8_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1695_c7_75b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_19b3_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1703_c30_3f5d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1695_c7_75b8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_75b8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_75b8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_75b8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_75b8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_75b8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_75b8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1701_c7_19b3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_19b3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_19b3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_19b3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_19b3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_19b3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_19b3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_19b3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_19b3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1682_c2_e4e5] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1705_c22_598e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_598e_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_598e_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_598e_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_598e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_598e_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_598e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1701_c7_19b3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_19b3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_19b3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_19b3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_19b3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_19b3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_19b3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_19b3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_19b3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1682_c2_e4e5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1701_c7_19b3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_19b3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_19b3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_19b3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_19b3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_19b3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_19b3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_19b3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_19b3_return_output;

     -- n8_MUX[uxn_opcodes_h_l1701_c7_19b3] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1701_c7_19b3_cond <= VAR_n8_MUX_uxn_opcodes_h_l1701_c7_19b3_cond;
     n8_MUX_uxn_opcodes_h_l1701_c7_19b3_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1701_c7_19b3_iftrue;
     n8_MUX_uxn_opcodes_h_l1701_c7_19b3_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1701_c7_19b3_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1701_c7_19b3_return_output := n8_MUX_uxn_opcodes_h_l1701_c7_19b3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1701_c7_19b3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1701_c7_19b3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1701_c7_19b3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1701_c7_19b3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1701_c7_19b3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1701_c7_19b3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1701_c7_19b3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1701_c7_19b3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1701_c7_19b3_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1682_c2_e4e5] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output;

     -- t8_MUX[uxn_opcodes_h_l1698_c7_e8cb] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1698_c7_e8cb_cond <= VAR_t8_MUX_uxn_opcodes_h_l1698_c7_e8cb_cond;
     t8_MUX_uxn_opcodes_h_l1698_c7_e8cb_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1698_c7_e8cb_iftrue;
     t8_MUX_uxn_opcodes_h_l1698_c7_e8cb_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1698_c7_e8cb_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1698_c7_e8cb_return_output := t8_MUX_uxn_opcodes_h_l1698_c7_e8cb_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1682_c2_e4e5] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l1705_c3_d9f2 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1705_c22_598e_return_output)),16);
     VAR_n8_MUX_uxn_opcodes_h_l1698_c7_e8cb_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1701_c7_19b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_e8cb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_19b3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_e8cb_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_19b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_e8cb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_19b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1701_c7_19b3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1695_c7_75b8_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1698_c7_e8cb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1701_c7_19b3_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1705_c3_d9f2;
     -- t8_MUX[uxn_opcodes_h_l1695_c7_75b8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1695_c7_75b8_cond <= VAR_t8_MUX_uxn_opcodes_h_l1695_c7_75b8_cond;
     t8_MUX_uxn_opcodes_h_l1695_c7_75b8_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1695_c7_75b8_iftrue;
     t8_MUX_uxn_opcodes_h_l1695_c7_75b8_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1695_c7_75b8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output := t8_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1698_c7_e8cb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_return_output := result_u8_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_return_output;

     -- n8_MUX[uxn_opcodes_h_l1698_c7_e8cb] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1698_c7_e8cb_cond <= VAR_n8_MUX_uxn_opcodes_h_l1698_c7_e8cb_cond;
     n8_MUX_uxn_opcodes_h_l1698_c7_e8cb_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1698_c7_e8cb_iftrue;
     n8_MUX_uxn_opcodes_h_l1698_c7_e8cb_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1698_c7_e8cb_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1698_c7_e8cb_return_output := n8_MUX_uxn_opcodes_h_l1698_c7_e8cb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1698_c7_e8cb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_e8cb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_e8cb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_e8cb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_e8cb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_e8cb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_e8cb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_e8cb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_e8cb_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1701_c7_19b3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1701_c7_19b3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1701_c7_19b3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1701_c7_19b3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1701_c7_19b3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1701_c7_19b3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1701_c7_19b3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1701_c7_19b3_return_output := result_u16_value_MUX_uxn_opcodes_h_l1701_c7_19b3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1682_c2_e4e5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1698_c7_e8cb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_e8cb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_e8cb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_e8cb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_e8cb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_e8cb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_e8cb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_e8cb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_e8cb_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1698_c7_e8cb] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_e8cb_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_e8cb_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_e8cb_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_e8cb_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_e8cb_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_e8cb_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_e8cb_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_e8cb_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l1695_c7_75b8_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1698_c7_e8cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_75b8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_e8cb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_75b8_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_e8cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_75b8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_e8cb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1701_c7_19b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1695_c7_75b8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1695_c7_75b8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_75b8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_75b8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_75b8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_75b8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_75b8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_75b8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1698_c7_e8cb] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_return_output := result_u16_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_return_output;

     -- t8_MUX[uxn_opcodes_h_l1682_c2_e4e5] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond <= VAR_t8_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond;
     t8_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue;
     t8_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output := t8_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1695_c7_75b8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_75b8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_75b8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_75b8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_75b8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_75b8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_75b8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output;

     -- n8_MUX[uxn_opcodes_h_l1695_c7_75b8] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1695_c7_75b8_cond <= VAR_n8_MUX_uxn_opcodes_h_l1695_c7_75b8_cond;
     n8_MUX_uxn_opcodes_h_l1695_c7_75b8_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1695_c7_75b8_iftrue;
     n8_MUX_uxn_opcodes_h_l1695_c7_75b8_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1695_c7_75b8_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output := n8_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1695_c7_75b8] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_75b8_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_75b8_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_75b8_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_75b8_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_75b8_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_75b8_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1695_c7_75b8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1695_c7_75b8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1695_c7_75b8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1695_c7_75b8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1695_c7_75b8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1695_c7_75b8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1695_c7_75b8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1695_c7_75b8_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1698_c7_e8cb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output;
     -- n8_MUX[uxn_opcodes_h_l1682_c2_e4e5] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond <= VAR_n8_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond;
     n8_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue;
     n8_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output := n8_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1695_c7_75b8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1695_c7_75b8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1695_c7_75b8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1695_c7_75b8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1695_c7_75b8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1695_c7_75b8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1695_c7_75b8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output := result_u16_value_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1682_c2_e4e5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1682_c2_e4e5] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1682_c2_e4e5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output := result_u8_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1682_c2_e4e5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1695_c7_75b8_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1682_c2_e4e5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output := result_u16_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output;

     -- Submodule level 6
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l1710_l1678_DUPLICATE_6c7d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l1710_l1678_DUPLICATE_6c7d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c942(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1682_c2_e4e5_return_output);

     -- Submodule level 7
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l1710_l1678_DUPLICATE_6c7d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l1710_l1678_DUPLICATE_6c7d_return_output;
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
