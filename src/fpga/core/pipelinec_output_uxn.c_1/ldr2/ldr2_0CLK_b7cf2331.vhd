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
-- BIN_OP_EQ[uxn_opcodes_h_l1638_c6_0030]
signal BIN_OP_EQ_uxn_opcodes_h_l1638_c6_0030_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1638_c6_0030_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1638_c6_0030_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1638_c2_e0a5]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1638_c2_e0a5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1638_c2_e0a5]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1638_c2_e0a5]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1638_c2_e0a5]
signal result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1638_c2_e0a5]
signal result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1638_c2_e0a5]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1638_c2_e0a5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1638_c2_e0a5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1638_c2_e0a5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output : unsigned(3 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1638_c2_e0a5]
signal tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1638_c2_e0a5]
signal tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1638_c2_e0a5]
signal t8_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1651_c11_3620]
signal BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3620_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3620_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3620_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1651_c7_8746]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_8746_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_8746_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1651_c7_8746]
signal result_u16_value_MUX_uxn_opcodes_h_l1651_c7_8746_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1651_c7_8746_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1651_c7_8746]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_8746_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_8746_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1651_c7_8746]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_8746_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_8746_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1651_c7_8746]
signal result_u8_value_MUX_uxn_opcodes_h_l1651_c7_8746_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1651_c7_8746_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1651_c7_8746]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_8746_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_8746_return_output : unsigned(3 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1651_c7_8746]
signal tmp8_low_MUX_uxn_opcodes_h_l1651_c7_8746_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1651_c7_8746_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1651_c7_8746]
signal tmp8_high_MUX_uxn_opcodes_h_l1651_c7_8746_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1651_c7_8746_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1651_c7_8746]
signal t8_MUX_uxn_opcodes_h_l1651_c7_8746_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1651_c7_8746_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1652_c30_65b0]
signal sp_relative_shift_uxn_opcodes_h_l1652_c30_65b0_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1652_c30_65b0_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1652_c30_65b0_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1652_c30_65b0_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1654_c11_ad2d]
signal BIN_OP_EQ_uxn_opcodes_h_l1654_c11_ad2d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1654_c11_ad2d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1654_c11_ad2d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1654_c7_2ef0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1654_c7_2ef0]
signal result_u16_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1654_c7_2ef0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1654_c7_2ef0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1654_c7_2ef0]
signal result_u8_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1654_c7_2ef0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output : unsigned(3 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1654_c7_2ef0]
signal tmp8_low_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1654_c7_2ef0]
signal tmp8_high_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1654_c7_2ef0]
signal t8_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1657_c22_b832]
signal BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_b832_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_b832_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_b832_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1659_c11_f65b]
signal BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f65b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f65b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f65b_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1659_c7_151d]
signal result_u16_value_MUX_uxn_opcodes_h_l1659_c7_151d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1659_c7_151d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1659_c7_151d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1659_c7_151d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1659_c7_151d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_151d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_151d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_151d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_151d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1659_c7_151d]
signal result_u8_value_MUX_uxn_opcodes_h_l1659_c7_151d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1659_c7_151d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1659_c7_151d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1659_c7_151d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1659_c7_151d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_151d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_151d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_151d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_151d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1659_c7_151d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_151d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_151d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_151d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_151d_return_output : unsigned(3 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1659_c7_151d]
signal tmp8_low_MUX_uxn_opcodes_h_l1659_c7_151d_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1659_c7_151d_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1659_c7_151d_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1659_c7_151d_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1659_c7_151d]
signal tmp8_high_MUX_uxn_opcodes_h_l1659_c7_151d_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1659_c7_151d_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1659_c7_151d_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1659_c7_151d_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1660_c22_d096]
signal BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_d096_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_d096_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_d096_return_output : signed(17 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1660_c22_8aa0]
signal BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_8aa0_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_8aa0_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_8aa0_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1662_c11_6ed6]
signal BIN_OP_EQ_uxn_opcodes_h_l1662_c11_6ed6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1662_c11_6ed6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1662_c11_6ed6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1662_c7_c1e1]
signal result_u8_value_MUX_uxn_opcodes_h_l1662_c7_c1e1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1662_c7_c1e1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1662_c7_c1e1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1662_c7_c1e1_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1662_c7_c1e1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_c1e1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_c1e1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_c1e1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_c1e1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1662_c7_c1e1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_c1e1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_c1e1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_c1e1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_c1e1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1662_c7_c1e1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_c1e1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_c1e1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_c1e1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_c1e1_return_output : unsigned(3 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1662_c7_c1e1]
signal tmp8_low_MUX_uxn_opcodes_h_l1662_c7_c1e1_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1662_c7_c1e1_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1662_c7_c1e1_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1662_c7_c1e1_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1662_c7_c1e1]
signal tmp8_high_MUX_uxn_opcodes_h_l1662_c7_c1e1_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1662_c7_c1e1_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1662_c7_c1e1_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1662_c7_c1e1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1668_c11_d921]
signal BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d921_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d921_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d921_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1668_c7_8228]
signal result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8228_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8228_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8228_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8228_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1668_c7_8228]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8228_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8228_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8228_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8228_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1668_c7_8228]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8228_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8228_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8228_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8228_return_output : unsigned(3 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1668_c7_8228]
signal tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8228_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8228_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8228_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8228_return_output : unsigned(7 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1638_c6_0030
BIN_OP_EQ_uxn_opcodes_h_l1638_c6_0030 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1638_c6_0030_left,
BIN_OP_EQ_uxn_opcodes_h_l1638_c6_0030_right,
BIN_OP_EQ_uxn_opcodes_h_l1638_c6_0030_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5
result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e0a5
result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e0a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5
result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e0a5
result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e0a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e0a5
result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e0a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond,
result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e0a5
result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e0a5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond,
result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e0a5
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e0a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e0a5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e0a5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e0a5
result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e0a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e0a5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e0a5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e0a5
tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e0a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond,
tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e0a5
tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e0a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond,
tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output);

-- t8_MUX_uxn_opcodes_h_l1638_c2_e0a5
t8_MUX_uxn_opcodes_h_l1638_c2_e0a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond,
t8_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue,
t8_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse,
t8_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3620
BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3620 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3620_left,
BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3620_right,
BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3620_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_8746
result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_8746 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_8746_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_8746_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1651_c7_8746
result_u16_value_MUX_uxn_opcodes_h_l1651_c7_8746 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1651_c7_8746_cond,
result_u16_value_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1651_c7_8746_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_8746
result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_8746 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_8746_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_8746_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_8746
result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_8746 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_8746_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_8746_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1651_c7_8746
result_u8_value_MUX_uxn_opcodes_h_l1651_c7_8746 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1651_c7_8746_cond,
result_u8_value_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1651_c7_8746_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_8746
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_8746 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_8746_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_8746_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1651_c7_8746
tmp8_low_MUX_uxn_opcodes_h_l1651_c7_8746 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1651_c7_8746_cond,
tmp8_low_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1651_c7_8746_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1651_c7_8746
tmp8_high_MUX_uxn_opcodes_h_l1651_c7_8746 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1651_c7_8746_cond,
tmp8_high_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1651_c7_8746_return_output);

-- t8_MUX_uxn_opcodes_h_l1651_c7_8746
t8_MUX_uxn_opcodes_h_l1651_c7_8746 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1651_c7_8746_cond,
t8_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue,
t8_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse,
t8_MUX_uxn_opcodes_h_l1651_c7_8746_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1652_c30_65b0
sp_relative_shift_uxn_opcodes_h_l1652_c30_65b0 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1652_c30_65b0_ins,
sp_relative_shift_uxn_opcodes_h_l1652_c30_65b0_x,
sp_relative_shift_uxn_opcodes_h_l1652_c30_65b0_y,
sp_relative_shift_uxn_opcodes_h_l1652_c30_65b0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1654_c11_ad2d
BIN_OP_EQ_uxn_opcodes_h_l1654_c11_ad2d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1654_c11_ad2d_left,
BIN_OP_EQ_uxn_opcodes_h_l1654_c11_ad2d_right,
BIN_OP_EQ_uxn_opcodes_h_l1654_c11_ad2d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_2ef0
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_2ef0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1654_c7_2ef0
result_u16_value_MUX_uxn_opcodes_h_l1654_c7_2ef0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond,
result_u16_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_2ef0
result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_2ef0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_2ef0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_2ef0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1654_c7_2ef0
result_u8_value_MUX_uxn_opcodes_h_l1654_c7_2ef0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_2ef0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_2ef0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1654_c7_2ef0
tmp8_low_MUX_uxn_opcodes_h_l1654_c7_2ef0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond,
tmp8_low_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1654_c7_2ef0
tmp8_high_MUX_uxn_opcodes_h_l1654_c7_2ef0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond,
tmp8_high_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output);

-- t8_MUX_uxn_opcodes_h_l1654_c7_2ef0
t8_MUX_uxn_opcodes_h_l1654_c7_2ef0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond,
t8_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue,
t8_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse,
t8_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_b832
BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_b832 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_b832_left,
BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_b832_right,
BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_b832_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f65b
BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f65b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f65b_left,
BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f65b_right,
BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f65b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1659_c7_151d
result_u16_value_MUX_uxn_opcodes_h_l1659_c7_151d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1659_c7_151d_cond,
result_u16_value_MUX_uxn_opcodes_h_l1659_c7_151d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1659_c7_151d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1659_c7_151d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_151d
result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_151d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_151d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_151d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_151d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_151d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1659_c7_151d
result_u8_value_MUX_uxn_opcodes_h_l1659_c7_151d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1659_c7_151d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1659_c7_151d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1659_c7_151d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1659_c7_151d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_151d
result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_151d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_151d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_151d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_151d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_151d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_151d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_151d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_151d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_151d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_151d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_151d_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1659_c7_151d
tmp8_low_MUX_uxn_opcodes_h_l1659_c7_151d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1659_c7_151d_cond,
tmp8_low_MUX_uxn_opcodes_h_l1659_c7_151d_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1659_c7_151d_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1659_c7_151d_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1659_c7_151d
tmp8_high_MUX_uxn_opcodes_h_l1659_c7_151d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1659_c7_151d_cond,
tmp8_high_MUX_uxn_opcodes_h_l1659_c7_151d_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1659_c7_151d_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1659_c7_151d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_d096
BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_d096 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_d096_left,
BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_d096_right,
BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_d096_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_8aa0
BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_8aa0 : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_8aa0_left,
BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_8aa0_right,
BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_8aa0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1662_c11_6ed6
BIN_OP_EQ_uxn_opcodes_h_l1662_c11_6ed6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1662_c11_6ed6_left,
BIN_OP_EQ_uxn_opcodes_h_l1662_c11_6ed6_right,
BIN_OP_EQ_uxn_opcodes_h_l1662_c11_6ed6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1662_c7_c1e1
result_u8_value_MUX_uxn_opcodes_h_l1662_c7_c1e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1662_c7_c1e1_cond,
result_u8_value_MUX_uxn_opcodes_h_l1662_c7_c1e1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1662_c7_c1e1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1662_c7_c1e1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_c1e1
result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_c1e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_c1e1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_c1e1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_c1e1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_c1e1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_c1e1
result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_c1e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_c1e1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_c1e1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_c1e1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_c1e1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_c1e1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_c1e1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_c1e1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_c1e1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_c1e1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_c1e1_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1662_c7_c1e1
tmp8_low_MUX_uxn_opcodes_h_l1662_c7_c1e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1662_c7_c1e1_cond,
tmp8_low_MUX_uxn_opcodes_h_l1662_c7_c1e1_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1662_c7_c1e1_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1662_c7_c1e1_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1662_c7_c1e1
tmp8_high_MUX_uxn_opcodes_h_l1662_c7_c1e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1662_c7_c1e1_cond,
tmp8_high_MUX_uxn_opcodes_h_l1662_c7_c1e1_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1662_c7_c1e1_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1662_c7_c1e1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d921
BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d921 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d921_left,
BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d921_right,
BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d921_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8228
result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8228 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8228_cond,
result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8228_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8228_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8228_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8228
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8228 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8228_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8228_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8228_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8228_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8228
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8228 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8228_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8228_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8228_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8228_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8228
tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8228 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8228_cond,
tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8228_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8228_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8228_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1638_c6_0030_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output,
 t8_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3620_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_8746_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1651_c7_8746_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_8746_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_8746_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1651_c7_8746_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_8746_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1651_c7_8746_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1651_c7_8746_return_output,
 t8_MUX_uxn_opcodes_h_l1651_c7_8746_return_output,
 sp_relative_shift_uxn_opcodes_h_l1652_c30_65b0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1654_c11_ad2d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output,
 t8_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_b832_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f65b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1659_c7_151d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_151d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1659_c7_151d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_151d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_151d_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1659_c7_151d_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1659_c7_151d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_d096_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_8aa0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1662_c11_6ed6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1662_c7_c1e1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_c1e1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_c1e1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_c1e1_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1662_c7_c1e1_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1662_c7_c1e1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d921_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8228_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8228_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8228_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8228_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_0030_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_0030_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_0030_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1638_c2_e0a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_8746_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1638_c2_e0a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1638_c2_e0a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_8746_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_8746_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1638_c2_e0a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1643_c3_f80f : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_8746_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_8746_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1648_c3_a188 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_8746_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_8746_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_8746_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1651_c7_8746_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3620_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3620_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3620_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_8746_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_8746_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_8746_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_8746_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_8746_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_8746_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_8746_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_8746_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1651_c7_8746_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_65b0_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_65b0_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_65b0_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_65b0_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_ad2d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_ad2d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_ad2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_151d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1657_c3_c1a3 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_151d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_151d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1656_c3_b8ca : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1654_c7_2ef0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_151d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_151d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_151d_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_151d_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_b832_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1657_c27_99ed_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_b832_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_b832_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f65b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f65b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f65b_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_151d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1660_c3_76f7 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_151d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_151d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_151d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_151d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_c1e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_151d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_151d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_151d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_c1e1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_151d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_151d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_151d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_c1e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_151d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_151d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_151d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_c1e1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_151d_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_151d_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_151d_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_c1e1_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_151d_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_151d_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_151d_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_c1e1_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_151d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_d096_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1660_c27_fbfc_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_d096_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_d096_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_8aa0_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_8aa0_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_8aa0_return_output : signed(18 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_6ed6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_6ed6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_6ed6_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_c1e1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_c1e1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8228_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_c1e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_c1e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_c1e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_c1e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_c1e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_c1e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8228_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_c1e1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_c1e1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1665_c3_c952 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_c1e1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8228_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_c1e1_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_c1e1_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_c1e1_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8228_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_c1e1_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_c1e1_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_c1e1_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_c1e1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d921_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d921_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d921_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8228_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8228_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8228_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8228_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8228_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8228_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8228_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1670_c3_7537 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8228_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8228_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8228_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8228_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8228_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1659_l1654_l1651_l1638_l1668_DUPLICATE_58c2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1651_l1638_l1659_DUPLICATE_f762_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1662_l1659_l1654_l1651_l1668_DUPLICATE_667b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1651_l1662_l1654_l1659_DUPLICATE_46ad_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1651_l1654_l1668_l1659_DUPLICATE_21c1_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6145_uxn_opcodes_h_l1634_l1675_DUPLICATE_dff7_return_output : opcode_result_t;
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
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1670_c3_7537 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8228_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1670_c3_7537;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f65b_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3620_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_6ed6_right := to_unsigned(4, 3);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_c1e1_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_0030_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_ad2d_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_8aa0_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_65b0_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1656_c3_b8ca := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1656_c3_b8ca;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1648_c3_a188 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1648_c3_a188;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d921_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1665_c3_c952 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_c1e1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1665_c3_c952;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8228_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_65b0_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1643_c3_f80f := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1643_c3_f80f;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_65b0_ins := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_b832_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_d096_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_0030_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3620_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_ad2d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f65b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_6ed6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d921_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_c1e1_iftrue := VAR_previous_ram_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8228_iftrue := VAR_previous_ram_read;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_c1e1_iftrue := VAR_previous_ram_read;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8228_iftrue := VAR_previous_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse := t8;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_151d_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_c1e1_iffalse := tmp8_high;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_151d_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_c1e1_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8228_iffalse := tmp8_low;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1651_l1662_l1654_l1659_DUPLICATE_46ad LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1651_l1662_l1654_l1659_DUPLICATE_46ad_return_output := result.is_stack_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1638_c2_e0a5] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1638_c2_e0a5_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1668_c11_d921] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d921_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d921_left;
     BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d921_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d921_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d921_return_output := BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d921_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1659_c11_f65b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f65b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f65b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f65b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f65b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f65b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f65b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1662_l1659_l1654_l1651_l1668_DUPLICATE_667b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1662_l1659_l1654_l1651_l1668_DUPLICATE_667b_return_output := result.is_opc_done;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1638_c2_e0a5] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1638_c2_e0a5_return_output := result.is_vram_write;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l1654_c7_2ef0] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1654_c7_2ef0_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1662_c11_6ed6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1662_c11_6ed6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_6ed6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1662_c11_6ed6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_6ed6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_6ed6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1662_c11_6ed6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1651_c11_3620] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3620_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3620_left;
     BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3620_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3620_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3620_return_output := BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3620_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1638_c2_e0a5] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1638_c2_e0a5_return_output := result.is_ram_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1638_c2_e0a5] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1638_c2_e0a5_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1638_c6_0030] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1638_c6_0030_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_0030_left;
     BIN_OP_EQ_uxn_opcodes_h_l1638_c6_0030_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_0030_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_0030_return_output := BIN_OP_EQ_uxn_opcodes_h_l1638_c6_0030_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1659_l1654_l1651_l1638_l1668_DUPLICATE_58c2 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1659_l1654_l1651_l1638_l1668_DUPLICATE_58c2_return_output := result.u8_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1651_l1654_l1668_l1659_DUPLICATE_21c1 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1651_l1654_l1668_l1659_DUPLICATE_21c1_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1654_c11_ad2d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1654_c11_ad2d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_ad2d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1654_c11_ad2d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_ad2d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_ad2d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1654_c11_ad2d_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1652_c30_65b0] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1652_c30_65b0_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_65b0_ins;
     sp_relative_shift_uxn_opcodes_h_l1652_c30_65b0_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_65b0_x;
     sp_relative_shift_uxn_opcodes_h_l1652_c30_65b0_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_65b0_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_65b0_return_output := sp_relative_shift_uxn_opcodes_h_l1652_c30_65b0_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1651_l1638_l1659_DUPLICATE_f762 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1651_l1638_l1659_DUPLICATE_f762_return_output := result.u16_value;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1660_c27_fbfc] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1660_c27_fbfc_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- CAST_TO_int8_t[uxn_opcodes_h_l1657_c27_99ed] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1657_c27_99ed_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_0030_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_0030_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_0030_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_0030_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_0030_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_0030_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_0030_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_0030_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_0030_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_0030_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_0030_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_0030_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_0030_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_8746_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3620_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_8746_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3620_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_8746_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3620_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_8746_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3620_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_8746_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3620_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_8746_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3620_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1651_c7_8746_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3620_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_8746_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3620_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_8746_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_3620_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_ad2d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_ad2d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_ad2d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_ad2d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_ad2d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_ad2d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_ad2d_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_ad2d_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_ad2d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_151d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f65b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_151d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f65b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_151d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f65b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_151d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f65b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_151d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f65b_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_151d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f65b_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_151d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f65b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_c1e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_6ed6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_c1e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_6ed6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_c1e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_6ed6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_c1e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_6ed6_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_c1e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_6ed6_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_c1e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_6ed6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8228_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d921_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8228_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d921_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8228_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d921_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8228_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d921_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_b832_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1657_c27_99ed_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_d096_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1660_c27_fbfc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1651_l1638_l1659_DUPLICATE_f762_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1651_l1638_l1659_DUPLICATE_f762_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_151d_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1651_l1638_l1659_DUPLICATE_f762_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1662_l1659_l1654_l1651_l1668_DUPLICATE_667b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1662_l1659_l1654_l1651_l1668_DUPLICATE_667b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_151d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1662_l1659_l1654_l1651_l1668_DUPLICATE_667b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_c1e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1662_l1659_l1654_l1651_l1668_DUPLICATE_667b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8228_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1662_l1659_l1654_l1651_l1668_DUPLICATE_667b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1651_l1662_l1654_l1659_DUPLICATE_46ad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1651_l1662_l1654_l1659_DUPLICATE_46ad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_151d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1651_l1662_l1654_l1659_DUPLICATE_46ad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_c1e1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1651_l1662_l1654_l1659_DUPLICATE_46ad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1651_l1654_l1668_l1659_DUPLICATE_21c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1651_l1654_l1668_l1659_DUPLICATE_21c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_151d_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1651_l1654_l1668_l1659_DUPLICATE_21c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8228_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1651_l1654_l1668_l1659_DUPLICATE_21c1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1659_l1654_l1651_l1638_l1668_DUPLICATE_58c2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1659_l1654_l1651_l1638_l1668_DUPLICATE_58c2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1659_l1654_l1651_l1638_l1668_DUPLICATE_58c2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_151d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1659_l1654_l1651_l1638_l1668_DUPLICATE_58c2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8228_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1659_l1654_l1651_l1638_l1668_DUPLICATE_58c2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1638_c2_e0a5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1638_c2_e0a5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1638_c2_e0a5_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1638_c2_e0a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1654_c7_2ef0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_65b0_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l1638_c2_e0a5] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1638_c2_e0a5] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1668_c7_8228] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8228_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8228_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8228_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8228_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8228_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8228_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8228_return_output := tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8228_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1668_c7_8228] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8228_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8228_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8228_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8228_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8228_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8228_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8228_return_output := result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8228_return_output;

     -- t8_MUX[uxn_opcodes_h_l1654_c7_2ef0] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond <= VAR_t8_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond;
     t8_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue;
     t8_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output := t8_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1638_c2_e0a5] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1638_c2_e0a5] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1654_c7_2ef0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1657_c22_b832] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_b832_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_b832_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_b832_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_b832_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_b832_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_b832_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1662_c7_c1e1] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1662_c7_c1e1_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_c1e1_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1662_c7_c1e1_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_c1e1_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1662_c7_c1e1_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_c1e1_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_c1e1_return_output := tmp8_high_MUX_uxn_opcodes_h_l1662_c7_c1e1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1668_c7_8228] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8228_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8228_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8228_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8228_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8228_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8228_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8228_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8228_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1660_c22_d096] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_d096_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_d096_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_d096_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_d096_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_d096_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_d096_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1662_c7_c1e1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_c1e1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_c1e1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_c1e1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_c1e1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_c1e1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_c1e1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_c1e1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_c1e1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1668_c7_8228] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8228_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8228_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8228_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8228_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8228_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8228_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8228_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8228_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l1657_c3_c1a3 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_b832_return_output)),16);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_8aa0_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_d096_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_c1e1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_8228_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_151d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_c1e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_c1e1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_8228_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_c1e1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_8228_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_151d_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_c1e1_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_c1e1_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_8228_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1657_c3_c1a3;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1659_c7_151d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_151d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_151d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_151d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_151d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_151d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_151d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_151d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_151d_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1659_c7_151d] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1659_c7_151d_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_151d_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1659_c7_151d_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_151d_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1659_c7_151d_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_151d_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_151d_return_output := tmp8_high_MUX_uxn_opcodes_h_l1659_c7_151d_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1662_c7_c1e1] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1662_c7_c1e1_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_c1e1_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1662_c7_c1e1_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_c1e1_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1662_c7_c1e1_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_c1e1_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_c1e1_return_output := tmp8_low_MUX_uxn_opcodes_h_l1662_c7_c1e1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1662_c7_c1e1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_c1e1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_c1e1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_c1e1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_c1e1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_c1e1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_c1e1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_c1e1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_c1e1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1651_c7_8746] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_8746_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_8746_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_8746_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_8746_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1662_c7_c1e1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1662_c7_c1e1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_c1e1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1662_c7_c1e1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_c1e1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1662_c7_c1e1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_c1e1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_c1e1_return_output := result_u8_value_MUX_uxn_opcodes_h_l1662_c7_c1e1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1662_c7_c1e1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_c1e1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_c1e1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_c1e1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_c1e1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_c1e1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_c1e1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_c1e1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_c1e1_return_output;

     -- t8_MUX[uxn_opcodes_h_l1651_c7_8746] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1651_c7_8746_cond <= VAR_t8_MUX_uxn_opcodes_h_l1651_c7_8746_cond;
     t8_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue;
     t8_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1651_c7_8746_return_output := t8_MUX_uxn_opcodes_h_l1651_c7_8746_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1660_c22_8aa0] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_8aa0_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_8aa0_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_8aa0_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_8aa0_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_8aa0_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_8aa0_return_output;

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1660_c3_76f7 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_8aa0_return_output)),16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_151d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_c1e1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_151d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_8746_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_151d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_c1e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_151d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_c1e1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1651_c7_8746_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_151d_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_151d_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_c1e1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_151d_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1660_c3_76f7;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1638_c2_e0a5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1659_c7_151d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1659_c7_151d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_151d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1659_c7_151d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_151d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1659_c7_151d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_151d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_151d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1659_c7_151d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1659_c7_151d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1659_c7_151d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_151d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1659_c7_151d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_151d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1659_c7_151d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_151d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_151d_return_output := result_u16_value_MUX_uxn_opcodes_h_l1659_c7_151d_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1654_c7_2ef0] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output := tmp8_high_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1659_c7_151d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_151d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_151d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_151d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_151d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_151d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_151d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_151d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_151d_return_output;

     -- t8_MUX[uxn_opcodes_h_l1638_c2_e0a5] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond <= VAR_t8_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond;
     t8_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue;
     t8_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output := t8_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1659_c7_151d] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1659_c7_151d_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_151d_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1659_c7_151d_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_151d_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1659_c7_151d_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_151d_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_151d_return_output := tmp8_low_MUX_uxn_opcodes_h_l1659_c7_151d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1659_c7_151d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_151d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_151d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_151d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_151d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_151d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_151d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_151d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_151d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1654_c7_2ef0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_151d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_151d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_151d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_151d_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_151d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1654_c7_2ef0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1654_c7_2ef0] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output := tmp8_low_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1654_c7_2ef0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output := result_u16_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1651_c7_8746] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1651_c7_8746_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_8746_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_8746_return_output := tmp8_high_MUX_uxn_opcodes_h_l1651_c7_8746_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1654_c7_2ef0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1654_c7_2ef0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1651_c7_8746] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_8746_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_8746_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_8746_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_8746_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_8746_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_8746_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_2ef0_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1638_c2_e0a5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1651_c7_8746] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1651_c7_8746_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_8746_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_8746_return_output := result_u16_value_MUX_uxn_opcodes_h_l1651_c7_8746_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1651_c7_8746] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_8746_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_8746_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_8746_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_8746_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1651_c7_8746] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1651_c7_8746_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_8746_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_8746_return_output := tmp8_low_MUX_uxn_opcodes_h_l1651_c7_8746_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1638_c2_e0a5] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output := tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1651_c7_8746] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_8746_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_8746_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_8746_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_8746_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1651_c7_8746] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1651_c7_8746_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_8746_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_8746_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_8746_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_8746_return_output := result_u8_value_MUX_uxn_opcodes_h_l1651_c7_8746_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_8746_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_8746_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_8746_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_8746_return_output;
     REG_VAR_tmp8_high := VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_8746_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1638_c2_e0a5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1638_c2_e0a5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1638_c2_e0a5] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output := tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1638_c2_e0a5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output := result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1638_c2_e0a5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output := result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output;

     -- Submodule level 7
     REG_VAR_tmp8_low := VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6145_uxn_opcodes_h_l1634_l1675_DUPLICATE_dff7 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6145_uxn_opcodes_h_l1634_l1675_DUPLICATE_dff7_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6145(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e0a5_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6145_uxn_opcodes_h_l1634_l1675_DUPLICATE_dff7_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6145_uxn_opcodes_h_l1634_l1675_DUPLICATE_dff7_return_output;
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
