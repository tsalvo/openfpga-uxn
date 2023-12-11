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
-- BIN_OP_EQ[uxn_opcodes_h_l1580_c6_a81b]
signal BIN_OP_EQ_uxn_opcodes_h_l1580_c6_a81b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1580_c6_a81b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1580_c6_a81b_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1580_c2_a46e]
signal t8_MUX_uxn_opcodes_h_l1580_c2_a46e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1580_c2_a46e]
signal n16_low_MUX_uxn_opcodes_h_l1580_c2_a46e_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1580_c2_a46e]
signal n16_high_MUX_uxn_opcodes_h_l1580_c2_a46e_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1580_c2_a46e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_a46e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1580_c2_a46e]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_a46e_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1580_c2_a46e]
signal result_u16_value_MUX_uxn_opcodes_h_l1580_c2_a46e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1580_c2_a46e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1580_c2_a46e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_a46e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1580_c2_a46e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_a46e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1580_c2_a46e]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1580_c2_a46e]
signal result_u8_value_MUX_uxn_opcodes_h_l1580_c2_a46e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1580_c2_a46e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_a46e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1580_c2_a46e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_a46e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1593_c11_37b7]
signal BIN_OP_EQ_uxn_opcodes_h_l1593_c11_37b7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1593_c11_37b7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1593_c11_37b7_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1593_c7_cc79]
signal t8_MUX_uxn_opcodes_h_l1593_c7_cc79_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1593_c7_cc79]
signal n16_low_MUX_uxn_opcodes_h_l1593_c7_cc79_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1593_c7_cc79]
signal n16_high_MUX_uxn_opcodes_h_l1593_c7_cc79_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1593_c7_cc79]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_cc79_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1593_c7_cc79]
signal result_u16_value_MUX_uxn_opcodes_h_l1593_c7_cc79_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1593_c7_cc79]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_cc79_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1593_c7_cc79]
signal result_u8_value_MUX_uxn_opcodes_h_l1593_c7_cc79_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1593_c7_cc79]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_cc79_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1593_c7_cc79]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_cc79_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1596_c11_5621]
signal BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5621_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5621_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5621_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1596_c7_ce83]
signal t8_MUX_uxn_opcodes_h_l1596_c7_ce83_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1596_c7_ce83]
signal n16_low_MUX_uxn_opcodes_h_l1596_c7_ce83_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1596_c7_ce83]
signal n16_high_MUX_uxn_opcodes_h_l1596_c7_ce83_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1596_c7_ce83]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_ce83_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1596_c7_ce83]
signal result_u16_value_MUX_uxn_opcodes_h_l1596_c7_ce83_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1596_c7_ce83]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_ce83_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1596_c7_ce83]
signal result_u8_value_MUX_uxn_opcodes_h_l1596_c7_ce83_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1596_c7_ce83]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_ce83_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1596_c7_ce83]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_ce83_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1600_c11_9cca]
signal BIN_OP_EQ_uxn_opcodes_h_l1600_c11_9cca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1600_c11_9cca_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1600_c11_9cca_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1600_c7_a717]
signal n16_low_MUX_uxn_opcodes_h_l1600_c7_a717_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1600_c7_a717_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1600_c7_a717_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1600_c7_a717_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1600_c7_a717]
signal n16_high_MUX_uxn_opcodes_h_l1600_c7_a717_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1600_c7_a717_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1600_c7_a717_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1600_c7_a717_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1600_c7_a717]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_a717_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_a717_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_a717_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_a717_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1600_c7_a717]
signal result_u16_value_MUX_uxn_opcodes_h_l1600_c7_a717_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1600_c7_a717_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1600_c7_a717_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1600_c7_a717_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1600_c7_a717]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_a717_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_a717_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_a717_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_a717_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1600_c7_a717]
signal result_u8_value_MUX_uxn_opcodes_h_l1600_c7_a717_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1600_c7_a717_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1600_c7_a717_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1600_c7_a717_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1600_c7_a717]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_a717_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_a717_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_a717_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_a717_return_output : signed(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1602_c30_60b1]
signal sp_relative_shift_uxn_opcodes_h_l1602_c30_60b1_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1602_c30_60b1_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1602_c30_60b1_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1602_c30_60b1_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1607_c11_ad0f]
signal BIN_OP_EQ_uxn_opcodes_h_l1607_c11_ad0f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1607_c11_ad0f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1607_c11_ad0f_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1607_c7_5829]
signal n16_low_MUX_uxn_opcodes_h_l1607_c7_5829_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1607_c7_5829_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1607_c7_5829_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1607_c7_5829_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1607_c7_5829]
signal result_u8_value_MUX_uxn_opcodes_h_l1607_c7_5829_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1607_c7_5829_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1607_c7_5829_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1607_c7_5829_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1607_c7_5829]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_5829_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_5829_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_5829_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_5829_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1607_c7_5829]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_5829_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_5829_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_5829_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_5829_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1607_c7_5829]
signal result_u16_value_MUX_uxn_opcodes_h_l1607_c7_5829_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1607_c7_5829_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1607_c7_5829_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1607_c7_5829_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1610_c33_62a2]
signal BIN_OP_PLUS_uxn_opcodes_h_l1610_c33_62a2_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1610_c33_62a2_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1610_c33_62a2_return_output : unsigned(8 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_1a75( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_ram_write := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.u8_value := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;
      base.is_pc_updated := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1580_c6_a81b
BIN_OP_EQ_uxn_opcodes_h_l1580_c6_a81b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1580_c6_a81b_left,
BIN_OP_EQ_uxn_opcodes_h_l1580_c6_a81b_right,
BIN_OP_EQ_uxn_opcodes_h_l1580_c6_a81b_return_output);

-- t8_MUX_uxn_opcodes_h_l1580_c2_a46e
t8_MUX_uxn_opcodes_h_l1580_c2_a46e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1580_c2_a46e_cond,
t8_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue,
t8_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse,
t8_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1580_c2_a46e
n16_low_MUX_uxn_opcodes_h_l1580_c2_a46e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1580_c2_a46e_cond,
n16_low_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue,
n16_low_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse,
n16_low_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1580_c2_a46e
n16_high_MUX_uxn_opcodes_h_l1580_c2_a46e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1580_c2_a46e_cond,
n16_high_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue,
n16_high_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse,
n16_high_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_a46e
result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_a46e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_a46e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_a46e
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_a46e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_a46e_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1580_c2_a46e
result_u16_value_MUX_uxn_opcodes_h_l1580_c2_a46e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1580_c2_a46e_cond,
result_u16_value_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_a46e
result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_a46e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_a46e
result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_a46e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_a46e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_a46e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_a46e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_a46e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_a46e
result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_a46e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1580_c2_a46e
result_u8_value_MUX_uxn_opcodes_h_l1580_c2_a46e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1580_c2_a46e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_a46e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_a46e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_a46e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_a46e
result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_a46e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_a46e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1593_c11_37b7
BIN_OP_EQ_uxn_opcodes_h_l1593_c11_37b7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1593_c11_37b7_left,
BIN_OP_EQ_uxn_opcodes_h_l1593_c11_37b7_right,
BIN_OP_EQ_uxn_opcodes_h_l1593_c11_37b7_return_output);

-- t8_MUX_uxn_opcodes_h_l1593_c7_cc79
t8_MUX_uxn_opcodes_h_l1593_c7_cc79 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1593_c7_cc79_cond,
t8_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue,
t8_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse,
t8_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1593_c7_cc79
n16_low_MUX_uxn_opcodes_h_l1593_c7_cc79 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1593_c7_cc79_cond,
n16_low_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue,
n16_low_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse,
n16_low_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1593_c7_cc79
n16_high_MUX_uxn_opcodes_h_l1593_c7_cc79 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1593_c7_cc79_cond,
n16_high_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue,
n16_high_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse,
n16_high_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_cc79
result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_cc79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_cc79_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1593_c7_cc79
result_u16_value_MUX_uxn_opcodes_h_l1593_c7_cc79 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1593_c7_cc79_cond,
result_u16_value_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_cc79
result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_cc79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_cc79_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1593_c7_cc79
result_u8_value_MUX_uxn_opcodes_h_l1593_c7_cc79 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1593_c7_cc79_cond,
result_u8_value_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_cc79
result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_cc79 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_cc79_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_cc79
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_cc79 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_cc79_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5621
BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5621 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5621_left,
BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5621_right,
BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5621_return_output);

-- t8_MUX_uxn_opcodes_h_l1596_c7_ce83
t8_MUX_uxn_opcodes_h_l1596_c7_ce83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1596_c7_ce83_cond,
t8_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue,
t8_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse,
t8_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1596_c7_ce83
n16_low_MUX_uxn_opcodes_h_l1596_c7_ce83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1596_c7_ce83_cond,
n16_low_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue,
n16_low_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse,
n16_low_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1596_c7_ce83
n16_high_MUX_uxn_opcodes_h_l1596_c7_ce83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1596_c7_ce83_cond,
n16_high_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue,
n16_high_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse,
n16_high_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_ce83
result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_ce83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_ce83_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1596_c7_ce83
result_u16_value_MUX_uxn_opcodes_h_l1596_c7_ce83 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1596_c7_ce83_cond,
result_u16_value_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_ce83
result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_ce83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_ce83_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1596_c7_ce83
result_u8_value_MUX_uxn_opcodes_h_l1596_c7_ce83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1596_c7_ce83_cond,
result_u8_value_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_ce83
result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_ce83 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_ce83_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_ce83
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_ce83 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_ce83_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1600_c11_9cca
BIN_OP_EQ_uxn_opcodes_h_l1600_c11_9cca : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1600_c11_9cca_left,
BIN_OP_EQ_uxn_opcodes_h_l1600_c11_9cca_right,
BIN_OP_EQ_uxn_opcodes_h_l1600_c11_9cca_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1600_c7_a717
n16_low_MUX_uxn_opcodes_h_l1600_c7_a717 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1600_c7_a717_cond,
n16_low_MUX_uxn_opcodes_h_l1600_c7_a717_iftrue,
n16_low_MUX_uxn_opcodes_h_l1600_c7_a717_iffalse,
n16_low_MUX_uxn_opcodes_h_l1600_c7_a717_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1600_c7_a717
n16_high_MUX_uxn_opcodes_h_l1600_c7_a717 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1600_c7_a717_cond,
n16_high_MUX_uxn_opcodes_h_l1600_c7_a717_iftrue,
n16_high_MUX_uxn_opcodes_h_l1600_c7_a717_iffalse,
n16_high_MUX_uxn_opcodes_h_l1600_c7_a717_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_a717
result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_a717 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_a717_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_a717_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_a717_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_a717_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1600_c7_a717
result_u16_value_MUX_uxn_opcodes_h_l1600_c7_a717 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1600_c7_a717_cond,
result_u16_value_MUX_uxn_opcodes_h_l1600_c7_a717_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1600_c7_a717_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1600_c7_a717_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_a717
result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_a717 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_a717_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_a717_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_a717_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_a717_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1600_c7_a717
result_u8_value_MUX_uxn_opcodes_h_l1600_c7_a717 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1600_c7_a717_cond,
result_u8_value_MUX_uxn_opcodes_h_l1600_c7_a717_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1600_c7_a717_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1600_c7_a717_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_a717
result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_a717 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_a717_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_a717_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_a717_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_a717_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1602_c30_60b1
sp_relative_shift_uxn_opcodes_h_l1602_c30_60b1 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1602_c30_60b1_ins,
sp_relative_shift_uxn_opcodes_h_l1602_c30_60b1_x,
sp_relative_shift_uxn_opcodes_h_l1602_c30_60b1_y,
sp_relative_shift_uxn_opcodes_h_l1602_c30_60b1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1607_c11_ad0f
BIN_OP_EQ_uxn_opcodes_h_l1607_c11_ad0f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1607_c11_ad0f_left,
BIN_OP_EQ_uxn_opcodes_h_l1607_c11_ad0f_right,
BIN_OP_EQ_uxn_opcodes_h_l1607_c11_ad0f_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1607_c7_5829
n16_low_MUX_uxn_opcodes_h_l1607_c7_5829 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1607_c7_5829_cond,
n16_low_MUX_uxn_opcodes_h_l1607_c7_5829_iftrue,
n16_low_MUX_uxn_opcodes_h_l1607_c7_5829_iffalse,
n16_low_MUX_uxn_opcodes_h_l1607_c7_5829_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1607_c7_5829
result_u8_value_MUX_uxn_opcodes_h_l1607_c7_5829 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1607_c7_5829_cond,
result_u8_value_MUX_uxn_opcodes_h_l1607_c7_5829_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1607_c7_5829_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1607_c7_5829_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_5829
result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_5829 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_5829_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_5829_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_5829_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_5829_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_5829
result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_5829 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_5829_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_5829_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_5829_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_5829_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1607_c7_5829
result_u16_value_MUX_uxn_opcodes_h_l1607_c7_5829 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1607_c7_5829_cond,
result_u16_value_MUX_uxn_opcodes_h_l1607_c7_5829_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1607_c7_5829_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1607_c7_5829_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1610_c33_62a2
BIN_OP_PLUS_uxn_opcodes_h_l1610_c33_62a2 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1610_c33_62a2_left,
BIN_OP_PLUS_uxn_opcodes_h_l1610_c33_62a2_right,
BIN_OP_PLUS_uxn_opcodes_h_l1610_c33_62a2_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1580_c6_a81b_return_output,
 t8_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output,
 n16_low_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output,
 n16_high_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1593_c11_37b7_return_output,
 t8_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output,
 n16_low_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output,
 n16_high_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5621_return_output,
 t8_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output,
 n16_low_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output,
 n16_high_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1600_c11_9cca_return_output,
 n16_low_MUX_uxn_opcodes_h_l1600_c7_a717_return_output,
 n16_high_MUX_uxn_opcodes_h_l1600_c7_a717_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_a717_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1600_c7_a717_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_a717_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1600_c7_a717_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_a717_return_output,
 sp_relative_shift_uxn_opcodes_h_l1602_c30_60b1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1607_c11_ad0f_return_output,
 n16_low_MUX_uxn_opcodes_h_l1607_c7_5829_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1607_c7_5829_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_5829_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_5829_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1607_c7_5829_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1610_c33_62a2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_a81b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_a81b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_a81b_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1580_c2_a46e_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1580_c2_a46e_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1580_c2_a46e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_a46e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1580_c2_a46e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_a46e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1580_c2_a46e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1580_c2_a46e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_a46e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1585_c3_fa2d : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_a46e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1580_c2_a46e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1580_c2_a46e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1590_c3_1e45 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_a46e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1580_c2_a46e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_a46e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1593_c11_37b7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1593_c11_37b7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1593_c11_37b7_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1593_c7_cc79_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1593_c7_cc79_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1593_c7_cc79_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_cc79_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1593_c7_cc79_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_cc79_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1593_c7_cc79_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_cc79_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1594_c3_00a2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_cc79_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5621_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5621_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5621_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1596_c7_ce83_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1600_c7_a717_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1596_c7_ce83_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1600_c7_a717_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1596_c7_ce83_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_a717_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_ce83_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1600_c7_a717_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1596_c7_ce83_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_a717_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_ce83_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1600_c7_a717_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1596_c7_ce83_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_a717_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_ce83_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1598_c3_bb79 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1596_c7_ce83_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_ce83_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1600_c11_9cca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1600_c11_9cca_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1600_c11_9cca_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1600_c7_a717_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1600_c7_a717_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1607_c7_5829_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1600_c7_a717_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1600_c7_a717_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1600_c7_a717_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1600_c7_a717_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_a717_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_a717_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_5829_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_a717_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1600_c7_a717_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1600_c7_a717_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1607_c7_5829_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1600_c7_a717_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_a717_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_a717_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_a717_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1600_c7_a717_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1600_c7_a717_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1607_c7_5829_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1600_c7_a717_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_a717_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_a717_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_5829_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_a717_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1602_c30_60b1_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1602_c30_60b1_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1602_c30_60b1_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1602_c30_60b1_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1604_c22_daee_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1607_c11_ad0f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1607_c11_ad0f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1607_c11_ad0f_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1607_c7_5829_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1607_c7_5829_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1607_c7_5829_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1607_c7_5829_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1607_c7_5829_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1607_c7_5829_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_5829_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1609_c3_c5a2 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_5829_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_5829_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_5829_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_5829_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_5829_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1607_c7_5829_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1607_c7_5829_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1607_c7_5829_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1610_c33_62a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1610_c33_62a2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1610_c33_62a2_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1610_c22_3c71_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1607_l1596_l1580_l1593_DUPLICATE_f921_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1607_l1596_l1580_l1593_DUPLICATE_c82c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1607_l1596_l1600_l1593_DUPLICATE_fad8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1596_l1600_l1593_DUPLICATE_c640_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1607_l1596_l1593_DUPLICATE_1935_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a75_uxn_opcodes_h_l1575_l1615_DUPLICATE_72dd_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_5829_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1594_c3_00a2 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1594_c3_00a2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_a81b_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1585_c3_fa2d := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1585_c3_fa2d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1600_c11_9cca_right := to_unsigned(3, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_a717_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1590_c3_1e45 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1590_c3_1e45;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1607_c11_ad0f_right := to_unsigned(4, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5621_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1610_c33_62a2_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1602_c30_60b1_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1602_c30_60b1_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1609_c3_c5a2 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_5829_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1609_c3_c5a2;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1598_c3_bb79 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1598_c3_bb79;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1593_c11_37b7_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1602_c30_60b1_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1600_c7_a717_iffalse := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1600_c7_a717_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1607_c7_5829_iffalse := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_a81b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1593_c11_37b7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5621_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1600_c11_9cca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1607_c11_ad0f_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l1600_c7_a717_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l1607_c7_5829_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1600_c7_a717_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1607_c7_5829_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1610_c33_62a2_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse := t8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1607_l1596_l1580_l1593_DUPLICATE_c82c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1607_l1596_l1580_l1593_DUPLICATE_c82c_return_output := result.u8_value;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1604_c22_daee] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1604_c22_daee_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1607_l1596_l1593_DUPLICATE_1935 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1607_l1596_l1593_DUPLICATE_1935_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1600_c11_9cca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1600_c11_9cca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1600_c11_9cca_left;
     BIN_OP_EQ_uxn_opcodes_h_l1600_c11_9cca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1600_c11_9cca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1600_c11_9cca_return_output := BIN_OP_EQ_uxn_opcodes_h_l1600_c11_9cca_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1596_c7_ce83] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1596_c7_ce83_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1607_l1596_l1580_l1593_DUPLICATE_f921 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1607_l1596_l1580_l1593_DUPLICATE_f921_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1593_c11_37b7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1593_c11_37b7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1593_c11_37b7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1593_c11_37b7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1593_c11_37b7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1593_c11_37b7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1593_c11_37b7_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1580_c2_a46e] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1580_c2_a46e_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1607_l1596_l1600_l1593_DUPLICATE_fad8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1607_l1596_l1600_l1593_DUPLICATE_fad8_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1596_l1600_l1593_DUPLICATE_c640 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1596_l1600_l1593_DUPLICATE_c640_return_output := result.is_ram_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1580_c2_a46e] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1580_c2_a46e_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1596_c11_5621] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5621_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5621_left;
     BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5621_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5621_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5621_return_output := BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5621_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1602_c30_60b1] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1602_c30_60b1_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1602_c30_60b1_ins;
     sp_relative_shift_uxn_opcodes_h_l1602_c30_60b1_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1602_c30_60b1_x;
     sp_relative_shift_uxn_opcodes_h_l1602_c30_60b1_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1602_c30_60b1_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1602_c30_60b1_return_output := sp_relative_shift_uxn_opcodes_h_l1602_c30_60b1_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1580_c2_a46e] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1580_c2_a46e_return_output := result.is_vram_write;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l1580_c2_a46e] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1580_c2_a46e_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1580_c6_a81b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1580_c6_a81b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_a81b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1580_c6_a81b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_a81b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_a81b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1580_c6_a81b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1607_c11_ad0f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1607_c11_ad0f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1607_c11_ad0f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1607_c11_ad0f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1607_c11_ad0f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1607_c11_ad0f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1607_c11_ad0f_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1610_c33_62a2] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1610_c33_62a2_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1610_c33_62a2_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1610_c33_62a2_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1610_c33_62a2_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1610_c33_62a2_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1610_c33_62a2_return_output;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l1580_c2_a46e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_a81b_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1580_c2_a46e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_a81b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_a46e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_a81b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_a46e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_a81b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_a81b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_a46e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_a81b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_a46e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_a81b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_a81b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_a46e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_a81b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_a46e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_a81b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1580_c2_a46e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_a81b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1580_c2_a46e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_a81b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1580_c2_a46e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_a81b_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1593_c7_cc79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1593_c11_37b7_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1593_c7_cc79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1593_c11_37b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_cc79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1593_c11_37b7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_cc79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1593_c11_37b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_cc79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1593_c11_37b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_cc79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1593_c11_37b7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1593_c7_cc79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1593_c11_37b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1593_c7_cc79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1593_c11_37b7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1593_c7_cc79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1593_c11_37b7_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1596_c7_ce83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5621_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1596_c7_ce83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5621_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_ce83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5621_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_ce83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5621_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_ce83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5621_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_ce83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5621_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1596_c7_ce83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5621_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1596_c7_ce83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5621_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1596_c7_ce83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5621_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1600_c7_a717_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1600_c11_9cca_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1600_c7_a717_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1600_c11_9cca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_a717_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1600_c11_9cca_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_a717_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1600_c11_9cca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_a717_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1600_c11_9cca_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1600_c7_a717_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1600_c11_9cca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1600_c7_a717_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1600_c11_9cca_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1607_c7_5829_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1607_c11_ad0f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_5829_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1607_c11_ad0f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_5829_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1607_c11_ad0f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1607_c7_5829_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1607_c11_ad0f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1607_c7_5829_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1607_c11_ad0f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1600_c7_a717_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1604_c22_daee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1607_l1596_l1593_DUPLICATE_1935_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1607_l1596_l1593_DUPLICATE_1935_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_5829_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1607_l1596_l1593_DUPLICATE_1935_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1607_l1596_l1580_l1593_DUPLICATE_f921_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1607_l1596_l1580_l1593_DUPLICATE_f921_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1607_l1596_l1580_l1593_DUPLICATE_f921_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1607_c7_5829_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1607_l1596_l1580_l1593_DUPLICATE_f921_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1607_l1596_l1600_l1593_DUPLICATE_fad8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1607_l1596_l1600_l1593_DUPLICATE_fad8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_a717_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1607_l1596_l1600_l1593_DUPLICATE_fad8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_5829_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1607_l1596_l1600_l1593_DUPLICATE_fad8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1596_l1600_l1593_DUPLICATE_c640_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1596_l1600_l1593_DUPLICATE_c640_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_a717_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1596_l1600_l1593_DUPLICATE_c640_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1607_l1596_l1580_l1593_DUPLICATE_c82c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1607_l1596_l1580_l1593_DUPLICATE_c82c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1607_l1596_l1580_l1593_DUPLICATE_c82c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1607_c7_5829_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1607_l1596_l1580_l1593_DUPLICATE_c82c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1580_c2_a46e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1580_c2_a46e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1580_c2_a46e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1580_c2_a46e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1596_c7_ce83_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_a717_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1602_c30_60b1_return_output;
     -- CAST_TO_uint16_t[uxn_opcodes_h_l1610_c22_3c71] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1610_c22_3c71_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1610_c33_62a2_return_output);

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1580_c2_a46e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output;

     -- t8_MUX[uxn_opcodes_h_l1596_c7_ce83] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1596_c7_ce83_cond <= VAR_t8_MUX_uxn_opcodes_h_l1596_c7_ce83_cond;
     t8_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue;
     t8_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output := t8_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1580_c2_a46e] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_a46e_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_a46e_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1607_c7_5829] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_5829_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_5829_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_5829_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_5829_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_5829_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_5829_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_5829_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_5829_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1607_c7_5829] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1607_c7_5829_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1607_c7_5829_cond;
     n16_low_MUX_uxn_opcodes_h_l1607_c7_5829_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1607_c7_5829_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1607_c7_5829_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1607_c7_5829_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1607_c7_5829_return_output := n16_low_MUX_uxn_opcodes_h_l1607_c7_5829_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1580_c2_a46e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_a46e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_a46e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1600_c7_a717] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1600_c7_a717_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1600_c7_a717_cond;
     n16_high_MUX_uxn_opcodes_h_l1600_c7_a717_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1600_c7_a717_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1600_c7_a717_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1600_c7_a717_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1600_c7_a717_return_output := n16_high_MUX_uxn_opcodes_h_l1600_c7_a717_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1596_c7_ce83] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_ce83_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_ce83_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1607_c7_5829] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1607_c7_5829_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1607_c7_5829_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1607_c7_5829_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1607_c7_5829_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1607_c7_5829_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1607_c7_5829_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1607_c7_5829_return_output := result_u8_value_MUX_uxn_opcodes_h_l1607_c7_5829_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1580_c2_a46e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_a46e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_a46e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1600_c7_a717] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_a717_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_a717_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_a717_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_a717_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_a717_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_a717_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_a717_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_a717_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1607_c7_5829] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_5829_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_5829_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_5829_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_5829_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_5829_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_5829_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_5829_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_5829_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1607_c7_5829_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1610_c22_3c71_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1600_c7_a717_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1600_c7_a717_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1607_c7_5829_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_a717_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_5829_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_a717_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_a717_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_5829_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1600_c7_a717_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1607_c7_5829_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l1600_c7_a717] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1600_c7_a717_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1600_c7_a717_cond;
     n16_low_MUX_uxn_opcodes_h_l1600_c7_a717_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1600_c7_a717_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1600_c7_a717_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1600_c7_a717_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1600_c7_a717_return_output := n16_low_MUX_uxn_opcodes_h_l1600_c7_a717_return_output;

     -- t8_MUX[uxn_opcodes_h_l1593_c7_cc79] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1593_c7_cc79_cond <= VAR_t8_MUX_uxn_opcodes_h_l1593_c7_cc79_cond;
     t8_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue;
     t8_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output := t8_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1596_c7_ce83] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_ce83_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_ce83_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1607_c7_5829] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1607_c7_5829_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1607_c7_5829_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1607_c7_5829_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1607_c7_5829_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1607_c7_5829_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1607_c7_5829_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1607_c7_5829_return_output := result_u16_value_MUX_uxn_opcodes_h_l1607_c7_5829_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1600_c7_a717] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_a717_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_a717_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_a717_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_a717_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_a717_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_a717_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_a717_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_a717_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1596_c7_ce83] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1596_c7_ce83_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1596_c7_ce83_cond;
     n16_high_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output := n16_high_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1600_c7_a717] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1600_c7_a717_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1600_c7_a717_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1600_c7_a717_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1600_c7_a717_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1600_c7_a717_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1600_c7_a717_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1600_c7_a717_return_output := result_u8_value_MUX_uxn_opcodes_h_l1600_c7_a717_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1593_c7_cc79] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_cc79_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_cc79_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1600_c7_a717] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_a717_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_a717_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_a717_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_a717_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_a717_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_a717_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_a717_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_a717_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1600_c7_a717_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_a717_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_a717_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1600_c7_a717_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1607_c7_5829_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1600_c7_a717_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1596_c7_ce83] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1596_c7_ce83_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1596_c7_ce83_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output := result_u8_value_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output;

     -- t8_MUX[uxn_opcodes_h_l1580_c2_a46e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1580_c2_a46e_cond <= VAR_t8_MUX_uxn_opcodes_h_l1580_c2_a46e_cond;
     t8_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue;
     t8_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output := t8_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1596_c7_ce83] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1596_c7_ce83_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1596_c7_ce83_cond;
     n16_low_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output := n16_low_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1596_c7_ce83] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_ce83_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_ce83_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1600_c7_a717] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1600_c7_a717_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1600_c7_a717_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1600_c7_a717_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1600_c7_a717_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1600_c7_a717_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1600_c7_a717_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1600_c7_a717_return_output := result_u16_value_MUX_uxn_opcodes_h_l1600_c7_a717_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1596_c7_ce83] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_ce83_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_ce83_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1593_c7_cc79] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1593_c7_cc79_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1593_c7_cc79_cond;
     n16_high_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output := n16_high_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1580_c2_a46e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_a46e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_a46e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1593_c7_cc79] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_cc79_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_cc79_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1600_c7_a717_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1593_c7_cc79] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1593_c7_cc79_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1593_c7_cc79_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output := result_u8_value_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1593_c7_cc79] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_cc79_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_cc79_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1596_c7_ce83] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1596_c7_ce83_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1596_c7_ce83_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1596_c7_ce83_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1596_c7_ce83_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output := result_u16_value_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1580_c2_a46e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1580_c2_a46e] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1580_c2_a46e_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1580_c2_a46e_cond;
     n16_high_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output := n16_high_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1593_c7_cc79] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1593_c7_cc79_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1593_c7_cc79_cond;
     n16_low_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output := n16_low_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1593_c7_cc79] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_cc79_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_cc79_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output;

     -- Submodule level 5
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1596_c7_ce83_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1580_c2_a46e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_a46e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_a46e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1580_c2_a46e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_a46e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_a46e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1593_c7_cc79] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1593_c7_cc79_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1593_c7_cc79_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1593_c7_cc79_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1593_c7_cc79_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output := result_u16_value_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1580_c2_a46e] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1580_c2_a46e_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1580_c2_a46e_cond;
     n16_low_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output := n16_low_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1580_c2_a46e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1580_c2_a46e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1580_c2_a46e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output;

     -- Submodule level 6
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1593_c7_cc79_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1580_c2_a46e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1580_c2_a46e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1580_c2_a46e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1580_c2_a46e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1580_c2_a46e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output := result_u16_value_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1a75_uxn_opcodes_h_l1575_l1615_DUPLICATE_72dd LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a75_uxn_opcodes_h_l1575_l1615_DUPLICATE_72dd_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1a75(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_a46e_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a75_uxn_opcodes_h_l1575_l1615_DUPLICATE_72dd_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a75_uxn_opcodes_h_l1575_l1615_DUPLICATE_72dd_return_output;
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
