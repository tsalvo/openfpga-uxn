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
-- Submodules: 40
entity stz_0CLK_bacf6a1d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end stz_0CLK_bacf6a1d;
architecture arch of stz_0CLK_bacf6a1d is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1538_c6_6e13]
signal BIN_OP_EQ_uxn_opcodes_h_l1538_c6_6e13_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1538_c6_6e13_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1538_c6_6e13_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1538_c2_a205]
signal t8_MUX_uxn_opcodes_h_l1538_c2_a205_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1538_c2_a205_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1538_c2_a205]
signal n8_MUX_uxn_opcodes_h_l1538_c2_a205_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1538_c2_a205_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1538_c2_a205]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_a205_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_a205_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1538_c2_a205]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_a205_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_a205_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1538_c2_a205]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_a205_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_a205_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1538_c2_a205]
signal result_u8_value_MUX_uxn_opcodes_h_l1538_c2_a205_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1538_c2_a205_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1538_c2_a205]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_a205_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_a205_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1538_c2_a205]
signal result_u16_value_MUX_uxn_opcodes_h_l1538_c2_a205_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1538_c2_a205_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1538_c2_a205]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_a205_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_a205_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1538_c2_a205]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_a205_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_a205_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1538_c2_a205]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_a205_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_a205_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1538_c2_a205]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_a205_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_a205_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1551_c11_df8f]
signal BIN_OP_EQ_uxn_opcodes_h_l1551_c11_df8f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1551_c11_df8f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1551_c11_df8f_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1551_c7_dab2]
signal t8_MUX_uxn_opcodes_h_l1551_c7_dab2_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1551_c7_dab2_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1551_c7_dab2_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1551_c7_dab2]
signal n8_MUX_uxn_opcodes_h_l1551_c7_dab2_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1551_c7_dab2_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1551_c7_dab2_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1551_c7_dab2]
signal result_u16_value_MUX_uxn_opcodes_h_l1551_c7_dab2_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1551_c7_dab2_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1551_c7_dab2_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1551_c7_dab2]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_dab2_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_dab2_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_dab2_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1551_c7_dab2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_dab2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_dab2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_dab2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1551_c7_dab2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_dab2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_dab2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_dab2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1551_c7_dab2]
signal result_u8_value_MUX_uxn_opcodes_h_l1551_c7_dab2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1551_c7_dab2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1551_c7_dab2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1551_c7_dab2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_dab2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_dab2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_dab2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1554_c11_abc2]
signal BIN_OP_EQ_uxn_opcodes_h_l1554_c11_abc2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1554_c11_abc2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1554_c11_abc2_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1554_c7_6026]
signal t8_MUX_uxn_opcodes_h_l1554_c7_6026_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1554_c7_6026_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1554_c7_6026_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1554_c7_6026_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1554_c7_6026]
signal n8_MUX_uxn_opcodes_h_l1554_c7_6026_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1554_c7_6026_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1554_c7_6026_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1554_c7_6026_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1554_c7_6026]
signal result_u16_value_MUX_uxn_opcodes_h_l1554_c7_6026_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1554_c7_6026_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1554_c7_6026_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1554_c7_6026_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1554_c7_6026]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_6026_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_6026_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_6026_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_6026_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1554_c7_6026]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_6026_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_6026_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_6026_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_6026_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1554_c7_6026]
signal result_u8_value_MUX_uxn_opcodes_h_l1554_c7_6026_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1554_c7_6026_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1554_c7_6026_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1554_c7_6026_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1554_c7_6026]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6026_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6026_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6026_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6026_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1557_c11_dfc3]
signal BIN_OP_EQ_uxn_opcodes_h_l1557_c11_dfc3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1557_c11_dfc3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1557_c11_dfc3_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1557_c7_9243]
signal n8_MUX_uxn_opcodes_h_l1557_c7_9243_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1557_c7_9243_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1557_c7_9243_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1557_c7_9243_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1557_c7_9243]
signal result_u16_value_MUX_uxn_opcodes_h_l1557_c7_9243_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1557_c7_9243_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1557_c7_9243_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1557_c7_9243_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1557_c7_9243]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_9243_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_9243_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_9243_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_9243_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1557_c7_9243]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_9243_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_9243_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_9243_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_9243_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1557_c7_9243]
signal result_u8_value_MUX_uxn_opcodes_h_l1557_c7_9243_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1557_c7_9243_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1557_c7_9243_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1557_c7_9243_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1557_c7_9243]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_9243_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_9243_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_9243_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_9243_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1559_c30_839f]
signal sp_relative_shift_uxn_opcodes_h_l1559_c30_839f_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1559_c30_839f_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1559_c30_839f_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1559_c30_839f_return_output : signed(3 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_775a( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.u16_value := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;
      base.is_ram_write := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1538_c6_6e13
BIN_OP_EQ_uxn_opcodes_h_l1538_c6_6e13 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1538_c6_6e13_left,
BIN_OP_EQ_uxn_opcodes_h_l1538_c6_6e13_right,
BIN_OP_EQ_uxn_opcodes_h_l1538_c6_6e13_return_output);

-- t8_MUX_uxn_opcodes_h_l1538_c2_a205
t8_MUX_uxn_opcodes_h_l1538_c2_a205 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1538_c2_a205_cond,
t8_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue,
t8_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse,
t8_MUX_uxn_opcodes_h_l1538_c2_a205_return_output);

-- n8_MUX_uxn_opcodes_h_l1538_c2_a205
n8_MUX_uxn_opcodes_h_l1538_c2_a205 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1538_c2_a205_cond,
n8_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue,
n8_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse,
n8_MUX_uxn_opcodes_h_l1538_c2_a205_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_a205
result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_a205 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_a205_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_a205_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_a205
result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_a205 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_a205_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_a205_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_a205
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_a205 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_a205_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_a205_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1538_c2_a205
result_u8_value_MUX_uxn_opcodes_h_l1538_c2_a205 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1538_c2_a205_cond,
result_u8_value_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1538_c2_a205_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_a205
result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_a205 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_a205_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_a205_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1538_c2_a205
result_u16_value_MUX_uxn_opcodes_h_l1538_c2_a205 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1538_c2_a205_cond,
result_u16_value_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1538_c2_a205_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_a205
result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_a205 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_a205_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_a205_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_a205
result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_a205 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_a205_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_a205_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_a205
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_a205 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_a205_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_a205_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_a205
result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_a205 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_a205_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_a205_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1551_c11_df8f
BIN_OP_EQ_uxn_opcodes_h_l1551_c11_df8f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1551_c11_df8f_left,
BIN_OP_EQ_uxn_opcodes_h_l1551_c11_df8f_right,
BIN_OP_EQ_uxn_opcodes_h_l1551_c11_df8f_return_output);

-- t8_MUX_uxn_opcodes_h_l1551_c7_dab2
t8_MUX_uxn_opcodes_h_l1551_c7_dab2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1551_c7_dab2_cond,
t8_MUX_uxn_opcodes_h_l1551_c7_dab2_iftrue,
t8_MUX_uxn_opcodes_h_l1551_c7_dab2_iffalse,
t8_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output);

-- n8_MUX_uxn_opcodes_h_l1551_c7_dab2
n8_MUX_uxn_opcodes_h_l1551_c7_dab2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1551_c7_dab2_cond,
n8_MUX_uxn_opcodes_h_l1551_c7_dab2_iftrue,
n8_MUX_uxn_opcodes_h_l1551_c7_dab2_iffalse,
n8_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1551_c7_dab2
result_u16_value_MUX_uxn_opcodes_h_l1551_c7_dab2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1551_c7_dab2_cond,
result_u16_value_MUX_uxn_opcodes_h_l1551_c7_dab2_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1551_c7_dab2_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_dab2
result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_dab2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_dab2_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_dab2_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_dab2_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_dab2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_dab2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_dab2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_dab2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_dab2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_dab2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_dab2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_dab2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_dab2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_dab2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1551_c7_dab2
result_u8_value_MUX_uxn_opcodes_h_l1551_c7_dab2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1551_c7_dab2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1551_c7_dab2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1551_c7_dab2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_dab2
result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_dab2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_dab2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_dab2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_dab2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1554_c11_abc2
BIN_OP_EQ_uxn_opcodes_h_l1554_c11_abc2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1554_c11_abc2_left,
BIN_OP_EQ_uxn_opcodes_h_l1554_c11_abc2_right,
BIN_OP_EQ_uxn_opcodes_h_l1554_c11_abc2_return_output);

-- t8_MUX_uxn_opcodes_h_l1554_c7_6026
t8_MUX_uxn_opcodes_h_l1554_c7_6026 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1554_c7_6026_cond,
t8_MUX_uxn_opcodes_h_l1554_c7_6026_iftrue,
t8_MUX_uxn_opcodes_h_l1554_c7_6026_iffalse,
t8_MUX_uxn_opcodes_h_l1554_c7_6026_return_output);

-- n8_MUX_uxn_opcodes_h_l1554_c7_6026
n8_MUX_uxn_opcodes_h_l1554_c7_6026 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1554_c7_6026_cond,
n8_MUX_uxn_opcodes_h_l1554_c7_6026_iftrue,
n8_MUX_uxn_opcodes_h_l1554_c7_6026_iffalse,
n8_MUX_uxn_opcodes_h_l1554_c7_6026_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1554_c7_6026
result_u16_value_MUX_uxn_opcodes_h_l1554_c7_6026 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1554_c7_6026_cond,
result_u16_value_MUX_uxn_opcodes_h_l1554_c7_6026_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1554_c7_6026_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1554_c7_6026_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_6026
result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_6026 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_6026_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_6026_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_6026_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_6026_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_6026
result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_6026 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_6026_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_6026_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_6026_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_6026_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1554_c7_6026
result_u8_value_MUX_uxn_opcodes_h_l1554_c7_6026 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1554_c7_6026_cond,
result_u8_value_MUX_uxn_opcodes_h_l1554_c7_6026_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1554_c7_6026_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1554_c7_6026_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6026
result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6026 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6026_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6026_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6026_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6026_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1557_c11_dfc3
BIN_OP_EQ_uxn_opcodes_h_l1557_c11_dfc3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1557_c11_dfc3_left,
BIN_OP_EQ_uxn_opcodes_h_l1557_c11_dfc3_right,
BIN_OP_EQ_uxn_opcodes_h_l1557_c11_dfc3_return_output);

-- n8_MUX_uxn_opcodes_h_l1557_c7_9243
n8_MUX_uxn_opcodes_h_l1557_c7_9243 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1557_c7_9243_cond,
n8_MUX_uxn_opcodes_h_l1557_c7_9243_iftrue,
n8_MUX_uxn_opcodes_h_l1557_c7_9243_iffalse,
n8_MUX_uxn_opcodes_h_l1557_c7_9243_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1557_c7_9243
result_u16_value_MUX_uxn_opcodes_h_l1557_c7_9243 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1557_c7_9243_cond,
result_u16_value_MUX_uxn_opcodes_h_l1557_c7_9243_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1557_c7_9243_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1557_c7_9243_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_9243
result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_9243 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_9243_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_9243_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_9243_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_9243_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_9243
result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_9243 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_9243_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_9243_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_9243_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_9243_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1557_c7_9243
result_u8_value_MUX_uxn_opcodes_h_l1557_c7_9243 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1557_c7_9243_cond,
result_u8_value_MUX_uxn_opcodes_h_l1557_c7_9243_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1557_c7_9243_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1557_c7_9243_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_9243
result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_9243 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_9243_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_9243_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_9243_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_9243_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1559_c30_839f
sp_relative_shift_uxn_opcodes_h_l1559_c30_839f : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1559_c30_839f_ins,
sp_relative_shift_uxn_opcodes_h_l1559_c30_839f_x,
sp_relative_shift_uxn_opcodes_h_l1559_c30_839f_y,
sp_relative_shift_uxn_opcodes_h_l1559_c30_839f_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1538_c6_6e13_return_output,
 t8_MUX_uxn_opcodes_h_l1538_c2_a205_return_output,
 n8_MUX_uxn_opcodes_h_l1538_c2_a205_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_a205_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_a205_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_a205_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1538_c2_a205_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_a205_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1538_c2_a205_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_a205_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_a205_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_a205_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_a205_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1551_c11_df8f_return_output,
 t8_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output,
 n8_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1554_c11_abc2_return_output,
 t8_MUX_uxn_opcodes_h_l1554_c7_6026_return_output,
 n8_MUX_uxn_opcodes_h_l1554_c7_6026_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1554_c7_6026_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_6026_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_6026_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1554_c7_6026_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6026_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1557_c11_dfc3_return_output,
 n8_MUX_uxn_opcodes_h_l1557_c7_9243_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1557_c7_9243_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_9243_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_9243_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1557_c7_9243_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_9243_return_output,
 sp_relative_shift_uxn_opcodes_h_l1559_c30_839f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c6_6e13_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c6_6e13_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c6_6e13_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1538_c2_a205_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1538_c2_a205_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1538_c2_a205_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1538_c2_a205_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1538_c2_a205_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_a205_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_a205_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1538_c2_a205_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_a205_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_a205_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1538_c2_a205_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_a205_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_a205_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1538_c2_a205_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1538_c2_a205_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_a205_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_a205_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1538_c2_a205_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1538_c2_a205_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1543_c3_d9fa : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_a205_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_a205_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1538_c2_a205_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_a205_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_a205_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1548_c3_e2eb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_a205_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_a205_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_a205_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_a205_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1551_c11_df8f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1551_c11_df8f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1551_c11_df8f_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1551_c7_dab2_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1551_c7_dab2_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1554_c7_6026_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1551_c7_dab2_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1551_c7_dab2_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1551_c7_dab2_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1554_c7_6026_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1551_c7_dab2_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1551_c7_dab2_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1551_c7_dab2_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1554_c7_6026_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1551_c7_dab2_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_dab2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_dab2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_6026_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_dab2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_dab2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1552_c3_ff93 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_dab2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1551_c7_dab2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_dab2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_dab2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_dab2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_6026_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_dab2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1551_c7_dab2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1551_c7_dab2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1554_c7_6026_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1551_c7_dab2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_dab2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_dab2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6026_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_dab2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1554_c11_abc2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1554_c11_abc2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1554_c11_abc2_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1554_c7_6026_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1554_c7_6026_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1554_c7_6026_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1554_c7_6026_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1554_c7_6026_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1557_c7_9243_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1554_c7_6026_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1554_c7_6026_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1554_c7_6026_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c7_9243_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1554_c7_6026_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_6026_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_6026_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_9243_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_6026_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_6026_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_6026_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_9243_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_6026_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1554_c7_6026_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1554_c7_6026_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c7_9243_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1554_c7_6026_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6026_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6026_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_9243_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6026_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c11_dfc3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c11_dfc3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c11_dfc3_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1557_c7_9243_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1557_c7_9243_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1557_c7_9243_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c7_9243_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c7_9243_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c7_9243_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_9243_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_9243_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_9243_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_9243_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_9243_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_9243_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c7_9243_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c7_9243_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c7_9243_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_9243_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_9243_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_9243_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1559_c30_839f_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1559_c30_839f_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1559_c30_839f_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1559_c30_839f_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1561_c22_99b1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1554_l1538_l1557_l1551_DUPLICATE_396d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1554_l1538_l1557_l1551_DUPLICATE_584b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1554_l1557_l1551_DUPLICATE_7a6a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1554_l1557_l1551_DUPLICATE_9c53_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1554_l1557_l1551_DUPLICATE_eeeb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l1534_l1566_DUPLICATE_3eb2_return_output : opcode_result_t;
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
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_9243_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1559_c30_839f_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c6_6e13_right := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c11_dfc3_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1551_c11_df8f_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_9243_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1552_c3_ff93 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_dab2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1552_c3_ff93;
     VAR_sp_relative_shift_uxn_opcodes_h_l1559_c30_839f_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1548_c3_e2eb := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1548_c3_e2eb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1554_c11_abc2_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1543_c3_d9fa := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1543_c3_d9fa;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1559_c30_839f_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1551_c7_dab2_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1554_c7_6026_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1557_c7_9243_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c6_6e13_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1551_c11_df8f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1554_c11_abc2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c11_dfc3_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1557_c7_9243_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c7_9243_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1554_c7_6026_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1551_c7_dab2_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1554_c7_6026_iffalse := t8;
     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l1538_c2_a205] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1538_c2_a205_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1554_c11_abc2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1554_c11_abc2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1554_c11_abc2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1554_c11_abc2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1554_c11_abc2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1554_c11_abc2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1554_c11_abc2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1551_c11_df8f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1551_c11_df8f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1551_c11_df8f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1551_c11_df8f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1551_c11_df8f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1551_c11_df8f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1551_c11_df8f_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1538_c2_a205] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1538_c2_a205_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1557_c11_dfc3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1557_c11_dfc3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c11_dfc3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1557_c11_dfc3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c11_dfc3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c11_dfc3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1557_c11_dfc3_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1554_l1557_l1551_DUPLICATE_eeeb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1554_l1557_l1551_DUPLICATE_eeeb_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1554_l1538_l1557_l1551_DUPLICATE_396d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1554_l1538_l1557_l1551_DUPLICATE_396d_return_output := result.u8_value;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1554_l1538_l1557_l1551_DUPLICATE_584b LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1554_l1538_l1557_l1551_DUPLICATE_584b_return_output := result.u16_value;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1551_c7_dab2] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1551_c7_dab2_return_output := result.stack_address_sp_offset;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1538_c2_a205] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1538_c2_a205_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1538_c6_6e13] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1538_c6_6e13_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c6_6e13_left;
     BIN_OP_EQ_uxn_opcodes_h_l1538_c6_6e13_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c6_6e13_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c6_6e13_return_output := BIN_OP_EQ_uxn_opcodes_h_l1538_c6_6e13_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1554_l1557_l1551_DUPLICATE_9c53 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1554_l1557_l1551_DUPLICATE_9c53_return_output := result.sp_relative_shift;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1538_c2_a205] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1538_c2_a205_return_output := result.is_stack_index_flipped;

     -- sp_relative_shift[uxn_opcodes_h_l1559_c30_839f] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1559_c30_839f_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1559_c30_839f_ins;
     sp_relative_shift_uxn_opcodes_h_l1559_c30_839f_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1559_c30_839f_x;
     sp_relative_shift_uxn_opcodes_h_l1559_c30_839f_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1559_c30_839f_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1559_c30_839f_return_output := sp_relative_shift_uxn_opcodes_h_l1559_c30_839f_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1561_c22_99b1] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1561_c22_99b1_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1554_l1557_l1551_DUPLICATE_7a6a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1554_l1557_l1551_DUPLICATE_7a6a_return_output := result.is_ram_write;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l1538_c2_a205_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c6_6e13_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_a205_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c6_6e13_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_a205_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c6_6e13_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_a205_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c6_6e13_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_a205_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c6_6e13_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_a205_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c6_6e13_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_a205_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c6_6e13_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_a205_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c6_6e13_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_a205_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c6_6e13_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1538_c2_a205_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c6_6e13_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1538_c2_a205_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c6_6e13_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1538_c2_a205_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c6_6e13_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1551_c7_dab2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1551_c11_df8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_dab2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1551_c11_df8f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_dab2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1551_c11_df8f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_dab2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1551_c11_df8f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_dab2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1551_c11_df8f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1551_c7_dab2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1551_c11_df8f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1551_c7_dab2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1551_c11_df8f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1551_c7_dab2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1551_c11_df8f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1554_c7_6026_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1554_c11_abc2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6026_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1554_c11_abc2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_6026_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1554_c11_abc2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_6026_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1554_c11_abc2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1554_c7_6026_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1554_c11_abc2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1554_c7_6026_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1554_c11_abc2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1554_c7_6026_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1554_c11_abc2_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1557_c7_9243_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c11_dfc3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_9243_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c11_dfc3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_9243_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c11_dfc3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_9243_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c11_dfc3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c7_9243_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c11_dfc3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c7_9243_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c11_dfc3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c7_9243_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1561_c22_99b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_dab2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1554_l1557_l1551_DUPLICATE_9c53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_6026_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1554_l1557_l1551_DUPLICATE_9c53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_9243_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1554_l1557_l1551_DUPLICATE_9c53_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1554_l1538_l1557_l1551_DUPLICATE_584b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1551_c7_dab2_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1554_l1538_l1557_l1551_DUPLICATE_584b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1554_c7_6026_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1554_l1538_l1557_l1551_DUPLICATE_584b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c7_9243_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1554_l1538_l1557_l1551_DUPLICATE_584b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_dab2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1554_l1557_l1551_DUPLICATE_eeeb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6026_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1554_l1557_l1551_DUPLICATE_eeeb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_9243_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1554_l1557_l1551_DUPLICATE_eeeb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_dab2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1554_l1557_l1551_DUPLICATE_7a6a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_6026_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1554_l1557_l1551_DUPLICATE_7a6a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_9243_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1554_l1557_l1551_DUPLICATE_7a6a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1554_l1538_l1557_l1551_DUPLICATE_396d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1551_c7_dab2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1554_l1538_l1557_l1551_DUPLICATE_396d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1554_c7_6026_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1554_l1538_l1557_l1551_DUPLICATE_396d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c7_9243_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1554_l1538_l1557_l1551_DUPLICATE_396d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1538_c2_a205_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1538_c2_a205_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1538_c2_a205_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1538_c2_a205_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_dab2_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1551_c7_dab2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_9243_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1559_c30_839f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1551_c7_dab2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_dab2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_dab2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_dab2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_dab2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_dab2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_dab2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output;

     -- t8_MUX[uxn_opcodes_h_l1554_c7_6026] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1554_c7_6026_cond <= VAR_t8_MUX_uxn_opcodes_h_l1554_c7_6026_cond;
     t8_MUX_uxn_opcodes_h_l1554_c7_6026_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1554_c7_6026_iftrue;
     t8_MUX_uxn_opcodes_h_l1554_c7_6026_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1554_c7_6026_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1554_c7_6026_return_output := t8_MUX_uxn_opcodes_h_l1554_c7_6026_return_output;

     -- n8_MUX[uxn_opcodes_h_l1557_c7_9243] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1557_c7_9243_cond <= VAR_n8_MUX_uxn_opcodes_h_l1557_c7_9243_cond;
     n8_MUX_uxn_opcodes_h_l1557_c7_9243_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1557_c7_9243_iftrue;
     n8_MUX_uxn_opcodes_h_l1557_c7_9243_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1557_c7_9243_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1557_c7_9243_return_output := n8_MUX_uxn_opcodes_h_l1557_c7_9243_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1557_c7_9243] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1557_c7_9243_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c7_9243_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1557_c7_9243_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c7_9243_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1557_c7_9243_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c7_9243_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c7_9243_return_output := result_u16_value_MUX_uxn_opcodes_h_l1557_c7_9243_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1538_c2_a205] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_a205_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_a205_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_a205_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_a205_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1538_c2_a205] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_a205_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_a205_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_a205_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_a205_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1557_c7_9243] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_9243_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_9243_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_9243_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_9243_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_9243_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_9243_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_9243_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_9243_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1557_c7_9243] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1557_c7_9243_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c7_9243_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1557_c7_9243_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c7_9243_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1557_c7_9243_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c7_9243_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c7_9243_return_output := result_u8_value_MUX_uxn_opcodes_h_l1557_c7_9243_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1538_c2_a205] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_a205_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_a205_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_a205_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_a205_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1557_c7_9243] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_9243_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_9243_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_9243_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_9243_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_9243_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_9243_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_9243_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_9243_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1557_c7_9243] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_9243_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_9243_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_9243_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_9243_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_9243_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_9243_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_9243_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_9243_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1538_c2_a205] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_a205_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_a205_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_a205_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_a205_return_output;

     -- Submodule level 2
     VAR_n8_MUX_uxn_opcodes_h_l1554_c7_6026_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1557_c7_9243_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6026_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_9243_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_6026_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_9243_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_6026_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_9243_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1554_c7_6026_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c7_9243_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1554_c7_6026_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c7_9243_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1551_c7_dab2_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1554_c7_6026_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1554_c7_6026] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1554_c7_6026_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1554_c7_6026_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1554_c7_6026_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1554_c7_6026_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1554_c7_6026_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1554_c7_6026_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1554_c7_6026_return_output := result_u16_value_MUX_uxn_opcodes_h_l1554_c7_6026_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1554_c7_6026] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_6026_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_6026_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_6026_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_6026_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_6026_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_6026_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_6026_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_6026_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1554_c7_6026] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1554_c7_6026_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1554_c7_6026_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1554_c7_6026_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1554_c7_6026_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1554_c7_6026_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1554_c7_6026_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1554_c7_6026_return_output := result_u8_value_MUX_uxn_opcodes_h_l1554_c7_6026_return_output;

     -- t8_MUX[uxn_opcodes_h_l1551_c7_dab2] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1551_c7_dab2_cond <= VAR_t8_MUX_uxn_opcodes_h_l1551_c7_dab2_cond;
     t8_MUX_uxn_opcodes_h_l1551_c7_dab2_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1551_c7_dab2_iftrue;
     t8_MUX_uxn_opcodes_h_l1551_c7_dab2_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1551_c7_dab2_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output := t8_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1554_c7_6026] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_6026_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_6026_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_6026_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_6026_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_6026_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_6026_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_6026_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_6026_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1538_c2_a205] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_a205_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_a205_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_a205_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_a205_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1554_c7_6026] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6026_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6026_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6026_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6026_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6026_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6026_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6026_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6026_return_output;

     -- n8_MUX[uxn_opcodes_h_l1554_c7_6026] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1554_c7_6026_cond <= VAR_n8_MUX_uxn_opcodes_h_l1554_c7_6026_cond;
     n8_MUX_uxn_opcodes_h_l1554_c7_6026_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1554_c7_6026_iftrue;
     n8_MUX_uxn_opcodes_h_l1554_c7_6026_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1554_c7_6026_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1554_c7_6026_return_output := n8_MUX_uxn_opcodes_h_l1554_c7_6026_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l1551_c7_dab2_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1554_c7_6026_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_dab2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_6026_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_dab2_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_6026_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_dab2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_6026_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1551_c7_dab2_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1554_c7_6026_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1551_c7_dab2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1554_c7_6026_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1551_c7_dab2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_dab2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_dab2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_dab2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_dab2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_dab2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_dab2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1551_c7_dab2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1551_c7_dab2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1551_c7_dab2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1551_c7_dab2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1551_c7_dab2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1551_c7_dab2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1551_c7_dab2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1551_c7_dab2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_dab2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_dab2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_dab2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_dab2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_dab2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_dab2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output;

     -- n8_MUX[uxn_opcodes_h_l1551_c7_dab2] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1551_c7_dab2_cond <= VAR_n8_MUX_uxn_opcodes_h_l1551_c7_dab2_cond;
     n8_MUX_uxn_opcodes_h_l1551_c7_dab2_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1551_c7_dab2_iftrue;
     n8_MUX_uxn_opcodes_h_l1551_c7_dab2_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1551_c7_dab2_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output := n8_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1551_c7_dab2] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_dab2_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_dab2_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_dab2_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_dab2_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_dab2_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_dab2_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1551_c7_dab2] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1551_c7_dab2_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1551_c7_dab2_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1551_c7_dab2_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1551_c7_dab2_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1551_c7_dab2_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1551_c7_dab2_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output := result_u16_value_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output;

     -- t8_MUX[uxn_opcodes_h_l1538_c2_a205] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1538_c2_a205_cond <= VAR_t8_MUX_uxn_opcodes_h_l1538_c2_a205_cond;
     t8_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue;
     t8_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1538_c2_a205_return_output := t8_MUX_uxn_opcodes_h_l1538_c2_a205_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1551_c7_dab2_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1538_c2_a205_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1538_c2_a205] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_a205_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_a205_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_a205_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_a205_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1538_c2_a205] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1538_c2_a205_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1538_c2_a205_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1538_c2_a205_return_output := result_u16_value_MUX_uxn_opcodes_h_l1538_c2_a205_return_output;

     -- n8_MUX[uxn_opcodes_h_l1538_c2_a205] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1538_c2_a205_cond <= VAR_n8_MUX_uxn_opcodes_h_l1538_c2_a205_cond;
     n8_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue;
     n8_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1538_c2_a205_return_output := n8_MUX_uxn_opcodes_h_l1538_c2_a205_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1538_c2_a205] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1538_c2_a205_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1538_c2_a205_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1538_c2_a205_return_output := result_u8_value_MUX_uxn_opcodes_h_l1538_c2_a205_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1538_c2_a205] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_a205_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_a205_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_a205_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_a205_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1538_c2_a205] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_a205_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_a205_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_a205_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_a205_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_a205_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_a205_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1538_c2_a205_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l1534_l1566_DUPLICATE_3eb2 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l1534_l1566_DUPLICATE_3eb2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_775a(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_a205_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_a205_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_a205_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1538_c2_a205_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_a205_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1538_c2_a205_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_a205_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_a205_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_a205_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_a205_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l1534_l1566_DUPLICATE_3eb2_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l1534_l1566_DUPLICATE_3eb2_return_output;
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
