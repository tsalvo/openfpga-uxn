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
-- BIN_OP_EQ[uxn_opcodes_h_l1718_c6_39b4]
signal BIN_OP_EQ_uxn_opcodes_h_l1718_c6_39b4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1718_c6_39b4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1718_c6_39b4_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1718_c2_ddd8]
signal n16_low_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1718_c2_ddd8]
signal t8_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1718_c2_ddd8]
signal n16_high_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1718_c2_ddd8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1718_c2_ddd8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1718_c2_ddd8]
signal result_u16_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1718_c2_ddd8]
signal result_u8_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1718_c2_ddd8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1718_c2_ddd8]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1718_c2_ddd8]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1718_c2_ddd8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1718_c2_ddd8]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1718_c2_ddd8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1731_c11_70f0]
signal BIN_OP_EQ_uxn_opcodes_h_l1731_c11_70f0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1731_c11_70f0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1731_c11_70f0_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1731_c7_2970]
signal n16_low_MUX_uxn_opcodes_h_l1731_c7_2970_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1731_c7_2970_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1731_c7_2970]
signal t8_MUX_uxn_opcodes_h_l1731_c7_2970_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1731_c7_2970_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1731_c7_2970]
signal n16_high_MUX_uxn_opcodes_h_l1731_c7_2970_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1731_c7_2970_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1731_c7_2970]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_2970_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_2970_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1731_c7_2970]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_2970_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_2970_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1731_c7_2970]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_2970_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_2970_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1731_c7_2970]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_2970_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_2970_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1731_c7_2970]
signal result_u16_value_MUX_uxn_opcodes_h_l1731_c7_2970_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1731_c7_2970_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1731_c7_2970]
signal result_u8_value_MUX_uxn_opcodes_h_l1731_c7_2970_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1731_c7_2970_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1734_c11_a1f0]
signal BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a1f0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a1f0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a1f0_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1734_c7_615e]
signal n16_low_MUX_uxn_opcodes_h_l1734_c7_615e_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1734_c7_615e_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1734_c7_615e]
signal t8_MUX_uxn_opcodes_h_l1734_c7_615e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1734_c7_615e_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1734_c7_615e]
signal n16_high_MUX_uxn_opcodes_h_l1734_c7_615e_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1734_c7_615e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1734_c7_615e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_615e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_615e_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1734_c7_615e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_615e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_615e_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1734_c7_615e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_615e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_615e_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1734_c7_615e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_615e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_615e_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1734_c7_615e]
signal result_u16_value_MUX_uxn_opcodes_h_l1734_c7_615e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1734_c7_615e_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1734_c7_615e]
signal result_u8_value_MUX_uxn_opcodes_h_l1734_c7_615e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1734_c7_615e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1738_c11_f854]
signal BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f854_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f854_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f854_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1738_c7_d0c4]
signal n16_low_MUX_uxn_opcodes_h_l1738_c7_d0c4_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1738_c7_d0c4_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1738_c7_d0c4_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1738_c7_d0c4_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1738_c7_d0c4]
signal n16_high_MUX_uxn_opcodes_h_l1738_c7_d0c4_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1738_c7_d0c4_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1738_c7_d0c4_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1738_c7_d0c4_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1738_c7_d0c4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_d0c4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_d0c4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_d0c4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_d0c4_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1738_c7_d0c4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_d0c4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_d0c4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_d0c4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_d0c4_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1738_c7_d0c4]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_d0c4_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_d0c4_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_d0c4_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_d0c4_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1738_c7_d0c4]
signal result_u16_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1738_c7_d0c4]
signal result_u8_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1740_c30_4577]
signal sp_relative_shift_uxn_opcodes_h_l1740_c30_4577_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1740_c30_4577_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1740_c30_4577_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1740_c30_4577_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1745_c11_9ae0]
signal BIN_OP_EQ_uxn_opcodes_h_l1745_c11_9ae0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1745_c11_9ae0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1745_c11_9ae0_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1745_c7_180d]
signal n16_low_MUX_uxn_opcodes_h_l1745_c7_180d_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1745_c7_180d_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1745_c7_180d_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1745_c7_180d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1745_c7_180d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_180d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_180d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_180d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_180d_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1745_c7_180d]
signal result_u16_value_MUX_uxn_opcodes_h_l1745_c7_180d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1745_c7_180d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1745_c7_180d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1745_c7_180d_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1745_c7_180d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_180d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_180d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_180d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_180d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1745_c7_180d]
signal result_u8_value_MUX_uxn_opcodes_h_l1745_c7_180d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1745_c7_180d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1745_c7_180d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1745_c7_180d_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1748_c22_3e38]
signal BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_3e38_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_3e38_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_3e38_return_output : signed(18 downto 0);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_0609
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_0609_left : signed(16 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_0609_right : signed(7 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_0609_return_output : signed(17 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_7557( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_vram_write := ref_toks_6;
      base.is_stack_index_flipped := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_ram_write := ref_toks_9;
      base.is_stack_write := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1718_c6_39b4
BIN_OP_EQ_uxn_opcodes_h_l1718_c6_39b4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1718_c6_39b4_left,
BIN_OP_EQ_uxn_opcodes_h_l1718_c6_39b4_right,
BIN_OP_EQ_uxn_opcodes_h_l1718_c6_39b4_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1718_c2_ddd8
n16_low_MUX_uxn_opcodes_h_l1718_c2_ddd8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond,
n16_low_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue,
n16_low_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse,
n16_low_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output);

-- t8_MUX_uxn_opcodes_h_l1718_c2_ddd8
t8_MUX_uxn_opcodes_h_l1718_c2_ddd8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond,
t8_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue,
t8_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse,
t8_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1718_c2_ddd8
n16_high_MUX_uxn_opcodes_h_l1718_c2_ddd8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond,
n16_high_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue,
n16_high_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse,
n16_high_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_ddd8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_ddd8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_ddd8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_ddd8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1718_c2_ddd8
result_u16_value_MUX_uxn_opcodes_h_l1718_c2_ddd8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond,
result_u16_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1718_c2_ddd8
result_u8_value_MUX_uxn_opcodes_h_l1718_c2_ddd8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_ddd8
result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_ddd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8
result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_ddd8
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_ddd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_ddd8
result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_ddd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8
result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_ddd8
result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_ddd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1731_c11_70f0
BIN_OP_EQ_uxn_opcodes_h_l1731_c11_70f0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1731_c11_70f0_left,
BIN_OP_EQ_uxn_opcodes_h_l1731_c11_70f0_right,
BIN_OP_EQ_uxn_opcodes_h_l1731_c11_70f0_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1731_c7_2970
n16_low_MUX_uxn_opcodes_h_l1731_c7_2970 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1731_c7_2970_cond,
n16_low_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue,
n16_low_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse,
n16_low_MUX_uxn_opcodes_h_l1731_c7_2970_return_output);

-- t8_MUX_uxn_opcodes_h_l1731_c7_2970
t8_MUX_uxn_opcodes_h_l1731_c7_2970 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1731_c7_2970_cond,
t8_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue,
t8_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse,
t8_MUX_uxn_opcodes_h_l1731_c7_2970_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1731_c7_2970
n16_high_MUX_uxn_opcodes_h_l1731_c7_2970 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1731_c7_2970_cond,
n16_high_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue,
n16_high_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse,
n16_high_MUX_uxn_opcodes_h_l1731_c7_2970_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_2970
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_2970 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_2970_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_2970_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_2970
result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_2970 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_2970_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_2970_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_2970
result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_2970 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_2970_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_2970_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_2970
result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_2970 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_2970_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_2970_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1731_c7_2970
result_u16_value_MUX_uxn_opcodes_h_l1731_c7_2970 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1731_c7_2970_cond,
result_u16_value_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1731_c7_2970_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1731_c7_2970
result_u8_value_MUX_uxn_opcodes_h_l1731_c7_2970 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1731_c7_2970_cond,
result_u8_value_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1731_c7_2970_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a1f0
BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a1f0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a1f0_left,
BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a1f0_right,
BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a1f0_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1734_c7_615e
n16_low_MUX_uxn_opcodes_h_l1734_c7_615e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1734_c7_615e_cond,
n16_low_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue,
n16_low_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse,
n16_low_MUX_uxn_opcodes_h_l1734_c7_615e_return_output);

-- t8_MUX_uxn_opcodes_h_l1734_c7_615e
t8_MUX_uxn_opcodes_h_l1734_c7_615e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1734_c7_615e_cond,
t8_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue,
t8_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse,
t8_MUX_uxn_opcodes_h_l1734_c7_615e_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1734_c7_615e
n16_high_MUX_uxn_opcodes_h_l1734_c7_615e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1734_c7_615e_cond,
n16_high_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue,
n16_high_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse,
n16_high_MUX_uxn_opcodes_h_l1734_c7_615e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_615e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_615e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_615e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_615e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_615e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_615e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_615e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_615e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_615e
result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_615e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_615e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_615e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_615e
result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_615e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_615e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_615e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1734_c7_615e
result_u16_value_MUX_uxn_opcodes_h_l1734_c7_615e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1734_c7_615e_cond,
result_u16_value_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1734_c7_615e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1734_c7_615e
result_u8_value_MUX_uxn_opcodes_h_l1734_c7_615e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1734_c7_615e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1734_c7_615e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f854
BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f854 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f854_left,
BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f854_right,
BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f854_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1738_c7_d0c4
n16_low_MUX_uxn_opcodes_h_l1738_c7_d0c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1738_c7_d0c4_cond,
n16_low_MUX_uxn_opcodes_h_l1738_c7_d0c4_iftrue,
n16_low_MUX_uxn_opcodes_h_l1738_c7_d0c4_iffalse,
n16_low_MUX_uxn_opcodes_h_l1738_c7_d0c4_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1738_c7_d0c4
n16_high_MUX_uxn_opcodes_h_l1738_c7_d0c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1738_c7_d0c4_cond,
n16_high_MUX_uxn_opcodes_h_l1738_c7_d0c4_iftrue,
n16_high_MUX_uxn_opcodes_h_l1738_c7_d0c4_iffalse,
n16_high_MUX_uxn_opcodes_h_l1738_c7_d0c4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_d0c4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_d0c4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_d0c4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_d0c4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_d0c4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_d0c4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_d0c4
result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_d0c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_d0c4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_d0c4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_d0c4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_d0c4_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_d0c4
result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_d0c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_d0c4_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_d0c4_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_d0c4_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_d0c4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1738_c7_d0c4
result_u16_value_MUX_uxn_opcodes_h_l1738_c7_d0c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_cond,
result_u16_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1738_c7_d0c4
result_u8_value_MUX_uxn_opcodes_h_l1738_c7_d0c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1740_c30_4577
sp_relative_shift_uxn_opcodes_h_l1740_c30_4577 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1740_c30_4577_ins,
sp_relative_shift_uxn_opcodes_h_l1740_c30_4577_x,
sp_relative_shift_uxn_opcodes_h_l1740_c30_4577_y,
sp_relative_shift_uxn_opcodes_h_l1740_c30_4577_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1745_c11_9ae0
BIN_OP_EQ_uxn_opcodes_h_l1745_c11_9ae0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1745_c11_9ae0_left,
BIN_OP_EQ_uxn_opcodes_h_l1745_c11_9ae0_right,
BIN_OP_EQ_uxn_opcodes_h_l1745_c11_9ae0_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1745_c7_180d
n16_low_MUX_uxn_opcodes_h_l1745_c7_180d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1745_c7_180d_cond,
n16_low_MUX_uxn_opcodes_h_l1745_c7_180d_iftrue,
n16_low_MUX_uxn_opcodes_h_l1745_c7_180d_iffalse,
n16_low_MUX_uxn_opcodes_h_l1745_c7_180d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_180d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_180d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_180d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_180d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_180d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_180d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1745_c7_180d
result_u16_value_MUX_uxn_opcodes_h_l1745_c7_180d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1745_c7_180d_cond,
result_u16_value_MUX_uxn_opcodes_h_l1745_c7_180d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1745_c7_180d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1745_c7_180d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_180d
result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_180d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_180d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_180d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_180d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_180d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1745_c7_180d
result_u8_value_MUX_uxn_opcodes_h_l1745_c7_180d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1745_c7_180d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1745_c7_180d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1745_c7_180d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1745_c7_180d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_3e38
BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_3e38 : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_3e38_left,
BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_3e38_right,
BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_3e38_return_output);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_0609
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_0609 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_0609_left,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_0609_right,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_0609_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1718_c6_39b4_return_output,
 n16_low_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output,
 t8_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output,
 n16_high_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1731_c11_70f0_return_output,
 n16_low_MUX_uxn_opcodes_h_l1731_c7_2970_return_output,
 t8_MUX_uxn_opcodes_h_l1731_c7_2970_return_output,
 n16_high_MUX_uxn_opcodes_h_l1731_c7_2970_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_2970_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_2970_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_2970_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_2970_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1731_c7_2970_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1731_c7_2970_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a1f0_return_output,
 n16_low_MUX_uxn_opcodes_h_l1734_c7_615e_return_output,
 t8_MUX_uxn_opcodes_h_l1734_c7_615e_return_output,
 n16_high_MUX_uxn_opcodes_h_l1734_c7_615e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_615e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_615e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_615e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_615e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1734_c7_615e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1734_c7_615e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f854_return_output,
 n16_low_MUX_uxn_opcodes_h_l1738_c7_d0c4_return_output,
 n16_high_MUX_uxn_opcodes_h_l1738_c7_d0c4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_d0c4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_d0c4_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_d0c4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_return_output,
 sp_relative_shift_uxn_opcodes_h_l1740_c30_4577_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1745_c11_9ae0_return_output,
 n16_low_MUX_uxn_opcodes_h_l1745_c7_180d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_180d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1745_c7_180d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_180d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1745_c7_180d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_3e38_return_output,
 BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_0609_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_39b4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_39b4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_39b4_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1731_c7_2970_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1731_c7_2970_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1731_c7_2970_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1723_c3_d04f : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_2970_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1728_c3_2cfe : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_2970_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_2970_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_2970_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_2970_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1718_c2_ddd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1718_c2_ddd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1718_c2_ddd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_2970_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1718_c2_ddd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_70f0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_70f0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_70f0_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1734_c7_615e_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1731_c7_2970_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1734_c7_615e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1731_c7_2970_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1734_c7_615e_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1731_c7_2970_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1732_c3_2758 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_615e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_2970_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_615e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_2970_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_615e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_2970_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_615e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_2970_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_615e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_2970_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_615e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_2970_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a1f0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a1f0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a1f0_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_d0c4_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1734_c7_615e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1734_c7_615e_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_d0c4_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1734_c7_615e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1736_c3_7b5f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1734_c7_615e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_615e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_d0c4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_615e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_d0c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_615e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_d0c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_615e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_615e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_615e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f854_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f854_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f854_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_d0c4_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_d0c4_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1745_c7_180d_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_d0c4_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_d0c4_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_d0c4_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_d0c4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_d0c4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_d0c4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_180d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_d0c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_d0c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_d0c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_180d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_d0c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_d0c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_d0c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_d0c4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1742_c3_390e : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_180d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_180d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_4577_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_4577_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_4577_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_4577_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_9ae0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_9ae0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_9ae0_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1745_c7_180d_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1745_c7_180d_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1745_c7_180d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_180d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1747_c3_d018 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_180d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_180d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_180d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1748_c3_6595 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_180d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_180d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_180d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_180d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_180d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_180d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_180d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_180d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_3e38_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_3e38_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_3e38_return_output : signed(18 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1745_l1734_l1718_l1731_DUPLICATE_71f1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1745_l1734_l1718_l1731_DUPLICATE_aca3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1745_l1734_l1731_DUPLICATE_ed66_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1745_l1734_l1738_l1731_DUPLICATE_9d16_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1734_l1738_l1731_DUPLICATE_192c_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1748_l1742_DUPLICATE_a25c_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_0609_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_0609_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_0609_return_output : signed(17 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l1753_l1714_DUPLICATE_1383_return_output : opcode_result_t;
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
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_d0c4_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_4577_y := resize(to_signed(-3, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1732_c3_2758 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1732_c3_2758;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_39b4_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1747_c3_d018 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_180d_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1747_c3_d018;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1723_c3_d04f := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1723_c3_d04f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_9ae0_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f854_right := to_unsigned(3, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a1f0_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_70f0_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1736_c3_7b5f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1736_c3_7b5f;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_180d_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1728_c3_2cfe := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1728_c3_2cfe;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_3e38_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_4577_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_4577_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_d0c4_iffalse := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_d0c4_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1745_c7_180d_iffalse := n16_low;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_0609_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_39b4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_70f0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a1f0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f854_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_9ae0_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_d0c4_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l1745_c7_180d_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_180d_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1731_c11_70f0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1731_c11_70f0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_70f0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1731_c11_70f0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_70f0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_70f0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1731_c11_70f0_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l1718_c2_ddd8] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1718_c2_ddd8_return_output := result.is_stack_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1745_l1734_l1731_DUPLICATE_ed66 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1745_l1734_l1731_DUPLICATE_ed66_return_output := result.sp_relative_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1734_c7_615e] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1734_c7_615e_return_output := result.stack_address_sp_offset;

     -- CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1748_l1742_DUPLICATE_a25c LATENCY=0
     VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1748_l1742_DUPLICATE_a25c_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l1745_c11_9ae0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1745_c11_9ae0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_9ae0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1745_c11_9ae0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_9ae0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_9ae0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1745_c11_9ae0_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1718_c2_ddd8] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1718_c2_ddd8_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1745_l1734_l1738_l1731_DUPLICATE_9d16 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1745_l1734_l1738_l1731_DUPLICATE_9d16_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1734_c11_a1f0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a1f0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a1f0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a1f0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a1f0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a1f0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a1f0_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1740_c30_4577] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1740_c30_4577_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_4577_ins;
     sp_relative_shift_uxn_opcodes_h_l1740_c30_4577_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_4577_x;
     sp_relative_shift_uxn_opcodes_h_l1740_c30_4577_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_4577_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_4577_return_output := sp_relative_shift_uxn_opcodes_h_l1740_c30_4577_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1738_c11_f854] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f854_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f854_left;
     BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f854_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f854_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f854_return_output := BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f854_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1734_l1738_l1731_DUPLICATE_192c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1734_l1738_l1731_DUPLICATE_192c_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1718_c6_39b4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1718_c6_39b4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_39b4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1718_c6_39b4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_39b4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_39b4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1718_c6_39b4_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1718_c2_ddd8] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1718_c2_ddd8_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1745_l1734_l1718_l1731_DUPLICATE_71f1 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1745_l1734_l1718_l1731_DUPLICATE_71f1_return_output := result.u16_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1745_l1734_l1718_l1731_DUPLICATE_aca3 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1745_l1734_l1718_l1731_DUPLICATE_aca3_return_output := result.u8_value;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1718_c2_ddd8] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1718_c2_ddd8_return_output := result.is_stack_index_flipped;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_39b4_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_39b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_39b4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_39b4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_39b4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_39b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_39b4_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_39b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_39b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_39b4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_39b4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_39b4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1718_c6_39b4_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1731_c7_2970_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_70f0_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1731_c7_2970_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_70f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_2970_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_70f0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_2970_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_70f0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_2970_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_70f0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_2970_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_70f0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_2970_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_70f0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_2970_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_70f0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1731_c7_2970_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_70f0_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1734_c7_615e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a1f0_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1734_c7_615e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a1f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_615e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a1f0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_615e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a1f0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_615e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a1f0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_615e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a1f0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_615e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a1f0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_615e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a1f0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1734_c7_615e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_a1f0_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_d0c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f854_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_d0c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f854_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_d0c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f854_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_d0c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f854_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_d0c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f854_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f854_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_f854_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1745_c7_180d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_9ae0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_180d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_9ae0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_180d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_9ae0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_180d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_9ae0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_180d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_9ae0_return_output;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_0609_right := VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1748_l1742_DUPLICATE_a25c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1745_l1734_l1731_DUPLICATE_ed66_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1745_l1734_l1731_DUPLICATE_ed66_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_180d_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1745_l1734_l1731_DUPLICATE_ed66_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1745_l1734_l1718_l1731_DUPLICATE_71f1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1745_l1734_l1718_l1731_DUPLICATE_71f1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1745_l1734_l1718_l1731_DUPLICATE_71f1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_180d_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1745_l1734_l1718_l1731_DUPLICATE_71f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1745_l1734_l1738_l1731_DUPLICATE_9d16_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1745_l1734_l1738_l1731_DUPLICATE_9d16_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_d0c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1745_l1734_l1738_l1731_DUPLICATE_9d16_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_180d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1745_l1734_l1738_l1731_DUPLICATE_9d16_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1734_l1738_l1731_DUPLICATE_192c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1734_l1738_l1731_DUPLICATE_192c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_d0c4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1734_l1738_l1731_DUPLICATE_192c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1745_l1734_l1718_l1731_DUPLICATE_aca3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1745_l1734_l1718_l1731_DUPLICATE_aca3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1745_l1734_l1718_l1731_DUPLICATE_aca3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_180d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1745_l1734_l1718_l1731_DUPLICATE_aca3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1718_c2_ddd8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1718_c2_ddd8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1718_c2_ddd8_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1718_c2_ddd8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1734_c7_615e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_d0c4_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_4577_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1745_c7_180d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_180d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_180d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_180d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_180d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_180d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_180d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_180d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_180d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1718_c2_ddd8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1718_c2_ddd8] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1745_c7_180d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1745_c7_180d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_180d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1745_c7_180d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_180d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1745_c7_180d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_180d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_180d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1745_c7_180d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1745_c7_180d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_180d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_180d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_180d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_180d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_180d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_180d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_180d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_180d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1738_c7_d0c4] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_d0c4_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_d0c4_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_d0c4_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_d0c4_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_d0c4_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_d0c4_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_d0c4_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_d0c4_return_output;

     -- t8_MUX[uxn_opcodes_h_l1734_c7_615e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1734_c7_615e_cond <= VAR_t8_MUX_uxn_opcodes_h_l1734_c7_615e_cond;
     t8_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue;
     t8_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1734_c7_615e_return_output := t8_MUX_uxn_opcodes_h_l1734_c7_615e_return_output;

     -- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_0609 LATENCY=0
     -- Inputs
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_0609_left <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_0609_left;
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_0609_right <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_0609_right;
     -- Outputs
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_0609_return_output := BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_0609_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1738_c7_d0c4] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1738_c7_d0c4_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_d0c4_cond;
     n16_high_MUX_uxn_opcodes_h_l1738_c7_d0c4_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_d0c4_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1738_c7_d0c4_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_d0c4_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_d0c4_return_output := n16_high_MUX_uxn_opcodes_h_l1738_c7_d0c4_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1745_c7_180d] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1745_c7_180d_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1745_c7_180d_cond;
     n16_low_MUX_uxn_opcodes_h_l1745_c7_180d_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1745_c7_180d_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1745_c7_180d_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1745_c7_180d_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1745_c7_180d_return_output := n16_low_MUX_uxn_opcodes_h_l1745_c7_180d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1718_c2_ddd8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1718_c2_ddd8] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1734_c7_615e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_615e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_615e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_615e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_615e_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_3e38_left := VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_0609_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1742_c3_390e := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1742_l1748_DUPLICATE_0609_return_output)),16);
     VAR_n16_high_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1738_c7_d0c4_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_d0c4_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1745_c7_180d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_d0c4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_180d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1738_c7_d0c4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_d0c4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1745_c7_180d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_615e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_180d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1734_c7_615e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1742_c3_390e;
     -- n16_low_MUX[uxn_opcodes_h_l1738_c7_d0c4] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1738_c7_d0c4_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_d0c4_cond;
     n16_low_MUX_uxn_opcodes_h_l1738_c7_d0c4_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_d0c4_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1738_c7_d0c4_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_d0c4_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_d0c4_return_output := n16_low_MUX_uxn_opcodes_h_l1738_c7_d0c4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1738_c7_d0c4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_d0c4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_d0c4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_d0c4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_d0c4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_d0c4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_d0c4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_d0c4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_d0c4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1738_c7_d0c4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1738_c7_d0c4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_d0c4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_d0c4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_d0c4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_d0c4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_d0c4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_d0c4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_d0c4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_d0c4_return_output;

     -- t8_MUX[uxn_opcodes_h_l1731_c7_2970] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1731_c7_2970_cond <= VAR_t8_MUX_uxn_opcodes_h_l1731_c7_2970_cond;
     t8_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue;
     t8_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1731_c7_2970_return_output := t8_MUX_uxn_opcodes_h_l1731_c7_2970_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1731_c7_2970] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_2970_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_2970_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_2970_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_2970_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1748_c22_3e38] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_3e38_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_3e38_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_3e38_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_3e38_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_3e38_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_3e38_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1734_c7_615e] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1734_c7_615e_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1734_c7_615e_cond;
     n16_high_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1734_c7_615e_return_output := n16_high_MUX_uxn_opcodes_h_l1734_c7_615e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1734_c7_615e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_615e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_615e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_615e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_615e_return_output;

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1748_c3_6595 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1748_c22_3e38_return_output)),16);
     VAR_n16_high_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1734_c7_615e_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1738_c7_d0c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_d0c4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1734_c7_615e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1738_c7_d0c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_2970_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1731_c7_2970_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_180d_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1748_c3_6595;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1731_c7_2970] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_2970_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_2970_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_2970_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_2970_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1734_c7_615e] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1734_c7_615e_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1734_c7_615e_cond;
     n16_low_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1734_c7_615e_return_output := n16_low_MUX_uxn_opcodes_h_l1734_c7_615e_return_output;

     -- t8_MUX[uxn_opcodes_h_l1718_c2_ddd8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond <= VAR_t8_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond;
     t8_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue;
     t8_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output := t8_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1745_c7_180d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1745_c7_180d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_180d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1745_c7_180d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_180d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1745_c7_180d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_180d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_180d_return_output := result_u16_value_MUX_uxn_opcodes_h_l1745_c7_180d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1734_c7_615e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_615e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_615e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_615e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_615e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1734_c7_615e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1734_c7_615e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_615e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_615e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1734_c7_615e_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1731_c7_2970] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1731_c7_2970_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1731_c7_2970_cond;
     n16_high_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1731_c7_2970_return_output := n16_high_MUX_uxn_opcodes_h_l1731_c7_2970_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1734_c7_615e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_615e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_615e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_615e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_615e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1718_c2_ddd8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1731_c7_2970_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1734_c7_615e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_615e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1731_c7_2970_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_615e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_180d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_615e_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l1731_c7_2970] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1731_c7_2970_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1731_c7_2970_cond;
     n16_low_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1731_c7_2970_return_output := n16_low_MUX_uxn_opcodes_h_l1731_c7_2970_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1738_c7_d0c4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_return_output := result_u16_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1731_c7_2970] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1731_c7_2970_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_2970_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_2970_return_output := result_u8_value_MUX_uxn_opcodes_h_l1731_c7_2970_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1718_c2_ddd8] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1731_c7_2970] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_2970_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_2970_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_2970_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_2970_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1718_c2_ddd8] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond;
     n16_high_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output := n16_high_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1731_c7_2970] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_2970_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_2970_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_2970_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_2970_return_output;

     -- Submodule level 5
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1731_c7_2970_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_2970_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_2970_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1738_c7_d0c4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_2970_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1718_c2_ddd8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1734_c7_615e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1734_c7_615e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_615e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_615e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_615e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_615e_return_output := result_u16_value_MUX_uxn_opcodes_h_l1734_c7_615e_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1718_c2_ddd8] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond;
     n16_low_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output := n16_low_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1718_c2_ddd8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1718_c2_ddd8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output;

     -- Submodule level 6
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_615e_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1731_c7_2970] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1731_c7_2970_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_2970_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_2970_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_2970_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_2970_return_output := result_u16_value_MUX_uxn_opcodes_h_l1731_c7_2970_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_2970_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1718_c2_ddd8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output := result_u16_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l1753_l1714_DUPLICATE_1383 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l1753_l1714_DUPLICATE_1383_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_7557(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1718_c2_ddd8_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l1753_l1714_DUPLICATE_1383_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l1753_l1714_DUPLICATE_1383_return_output;
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
