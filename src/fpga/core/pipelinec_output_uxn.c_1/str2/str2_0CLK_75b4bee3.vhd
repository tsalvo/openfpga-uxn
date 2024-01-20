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
-- BIN_OP_EQ[uxn_opcodes_h_l1717_c6_fab4]
signal BIN_OP_EQ_uxn_opcodes_h_l1717_c6_fab4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1717_c6_fab4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1717_c6_fab4_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1717_c2_1503]
signal n16_high_MUX_uxn_opcodes_h_l1717_c2_1503_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1717_c2_1503_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1717_c2_1503]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_1503_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_1503_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1717_c2_1503]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_1503_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_1503_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1717_c2_1503]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_1503_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_1503_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1717_c2_1503]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_1503_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_1503_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1717_c2_1503]
signal result_u8_value_MUX_uxn_opcodes_h_l1717_c2_1503_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1717_c2_1503_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1717_c2_1503]
signal result_u16_value_MUX_uxn_opcodes_h_l1717_c2_1503_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1717_c2_1503_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1717_c2_1503]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_1503_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_1503_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1717_c2_1503]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_1503_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_1503_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1717_c2_1503]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_1503_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_1503_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1717_c2_1503]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_1503_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_1503_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l1717_c2_1503]
signal t8_MUX_uxn_opcodes_h_l1717_c2_1503_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1717_c2_1503_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1717_c2_1503]
signal n16_low_MUX_uxn_opcodes_h_l1717_c2_1503_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1717_c2_1503_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1730_c11_84c1]
signal BIN_OP_EQ_uxn_opcodes_h_l1730_c11_84c1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1730_c11_84c1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1730_c11_84c1_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1730_c7_2c13]
signal n16_high_MUX_uxn_opcodes_h_l1730_c7_2c13_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1730_c7_2c13]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_2c13_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1730_c7_2c13]
signal result_u16_value_MUX_uxn_opcodes_h_l1730_c7_2c13_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1730_c7_2c13]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_2c13_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1730_c7_2c13]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_2c13_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1730_c7_2c13]
signal result_u8_value_MUX_uxn_opcodes_h_l1730_c7_2c13_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1730_c7_2c13]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_2c13_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l1730_c7_2c13]
signal t8_MUX_uxn_opcodes_h_l1730_c7_2c13_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1730_c7_2c13]
signal n16_low_MUX_uxn_opcodes_h_l1730_c7_2c13_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1733_c11_ad78]
signal BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ad78_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ad78_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ad78_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1733_c7_f8f7]
signal n16_high_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1733_c7_f8f7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1733_c7_f8f7]
signal result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1733_c7_f8f7]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1733_c7_f8f7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1733_c7_f8f7]
signal result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1733_c7_f8f7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l1733_c7_f8f7]
signal t8_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1733_c7_f8f7]
signal n16_low_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1737_c11_d8ac]
signal BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d8ac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d8ac_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d8ac_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1737_c7_6375]
signal n16_high_MUX_uxn_opcodes_h_l1737_c7_6375_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1737_c7_6375_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1737_c7_6375_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1737_c7_6375_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1737_c7_6375]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_6375_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_6375_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_6375_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_6375_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1737_c7_6375]
signal result_u16_value_MUX_uxn_opcodes_h_l1737_c7_6375_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1737_c7_6375_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1737_c7_6375_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1737_c7_6375_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1737_c7_6375]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_6375_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_6375_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_6375_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_6375_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1737_c7_6375]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_6375_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_6375_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_6375_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_6375_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1737_c7_6375]
signal result_u8_value_MUX_uxn_opcodes_h_l1737_c7_6375_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1737_c7_6375_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1737_c7_6375_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1737_c7_6375_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1737_c7_6375]
signal n16_low_MUX_uxn_opcodes_h_l1737_c7_6375_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1737_c7_6375_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1737_c7_6375_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1737_c7_6375_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1739_c30_a3ec]
signal sp_relative_shift_uxn_opcodes_h_l1739_c30_a3ec_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1739_c30_a3ec_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1739_c30_a3ec_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1739_c30_a3ec_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1744_c11_4196]
signal BIN_OP_EQ_uxn_opcodes_h_l1744_c11_4196_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1744_c11_4196_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1744_c11_4196_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1744_c7_6abf]
signal result_u16_value_MUX_uxn_opcodes_h_l1744_c7_6abf_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1744_c7_6abf_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1744_c7_6abf_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1744_c7_6abf_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1744_c7_6abf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_6abf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_6abf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_6abf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_6abf_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1744_c7_6abf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_6abf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_6abf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_6abf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_6abf_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1744_c7_6abf]
signal result_u8_value_MUX_uxn_opcodes_h_l1744_c7_6abf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1744_c7_6abf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1744_c7_6abf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1744_c7_6abf_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1744_c7_6abf]
signal n16_low_MUX_uxn_opcodes_h_l1744_c7_6abf_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1744_c7_6abf_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1744_c7_6abf_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1744_c7_6abf_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1747_c22_40a1]
signal BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_40a1_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_40a1_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_40a1_return_output : signed(18 downto 0);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_5d1e
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_5d1e_left : signed(16 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_5d1e_right : signed(7 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_5d1e_return_output : signed(17 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_6145( ref_toks_0 : opcode_result_t;
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
      base.is_ram_write := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.u16_value := ref_toks_6;
      base.is_stack_index_flipped := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.is_opc_done := ref_toks_9;
      base.stack_address_sp_offset := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1717_c6_fab4
BIN_OP_EQ_uxn_opcodes_h_l1717_c6_fab4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1717_c6_fab4_left,
BIN_OP_EQ_uxn_opcodes_h_l1717_c6_fab4_right,
BIN_OP_EQ_uxn_opcodes_h_l1717_c6_fab4_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1717_c2_1503
n16_high_MUX_uxn_opcodes_h_l1717_c2_1503 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1717_c2_1503_cond,
n16_high_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue,
n16_high_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse,
n16_high_MUX_uxn_opcodes_h_l1717_c2_1503_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_1503
result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_1503 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_1503_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_1503_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_1503
result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_1503 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_1503_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_1503_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_1503
result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_1503 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_1503_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_1503_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_1503
result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_1503 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_1503_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_1503_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1717_c2_1503
result_u8_value_MUX_uxn_opcodes_h_l1717_c2_1503 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1717_c2_1503_cond,
result_u8_value_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1717_c2_1503_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1717_c2_1503
result_u16_value_MUX_uxn_opcodes_h_l1717_c2_1503 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1717_c2_1503_cond,
result_u16_value_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1717_c2_1503_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_1503
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_1503 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_1503_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_1503_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_1503
result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_1503 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_1503_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_1503_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_1503
result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_1503 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_1503_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_1503_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_1503
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_1503 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_1503_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_1503_return_output);

-- t8_MUX_uxn_opcodes_h_l1717_c2_1503
t8_MUX_uxn_opcodes_h_l1717_c2_1503 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1717_c2_1503_cond,
t8_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue,
t8_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse,
t8_MUX_uxn_opcodes_h_l1717_c2_1503_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1717_c2_1503
n16_low_MUX_uxn_opcodes_h_l1717_c2_1503 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1717_c2_1503_cond,
n16_low_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue,
n16_low_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse,
n16_low_MUX_uxn_opcodes_h_l1717_c2_1503_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1730_c11_84c1
BIN_OP_EQ_uxn_opcodes_h_l1730_c11_84c1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1730_c11_84c1_left,
BIN_OP_EQ_uxn_opcodes_h_l1730_c11_84c1_right,
BIN_OP_EQ_uxn_opcodes_h_l1730_c11_84c1_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1730_c7_2c13
n16_high_MUX_uxn_opcodes_h_l1730_c7_2c13 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1730_c7_2c13_cond,
n16_high_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue,
n16_high_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse,
n16_high_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_2c13
result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_2c13 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_2c13_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1730_c7_2c13
result_u16_value_MUX_uxn_opcodes_h_l1730_c7_2c13 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1730_c7_2c13_cond,
result_u16_value_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_2c13
result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_2c13 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_2c13_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_2c13
result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_2c13 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_2c13_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1730_c7_2c13
result_u8_value_MUX_uxn_opcodes_h_l1730_c7_2c13 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1730_c7_2c13_cond,
result_u8_value_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_2c13
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_2c13 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_2c13_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output);

-- t8_MUX_uxn_opcodes_h_l1730_c7_2c13
t8_MUX_uxn_opcodes_h_l1730_c7_2c13 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1730_c7_2c13_cond,
t8_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue,
t8_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse,
t8_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1730_c7_2c13
n16_low_MUX_uxn_opcodes_h_l1730_c7_2c13 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1730_c7_2c13_cond,
n16_low_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue,
n16_low_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse,
n16_low_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ad78
BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ad78 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ad78_left,
BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ad78_right,
BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ad78_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1733_c7_f8f7
n16_high_MUX_uxn_opcodes_h_l1733_c7_f8f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond,
n16_high_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue,
n16_high_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse,
n16_high_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f8f7
result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f8f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f8f7
result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f8f7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond,
result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f8f7
result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f8f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f8f7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f8f7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f8f7
result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f8f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f8f7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f8f7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output);

-- t8_MUX_uxn_opcodes_h_l1733_c7_f8f7
t8_MUX_uxn_opcodes_h_l1733_c7_f8f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond,
t8_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue,
t8_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse,
t8_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1733_c7_f8f7
n16_low_MUX_uxn_opcodes_h_l1733_c7_f8f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond,
n16_low_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue,
n16_low_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse,
n16_low_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d8ac
BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d8ac : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d8ac_left,
BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d8ac_right,
BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d8ac_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1737_c7_6375
n16_high_MUX_uxn_opcodes_h_l1737_c7_6375 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1737_c7_6375_cond,
n16_high_MUX_uxn_opcodes_h_l1737_c7_6375_iftrue,
n16_high_MUX_uxn_opcodes_h_l1737_c7_6375_iffalse,
n16_high_MUX_uxn_opcodes_h_l1737_c7_6375_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_6375
result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_6375 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_6375_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_6375_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_6375_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_6375_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1737_c7_6375
result_u16_value_MUX_uxn_opcodes_h_l1737_c7_6375 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1737_c7_6375_cond,
result_u16_value_MUX_uxn_opcodes_h_l1737_c7_6375_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1737_c7_6375_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1737_c7_6375_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_6375
result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_6375 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_6375_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_6375_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_6375_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_6375_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_6375
result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_6375 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_6375_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_6375_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_6375_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_6375_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1737_c7_6375
result_u8_value_MUX_uxn_opcodes_h_l1737_c7_6375 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1737_c7_6375_cond,
result_u8_value_MUX_uxn_opcodes_h_l1737_c7_6375_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1737_c7_6375_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1737_c7_6375_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1737_c7_6375
n16_low_MUX_uxn_opcodes_h_l1737_c7_6375 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1737_c7_6375_cond,
n16_low_MUX_uxn_opcodes_h_l1737_c7_6375_iftrue,
n16_low_MUX_uxn_opcodes_h_l1737_c7_6375_iffalse,
n16_low_MUX_uxn_opcodes_h_l1737_c7_6375_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1739_c30_a3ec
sp_relative_shift_uxn_opcodes_h_l1739_c30_a3ec : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1739_c30_a3ec_ins,
sp_relative_shift_uxn_opcodes_h_l1739_c30_a3ec_x,
sp_relative_shift_uxn_opcodes_h_l1739_c30_a3ec_y,
sp_relative_shift_uxn_opcodes_h_l1739_c30_a3ec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1744_c11_4196
BIN_OP_EQ_uxn_opcodes_h_l1744_c11_4196 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1744_c11_4196_left,
BIN_OP_EQ_uxn_opcodes_h_l1744_c11_4196_right,
BIN_OP_EQ_uxn_opcodes_h_l1744_c11_4196_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1744_c7_6abf
result_u16_value_MUX_uxn_opcodes_h_l1744_c7_6abf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1744_c7_6abf_cond,
result_u16_value_MUX_uxn_opcodes_h_l1744_c7_6abf_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1744_c7_6abf_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1744_c7_6abf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_6abf
result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_6abf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_6abf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_6abf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_6abf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_6abf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_6abf
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_6abf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_6abf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_6abf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_6abf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_6abf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1744_c7_6abf
result_u8_value_MUX_uxn_opcodes_h_l1744_c7_6abf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1744_c7_6abf_cond,
result_u8_value_MUX_uxn_opcodes_h_l1744_c7_6abf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1744_c7_6abf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1744_c7_6abf_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1744_c7_6abf
n16_low_MUX_uxn_opcodes_h_l1744_c7_6abf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1744_c7_6abf_cond,
n16_low_MUX_uxn_opcodes_h_l1744_c7_6abf_iftrue,
n16_low_MUX_uxn_opcodes_h_l1744_c7_6abf_iffalse,
n16_low_MUX_uxn_opcodes_h_l1744_c7_6abf_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_40a1
BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_40a1 : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_40a1_left,
BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_40a1_right,
BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_40a1_return_output);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_5d1e
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_5d1e : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_5d1e_left,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_5d1e_right,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_5d1e_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1717_c6_fab4_return_output,
 n16_high_MUX_uxn_opcodes_h_l1717_c2_1503_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_1503_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_1503_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_1503_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_1503_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1717_c2_1503_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1717_c2_1503_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_1503_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_1503_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_1503_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_1503_return_output,
 t8_MUX_uxn_opcodes_h_l1717_c2_1503_return_output,
 n16_low_MUX_uxn_opcodes_h_l1717_c2_1503_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1730_c11_84c1_return_output,
 n16_high_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output,
 t8_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output,
 n16_low_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ad78_return_output,
 n16_high_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output,
 t8_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output,
 n16_low_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d8ac_return_output,
 n16_high_MUX_uxn_opcodes_h_l1737_c7_6375_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_6375_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1737_c7_6375_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_6375_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_6375_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1737_c7_6375_return_output,
 n16_low_MUX_uxn_opcodes_h_l1737_c7_6375_return_output,
 sp_relative_shift_uxn_opcodes_h_l1739_c30_a3ec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1744_c11_4196_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1744_c7_6abf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_6abf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_6abf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1744_c7_6abf_return_output,
 n16_low_MUX_uxn_opcodes_h_l1744_c7_6abf_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_40a1_return_output,
 BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_5d1e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_fab4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_fab4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_fab4_return_output : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1717_c2_1503_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1717_c2_1503_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_1503_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_1503_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1717_c2_1503_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_1503_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_1503_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1717_c2_1503_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_1503_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_1503_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1717_c2_1503_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_1503_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_1503_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c2_1503_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c2_1503_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c2_1503_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c2_1503_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1717_c2_1503_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_1503_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_1503_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1722_c3_60c6 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_1503_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_1503_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_1503_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_1503_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1727_c3_103a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_1503_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_1503_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1717_c2_1503_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1717_c2_1503_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1717_c2_1503_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1717_c2_1503_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_84c1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_84c1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_84c1_return_output : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1730_c7_2c13_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_2c13_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1730_c7_2c13_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_2c13_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_2c13_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1730_c7_2c13_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1731_c3_42fd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_2c13_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1730_c7_2c13_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1730_c7_2c13_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ad78_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ad78_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ad78_return_output : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1737_c7_6375_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_6375_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_6375_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_6375_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_6375_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_6375_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1735_c3_6964 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1733_c7_f8f7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1737_c7_6375_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d8ac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d8ac_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d8ac_return_output : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1737_c7_6375_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1737_c7_6375_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1737_c7_6375_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_6375_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_6375_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_6abf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_6375_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_6375_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1741_c3_8477 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_6375_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_6abf_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_6375_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_6375_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_6375_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_6375_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_6375_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_6375_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_6abf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_6375_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_6375_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_6375_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_6abf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_6375_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1737_c7_6375_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1737_c7_6375_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1744_c7_6abf_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1737_c7_6375_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1739_c30_a3ec_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1739_c30_a3ec_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1739_c30_a3ec_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1739_c30_a3ec_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_4196_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_4196_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_4196_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_6abf_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1747_c3_5470 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_6abf_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_6abf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_6abf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1746_c3_88e1 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_6abf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_6abf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_6abf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_6abf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_6abf_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_6abf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_6abf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_6abf_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1744_c7_6abf_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1744_c7_6abf_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1744_c7_6abf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_40a1_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_40a1_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_40a1_return_output : signed(18 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1717_DUPLICATE_34f0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1717_DUPLICATE_6aac_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1737_DUPLICATE_fd93_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1730_l1733_l1737_DUPLICATE_891a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1730_l1744_l1733_DUPLICATE_0c7a_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_b64c_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_5d1e_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_5d1e_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_5d1e_return_output : signed(17 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6145_uxn_opcodes_h_l1713_l1752_DUPLICATE_6add_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l1739_c30_a3ec_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_fab4_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1727_c3_103a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1727_c3_103a;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_84c1_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1746_c3_88e1 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_6abf_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1746_c3_88e1;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1731_c3_42fd := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1731_c3_42fd;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d8ac_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_6abf_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_6375_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1722_c3_60c6 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1722_c3_60c6;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ad78_right := to_unsigned(2, 2);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_4196_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1739_c30_a3ec_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1735_c3_6964 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1735_c3_6964;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_40a1_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1739_c30_a3ec_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1737_c7_6375_iffalse := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1737_c7_6375_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1744_c7_6abf_iffalse := n16_low;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_5d1e_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_fab4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_84c1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ad78_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d8ac_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_4196_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l1737_c7_6375_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l1744_c7_6abf_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_6375_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_6abf_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse := t8;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1730_l1744_l1733_DUPLICATE_0c7a LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1730_l1744_l1733_DUPLICATE_0c7a_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1737_c11_d8ac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d8ac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d8ac_left;
     BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d8ac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d8ac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d8ac_return_output := BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d8ac_return_output;

     -- CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_b64c LATENCY=0
     VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_b64c_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l1744_c11_4196] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1744_c11_4196_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_4196_left;
     BIN_OP_EQ_uxn_opcodes_h_l1744_c11_4196_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_4196_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_4196_return_output := BIN_OP_EQ_uxn_opcodes_h_l1744_c11_4196_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1739_c30_a3ec] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1739_c30_a3ec_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1739_c30_a3ec_ins;
     sp_relative_shift_uxn_opcodes_h_l1739_c30_a3ec_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1739_c30_a3ec_x;
     sp_relative_shift_uxn_opcodes_h_l1739_c30_a3ec_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1739_c30_a3ec_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1739_c30_a3ec_return_output := sp_relative_shift_uxn_opcodes_h_l1739_c30_a3ec_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1717_DUPLICATE_6aac LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1717_DUPLICATE_6aac_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1730_l1733_l1737_DUPLICATE_891a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1730_l1733_l1737_DUPLICATE_891a_return_output := result.is_ram_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1717_c2_1503] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1717_c2_1503_return_output := result.is_pc_updated;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1733_c7_f8f7] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1733_c7_f8f7_return_output := result.stack_address_sp_offset;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l1717_c2_1503] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1717_c2_1503_return_output := result.is_stack_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1717_c2_1503] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1717_c2_1503_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1717_c6_fab4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1717_c6_fab4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_fab4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1717_c6_fab4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_fab4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_fab4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1717_c6_fab4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1737_DUPLICATE_fd93 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1737_DUPLICATE_fd93_return_output := result.is_opc_done;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1717_c2_1503] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1717_c2_1503_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1733_c11_ad78] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ad78_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ad78_left;
     BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ad78_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ad78_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ad78_return_output := BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ad78_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1730_c11_84c1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1730_c11_84c1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_84c1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1730_c11_84c1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_84c1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_84c1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1730_c11_84c1_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1717_DUPLICATE_34f0 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1717_DUPLICATE_34f0_return_output := result.u8_value;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l1717_c2_1503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_fab4_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1717_c2_1503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_fab4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_1503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_fab4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_1503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_fab4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_1503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_fab4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_1503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_fab4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_1503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_fab4_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_1503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_fab4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_1503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_fab4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_1503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_fab4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c2_1503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_fab4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c2_1503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_fab4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1717_c2_1503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_fab4_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1730_c7_2c13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_84c1_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1730_c7_2c13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_84c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_2c13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_84c1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_2c13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_84c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_2c13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_84c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_2c13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_84c1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1730_c7_2c13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_84c1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1730_c7_2c13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_84c1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1730_c7_2c13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_84c1_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ad78_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ad78_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ad78_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ad78_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ad78_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ad78_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ad78_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ad78_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_ad78_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1737_c7_6375_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d8ac_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1737_c7_6375_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d8ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_6375_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d8ac_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_6375_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d8ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_6375_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d8ac_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_6375_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d8ac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_6375_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_d8ac_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1744_c7_6abf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_4196_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_6abf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_4196_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_6abf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_4196_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_6abf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_4196_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_6abf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_4196_return_output;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_5d1e_right := VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_b64c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1730_l1744_l1733_DUPLICATE_0c7a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1730_l1744_l1733_DUPLICATE_0c7a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_6abf_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1730_l1744_l1733_DUPLICATE_0c7a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1717_DUPLICATE_6aac_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1717_DUPLICATE_6aac_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1717_DUPLICATE_6aac_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_6abf_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1717_DUPLICATE_6aac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1737_DUPLICATE_fd93_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1737_DUPLICATE_fd93_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_6375_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1737_DUPLICATE_fd93_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_6abf_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1737_DUPLICATE_fd93_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1730_l1733_l1737_DUPLICATE_891a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1730_l1733_l1737_DUPLICATE_891a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_6375_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1730_l1733_l1737_DUPLICATE_891a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1717_DUPLICATE_34f0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1717_DUPLICATE_34f0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1717_DUPLICATE_34f0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_6abf_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1730_l1744_l1733_l1717_DUPLICATE_34f0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1717_c2_1503_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1717_c2_1503_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1717_c2_1503_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1717_c2_1503_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1733_c7_f8f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_6375_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1739_c30_a3ec_return_output;
     -- n16_high_MUX[uxn_opcodes_h_l1737_c7_6375] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1737_c7_6375_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1737_c7_6375_cond;
     n16_high_MUX_uxn_opcodes_h_l1737_c7_6375_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1737_c7_6375_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1737_c7_6375_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1737_c7_6375_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1737_c7_6375_return_output := n16_high_MUX_uxn_opcodes_h_l1737_c7_6375_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1744_c7_6abf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1744_c7_6abf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_6abf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1744_c7_6abf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_6abf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1744_c7_6abf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_6abf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_6abf_return_output := result_u8_value_MUX_uxn_opcodes_h_l1744_c7_6abf_return_output;

     -- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_5d1e LATENCY=0
     -- Inputs
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_5d1e_left <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_5d1e_left;
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_5d1e_right <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_5d1e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_5d1e_return_output := BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_5d1e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1733_c7_f8f7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1717_c2_1503] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_1503_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_1503_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_1503_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_1503_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1744_c7_6abf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_6abf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_6abf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_6abf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_6abf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_6abf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_6abf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_6abf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_6abf_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1737_c7_6375] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_6375_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_6375_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_6375_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_6375_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_6375_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_6375_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_6375_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_6375_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1744_c7_6abf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_6abf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_6abf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_6abf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_6abf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_6abf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_6abf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_6abf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_6abf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1717_c2_1503] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_1503_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_1503_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_1503_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_1503_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1744_c7_6abf] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1744_c7_6abf_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1744_c7_6abf_cond;
     n16_low_MUX_uxn_opcodes_h_l1744_c7_6abf_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1744_c7_6abf_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1744_c7_6abf_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1744_c7_6abf_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1744_c7_6abf_return_output := n16_low_MUX_uxn_opcodes_h_l1744_c7_6abf_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1717_c2_1503] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_1503_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_1503_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_1503_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_1503_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1717_c2_1503] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_1503_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_1503_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_1503_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_1503_return_output;

     -- t8_MUX[uxn_opcodes_h_l1733_c7_f8f7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond <= VAR_t8_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond;
     t8_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue;
     t8_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output := t8_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_40a1_left := VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_5d1e_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1741_c3_8477 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1741_l1747_DUPLICATE_5d1e_return_output)),16);
     VAR_n16_high_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1737_c7_6375_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1737_c7_6375_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1744_c7_6abf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_6375_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_6abf_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1737_c7_6375_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_6375_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_6abf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_6375_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_6abf_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_6375_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1741_c3_8477;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1737_c7_6375] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_6375_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_6375_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_6375_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_6375_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_6375_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_6375_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_6375_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_6375_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1737_c7_6375] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_6375_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_6375_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_6375_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_6375_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_6375_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_6375_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_6375_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_6375_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1733_c7_f8f7] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond;
     n16_high_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output := n16_high_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1747_c22_40a1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_40a1_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_40a1_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_40a1_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_40a1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_40a1_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_40a1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1730_c7_2c13] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_2c13_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_2c13_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1733_c7_f8f7] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1737_c7_6375] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1737_c7_6375_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_6375_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1737_c7_6375_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_6375_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1737_c7_6375_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_6375_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_6375_return_output := result_u8_value_MUX_uxn_opcodes_h_l1737_c7_6375_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1737_c7_6375] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1737_c7_6375_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1737_c7_6375_cond;
     n16_low_MUX_uxn_opcodes_h_l1737_c7_6375_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1737_c7_6375_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1737_c7_6375_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1737_c7_6375_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1737_c7_6375_return_output := n16_low_MUX_uxn_opcodes_h_l1737_c7_6375_return_output;

     -- t8_MUX[uxn_opcodes_h_l1730_c7_2c13] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1730_c7_2c13_cond <= VAR_t8_MUX_uxn_opcodes_h_l1730_c7_2c13_cond;
     t8_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue;
     t8_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output := t8_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output;

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1747_c3_5470 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_40a1_return_output)),16);
     VAR_n16_high_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1737_c7_6375_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_6375_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_6375_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_6375_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_6abf_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1747_c3_5470;
     -- t8_MUX[uxn_opcodes_h_l1717_c2_1503] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1717_c2_1503_cond <= VAR_t8_MUX_uxn_opcodes_h_l1717_c2_1503_cond;
     t8_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue;
     t8_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1717_c2_1503_return_output := t8_MUX_uxn_opcodes_h_l1717_c2_1503_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1733_c7_f8f7] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond;
     n16_low_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output := n16_low_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1733_c7_f8f7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1730_c7_2c13] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_2c13_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_2c13_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1730_c7_2c13] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1730_c7_2c13_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1730_c7_2c13_cond;
     n16_high_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output := n16_high_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1733_c7_f8f7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1717_c2_1503] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_1503_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_1503_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_1503_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_1503_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1744_c7_6abf] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1744_c7_6abf_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_6abf_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1744_c7_6abf_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_6abf_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1744_c7_6abf_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_6abf_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_6abf_return_output := result_u16_value_MUX_uxn_opcodes_h_l1744_c7_6abf_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1733_c7_f8f7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_6375_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_6abf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1717_c2_1503_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1730_c7_2c13] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_2c13_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_2c13_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1730_c7_2c13] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_2c13_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_2c13_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1717_c2_1503] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1717_c2_1503_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1717_c2_1503_cond;
     n16_high_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1717_c2_1503_return_output := n16_high_MUX_uxn_opcodes_h_l1717_c2_1503_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1717_c2_1503] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_1503_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_1503_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_1503_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_1503_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1730_c7_2c13] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1730_c7_2c13_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1730_c7_2c13_cond;
     n16_low_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output := n16_low_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1730_c7_2c13] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1730_c7_2c13_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1730_c7_2c13_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output := result_u8_value_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1737_c7_6375] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1737_c7_6375_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_6375_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1737_c7_6375_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_6375_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1737_c7_6375_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_6375_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_6375_return_output := result_u16_value_MUX_uxn_opcodes_h_l1737_c7_6375_return_output;

     -- Submodule level 5
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l1717_c2_1503_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_6375_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1717_c2_1503] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_1503_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_1503_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_1503_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_1503_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1717_c2_1503] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_1503_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_1503_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_1503_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_1503_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1717_c2_1503] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1717_c2_1503_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c2_1503_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c2_1503_return_output := result_u8_value_MUX_uxn_opcodes_h_l1717_c2_1503_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1733_c7_f8f7] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output := result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1717_c2_1503] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1717_c2_1503_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1717_c2_1503_cond;
     n16_low_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1717_c2_1503_return_output := n16_low_MUX_uxn_opcodes_h_l1717_c2_1503_return_output;

     -- Submodule level 6
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l1717_c2_1503_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1733_c7_f8f7_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1730_c7_2c13] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1730_c7_2c13_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1730_c7_2c13_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1730_c7_2c13_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1730_c7_2c13_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output := result_u16_value_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1730_c7_2c13_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1717_c2_1503] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1717_c2_1503_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c2_1503_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c2_1503_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c2_1503_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c2_1503_return_output := result_u16_value_MUX_uxn_opcodes_h_l1717_c2_1503_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6145_uxn_opcodes_h_l1713_l1752_DUPLICATE_6add LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6145_uxn_opcodes_h_l1713_l1752_DUPLICATE_6add_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6145(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c2_1503_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_1503_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1717_c2_1503_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1717_c2_1503_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c2_1503_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c2_1503_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1717_c2_1503_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_1503_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_1503_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_1503_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6145_uxn_opcodes_h_l1713_l1752_DUPLICATE_6add_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6145_uxn_opcodes_h_l1713_l1752_DUPLICATE_6add_return_output;
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
