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
entity stz2_0CLK_75b4bee3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end stz2_0CLK_75b4bee3;
architecture arch of stz2_0CLK_75b4bee3 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16_low : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16_high : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n16_low : unsigned(7 downto 0);
signal REG_COMB_n16_high : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1557_c6_c876]
signal BIN_OP_EQ_uxn_opcodes_h_l1557_c6_c876_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1557_c6_c876_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1557_c6_c876_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1557_c2_ea39]
signal n16_low_MUX_uxn_opcodes_h_l1557_c2_ea39_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1557_c2_ea39]
signal n16_high_MUX_uxn_opcodes_h_l1557_c2_ea39_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1557_c2_ea39]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_ea39_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1557_c2_ea39]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_ea39_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1557_c2_ea39]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_ea39_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1557_c2_ea39]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_ea39_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1557_c2_ea39]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_ea39_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1557_c2_ea39]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_ea39_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1557_c2_ea39]
signal result_u16_value_MUX_uxn_opcodes_h_l1557_c2_ea39_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1557_c2_ea39]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1557_c2_ea39]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1557_c2_ea39]
signal result_u8_value_MUX_uxn_opcodes_h_l1557_c2_ea39_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1557_c2_ea39]
signal t8_MUX_uxn_opcodes_h_l1557_c2_ea39_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1570_c11_5677]
signal BIN_OP_EQ_uxn_opcodes_h_l1570_c11_5677_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1570_c11_5677_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1570_c11_5677_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1570_c7_bbc7]
signal n16_low_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1570_c7_bbc7]
signal n16_high_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1570_c7_bbc7]
signal result_u16_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1570_c7_bbc7]
signal result_u8_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1570_c7_bbc7]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1570_c7_bbc7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1570_c7_bbc7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1570_c7_bbc7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1570_c7_bbc7]
signal t8_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1573_c11_caab]
signal BIN_OP_EQ_uxn_opcodes_h_l1573_c11_caab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1573_c11_caab_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1573_c11_caab_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1573_c7_8f36]
signal n16_low_MUX_uxn_opcodes_h_l1573_c7_8f36_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1573_c7_8f36]
signal n16_high_MUX_uxn_opcodes_h_l1573_c7_8f36_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1573_c7_8f36]
signal result_u16_value_MUX_uxn_opcodes_h_l1573_c7_8f36_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1573_c7_8f36]
signal result_u8_value_MUX_uxn_opcodes_h_l1573_c7_8f36_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1573_c7_8f36]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_8f36_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1573_c7_8f36]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_8f36_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1573_c7_8f36]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_8f36_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1573_c7_8f36]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_8f36_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1573_c7_8f36]
signal t8_MUX_uxn_opcodes_h_l1573_c7_8f36_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1577_c11_a41a]
signal BIN_OP_EQ_uxn_opcodes_h_l1577_c11_a41a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1577_c11_a41a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1577_c11_a41a_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1577_c7_94fb]
signal n16_low_MUX_uxn_opcodes_h_l1577_c7_94fb_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1577_c7_94fb_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1577_c7_94fb_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1577_c7_94fb_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1577_c7_94fb]
signal n16_high_MUX_uxn_opcodes_h_l1577_c7_94fb_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1577_c7_94fb_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1577_c7_94fb_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1577_c7_94fb_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1577_c7_94fb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_94fb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_94fb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_94fb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_94fb_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1577_c7_94fb]
signal result_u16_value_MUX_uxn_opcodes_h_l1577_c7_94fb_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1577_c7_94fb_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1577_c7_94fb_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1577_c7_94fb_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1577_c7_94fb]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_94fb_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_94fb_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_94fb_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_94fb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1577_c7_94fb]
signal result_u8_value_MUX_uxn_opcodes_h_l1577_c7_94fb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1577_c7_94fb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1577_c7_94fb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1577_c7_94fb_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1577_c7_94fb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_94fb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_94fb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_94fb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_94fb_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1579_c30_5917]
signal sp_relative_shift_uxn_opcodes_h_l1579_c30_5917_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1579_c30_5917_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1579_c30_5917_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1579_c30_5917_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1584_c11_b37a]
signal BIN_OP_EQ_uxn_opcodes_h_l1584_c11_b37a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1584_c11_b37a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1584_c11_b37a_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1584_c7_17bb]
signal n16_low_MUX_uxn_opcodes_h_l1584_c7_17bb_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1584_c7_17bb_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1584_c7_17bb_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1584_c7_17bb_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1584_c7_17bb]
signal result_u16_value_MUX_uxn_opcodes_h_l1584_c7_17bb_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1584_c7_17bb_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1584_c7_17bb_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1584_c7_17bb_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1584_c7_17bb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_17bb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_17bb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_17bb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_17bb_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1584_c7_17bb]
signal result_u8_value_MUX_uxn_opcodes_h_l1584_c7_17bb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1584_c7_17bb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1584_c7_17bb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1584_c7_17bb_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1584_c7_17bb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_17bb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_17bb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_17bb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_17bb_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1587_c33_6ecc]
signal BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_6ecc_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_6ecc_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_6ecc_return_output : unsigned(8 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint9_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(8 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
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
-- BIN_OP_EQ_uxn_opcodes_h_l1557_c6_c876
BIN_OP_EQ_uxn_opcodes_h_l1557_c6_c876 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1557_c6_c876_left,
BIN_OP_EQ_uxn_opcodes_h_l1557_c6_c876_right,
BIN_OP_EQ_uxn_opcodes_h_l1557_c6_c876_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1557_c2_ea39
n16_low_MUX_uxn_opcodes_h_l1557_c2_ea39 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1557_c2_ea39_cond,
n16_low_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue,
n16_low_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse,
n16_low_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1557_c2_ea39
n16_high_MUX_uxn_opcodes_h_l1557_c2_ea39 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1557_c2_ea39_cond,
n16_high_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue,
n16_high_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse,
n16_high_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_ea39
result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_ea39 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_ea39_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_ea39
result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_ea39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_ea39_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_ea39
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_ea39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_ea39_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_ea39
result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_ea39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_ea39_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_ea39
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_ea39 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_ea39_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_ea39
result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_ea39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_ea39_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1557_c2_ea39
result_u16_value_MUX_uxn_opcodes_h_l1557_c2_ea39 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1557_c2_ea39_cond,
result_u16_value_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_ea39
result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_ea39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_ea39
result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_ea39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1557_c2_ea39
result_u8_value_MUX_uxn_opcodes_h_l1557_c2_ea39 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1557_c2_ea39_cond,
result_u8_value_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output);

-- t8_MUX_uxn_opcodes_h_l1557_c2_ea39
t8_MUX_uxn_opcodes_h_l1557_c2_ea39 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1557_c2_ea39_cond,
t8_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue,
t8_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse,
t8_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1570_c11_5677
BIN_OP_EQ_uxn_opcodes_h_l1570_c11_5677 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1570_c11_5677_left,
BIN_OP_EQ_uxn_opcodes_h_l1570_c11_5677_right,
BIN_OP_EQ_uxn_opcodes_h_l1570_c11_5677_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1570_c7_bbc7
n16_low_MUX_uxn_opcodes_h_l1570_c7_bbc7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond,
n16_low_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue,
n16_low_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse,
n16_low_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1570_c7_bbc7
n16_high_MUX_uxn_opcodes_h_l1570_c7_bbc7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond,
n16_high_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue,
n16_high_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse,
n16_high_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1570_c7_bbc7
result_u16_value_MUX_uxn_opcodes_h_l1570_c7_bbc7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond,
result_u16_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1570_c7_bbc7
result_u8_value_MUX_uxn_opcodes_h_l1570_c7_bbc7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_bbc7
result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_bbc7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_bbc7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_bbc7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_bbc7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_bbc7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_bbc7
result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_bbc7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output);

-- t8_MUX_uxn_opcodes_h_l1570_c7_bbc7
t8_MUX_uxn_opcodes_h_l1570_c7_bbc7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond,
t8_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue,
t8_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse,
t8_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1573_c11_caab
BIN_OP_EQ_uxn_opcodes_h_l1573_c11_caab : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1573_c11_caab_left,
BIN_OP_EQ_uxn_opcodes_h_l1573_c11_caab_right,
BIN_OP_EQ_uxn_opcodes_h_l1573_c11_caab_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1573_c7_8f36
n16_low_MUX_uxn_opcodes_h_l1573_c7_8f36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1573_c7_8f36_cond,
n16_low_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue,
n16_low_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse,
n16_low_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1573_c7_8f36
n16_high_MUX_uxn_opcodes_h_l1573_c7_8f36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1573_c7_8f36_cond,
n16_high_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue,
n16_high_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse,
n16_high_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1573_c7_8f36
result_u16_value_MUX_uxn_opcodes_h_l1573_c7_8f36 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1573_c7_8f36_cond,
result_u16_value_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1573_c7_8f36
result_u8_value_MUX_uxn_opcodes_h_l1573_c7_8f36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1573_c7_8f36_cond,
result_u8_value_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_8f36
result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_8f36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_8f36_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_8f36
result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_8f36 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_8f36_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_8f36
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_8f36 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_8f36_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_8f36
result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_8f36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_8f36_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output);

-- t8_MUX_uxn_opcodes_h_l1573_c7_8f36
t8_MUX_uxn_opcodes_h_l1573_c7_8f36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1573_c7_8f36_cond,
t8_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue,
t8_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse,
t8_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1577_c11_a41a
BIN_OP_EQ_uxn_opcodes_h_l1577_c11_a41a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1577_c11_a41a_left,
BIN_OP_EQ_uxn_opcodes_h_l1577_c11_a41a_right,
BIN_OP_EQ_uxn_opcodes_h_l1577_c11_a41a_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1577_c7_94fb
n16_low_MUX_uxn_opcodes_h_l1577_c7_94fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1577_c7_94fb_cond,
n16_low_MUX_uxn_opcodes_h_l1577_c7_94fb_iftrue,
n16_low_MUX_uxn_opcodes_h_l1577_c7_94fb_iffalse,
n16_low_MUX_uxn_opcodes_h_l1577_c7_94fb_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1577_c7_94fb
n16_high_MUX_uxn_opcodes_h_l1577_c7_94fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1577_c7_94fb_cond,
n16_high_MUX_uxn_opcodes_h_l1577_c7_94fb_iftrue,
n16_high_MUX_uxn_opcodes_h_l1577_c7_94fb_iffalse,
n16_high_MUX_uxn_opcodes_h_l1577_c7_94fb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_94fb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_94fb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_94fb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_94fb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_94fb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_94fb_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1577_c7_94fb
result_u16_value_MUX_uxn_opcodes_h_l1577_c7_94fb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1577_c7_94fb_cond,
result_u16_value_MUX_uxn_opcodes_h_l1577_c7_94fb_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1577_c7_94fb_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1577_c7_94fb_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_94fb
result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_94fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_94fb_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_94fb_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_94fb_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_94fb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1577_c7_94fb
result_u8_value_MUX_uxn_opcodes_h_l1577_c7_94fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1577_c7_94fb_cond,
result_u8_value_MUX_uxn_opcodes_h_l1577_c7_94fb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1577_c7_94fb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1577_c7_94fb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_94fb
result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_94fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_94fb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_94fb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_94fb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_94fb_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1579_c30_5917
sp_relative_shift_uxn_opcodes_h_l1579_c30_5917 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1579_c30_5917_ins,
sp_relative_shift_uxn_opcodes_h_l1579_c30_5917_x,
sp_relative_shift_uxn_opcodes_h_l1579_c30_5917_y,
sp_relative_shift_uxn_opcodes_h_l1579_c30_5917_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1584_c11_b37a
BIN_OP_EQ_uxn_opcodes_h_l1584_c11_b37a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1584_c11_b37a_left,
BIN_OP_EQ_uxn_opcodes_h_l1584_c11_b37a_right,
BIN_OP_EQ_uxn_opcodes_h_l1584_c11_b37a_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1584_c7_17bb
n16_low_MUX_uxn_opcodes_h_l1584_c7_17bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1584_c7_17bb_cond,
n16_low_MUX_uxn_opcodes_h_l1584_c7_17bb_iftrue,
n16_low_MUX_uxn_opcodes_h_l1584_c7_17bb_iffalse,
n16_low_MUX_uxn_opcodes_h_l1584_c7_17bb_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1584_c7_17bb
result_u16_value_MUX_uxn_opcodes_h_l1584_c7_17bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1584_c7_17bb_cond,
result_u16_value_MUX_uxn_opcodes_h_l1584_c7_17bb_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1584_c7_17bb_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1584_c7_17bb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_17bb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_17bb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_17bb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_17bb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_17bb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_17bb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1584_c7_17bb
result_u8_value_MUX_uxn_opcodes_h_l1584_c7_17bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1584_c7_17bb_cond,
result_u8_value_MUX_uxn_opcodes_h_l1584_c7_17bb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1584_c7_17bb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1584_c7_17bb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_17bb
result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_17bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_17bb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_17bb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_17bb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_17bb_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_6ecc
BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_6ecc : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_6ecc_left,
BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_6ecc_right,
BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_6ecc_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n16_low,
 n16_high,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1557_c6_c876_return_output,
 n16_low_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output,
 n16_high_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output,
 t8_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1570_c11_5677_return_output,
 n16_low_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output,
 n16_high_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output,
 t8_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1573_c11_caab_return_output,
 n16_low_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output,
 n16_high_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output,
 t8_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1577_c11_a41a_return_output,
 n16_low_MUX_uxn_opcodes_h_l1577_c7_94fb_return_output,
 n16_high_MUX_uxn_opcodes_h_l1577_c7_94fb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_94fb_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1577_c7_94fb_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_94fb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1577_c7_94fb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_94fb_return_output,
 sp_relative_shift_uxn_opcodes_h_l1579_c30_5917_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1584_c11_b37a_return_output,
 n16_low_MUX_uxn_opcodes_h_l1584_c7_17bb_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1584_c7_17bb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_17bb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1584_c7_17bb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_17bb_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_6ecc_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_c876_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_c876_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_c876_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_ea39_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_ea39_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1562_c3_01d8 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_ea39_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1557_c2_ea39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_ea39_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1557_c2_ea39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_ea39_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1557_c2_ea39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_ea39_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1567_c3_2a28 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_ea39_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_ea39_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_ea39_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1557_c2_ea39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_ea39_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1557_c2_ea39_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_5677_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_5677_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_5677_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1571_c3_ff84 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_caab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_caab_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_caab_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_94fb_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_8f36_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_94fb_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_8f36_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_94fb_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_8f36_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_94fb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_8f36_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_94fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_8f36_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_94fb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_8f36_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1575_c3_bc77 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1573_c7_8f36_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_8f36_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_94fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_8f36_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1573_c7_8f36_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_a41a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_a41a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_a41a_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_94fb_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_94fb_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_17bb_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_94fb_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_94fb_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_94fb_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_94fb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_94fb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_94fb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_17bb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_94fb_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_94fb_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_94fb_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_17bb_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_94fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_94fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_94fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_94fb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_94fb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_94fb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_17bb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_94fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_94fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_94fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_17bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_94fb_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_5917_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_5917_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_5917_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_5917_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1581_c22_4c32_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_b37a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_b37a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_b37a_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_17bb_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_17bb_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_17bb_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_17bb_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_17bb_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_17bb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_17bb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1586_c3_45bc : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_17bb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_17bb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_17bb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_17bb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_17bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_17bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_17bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_17bb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_6ecc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_6ecc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_6ecc_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1587_c22_1fcf_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1570_l1584_l1573_l1557_DUPLICATE_56a4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1570_l1584_l1573_l1557_DUPLICATE_8b93_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1570_l1573_l1577_DUPLICATE_ace8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1570_l1584_l1573_DUPLICATE_593e_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1570_l1584_l1573_l1577_DUPLICATE_18e8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d736_uxn_opcodes_h_l1592_l1552_DUPLICATE_133e_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n16_low : unsigned(7 downto 0);
variable REG_VAR_n16_high : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n16_low := n16_low;
  REG_VAR_n16_high := n16_high;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_b37a_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_caab_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_17bb_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_c876_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_5917_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_a41a_right := to_unsigned(3, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_94fb_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_5917_y := resize(to_signed(-3, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1567_c3_2a28 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1567_c3_2a28;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1571_c3_ff84 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1571_c3_ff84;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1562_c3_01d8 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1562_c3_01d8;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1575_c3_bc77 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1575_c3_bc77;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_6ecc_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1586_c3_45bc := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_17bb_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1586_c3_45bc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_5677_right := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_5917_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_94fb_iffalse := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_94fb_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_17bb_iffalse := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_c876_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_5677_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_caab_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_a41a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_b37a_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_94fb_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_17bb_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_94fb_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_17bb_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_6ecc_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse := t8;
     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1570_l1584_l1573_l1557_DUPLICATE_56a4 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1570_l1584_l1573_l1557_DUPLICATE_56a4_return_output := result.u16_value;

     -- sp_relative_shift[uxn_opcodes_h_l1579_c30_5917] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1579_c30_5917_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_5917_ins;
     sp_relative_shift_uxn_opcodes_h_l1579_c30_5917_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_5917_x;
     sp_relative_shift_uxn_opcodes_h_l1579_c30_5917_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_5917_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_5917_return_output := sp_relative_shift_uxn_opcodes_h_l1579_c30_5917_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1581_c22_4c32] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1581_c22_4c32_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1570_l1584_l1573_DUPLICATE_593e LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1570_l1584_l1573_DUPLICATE_593e_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1570_l1573_l1577_DUPLICATE_ace8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1570_l1573_l1577_DUPLICATE_ace8_return_output := result.is_ram_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1587_c33_6ecc] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_6ecc_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_6ecc_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_6ecc_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_6ecc_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_6ecc_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_6ecc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1584_c11_b37a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1584_c11_b37a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_b37a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1584_c11_b37a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_b37a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_b37a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1584_c11_b37a_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1557_c2_ea39] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1557_c2_ea39_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1570_c11_5677] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1570_c11_5677_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_5677_left;
     BIN_OP_EQ_uxn_opcodes_h_l1570_c11_5677_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_5677_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_5677_return_output := BIN_OP_EQ_uxn_opcodes_h_l1570_c11_5677_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1557_c2_ea39] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1557_c2_ea39_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1573_c11_caab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1573_c11_caab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_caab_left;
     BIN_OP_EQ_uxn_opcodes_h_l1573_c11_caab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_caab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_caab_return_output := BIN_OP_EQ_uxn_opcodes_h_l1573_c11_caab_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1570_l1584_l1573_l1577_DUPLICATE_18e8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1570_l1584_l1573_l1577_DUPLICATE_18e8_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1570_l1584_l1573_l1557_DUPLICATE_8b93 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1570_l1584_l1573_l1557_DUPLICATE_8b93_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1557_c6_c876] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1557_c6_c876_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_c876_left;
     BIN_OP_EQ_uxn_opcodes_h_l1557_c6_c876_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_c876_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_c876_return_output := BIN_OP_EQ_uxn_opcodes_h_l1557_c6_c876_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1577_c11_a41a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1577_c11_a41a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_a41a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1577_c11_a41a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_a41a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_a41a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1577_c11_a41a_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1573_c7_8f36] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1573_c7_8f36_return_output := result.stack_address_sp_offset;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1557_c2_ea39] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1557_c2_ea39_return_output := result.is_stack_index_flipped;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l1557_c2_ea39] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1557_c2_ea39_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_ea39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_c876_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_ea39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_c876_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_ea39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_c876_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_ea39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_c876_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_c876_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_ea39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_c876_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_ea39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_c876_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_c876_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_ea39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_c876_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_ea39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_c876_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_ea39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_c876_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_ea39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_c876_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1557_c2_ea39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_c876_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_5677_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_5677_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_5677_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_5677_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_5677_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_5677_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_5677_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_5677_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_5677_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_8f36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_caab_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_8f36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_caab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_8f36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_caab_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_8f36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_caab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_8f36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_caab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_8f36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_caab_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_8f36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_caab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_8f36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_caab_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1573_c7_8f36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_caab_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_94fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_a41a_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_94fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_a41a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_94fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_a41a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_94fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_a41a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_94fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_a41a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_94fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_a41a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_94fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_a41a_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_17bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_b37a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_17bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_b37a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_17bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_b37a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_17bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_b37a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_17bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_b37a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_94fb_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1581_c22_4c32_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1570_l1584_l1573_DUPLICATE_593e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1570_l1584_l1573_DUPLICATE_593e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_17bb_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1570_l1584_l1573_DUPLICATE_593e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1570_l1584_l1573_l1557_DUPLICATE_56a4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1570_l1584_l1573_l1557_DUPLICATE_56a4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1570_l1584_l1573_l1557_DUPLICATE_56a4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_17bb_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1570_l1584_l1573_l1557_DUPLICATE_56a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1570_l1584_l1573_l1577_DUPLICATE_18e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1570_l1584_l1573_l1577_DUPLICATE_18e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_94fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1570_l1584_l1573_l1577_DUPLICATE_18e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_17bb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1570_l1584_l1573_l1577_DUPLICATE_18e8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1570_l1573_l1577_DUPLICATE_ace8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1570_l1573_l1577_DUPLICATE_ace8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_94fb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1570_l1573_l1577_DUPLICATE_ace8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1570_l1584_l1573_l1557_DUPLICATE_8b93_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1570_l1584_l1573_l1557_DUPLICATE_8b93_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1570_l1584_l1573_l1557_DUPLICATE_8b93_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_17bb_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1570_l1584_l1573_l1557_DUPLICATE_8b93_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1557_c2_ea39_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1557_c2_ea39_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1557_c2_ea39_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1557_c2_ea39_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1573_c7_8f36_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_94fb_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_5917_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1584_c7_17bb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_17bb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_17bb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_17bb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_17bb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_17bb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_17bb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_17bb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_17bb_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1557_c2_ea39] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1557_c2_ea39] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_ea39_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_ea39_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1557_c2_ea39] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_ea39_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_ea39_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1587_c22_1fcf] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1587_c22_1fcf_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_6ecc_return_output);

     -- t8_MUX[uxn_opcodes_h_l1573_c7_8f36] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1573_c7_8f36_cond <= VAR_t8_MUX_uxn_opcodes_h_l1573_c7_8f36_cond;
     t8_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue;
     t8_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output := t8_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1577_c7_94fb] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1577_c7_94fb_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_94fb_cond;
     n16_high_MUX_uxn_opcodes_h_l1577_c7_94fb_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_94fb_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1577_c7_94fb_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_94fb_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_94fb_return_output := n16_high_MUX_uxn_opcodes_h_l1577_c7_94fb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1584_c7_17bb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1584_c7_17bb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_17bb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1584_c7_17bb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_17bb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1584_c7_17bb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_17bb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_17bb_return_output := result_u8_value_MUX_uxn_opcodes_h_l1584_c7_17bb_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1584_c7_17bb] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1584_c7_17bb_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_17bb_cond;
     n16_low_MUX_uxn_opcodes_h_l1584_c7_17bb_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_17bb_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1584_c7_17bb_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_17bb_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_17bb_return_output := n16_low_MUX_uxn_opcodes_h_l1584_c7_17bb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1573_c7_8f36] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_8f36_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_8f36_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1584_c7_17bb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_17bb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_17bb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_17bb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_17bb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_17bb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_17bb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_17bb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_17bb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1557_c2_ea39] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_ea39_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_ea39_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1577_c7_94fb] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_94fb_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_94fb_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_94fb_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_94fb_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_94fb_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_94fb_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_94fb_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_94fb_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_17bb_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1587_c22_1fcf_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_94fb_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_94fb_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_17bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_94fb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_17bb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_94fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_94fb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_17bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_94fb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_17bb_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1577_c7_94fb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_94fb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_94fb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_94fb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_94fb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_94fb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_94fb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_94fb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_94fb_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1577_c7_94fb] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1577_c7_94fb_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_94fb_cond;
     n16_low_MUX_uxn_opcodes_h_l1577_c7_94fb_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_94fb_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1577_c7_94fb_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_94fb_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_94fb_return_output := n16_low_MUX_uxn_opcodes_h_l1577_c7_94fb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1577_c7_94fb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1577_c7_94fb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_94fb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1577_c7_94fb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_94fb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1577_c7_94fb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_94fb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_94fb_return_output := result_u8_value_MUX_uxn_opcodes_h_l1577_c7_94fb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1577_c7_94fb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_94fb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_94fb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_94fb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_94fb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_94fb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_94fb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_94fb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_94fb_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1584_c7_17bb] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1584_c7_17bb_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_17bb_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1584_c7_17bb_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_17bb_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1584_c7_17bb_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_17bb_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_17bb_return_output := result_u16_value_MUX_uxn_opcodes_h_l1584_c7_17bb_return_output;

     -- t8_MUX[uxn_opcodes_h_l1570_c7_bbc7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond <= VAR_t8_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond;
     t8_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue;
     t8_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output := t8_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1573_c7_8f36] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1573_c7_8f36_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_8f36_cond;
     n16_high_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output := n16_high_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1570_c7_bbc7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1573_c7_8f36] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_8f36_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_8f36_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_94fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_94fb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_94fb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_94fb_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_17bb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_94fb_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1570_c7_bbc7] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1573_c7_8f36] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1573_c7_8f36_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_8f36_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output := result_u8_value_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1577_c7_94fb] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1577_c7_94fb_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_94fb_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1577_c7_94fb_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_94fb_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1577_c7_94fb_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_94fb_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_94fb_return_output := result_u16_value_MUX_uxn_opcodes_h_l1577_c7_94fb_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1570_c7_bbc7] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond;
     n16_high_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output := n16_high_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1573_c7_8f36] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1573_c7_8f36_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_8f36_cond;
     n16_low_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output := n16_low_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output;

     -- t8_MUX[uxn_opcodes_h_l1557_c2_ea39] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1557_c2_ea39_cond <= VAR_t8_MUX_uxn_opcodes_h_l1557_c2_ea39_cond;
     t8_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue;
     t8_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output := t8_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1557_c2_ea39] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_ea39_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_ea39_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1573_c7_8f36] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_8f36_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_8f36_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1573_c7_8f36] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_8f36_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_8f36_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_94fb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1570_c7_bbc7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1573_c7_8f36] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1573_c7_8f36_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_8f36_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_8f36_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_8f36_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output := result_u16_value_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1557_c2_ea39] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1557_c2_ea39_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_ea39_cond;
     n16_high_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output := n16_high_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1557_c2_ea39] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1570_c7_bbc7] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond;
     n16_low_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output := n16_low_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1570_c7_bbc7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1570_c7_bbc7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output;

     -- Submodule level 5
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_8f36_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1557_c2_ea39] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1557_c2_ea39_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_ea39_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output := result_u8_value_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1570_c7_bbc7] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output := result_u16_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1557_c2_ea39] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_ea39_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_ea39_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1557_c2_ea39] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_ea39_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_ea39_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1557_c2_ea39] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1557_c2_ea39_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_ea39_cond;
     n16_low_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output := n16_low_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output;

     -- Submodule level 6
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_bbc7_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1557_c2_ea39] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1557_c2_ea39_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_ea39_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_ea39_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_ea39_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output := result_u16_value_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d736_uxn_opcodes_h_l1592_l1552_DUPLICATE_133e LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d736_uxn_opcodes_h_l1592_l1552_DUPLICATE_133e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d736(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_ea39_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d736_uxn_opcodes_h_l1592_l1552_DUPLICATE_133e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d736_uxn_opcodes_h_l1592_l1552_DUPLICATE_133e_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n16_low <= REG_VAR_n16_low;
REG_COMB_n16_high <= REG_VAR_n16_high;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n16_low <= REG_COMB_n16_low;
     n16_high <= REG_COMB_n16_high;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
