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
-- Submodules: 61
entity ldr2_0CLK_b7cf2331 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ldr2_0CLK_b7cf2331;
architecture arch of ldr2_0CLK_b7cf2331 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8_high : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8_low : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp8_high : unsigned(7 downto 0);
signal REG_COMB_tmp8_low : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1661_c6_cc85]
signal BIN_OP_EQ_uxn_opcodes_h_l1661_c6_cc85_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1661_c6_cc85_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1661_c6_cc85_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1661_c2_4444]
signal tmp8_high_MUX_uxn_opcodes_h_l1661_c2_4444_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1661_c2_4444_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1661_c2_4444]
signal t8_MUX_uxn_opcodes_h_l1661_c2_4444_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1661_c2_4444_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1661_c2_4444]
signal tmp8_low_MUX_uxn_opcodes_h_l1661_c2_4444_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1661_c2_4444_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1661_c2_4444]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_4444_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_4444_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1661_c2_4444]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_4444_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_4444_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1661_c2_4444]
signal result_u16_value_MUX_uxn_opcodes_h_l1661_c2_4444_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1661_c2_4444_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1661_c2_4444]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_4444_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_4444_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1661_c2_4444]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_4444_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_4444_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1661_c2_4444]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_4444_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_4444_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1661_c2_4444]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_4444_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_4444_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1661_c2_4444]
signal result_u8_value_MUX_uxn_opcodes_h_l1661_c2_4444_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1661_c2_4444_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1661_c2_4444]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_4444_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_4444_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1661_c2_4444]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_4444_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_4444_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1674_c11_468e]
signal BIN_OP_EQ_uxn_opcodes_h_l1674_c11_468e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1674_c11_468e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1674_c11_468e_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1674_c7_7d61]
signal tmp8_high_MUX_uxn_opcodes_h_l1674_c7_7d61_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1674_c7_7d61]
signal t8_MUX_uxn_opcodes_h_l1674_c7_7d61_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1674_c7_7d61]
signal tmp8_low_MUX_uxn_opcodes_h_l1674_c7_7d61_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1674_c7_7d61]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_7d61_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1674_c7_7d61]
signal result_u16_value_MUX_uxn_opcodes_h_l1674_c7_7d61_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1674_c7_7d61]
signal result_u8_value_MUX_uxn_opcodes_h_l1674_c7_7d61_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1674_c7_7d61]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_7d61_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1674_c7_7d61]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_7d61_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1674_c7_7d61]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_7d61_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1675_c30_e9bc]
signal sp_relative_shift_uxn_opcodes_h_l1675_c30_e9bc_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1675_c30_e9bc_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1675_c30_e9bc_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1675_c30_e9bc_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1677_c11_49a7]
signal BIN_OP_EQ_uxn_opcodes_h_l1677_c11_49a7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1677_c11_49a7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1677_c11_49a7_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1677_c7_f158]
signal tmp8_high_MUX_uxn_opcodes_h_l1677_c7_f158_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1677_c7_f158_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1677_c7_f158]
signal t8_MUX_uxn_opcodes_h_l1677_c7_f158_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1677_c7_f158_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1677_c7_f158]
signal tmp8_low_MUX_uxn_opcodes_h_l1677_c7_f158_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1677_c7_f158_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1677_c7_f158]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_f158_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_f158_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1677_c7_f158]
signal result_u16_value_MUX_uxn_opcodes_h_l1677_c7_f158_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1677_c7_f158_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1677_c7_f158]
signal result_u8_value_MUX_uxn_opcodes_h_l1677_c7_f158_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1677_c7_f158_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1677_c7_f158]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_f158_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_f158_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1677_c7_f158]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_f158_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_f158_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1677_c7_f158]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_f158_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_f158_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1680_c22_9cde]
signal BIN_OP_PLUS_uxn_opcodes_h_l1680_c22_9cde_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1680_c22_9cde_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1680_c22_9cde_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1682_c11_36bc]
signal BIN_OP_EQ_uxn_opcodes_h_l1682_c11_36bc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1682_c11_36bc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1682_c11_36bc_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1682_c7_0a9f]
signal tmp8_high_MUX_uxn_opcodes_h_l1682_c7_0a9f_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1682_c7_0a9f_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1682_c7_0a9f_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1682_c7_0a9f_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1682_c7_0a9f]
signal tmp8_low_MUX_uxn_opcodes_h_l1682_c7_0a9f_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1682_c7_0a9f_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1682_c7_0a9f_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1682_c7_0a9f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1682_c7_0a9f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_0a9f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_0a9f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_0a9f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_0a9f_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1682_c7_0a9f]
signal result_u16_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1682_c7_0a9f]
signal result_u8_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1682_c7_0a9f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_0a9f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_0a9f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_0a9f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_0a9f_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1682_c7_0a9f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_0a9f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_0a9f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_0a9f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_0a9f_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1683_c22_552d]
signal BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_552d_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_552d_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_552d_return_output : signed(17 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1683_c22_35aa]
signal BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_35aa_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_35aa_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_35aa_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1685_c11_16f9]
signal BIN_OP_EQ_uxn_opcodes_h_l1685_c11_16f9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1685_c11_16f9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1685_c11_16f9_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1685_c7_dd5d]
signal tmp8_high_MUX_uxn_opcodes_h_l1685_c7_dd5d_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1685_c7_dd5d_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1685_c7_dd5d_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1685_c7_dd5d_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1685_c7_dd5d]
signal tmp8_low_MUX_uxn_opcodes_h_l1685_c7_dd5d_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1685_c7_dd5d_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1685_c7_dd5d_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1685_c7_dd5d_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1685_c7_dd5d]
signal result_u8_value_MUX_uxn_opcodes_h_l1685_c7_dd5d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1685_c7_dd5d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1685_c7_dd5d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1685_c7_dd5d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1685_c7_dd5d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_dd5d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_dd5d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_dd5d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_dd5d_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1685_c7_dd5d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_dd5d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_dd5d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_dd5d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_dd5d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1685_c7_dd5d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_dd5d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_dd5d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_dd5d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_dd5d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1691_c11_9893]
signal BIN_OP_EQ_uxn_opcodes_h_l1691_c11_9893_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1691_c11_9893_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1691_c11_9893_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1691_c7_3912]
signal tmp8_low_MUX_uxn_opcodes_h_l1691_c7_3912_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1691_c7_3912_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1691_c7_3912_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1691_c7_3912_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1691_c7_3912]
signal result_u8_value_MUX_uxn_opcodes_h_l1691_c7_3912_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1691_c7_3912_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1691_c7_3912_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1691_c7_3912_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1691_c7_3912]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_3912_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_3912_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_3912_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_3912_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1691_c7_3912]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_3912_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_3912_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_3912_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_3912_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
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
-- BIN_OP_EQ_uxn_opcodes_h_l1661_c6_cc85
BIN_OP_EQ_uxn_opcodes_h_l1661_c6_cc85 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1661_c6_cc85_left,
BIN_OP_EQ_uxn_opcodes_h_l1661_c6_cc85_right,
BIN_OP_EQ_uxn_opcodes_h_l1661_c6_cc85_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1661_c2_4444
tmp8_high_MUX_uxn_opcodes_h_l1661_c2_4444 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1661_c2_4444_cond,
tmp8_high_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1661_c2_4444_return_output);

-- t8_MUX_uxn_opcodes_h_l1661_c2_4444
t8_MUX_uxn_opcodes_h_l1661_c2_4444 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1661_c2_4444_cond,
t8_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue,
t8_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse,
t8_MUX_uxn_opcodes_h_l1661_c2_4444_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1661_c2_4444
tmp8_low_MUX_uxn_opcodes_h_l1661_c2_4444 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1661_c2_4444_cond,
tmp8_low_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1661_c2_4444_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_4444
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_4444 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_4444_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_4444_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_4444
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_4444 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_4444_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_4444_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1661_c2_4444
result_u16_value_MUX_uxn_opcodes_h_l1661_c2_4444 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1661_c2_4444_cond,
result_u16_value_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1661_c2_4444_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_4444
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_4444 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_4444_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_4444_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_4444
result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_4444 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_4444_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_4444_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_4444
result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_4444 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_4444_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_4444_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_4444
result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_4444 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_4444_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_4444_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1661_c2_4444
result_u8_value_MUX_uxn_opcodes_h_l1661_c2_4444 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1661_c2_4444_cond,
result_u8_value_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1661_c2_4444_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_4444
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_4444 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_4444_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_4444_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_4444
result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_4444 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_4444_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_4444_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1674_c11_468e
BIN_OP_EQ_uxn_opcodes_h_l1674_c11_468e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1674_c11_468e_left,
BIN_OP_EQ_uxn_opcodes_h_l1674_c11_468e_right,
BIN_OP_EQ_uxn_opcodes_h_l1674_c11_468e_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1674_c7_7d61
tmp8_high_MUX_uxn_opcodes_h_l1674_c7_7d61 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1674_c7_7d61_cond,
tmp8_high_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output);

-- t8_MUX_uxn_opcodes_h_l1674_c7_7d61
t8_MUX_uxn_opcodes_h_l1674_c7_7d61 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1674_c7_7d61_cond,
t8_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue,
t8_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse,
t8_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1674_c7_7d61
tmp8_low_MUX_uxn_opcodes_h_l1674_c7_7d61 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1674_c7_7d61_cond,
tmp8_low_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_7d61
result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_7d61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_7d61_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1674_c7_7d61
result_u16_value_MUX_uxn_opcodes_h_l1674_c7_7d61 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1674_c7_7d61_cond,
result_u16_value_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1674_c7_7d61
result_u8_value_MUX_uxn_opcodes_h_l1674_c7_7d61 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1674_c7_7d61_cond,
result_u8_value_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_7d61
result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_7d61 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_7d61_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_7d61
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_7d61 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_7d61_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_7d61
result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_7d61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_7d61_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1675_c30_e9bc
sp_relative_shift_uxn_opcodes_h_l1675_c30_e9bc : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1675_c30_e9bc_ins,
sp_relative_shift_uxn_opcodes_h_l1675_c30_e9bc_x,
sp_relative_shift_uxn_opcodes_h_l1675_c30_e9bc_y,
sp_relative_shift_uxn_opcodes_h_l1675_c30_e9bc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1677_c11_49a7
BIN_OP_EQ_uxn_opcodes_h_l1677_c11_49a7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1677_c11_49a7_left,
BIN_OP_EQ_uxn_opcodes_h_l1677_c11_49a7_right,
BIN_OP_EQ_uxn_opcodes_h_l1677_c11_49a7_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1677_c7_f158
tmp8_high_MUX_uxn_opcodes_h_l1677_c7_f158 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1677_c7_f158_cond,
tmp8_high_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1677_c7_f158_return_output);

-- t8_MUX_uxn_opcodes_h_l1677_c7_f158
t8_MUX_uxn_opcodes_h_l1677_c7_f158 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1677_c7_f158_cond,
t8_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue,
t8_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse,
t8_MUX_uxn_opcodes_h_l1677_c7_f158_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1677_c7_f158
tmp8_low_MUX_uxn_opcodes_h_l1677_c7_f158 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1677_c7_f158_cond,
tmp8_low_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1677_c7_f158_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_f158
result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_f158 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_f158_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_f158_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1677_c7_f158
result_u16_value_MUX_uxn_opcodes_h_l1677_c7_f158 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1677_c7_f158_cond,
result_u16_value_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1677_c7_f158_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1677_c7_f158
result_u8_value_MUX_uxn_opcodes_h_l1677_c7_f158 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1677_c7_f158_cond,
result_u8_value_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1677_c7_f158_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_f158
result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_f158 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_f158_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_f158_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_f158
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_f158 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_f158_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_f158_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_f158
result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_f158 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_f158_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_f158_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1680_c22_9cde
BIN_OP_PLUS_uxn_opcodes_h_l1680_c22_9cde : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1680_c22_9cde_left,
BIN_OP_PLUS_uxn_opcodes_h_l1680_c22_9cde_right,
BIN_OP_PLUS_uxn_opcodes_h_l1680_c22_9cde_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1682_c11_36bc
BIN_OP_EQ_uxn_opcodes_h_l1682_c11_36bc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1682_c11_36bc_left,
BIN_OP_EQ_uxn_opcodes_h_l1682_c11_36bc_right,
BIN_OP_EQ_uxn_opcodes_h_l1682_c11_36bc_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1682_c7_0a9f
tmp8_high_MUX_uxn_opcodes_h_l1682_c7_0a9f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1682_c7_0a9f_cond,
tmp8_high_MUX_uxn_opcodes_h_l1682_c7_0a9f_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1682_c7_0a9f_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1682_c7_0a9f_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1682_c7_0a9f
tmp8_low_MUX_uxn_opcodes_h_l1682_c7_0a9f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1682_c7_0a9f_cond,
tmp8_low_MUX_uxn_opcodes_h_l1682_c7_0a9f_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1682_c7_0a9f_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1682_c7_0a9f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_0a9f
result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_0a9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_0a9f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_0a9f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_0a9f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_0a9f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1682_c7_0a9f
result_u16_value_MUX_uxn_opcodes_h_l1682_c7_0a9f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_cond,
result_u16_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1682_c7_0a9f
result_u8_value_MUX_uxn_opcodes_h_l1682_c7_0a9f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_0a9f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_0a9f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_0a9f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_0a9f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_0a9f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_0a9f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_0a9f
result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_0a9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_0a9f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_0a9f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_0a9f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_0a9f_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_552d
BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_552d : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_552d_left,
BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_552d_right,
BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_552d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_35aa
BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_35aa : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_35aa_left,
BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_35aa_right,
BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_35aa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1685_c11_16f9
BIN_OP_EQ_uxn_opcodes_h_l1685_c11_16f9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1685_c11_16f9_left,
BIN_OP_EQ_uxn_opcodes_h_l1685_c11_16f9_right,
BIN_OP_EQ_uxn_opcodes_h_l1685_c11_16f9_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1685_c7_dd5d
tmp8_high_MUX_uxn_opcodes_h_l1685_c7_dd5d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1685_c7_dd5d_cond,
tmp8_high_MUX_uxn_opcodes_h_l1685_c7_dd5d_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1685_c7_dd5d_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1685_c7_dd5d_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1685_c7_dd5d
tmp8_low_MUX_uxn_opcodes_h_l1685_c7_dd5d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1685_c7_dd5d_cond,
tmp8_low_MUX_uxn_opcodes_h_l1685_c7_dd5d_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1685_c7_dd5d_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1685_c7_dd5d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1685_c7_dd5d
result_u8_value_MUX_uxn_opcodes_h_l1685_c7_dd5d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1685_c7_dd5d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1685_c7_dd5d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1685_c7_dd5d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1685_c7_dd5d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_dd5d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_dd5d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_dd5d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_dd5d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_dd5d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_dd5d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_dd5d
result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_dd5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_dd5d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_dd5d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_dd5d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_dd5d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_dd5d
result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_dd5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_dd5d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_dd5d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_dd5d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_dd5d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1691_c11_9893
BIN_OP_EQ_uxn_opcodes_h_l1691_c11_9893 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1691_c11_9893_left,
BIN_OP_EQ_uxn_opcodes_h_l1691_c11_9893_right,
BIN_OP_EQ_uxn_opcodes_h_l1691_c11_9893_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1691_c7_3912
tmp8_low_MUX_uxn_opcodes_h_l1691_c7_3912 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1691_c7_3912_cond,
tmp8_low_MUX_uxn_opcodes_h_l1691_c7_3912_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1691_c7_3912_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1691_c7_3912_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1691_c7_3912
result_u8_value_MUX_uxn_opcodes_h_l1691_c7_3912 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1691_c7_3912_cond,
result_u8_value_MUX_uxn_opcodes_h_l1691_c7_3912_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1691_c7_3912_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1691_c7_3912_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_3912
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_3912 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_3912_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_3912_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_3912_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_3912_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_3912
result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_3912 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_3912_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_3912_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_3912_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_3912_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t8,
 tmp8_high,
 tmp8_low,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1661_c6_cc85_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1661_c2_4444_return_output,
 t8_MUX_uxn_opcodes_h_l1661_c2_4444_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1661_c2_4444_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_4444_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_4444_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1661_c2_4444_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_4444_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_4444_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_4444_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_4444_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1661_c2_4444_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_4444_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_4444_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1674_c11_468e_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output,
 t8_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output,
 sp_relative_shift_uxn_opcodes_h_l1675_c30_e9bc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1677_c11_49a7_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1677_c7_f158_return_output,
 t8_MUX_uxn_opcodes_h_l1677_c7_f158_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1677_c7_f158_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_f158_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1677_c7_f158_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1677_c7_f158_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_f158_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_f158_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_f158_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1680_c22_9cde_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1682_c11_36bc_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1682_c7_0a9f_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1682_c7_0a9f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_0a9f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_0a9f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_0a9f_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_552d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_35aa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1685_c11_16f9_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1685_c7_dd5d_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1685_c7_dd5d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1685_c7_dd5d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_dd5d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_dd5d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_dd5d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1691_c11_9893_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1691_c7_3912_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1691_c7_3912_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_3912_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_3912_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_cc85_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_cc85_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_cc85_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1661_c2_4444_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1661_c2_4444_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1661_c2_4444_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1661_c2_4444_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1661_c2_4444_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1661_c2_4444_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_4444_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_4444_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1661_c2_4444_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_4444_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_4444_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c2_4444_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c2_4444_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1661_c2_4444_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_4444_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_4444_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_4444_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_4444_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1666_c3_380d : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_4444_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_4444_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1661_c2_4444_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_4444_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_4444_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c2_4444_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c2_4444_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1671_c3_db7e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_4444_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_4444_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1661_c2_4444_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_4444_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_4444_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_468e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_468e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_468e_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1677_c7_f158_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1674_c7_7d61_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1677_c7_f158_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1674_c7_7d61_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1677_c7_f158_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1674_c7_7d61_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_f158_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_7d61_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1677_c7_f158_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1674_c7_7d61_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1677_c7_f158_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1674_c7_7d61_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_f158_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_7d61_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_f158_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_7d61_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_f158_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_7d61_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1675_c30_e9bc_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1675_c30_e9bc_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1675_c30_e9bc_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1675_c30_e9bc_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_49a7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_49a7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_49a7_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1682_c7_0a9f_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1677_c7_f158_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1677_c7_f158_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1682_c7_0a9f_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1677_c7_f158_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_0a9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_f158_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1680_c3_74fd : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1677_c7_f158_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1677_c7_f158_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1679_c3_544b : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1677_c7_f158_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_f158_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_0a9f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_f158_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_0a9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_f158_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1680_c22_9cde_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1680_c27_06bb_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1680_c22_9cde_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1680_c22_9cde_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_36bc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_36bc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_36bc_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1682_c7_0a9f_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1682_c7_0a9f_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1685_c7_dd5d_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1682_c7_0a9f_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1682_c7_0a9f_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1682_c7_0a9f_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1685_c7_dd5d_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1682_c7_0a9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_0a9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_0a9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_dd5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_0a9f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1683_c3_7065 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1685_c7_dd5d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_0a9f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_0a9f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_dd5d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_0a9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_0a9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_0a9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_dd5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_0a9f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_552d_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1683_c27_77e2_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_552d_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_552d_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_35aa_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_35aa_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_35aa_return_output : signed(18 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_16f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_16f9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_16f9_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1685_c7_dd5d_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1685_c7_dd5d_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1685_c7_dd5d_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1685_c7_dd5d_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1685_c7_dd5d_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1691_c7_3912_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1685_c7_dd5d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1685_c7_dd5d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1685_c7_dd5d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1691_c7_3912_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1685_c7_dd5d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_dd5d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1688_c3_0ed7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_dd5d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_3912_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_dd5d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_dd5d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_dd5d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_dd5d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_dd5d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_dd5d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_3912_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_dd5d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_9893_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_9893_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_9893_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1691_c7_3912_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1691_c7_3912_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1691_c7_3912_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1691_c7_3912_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1691_c7_3912_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1691_c7_3912_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_3912_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1693_c3_0ea2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_3912_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_3912_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_3912_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_3912_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_3912_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1661_l1674_l1682_DUPLICATE_ce70_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1691_l1674_l1661_l1682_l1677_DUPLICATE_3a3a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1691_l1674_l1685_l1682_l1677_DUPLICATE_34aa_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1677_l1691_l1674_l1682_DUPLICATE_3c9b_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1677_l1674_l1685_l1682_DUPLICATE_77f2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a75_uxn_opcodes_h_l1698_l1657_DUPLICATE_4ff4_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp8_high : unsigned(7 downto 0);
variable REG_VAR_tmp8_low : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_tmp8_high := tmp8_high;
  REG_VAR_tmp8_low := tmp8_low;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1666_c3_380d := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1666_c3_380d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1688_c3_0ed7 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_dd5d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1688_c3_0ed7;
     VAR_sp_relative_shift_uxn_opcodes_h_l1675_c30_e9bc_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_49a7_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1675_c30_e9bc_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1671_c3_db7e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1671_c3_db7e;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_16f9_right := to_unsigned(4, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_35aa_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_dd5d_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_3912_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_468e_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1693_c3_0ea2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_3912_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1693_c3_0ea2;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1679_c3_544b := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1679_c3_544b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_9893_right := to_unsigned(5, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_cc85_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_36bc_right := to_unsigned(3, 2);

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
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l1675_c30_e9bc_ins := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1680_c22_9cde_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_552d_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_cc85_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_468e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_49a7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_36bc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_16f9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_9893_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1685_c7_dd5d_iftrue := VAR_previous_ram_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1691_c7_3912_iftrue := VAR_previous_ram_read;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1685_c7_dd5d_iftrue := VAR_previous_ram_read;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1691_c7_3912_iftrue := VAR_previous_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse := t8;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1682_c7_0a9f_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1685_c7_dd5d_iffalse := tmp8_high;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1682_c7_0a9f_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1685_c7_dd5d_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1691_c7_3912_iffalse := tmp8_low;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1691_l1674_l1685_l1682_l1677_DUPLICATE_34aa LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1691_l1674_l1685_l1682_l1677_DUPLICATE_34aa_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1677_l1674_l1685_l1682_DUPLICATE_77f2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1677_l1674_l1685_l1682_DUPLICATE_77f2_return_output := result.is_stack_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1661_c2_4444] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1661_c2_4444_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1661_l1674_l1682_DUPLICATE_ce70 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1661_l1674_l1682_DUPLICATE_ce70_return_output := result.u16_value;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1661_c2_4444] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1661_c2_4444_return_output := result.is_stack_index_flipped;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1683_c27_77e2] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1683_c27_77e2_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l1661_c6_cc85] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1661_c6_cc85_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_cc85_left;
     BIN_OP_EQ_uxn_opcodes_h_l1661_c6_cc85_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_cc85_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_cc85_return_output := BIN_OP_EQ_uxn_opcodes_h_l1661_c6_cc85_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1674_c11_468e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1674_c11_468e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_468e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1674_c11_468e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_468e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_468e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1674_c11_468e_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1675_c30_e9bc] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1675_c30_e9bc_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1675_c30_e9bc_ins;
     sp_relative_shift_uxn_opcodes_h_l1675_c30_e9bc_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1675_c30_e9bc_x;
     sp_relative_shift_uxn_opcodes_h_l1675_c30_e9bc_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1675_c30_e9bc_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1675_c30_e9bc_return_output := sp_relative_shift_uxn_opcodes_h_l1675_c30_e9bc_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1661_c2_4444] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1661_c2_4444_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1682_c11_36bc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1682_c11_36bc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_36bc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1682_c11_36bc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_36bc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_36bc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1682_c11_36bc_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1677_l1691_l1674_l1682_DUPLICATE_3c9b LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1677_l1691_l1674_l1682_DUPLICATE_3c9b_return_output := result.stack_address_sp_offset;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1661_c2_4444] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1661_c2_4444_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1691_c11_9893] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1691_c11_9893_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_9893_left;
     BIN_OP_EQ_uxn_opcodes_h_l1691_c11_9893_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_9893_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_9893_return_output := BIN_OP_EQ_uxn_opcodes_h_l1691_c11_9893_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1677_c11_49a7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1677_c11_49a7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_49a7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1677_c11_49a7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_49a7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_49a7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1677_c11_49a7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1685_c11_16f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1685_c11_16f9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_16f9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1685_c11_16f9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_16f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_16f9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1685_c11_16f9_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l1677_c7_f158] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1677_c7_f158_return_output := result.sp_relative_shift;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1680_c27_06bb] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1680_c27_06bb_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1691_l1674_l1661_l1682_l1677_DUPLICATE_3a3a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1691_l1674_l1661_l1682_l1677_DUPLICATE_3a3a_return_output := result.u8_value;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_4444_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_cc85_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_4444_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_cc85_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_4444_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_cc85_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_4444_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_cc85_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_4444_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_cc85_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_4444_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_cc85_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_4444_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_cc85_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_4444_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_cc85_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c2_4444_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_cc85_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c2_4444_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_cc85_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1661_c2_4444_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_cc85_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1661_c2_4444_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_cc85_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1661_c2_4444_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_cc85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_7d61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_468e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_7d61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_468e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_7d61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_468e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_7d61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_468e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1674_c7_7d61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_468e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1674_c7_7d61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_468e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1674_c7_7d61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_468e_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1674_c7_7d61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_468e_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1674_c7_7d61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_468e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_f158_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_49a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_f158_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_49a7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_f158_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_49a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_f158_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_49a7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1677_c7_f158_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_49a7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1677_c7_f158_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_49a7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1677_c7_f158_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_49a7_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1677_c7_f158_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_49a7_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1677_c7_f158_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_49a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_0a9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_36bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_0a9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_36bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_0a9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_36bc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_36bc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_36bc_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1682_c7_0a9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_36bc_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1682_c7_0a9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_36bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_dd5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_16f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_dd5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_16f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_dd5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_16f9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1685_c7_dd5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_16f9_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1685_c7_dd5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_16f9_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1685_c7_dd5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_16f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_3912_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_9893_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_3912_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_9893_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1691_c7_3912_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_9893_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1691_c7_3912_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_9893_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1680_c22_9cde_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1680_c27_06bb_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_552d_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1683_c27_77e2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1661_l1674_l1682_DUPLICATE_ce70_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1661_l1674_l1682_DUPLICATE_ce70_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1661_l1674_l1682_DUPLICATE_ce70_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1691_l1674_l1685_l1682_l1677_DUPLICATE_34aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1691_l1674_l1685_l1682_l1677_DUPLICATE_34aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_0a9f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1691_l1674_l1685_l1682_l1677_DUPLICATE_34aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_dd5d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1691_l1674_l1685_l1682_l1677_DUPLICATE_34aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_3912_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1691_l1674_l1685_l1682_l1677_DUPLICATE_34aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1677_l1674_l1685_l1682_DUPLICATE_77f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1677_l1674_l1685_l1682_DUPLICATE_77f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_0a9f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1677_l1674_l1685_l1682_DUPLICATE_77f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_dd5d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1677_l1674_l1685_l1682_DUPLICATE_77f2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1677_l1691_l1674_l1682_DUPLICATE_3c9b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1677_l1691_l1674_l1682_DUPLICATE_3c9b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_0a9f_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1677_l1691_l1674_l1682_DUPLICATE_3c9b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_3912_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1677_l1691_l1674_l1682_DUPLICATE_3c9b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1691_l1674_l1661_l1682_l1677_DUPLICATE_3a3a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1691_l1674_l1661_l1682_l1677_DUPLICATE_3a3a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1691_l1674_l1661_l1682_l1677_DUPLICATE_3a3a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1691_l1674_l1661_l1682_l1677_DUPLICATE_3a3a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1691_c7_3912_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1691_l1674_l1661_l1682_l1677_DUPLICATE_3a3a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1661_c2_4444_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1661_c2_4444_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1661_c2_4444_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1661_c2_4444_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1677_c7_f158_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1675_c30_e9bc_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1691_c7_3912] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_3912_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_3912_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_3912_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_3912_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_3912_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_3912_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_3912_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_3912_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1661_c2_4444] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_4444_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_4444_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_4444_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_4444_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1661_c2_4444] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_4444_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_4444_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_4444_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_4444_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1661_c2_4444] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_4444_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_4444_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_4444_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_4444_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1677_c7_f158] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_f158_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_f158_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_f158_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_f158_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1661_c2_4444] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_4444_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_4444_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_4444_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_4444_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1691_c7_3912] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_3912_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_3912_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_3912_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_3912_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_3912_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_3912_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_3912_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_3912_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1680_c22_9cde] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1680_c22_9cde_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1680_c22_9cde_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1680_c22_9cde_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1680_c22_9cde_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1680_c22_9cde_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1680_c22_9cde_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1685_c7_dd5d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_dd5d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_dd5d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_dd5d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_dd5d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_dd5d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_dd5d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_dd5d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_dd5d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1691_c7_3912] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1691_c7_3912_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1691_c7_3912_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1691_c7_3912_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1691_c7_3912_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1691_c7_3912_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1691_c7_3912_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1691_c7_3912_return_output := result_u8_value_MUX_uxn_opcodes_h_l1691_c7_3912_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1685_c7_dd5d] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1685_c7_dd5d_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1685_c7_dd5d_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1685_c7_dd5d_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1685_c7_dd5d_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1685_c7_dd5d_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1685_c7_dd5d_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1685_c7_dd5d_return_output := tmp8_high_MUX_uxn_opcodes_h_l1685_c7_dd5d_return_output;

     -- t8_MUX[uxn_opcodes_h_l1677_c7_f158] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1677_c7_f158_cond <= VAR_t8_MUX_uxn_opcodes_h_l1677_c7_f158_cond;
     t8_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue;
     t8_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1677_c7_f158_return_output := t8_MUX_uxn_opcodes_h_l1677_c7_f158_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1691_c7_3912] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1691_c7_3912_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1691_c7_3912_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1691_c7_3912_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1691_c7_3912_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1691_c7_3912_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1691_c7_3912_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1691_c7_3912_return_output := tmp8_low_MUX_uxn_opcodes_h_l1691_c7_3912_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1683_c22_552d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_552d_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_552d_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_552d_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_552d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_552d_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_552d_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l1680_c3_74fd := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1680_c22_9cde_return_output)),16);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_35aa_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_552d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_dd5d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_3912_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_0a9f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_dd5d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1677_c7_f158_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_dd5d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_3912_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1685_c7_dd5d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1691_c7_3912_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1677_c7_f158_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1682_c7_0a9f_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1685_c7_dd5d_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1685_c7_dd5d_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1691_c7_3912_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1680_c3_74fd;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1682_c7_0a9f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_0a9f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_0a9f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_0a9f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_0a9f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_0a9f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_0a9f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_0a9f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_0a9f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1685_c7_dd5d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_dd5d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_dd5d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_dd5d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_dd5d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_dd5d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_dd5d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_dd5d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_dd5d_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1682_c7_0a9f] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1682_c7_0a9f_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1682_c7_0a9f_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1682_c7_0a9f_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1682_c7_0a9f_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1682_c7_0a9f_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1682_c7_0a9f_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1682_c7_0a9f_return_output := tmp8_high_MUX_uxn_opcodes_h_l1682_c7_0a9f_return_output;

     -- t8_MUX[uxn_opcodes_h_l1674_c7_7d61] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1674_c7_7d61_cond <= VAR_t8_MUX_uxn_opcodes_h_l1674_c7_7d61_cond;
     t8_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue;
     t8_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output := t8_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1685_c7_dd5d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_dd5d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_dd5d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_dd5d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_dd5d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_dd5d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_dd5d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_dd5d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_dd5d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1674_c7_7d61] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_7d61_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_7d61_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1685_c7_dd5d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1685_c7_dd5d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1685_c7_dd5d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1685_c7_dd5d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1685_c7_dd5d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1685_c7_dd5d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1685_c7_dd5d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1685_c7_dd5d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1685_c7_dd5d_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1685_c7_dd5d] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1685_c7_dd5d_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1685_c7_dd5d_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1685_c7_dd5d_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1685_c7_dd5d_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1685_c7_dd5d_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1685_c7_dd5d_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1685_c7_dd5d_return_output := tmp8_low_MUX_uxn_opcodes_h_l1685_c7_dd5d_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1683_c22_35aa] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_35aa_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_35aa_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_35aa_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_35aa_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_35aa_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_35aa_return_output;

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1683_c3_7065 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1683_c22_35aa_return_output)),16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_0a9f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_dd5d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_0a9f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_0a9f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_dd5d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1685_c7_dd5d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1682_c7_0a9f_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1682_c7_0a9f_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1685_c7_dd5d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1683_c3_7065;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1661_c2_4444] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_4444_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_4444_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_4444_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_4444_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1682_c7_0a9f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_0a9f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_0a9f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_0a9f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_0a9f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_0a9f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_0a9f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_0a9f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_0a9f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1682_c7_0a9f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_return_output := result_u16_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1677_c7_f158] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_f158_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_f158_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_f158_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_f158_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1677_c7_f158] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1677_c7_f158_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1677_c7_f158_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1677_c7_f158_return_output := tmp8_high_MUX_uxn_opcodes_h_l1677_c7_f158_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1682_c7_0a9f] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1682_c7_0a9f_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1682_c7_0a9f_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1682_c7_0a9f_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1682_c7_0a9f_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1682_c7_0a9f_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1682_c7_0a9f_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1682_c7_0a9f_return_output := tmp8_low_MUX_uxn_opcodes_h_l1682_c7_0a9f_return_output;

     -- t8_MUX[uxn_opcodes_h_l1661_c2_4444] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1661_c2_4444_cond <= VAR_t8_MUX_uxn_opcodes_h_l1661_c2_4444_cond;
     t8_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue;
     t8_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1661_c2_4444_return_output := t8_MUX_uxn_opcodes_h_l1661_c2_4444_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1682_c7_0a9f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1682_c7_0a9f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_0a9f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_0a9f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_0a9f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_0a9f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_0a9f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_0a9f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_0a9f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_0a9f_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_0a9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1677_c7_f158_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_0a9f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1682_c7_0a9f_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1661_c2_4444_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1677_c7_f158_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1682_c7_0a9f_return_output;
     -- tmp8_low_MUX[uxn_opcodes_h_l1677_c7_f158] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1677_c7_f158_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1677_c7_f158_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1677_c7_f158_return_output := tmp8_low_MUX_uxn_opcodes_h_l1677_c7_f158_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1677_c7_f158] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1677_c7_f158_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1677_c7_f158_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1677_c7_f158_return_output := result_u16_value_MUX_uxn_opcodes_h_l1677_c7_f158_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1677_c7_f158] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_f158_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_f158_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_f158_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_f158_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1674_c7_7d61] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_7d61_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_7d61_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1674_c7_7d61] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1674_c7_7d61_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1674_c7_7d61_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output := tmp8_high_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1677_c7_f158] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1677_c7_f158_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1677_c7_f158_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1677_c7_f158_return_output := result_u8_value_MUX_uxn_opcodes_h_l1677_c7_f158_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1677_c7_f158] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_f158_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_f158_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_f158_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_f158_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_f158_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_f158_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_f158_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1677_c7_f158_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1677_c7_f158_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1677_c7_f158_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1677_c7_f158_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1674_c7_7d61] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_7d61_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_7d61_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1674_c7_7d61] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1674_c7_7d61_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1674_c7_7d61_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output := result_u8_value_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1674_c7_7d61] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_7d61_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_7d61_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1674_c7_7d61] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1674_c7_7d61_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1674_c7_7d61_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output := result_u16_value_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1661_c2_4444] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1661_c2_4444_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1661_c2_4444_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1661_c2_4444_return_output := tmp8_high_MUX_uxn_opcodes_h_l1661_c2_4444_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1674_c7_7d61] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1674_c7_7d61_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1674_c7_7d61_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1674_c7_7d61_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1674_c7_7d61_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output := tmp8_low_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1661_c2_4444] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_4444_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_4444_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_4444_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_4444_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output;
     REG_VAR_tmp8_high := VAR_tmp8_high_MUX_uxn_opcodes_h_l1661_c2_4444_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1674_c7_7d61_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1661_c2_4444] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1661_c2_4444_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c2_4444_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c2_4444_return_output := result_u16_value_MUX_uxn_opcodes_h_l1661_c2_4444_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1661_c2_4444] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_4444_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_4444_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_4444_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_4444_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1661_c2_4444] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1661_c2_4444_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c2_4444_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c2_4444_return_output := result_u8_value_MUX_uxn_opcodes_h_l1661_c2_4444_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1661_c2_4444] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1661_c2_4444_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1661_c2_4444_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1661_c2_4444_return_output := tmp8_low_MUX_uxn_opcodes_h_l1661_c2_4444_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1661_c2_4444] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_4444_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_4444_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_4444_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_4444_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_4444_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_4444_return_output;

     -- Submodule level 7
     REG_VAR_tmp8_low := VAR_tmp8_low_MUX_uxn_opcodes_h_l1661_c2_4444_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1a75_uxn_opcodes_h_l1698_l1657_DUPLICATE_4ff4 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a75_uxn_opcodes_h_l1698_l1657_DUPLICATE_4ff4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1a75(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_4444_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1661_c2_4444_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c2_4444_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c2_4444_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_4444_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_4444_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1661_c2_4444_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c2_4444_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_4444_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1661_c2_4444_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a75_uxn_opcodes_h_l1698_l1657_DUPLICATE_4ff4_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a75_uxn_opcodes_h_l1698_l1657_DUPLICATE_4ff4_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_tmp8_high <= REG_VAR_tmp8_high;
REG_COMB_tmp8_low <= REG_VAR_tmp8_low;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     tmp8_high <= REG_COMB_tmp8_high;
     tmp8_low <= REG_COMB_tmp8_low;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
