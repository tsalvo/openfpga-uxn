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
-- BIN_OP_EQ[uxn_opcodes_h_l1580_c6_7e26]
signal BIN_OP_EQ_uxn_opcodes_h_l1580_c6_7e26_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1580_c6_7e26_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1580_c6_7e26_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1580_c2_bf0c]
signal t8_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1580_c2_bf0c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1580_c2_bf0c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1580_c2_bf0c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1580_c2_bf0c]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1580_c2_bf0c]
signal result_u8_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1580_c2_bf0c]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1580_c2_bf0c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1580_c2_bf0c]
signal result_u16_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1580_c2_bf0c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1580_c2_bf0c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1580_c2_bf0c]
signal n16_low_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1580_c2_bf0c]
signal n16_high_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1593_c11_967e]
signal BIN_OP_EQ_uxn_opcodes_h_l1593_c11_967e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1593_c11_967e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1593_c11_967e_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1593_c7_ed84]
signal t8_MUX_uxn_opcodes_h_l1593_c7_ed84_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1593_c7_ed84]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_ed84_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1593_c7_ed84]
signal result_u16_value_MUX_uxn_opcodes_h_l1593_c7_ed84_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1593_c7_ed84]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_ed84_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1593_c7_ed84]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_ed84_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1593_c7_ed84]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_ed84_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1593_c7_ed84]
signal result_u8_value_MUX_uxn_opcodes_h_l1593_c7_ed84_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1593_c7_ed84]
signal n16_low_MUX_uxn_opcodes_h_l1593_c7_ed84_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1593_c7_ed84]
signal n16_high_MUX_uxn_opcodes_h_l1593_c7_ed84_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1596_c11_b324]
signal BIN_OP_EQ_uxn_opcodes_h_l1596_c11_b324_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1596_c11_b324_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1596_c11_b324_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1596_c7_9b44]
signal t8_MUX_uxn_opcodes_h_l1596_c7_9b44_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1596_c7_9b44]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_9b44_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1596_c7_9b44]
signal result_u16_value_MUX_uxn_opcodes_h_l1596_c7_9b44_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1596_c7_9b44]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_9b44_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1596_c7_9b44]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_9b44_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1596_c7_9b44]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_9b44_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1596_c7_9b44]
signal result_u8_value_MUX_uxn_opcodes_h_l1596_c7_9b44_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1596_c7_9b44]
signal n16_low_MUX_uxn_opcodes_h_l1596_c7_9b44_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1596_c7_9b44]
signal n16_high_MUX_uxn_opcodes_h_l1596_c7_9b44_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1600_c11_6977]
signal BIN_OP_EQ_uxn_opcodes_h_l1600_c11_6977_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1600_c11_6977_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1600_c11_6977_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1600_c7_b76f]
signal result_u16_value_MUX_uxn_opcodes_h_l1600_c7_b76f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1600_c7_b76f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1600_c7_b76f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1600_c7_b76f_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1600_c7_b76f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_b76f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_b76f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_b76f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_b76f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1600_c7_b76f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_b76f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_b76f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_b76f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_b76f_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1600_c7_b76f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_b76f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_b76f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_b76f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_b76f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1600_c7_b76f]
signal result_u8_value_MUX_uxn_opcodes_h_l1600_c7_b76f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1600_c7_b76f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1600_c7_b76f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1600_c7_b76f_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1600_c7_b76f]
signal n16_low_MUX_uxn_opcodes_h_l1600_c7_b76f_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1600_c7_b76f_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1600_c7_b76f_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1600_c7_b76f_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1600_c7_b76f]
signal n16_high_MUX_uxn_opcodes_h_l1600_c7_b76f_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1600_c7_b76f_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1600_c7_b76f_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1600_c7_b76f_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1602_c30_e890]
signal sp_relative_shift_uxn_opcodes_h_l1602_c30_e890_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1602_c30_e890_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1602_c30_e890_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1602_c30_e890_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1607_c11_32e4]
signal BIN_OP_EQ_uxn_opcodes_h_l1607_c11_32e4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1607_c11_32e4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1607_c11_32e4_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1607_c7_8f09]
signal result_u16_value_MUX_uxn_opcodes_h_l1607_c7_8f09_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1607_c7_8f09_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1607_c7_8f09_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1607_c7_8f09_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1607_c7_8f09]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_8f09_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_8f09_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_8f09_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_8f09_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1607_c7_8f09]
signal result_u8_value_MUX_uxn_opcodes_h_l1607_c7_8f09_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1607_c7_8f09_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1607_c7_8f09_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1607_c7_8f09_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1607_c7_8f09]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_8f09_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_8f09_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_8f09_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_8f09_return_output : signed(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1607_c7_8f09]
signal n16_low_MUX_uxn_opcodes_h_l1607_c7_8f09_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1607_c7_8f09_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1607_c7_8f09_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1607_c7_8f09_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1610_c33_40bd]
signal BIN_OP_PLUS_uxn_opcodes_h_l1610_c33_40bd_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1610_c33_40bd_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1610_c33_40bd_return_output : unsigned(8 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.u16_value := ref_toks_8;
      base.is_pc_updated := ref_toks_9;
      base.is_opc_done := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1580_c6_7e26
BIN_OP_EQ_uxn_opcodes_h_l1580_c6_7e26 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1580_c6_7e26_left,
BIN_OP_EQ_uxn_opcodes_h_l1580_c6_7e26_right,
BIN_OP_EQ_uxn_opcodes_h_l1580_c6_7e26_return_output);

-- t8_MUX_uxn_opcodes_h_l1580_c2_bf0c
t8_MUX_uxn_opcodes_h_l1580_c2_bf0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond,
t8_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue,
t8_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse,
t8_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_bf0c
result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_bf0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c
result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_bf0c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_bf0c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c
result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1580_c2_bf0c
result_u8_value_MUX_uxn_opcodes_h_l1580_c2_bf0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_bf0c
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_bf0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_bf0c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_bf0c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1580_c2_bf0c
result_u16_value_MUX_uxn_opcodes_h_l1580_c2_bf0c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond,
result_u16_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_bf0c
result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_bf0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_bf0c
result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_bf0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1580_c2_bf0c
n16_low_MUX_uxn_opcodes_h_l1580_c2_bf0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond,
n16_low_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue,
n16_low_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse,
n16_low_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1580_c2_bf0c
n16_high_MUX_uxn_opcodes_h_l1580_c2_bf0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond,
n16_high_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue,
n16_high_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse,
n16_high_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1593_c11_967e
BIN_OP_EQ_uxn_opcodes_h_l1593_c11_967e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1593_c11_967e_left,
BIN_OP_EQ_uxn_opcodes_h_l1593_c11_967e_right,
BIN_OP_EQ_uxn_opcodes_h_l1593_c11_967e_return_output);

-- t8_MUX_uxn_opcodes_h_l1593_c7_ed84
t8_MUX_uxn_opcodes_h_l1593_c7_ed84 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1593_c7_ed84_cond,
t8_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue,
t8_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse,
t8_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_ed84
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_ed84 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_ed84_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1593_c7_ed84
result_u16_value_MUX_uxn_opcodes_h_l1593_c7_ed84 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1593_c7_ed84_cond,
result_u16_value_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_ed84
result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_ed84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_ed84_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_ed84
result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_ed84 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_ed84_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_ed84
result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_ed84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_ed84_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1593_c7_ed84
result_u8_value_MUX_uxn_opcodes_h_l1593_c7_ed84 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1593_c7_ed84_cond,
result_u8_value_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1593_c7_ed84
n16_low_MUX_uxn_opcodes_h_l1593_c7_ed84 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1593_c7_ed84_cond,
n16_low_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue,
n16_low_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse,
n16_low_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1593_c7_ed84
n16_high_MUX_uxn_opcodes_h_l1593_c7_ed84 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1593_c7_ed84_cond,
n16_high_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue,
n16_high_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse,
n16_high_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1596_c11_b324
BIN_OP_EQ_uxn_opcodes_h_l1596_c11_b324 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1596_c11_b324_left,
BIN_OP_EQ_uxn_opcodes_h_l1596_c11_b324_right,
BIN_OP_EQ_uxn_opcodes_h_l1596_c11_b324_return_output);

-- t8_MUX_uxn_opcodes_h_l1596_c7_9b44
t8_MUX_uxn_opcodes_h_l1596_c7_9b44 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1596_c7_9b44_cond,
t8_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue,
t8_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse,
t8_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_9b44
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_9b44 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_9b44_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1596_c7_9b44
result_u16_value_MUX_uxn_opcodes_h_l1596_c7_9b44 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1596_c7_9b44_cond,
result_u16_value_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_9b44
result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_9b44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_9b44_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_9b44
result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_9b44 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_9b44_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_9b44
result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_9b44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_9b44_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1596_c7_9b44
result_u8_value_MUX_uxn_opcodes_h_l1596_c7_9b44 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1596_c7_9b44_cond,
result_u8_value_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1596_c7_9b44
n16_low_MUX_uxn_opcodes_h_l1596_c7_9b44 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1596_c7_9b44_cond,
n16_low_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue,
n16_low_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse,
n16_low_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1596_c7_9b44
n16_high_MUX_uxn_opcodes_h_l1596_c7_9b44 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1596_c7_9b44_cond,
n16_high_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue,
n16_high_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse,
n16_high_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1600_c11_6977
BIN_OP_EQ_uxn_opcodes_h_l1600_c11_6977 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1600_c11_6977_left,
BIN_OP_EQ_uxn_opcodes_h_l1600_c11_6977_right,
BIN_OP_EQ_uxn_opcodes_h_l1600_c11_6977_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1600_c7_b76f
result_u16_value_MUX_uxn_opcodes_h_l1600_c7_b76f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1600_c7_b76f_cond,
result_u16_value_MUX_uxn_opcodes_h_l1600_c7_b76f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1600_c7_b76f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1600_c7_b76f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_b76f
result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_b76f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_b76f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_b76f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_b76f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_b76f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_b76f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_b76f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_b76f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_b76f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_b76f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_b76f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_b76f
result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_b76f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_b76f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_b76f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_b76f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_b76f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1600_c7_b76f
result_u8_value_MUX_uxn_opcodes_h_l1600_c7_b76f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1600_c7_b76f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1600_c7_b76f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1600_c7_b76f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1600_c7_b76f_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1600_c7_b76f
n16_low_MUX_uxn_opcodes_h_l1600_c7_b76f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1600_c7_b76f_cond,
n16_low_MUX_uxn_opcodes_h_l1600_c7_b76f_iftrue,
n16_low_MUX_uxn_opcodes_h_l1600_c7_b76f_iffalse,
n16_low_MUX_uxn_opcodes_h_l1600_c7_b76f_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1600_c7_b76f
n16_high_MUX_uxn_opcodes_h_l1600_c7_b76f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1600_c7_b76f_cond,
n16_high_MUX_uxn_opcodes_h_l1600_c7_b76f_iftrue,
n16_high_MUX_uxn_opcodes_h_l1600_c7_b76f_iffalse,
n16_high_MUX_uxn_opcodes_h_l1600_c7_b76f_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1602_c30_e890
sp_relative_shift_uxn_opcodes_h_l1602_c30_e890 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1602_c30_e890_ins,
sp_relative_shift_uxn_opcodes_h_l1602_c30_e890_x,
sp_relative_shift_uxn_opcodes_h_l1602_c30_e890_y,
sp_relative_shift_uxn_opcodes_h_l1602_c30_e890_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1607_c11_32e4
BIN_OP_EQ_uxn_opcodes_h_l1607_c11_32e4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1607_c11_32e4_left,
BIN_OP_EQ_uxn_opcodes_h_l1607_c11_32e4_right,
BIN_OP_EQ_uxn_opcodes_h_l1607_c11_32e4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1607_c7_8f09
result_u16_value_MUX_uxn_opcodes_h_l1607_c7_8f09 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1607_c7_8f09_cond,
result_u16_value_MUX_uxn_opcodes_h_l1607_c7_8f09_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1607_c7_8f09_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1607_c7_8f09_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_8f09
result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_8f09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_8f09_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_8f09_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_8f09_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_8f09_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1607_c7_8f09
result_u8_value_MUX_uxn_opcodes_h_l1607_c7_8f09 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1607_c7_8f09_cond,
result_u8_value_MUX_uxn_opcodes_h_l1607_c7_8f09_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1607_c7_8f09_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1607_c7_8f09_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_8f09
result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_8f09 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_8f09_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_8f09_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_8f09_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_8f09_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1607_c7_8f09
n16_low_MUX_uxn_opcodes_h_l1607_c7_8f09 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1607_c7_8f09_cond,
n16_low_MUX_uxn_opcodes_h_l1607_c7_8f09_iftrue,
n16_low_MUX_uxn_opcodes_h_l1607_c7_8f09_iffalse,
n16_low_MUX_uxn_opcodes_h_l1607_c7_8f09_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1610_c33_40bd
BIN_OP_PLUS_uxn_opcodes_h_l1610_c33_40bd : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1610_c33_40bd_left,
BIN_OP_PLUS_uxn_opcodes_h_l1610_c33_40bd_right,
BIN_OP_PLUS_uxn_opcodes_h_l1610_c33_40bd_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1580_c6_7e26_return_output,
 t8_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output,
 n16_low_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output,
 n16_high_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1593_c11_967e_return_output,
 t8_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output,
 n16_low_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output,
 n16_high_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1596_c11_b324_return_output,
 t8_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output,
 n16_low_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output,
 n16_high_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1600_c11_6977_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1600_c7_b76f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_b76f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_b76f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_b76f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1600_c7_b76f_return_output,
 n16_low_MUX_uxn_opcodes_h_l1600_c7_b76f_return_output,
 n16_high_MUX_uxn_opcodes_h_l1600_c7_b76f_return_output,
 sp_relative_shift_uxn_opcodes_h_l1602_c30_e890_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1607_c11_32e4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1607_c7_8f09_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_8f09_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1607_c7_8f09_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_8f09_return_output,
 n16_low_MUX_uxn_opcodes_h_l1607_c7_8f09_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1610_c33_40bd_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_7e26_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_7e26_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_7e26_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1580_c2_bf0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1585_c3_0c1f : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1580_c2_bf0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1580_c2_bf0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1590_c3_39c2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1580_c2_bf0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1593_c11_967e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1593_c11_967e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1593_c11_967e_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1593_c7_ed84_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1594_c3_9cee : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_ed84_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1593_c7_ed84_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_ed84_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_ed84_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_ed84_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1593_c7_ed84_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1593_c7_ed84_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1593_c7_ed84_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1596_c11_b324_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1596_c11_b324_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1596_c11_b324_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1596_c7_9b44_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1598_c3_3f31 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1596_c7_9b44_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_9b44_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1600_c7_b76f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1596_c7_9b44_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_b76f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_9b44_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_b76f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_9b44_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_b76f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_9b44_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1600_c7_b76f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1596_c7_9b44_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1600_c7_b76f_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1596_c7_9b44_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1600_c7_b76f_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1596_c7_9b44_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1600_c11_6977_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1600_c11_6977_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1600_c11_6977_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1600_c7_b76f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1600_c7_b76f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1607_c7_8f09_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1600_c7_b76f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_b76f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_b76f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_b76f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_b76f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_b76f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_8f09_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_b76f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_b76f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_b76f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_8f09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_b76f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1600_c7_b76f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1600_c7_b76f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1607_c7_8f09_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1600_c7_b76f_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1600_c7_b76f_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1600_c7_b76f_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1607_c7_8f09_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1600_c7_b76f_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1600_c7_b76f_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1600_c7_b76f_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1600_c7_b76f_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1602_c30_e890_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1602_c30_e890_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1602_c30_e890_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1602_c30_e890_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1604_c22_fe98_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1607_c11_32e4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1607_c11_32e4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1607_c11_32e4_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1607_c7_8f09_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1607_c7_8f09_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1607_c7_8f09_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_8f09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_8f09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_8f09_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1607_c7_8f09_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1607_c7_8f09_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1607_c7_8f09_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_8f09_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1609_c3_7435 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_8f09_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_8f09_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1607_c7_8f09_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1607_c7_8f09_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1607_c7_8f09_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1610_c33_40bd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1610_c33_40bd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1610_c33_40bd_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1610_c22_8bb4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1593_l1607_l1596_l1580_DUPLICATE_c54d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1593_l1607_l1596_l1580_DUPLICATE_2dc3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1600_l1593_l1596_DUPLICATE_d78e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1593_l1607_l1596_DUPLICATE_a049_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1600_l1593_l1607_l1596_DUPLICATE_e499_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4_uxn_opcodes_h_l1615_l1575_DUPLICATE_70a5_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1607_c11_32e4_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_8f09_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1609_c3_7435 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_8f09_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1609_c3_7435;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1598_c3_3f31 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1598_c3_3f31;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1593_c11_967e_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_7e26_right := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1594_c3_9cee := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1594_c3_9cee;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1600_c11_6977_right := to_unsigned(3, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_b76f_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1590_c3_39c2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1590_c3_39c2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1596_c11_b324_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1602_c30_e890_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1585_c3_0c1f := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1585_c3_0c1f;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1610_c33_40bd_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1602_c30_e890_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1602_c30_e890_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1600_c7_b76f_iffalse := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1600_c7_b76f_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1607_c7_8f09_iffalse := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_7e26_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1593_c11_967e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1596_c11_b324_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1600_c11_6977_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1607_c11_32e4_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l1600_c7_b76f_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l1607_c7_8f09_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1600_c7_b76f_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1607_c7_8f09_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1610_c33_40bd_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1600_c11_6977] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1600_c11_6977_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1600_c11_6977_left;
     BIN_OP_EQ_uxn_opcodes_h_l1600_c11_6977_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1600_c11_6977_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1600_c11_6977_return_output := BIN_OP_EQ_uxn_opcodes_h_l1600_c11_6977_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1602_c30_e890] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1602_c30_e890_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1602_c30_e890_ins;
     sp_relative_shift_uxn_opcodes_h_l1602_c30_e890_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1602_c30_e890_x;
     sp_relative_shift_uxn_opcodes_h_l1602_c30_e890_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1602_c30_e890_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1602_c30_e890_return_output := sp_relative_shift_uxn_opcodes_h_l1602_c30_e890_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1593_l1607_l1596_l1580_DUPLICATE_2dc3 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1593_l1607_l1596_l1580_DUPLICATE_2dc3_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1593_c11_967e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1593_c11_967e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1593_c11_967e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1593_c11_967e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1593_c11_967e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1593_c11_967e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1593_c11_967e_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1593_l1607_l1596_l1580_DUPLICATE_c54d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1593_l1607_l1596_l1580_DUPLICATE_c54d_return_output := result.u8_value;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1610_c33_40bd] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1610_c33_40bd_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1610_c33_40bd_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1610_c33_40bd_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1610_c33_40bd_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1610_c33_40bd_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1610_c33_40bd_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l1580_c2_bf0c] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1580_c2_bf0c_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1600_l1593_l1596_DUPLICATE_d78e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1600_l1593_l1596_DUPLICATE_d78e_return_output := result.is_ram_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1580_c2_bf0c] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1580_c2_bf0c_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1607_c11_32e4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1607_c11_32e4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1607_c11_32e4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1607_c11_32e4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1607_c11_32e4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1607_c11_32e4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1607_c11_32e4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1580_c6_7e26] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1580_c6_7e26_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_7e26_left;
     BIN_OP_EQ_uxn_opcodes_h_l1580_c6_7e26_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_7e26_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_7e26_return_output := BIN_OP_EQ_uxn_opcodes_h_l1580_c6_7e26_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1604_c22_fe98] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1604_c22_fe98_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1596_c7_9b44] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1596_c7_9b44_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1600_l1593_l1607_l1596_DUPLICATE_e499 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1600_l1593_l1607_l1596_DUPLICATE_e499_return_output := result.is_opc_done;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1580_c2_bf0c] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1580_c2_bf0c_return_output := result.is_stack_index_flipped;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1580_c2_bf0c] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1580_c2_bf0c_return_output := result.is_pc_updated;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1593_l1607_l1596_DUPLICATE_a049 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1593_l1607_l1596_DUPLICATE_a049_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1596_c11_b324] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1596_c11_b324_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1596_c11_b324_left;
     BIN_OP_EQ_uxn_opcodes_h_l1596_c11_b324_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1596_c11_b324_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1596_c11_b324_return_output := BIN_OP_EQ_uxn_opcodes_h_l1596_c11_b324_return_output;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_7e26_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_7e26_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_7e26_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_7e26_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_7e26_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_7e26_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_7e26_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_7e26_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_7e26_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_7e26_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_7e26_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_7e26_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1580_c6_7e26_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1593_c7_ed84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1593_c11_967e_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1593_c7_ed84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1593_c11_967e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_ed84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1593_c11_967e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_ed84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1593_c11_967e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_ed84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1593_c11_967e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_ed84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1593_c11_967e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1593_c7_ed84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1593_c11_967e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1593_c7_ed84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1593_c11_967e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1593_c7_ed84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1593_c11_967e_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1596_c7_9b44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1596_c11_b324_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1596_c7_9b44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1596_c11_b324_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_9b44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1596_c11_b324_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_9b44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1596_c11_b324_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_9b44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1596_c11_b324_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_9b44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1596_c11_b324_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1596_c7_9b44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1596_c11_b324_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1596_c7_9b44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1596_c11_b324_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1596_c7_9b44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1596_c11_b324_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1600_c7_b76f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1600_c11_6977_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1600_c7_b76f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1600_c11_6977_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_b76f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1600_c11_6977_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_b76f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1600_c11_6977_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_b76f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1600_c11_6977_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1600_c7_b76f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1600_c11_6977_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1600_c7_b76f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1600_c11_6977_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1607_c7_8f09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1607_c11_32e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_8f09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1607_c11_32e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_8f09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1607_c11_32e4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1607_c7_8f09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1607_c11_32e4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1607_c7_8f09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1607_c11_32e4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1600_c7_b76f_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1604_c22_fe98_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1593_l1607_l1596_DUPLICATE_a049_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1593_l1607_l1596_DUPLICATE_a049_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_8f09_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1593_l1607_l1596_DUPLICATE_a049_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1593_l1607_l1596_l1580_DUPLICATE_2dc3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1593_l1607_l1596_l1580_DUPLICATE_2dc3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1593_l1607_l1596_l1580_DUPLICATE_2dc3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1607_c7_8f09_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1593_l1607_l1596_l1580_DUPLICATE_2dc3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1600_l1593_l1607_l1596_DUPLICATE_e499_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1600_l1593_l1607_l1596_DUPLICATE_e499_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_b76f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1600_l1593_l1607_l1596_DUPLICATE_e499_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_8f09_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1600_l1593_l1607_l1596_DUPLICATE_e499_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1600_l1593_l1596_DUPLICATE_d78e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1600_l1593_l1596_DUPLICATE_d78e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_b76f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1600_l1593_l1596_DUPLICATE_d78e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1593_l1607_l1596_l1580_DUPLICATE_c54d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1593_l1607_l1596_l1580_DUPLICATE_c54d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1593_l1607_l1596_l1580_DUPLICATE_c54d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1607_c7_8f09_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1593_l1607_l1596_l1580_DUPLICATE_c54d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1580_c2_bf0c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1580_c2_bf0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1580_c2_bf0c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1580_c2_bf0c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1596_c7_9b44_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_b76f_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1602_c30_e890_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1580_c2_bf0c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1580_c2_bf0c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1600_c7_b76f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_b76f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_b76f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_b76f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_b76f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_b76f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_b76f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_b76f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_b76f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1596_c7_9b44] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_9b44_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_9b44_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1580_c2_bf0c] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output;

     -- t8_MUX[uxn_opcodes_h_l1596_c7_9b44] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1596_c7_9b44_cond <= VAR_t8_MUX_uxn_opcodes_h_l1596_c7_9b44_cond;
     t8_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue;
     t8_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output := t8_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1607_c7_8f09] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_8f09_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_8f09_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_8f09_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_8f09_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_8f09_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_8f09_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_8f09_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_8f09_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1580_c2_bf0c] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1607_c7_8f09] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1607_c7_8f09_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1607_c7_8f09_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1607_c7_8f09_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1607_c7_8f09_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1607_c7_8f09_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1607_c7_8f09_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1607_c7_8f09_return_output := result_u8_value_MUX_uxn_opcodes_h_l1607_c7_8f09_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1610_c22_8bb4] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1610_c22_8bb4_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1610_c33_40bd_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1607_c7_8f09] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_8f09_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_8f09_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_8f09_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_8f09_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_8f09_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_8f09_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_8f09_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_8f09_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1607_c7_8f09] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1607_c7_8f09_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1607_c7_8f09_cond;
     n16_low_MUX_uxn_opcodes_h_l1607_c7_8f09_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1607_c7_8f09_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1607_c7_8f09_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1607_c7_8f09_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1607_c7_8f09_return_output := n16_low_MUX_uxn_opcodes_h_l1607_c7_8f09_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1600_c7_b76f] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1600_c7_b76f_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1600_c7_b76f_cond;
     n16_high_MUX_uxn_opcodes_h_l1600_c7_b76f_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1600_c7_b76f_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1600_c7_b76f_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1600_c7_b76f_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1600_c7_b76f_return_output := n16_high_MUX_uxn_opcodes_h_l1600_c7_b76f_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1607_c7_8f09_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1610_c22_8bb4_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1600_c7_b76f_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1600_c7_b76f_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1607_c7_8f09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_b76f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1607_c7_8f09_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1600_c7_b76f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_b76f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c7_8f09_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1600_c7_b76f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1607_c7_8f09_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l1600_c7_b76f] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1600_c7_b76f_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1600_c7_b76f_cond;
     n16_low_MUX_uxn_opcodes_h_l1600_c7_b76f_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1600_c7_b76f_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1600_c7_b76f_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1600_c7_b76f_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1600_c7_b76f_return_output := n16_low_MUX_uxn_opcodes_h_l1600_c7_b76f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1600_c7_b76f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_b76f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_b76f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_b76f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_b76f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_b76f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_b76f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_b76f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_b76f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1600_c7_b76f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1600_c7_b76f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1600_c7_b76f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1600_c7_b76f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1600_c7_b76f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1600_c7_b76f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1600_c7_b76f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1600_c7_b76f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1600_c7_b76f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1593_c7_ed84] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_ed84_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_ed84_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1596_c7_9b44] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_9b44_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_9b44_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1596_c7_9b44] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1596_c7_9b44_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1596_c7_9b44_cond;
     n16_high_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output := n16_high_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output;

     -- t8_MUX[uxn_opcodes_h_l1593_c7_ed84] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1593_c7_ed84_cond <= VAR_t8_MUX_uxn_opcodes_h_l1593_c7_ed84_cond;
     t8_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue;
     t8_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output := t8_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1607_c7_8f09] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1607_c7_8f09_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1607_c7_8f09_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1607_c7_8f09_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1607_c7_8f09_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1607_c7_8f09_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1607_c7_8f09_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1607_c7_8f09_return_output := result_u16_value_MUX_uxn_opcodes_h_l1607_c7_8f09_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1600_c7_b76f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_b76f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_b76f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_b76f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_b76f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_b76f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_b76f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_b76f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_b76f_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1600_c7_b76f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1600_c7_b76f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1600_c7_b76f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1600_c7_b76f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1607_c7_8f09_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1600_c7_b76f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l1596_c7_9b44] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1596_c7_9b44_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1596_c7_9b44_cond;
     n16_low_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output := n16_low_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1596_c7_9b44] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_9b44_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_9b44_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1600_c7_b76f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1600_c7_b76f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1600_c7_b76f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1600_c7_b76f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1600_c7_b76f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1600_c7_b76f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1600_c7_b76f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1600_c7_b76f_return_output := result_u16_value_MUX_uxn_opcodes_h_l1600_c7_b76f_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1593_c7_ed84] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_ed84_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_ed84_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output;

     -- t8_MUX[uxn_opcodes_h_l1580_c2_bf0c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond <= VAR_t8_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond;
     t8_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue;
     t8_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output := t8_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1593_c7_ed84] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1593_c7_ed84_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1593_c7_ed84_cond;
     n16_high_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output := n16_high_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1596_c7_9b44] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1596_c7_9b44_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1596_c7_9b44_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output := result_u8_value_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1580_c2_bf0c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1596_c7_9b44] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_9b44_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_9b44_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1600_c7_b76f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1593_c7_ed84] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_ed84_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_ed84_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1593_c7_ed84] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_ed84_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_ed84_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1593_c7_ed84] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1593_c7_ed84_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1593_c7_ed84_cond;
     n16_low_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output := n16_low_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1580_c2_bf0c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1593_c7_ed84] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1593_c7_ed84_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1593_c7_ed84_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output := result_u8_value_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1596_c7_9b44] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1596_c7_9b44_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1596_c7_9b44_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1596_c7_9b44_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1596_c7_9b44_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output := result_u16_value_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1580_c2_bf0c] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond;
     n16_high_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output := n16_high_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output;

     -- Submodule level 5
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1596_c7_9b44_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l1580_c2_bf0c] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond;
     n16_low_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output := n16_low_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1580_c2_bf0c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1580_c2_bf0c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1593_c7_ed84] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1593_c7_ed84_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1593_c7_ed84_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1593_c7_ed84_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1593_c7_ed84_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output := result_u16_value_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1580_c2_bf0c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output;

     -- Submodule level 6
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1593_c7_ed84_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1580_c2_bf0c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output := result_u16_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4_uxn_opcodes_h_l1615_l1575_DUPLICATE_70a5 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4_uxn_opcodes_h_l1615_l1575_DUPLICATE_70a5_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1580_c2_bf0c_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4_uxn_opcodes_h_l1615_l1575_DUPLICATE_70a5_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4_uxn_opcodes_h_l1615_l1575_DUPLICATE_70a5_return_output;
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
