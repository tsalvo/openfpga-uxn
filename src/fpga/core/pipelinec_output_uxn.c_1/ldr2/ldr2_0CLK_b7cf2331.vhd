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
-- BIN_OP_EQ[uxn_opcodes_h_l1638_c6_4ea9]
signal BIN_OP_EQ_uxn_opcodes_h_l1638_c6_4ea9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1638_c6_4ea9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1638_c6_4ea9_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1638_c2_8c27]
signal tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8c27_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1638_c2_8c27]
signal tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8c27_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1638_c2_8c27]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8c27_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1638_c2_8c27]
signal result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8c27_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1638_c2_8c27]
signal result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8c27_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1638_c2_8c27]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1638_c2_8c27]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8c27_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1638_c2_8c27]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8c27_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1638_c2_8c27]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8c27_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1638_c2_8c27]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1638_c2_8c27]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8c27_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1638_c2_8c27]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8c27_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1638_c2_8c27]
signal t8_MUX_uxn_opcodes_h_l1638_c2_8c27_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1651_c11_8975]
signal BIN_OP_EQ_uxn_opcodes_h_l1651_c11_8975_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1651_c11_8975_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1651_c11_8975_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1651_c7_b907]
signal tmp8_high_MUX_uxn_opcodes_h_l1651_c7_b907_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1651_c7_b907_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1651_c7_b907]
signal tmp8_low_MUX_uxn_opcodes_h_l1651_c7_b907_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1651_c7_b907_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1651_c7_b907]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_b907_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_b907_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1651_c7_b907]
signal result_u8_value_MUX_uxn_opcodes_h_l1651_c7_b907_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1651_c7_b907_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1651_c7_b907]
signal result_u16_value_MUX_uxn_opcodes_h_l1651_c7_b907_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1651_c7_b907_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1651_c7_b907]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_b907_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_b907_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1651_c7_b907]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_b907_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_b907_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1651_c7_b907]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_b907_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_b907_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1651_c7_b907]
signal t8_MUX_uxn_opcodes_h_l1651_c7_b907_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1651_c7_b907_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1652_c30_01e2]
signal sp_relative_shift_uxn_opcodes_h_l1652_c30_01e2_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1652_c30_01e2_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1652_c30_01e2_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1652_c30_01e2_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1654_c11_e8f0]
signal BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e8f0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e8f0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e8f0_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1654_c7_cc2a]
signal tmp8_high_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1654_c7_cc2a]
signal tmp8_low_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1654_c7_cc2a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1654_c7_cc2a]
signal result_u8_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1654_c7_cc2a]
signal result_u16_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1654_c7_cc2a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1654_c7_cc2a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1654_c7_cc2a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1654_c7_cc2a]
signal t8_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1657_c22_d390]
signal BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_d390_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_d390_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_d390_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1659_c11_74f2]
signal BIN_OP_EQ_uxn_opcodes_h_l1659_c11_74f2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1659_c11_74f2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1659_c11_74f2_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1659_c7_892a]
signal tmp8_high_MUX_uxn_opcodes_h_l1659_c7_892a_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1659_c7_892a_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1659_c7_892a_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1659_c7_892a_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1659_c7_892a]
signal tmp8_low_MUX_uxn_opcodes_h_l1659_c7_892a_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1659_c7_892a_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1659_c7_892a_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1659_c7_892a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1659_c7_892a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_892a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_892a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_892a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_892a_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1659_c7_892a]
signal result_u8_value_MUX_uxn_opcodes_h_l1659_c7_892a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1659_c7_892a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1659_c7_892a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1659_c7_892a_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1659_c7_892a]
signal result_u16_value_MUX_uxn_opcodes_h_l1659_c7_892a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1659_c7_892a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1659_c7_892a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1659_c7_892a_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1659_c7_892a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_892a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_892a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_892a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_892a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1659_c7_892a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_892a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_892a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_892a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_892a_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1660_c22_a4bd]
signal BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_a4bd_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_a4bd_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_a4bd_return_output : signed(17 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1660_c22_ec7d]
signal BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_ec7d_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_ec7d_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_ec7d_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1662_c11_0ef9]
signal BIN_OP_EQ_uxn_opcodes_h_l1662_c11_0ef9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1662_c11_0ef9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1662_c11_0ef9_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1662_c7_749b]
signal tmp8_high_MUX_uxn_opcodes_h_l1662_c7_749b_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1662_c7_749b_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1662_c7_749b_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1662_c7_749b_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1662_c7_749b]
signal tmp8_low_MUX_uxn_opcodes_h_l1662_c7_749b_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1662_c7_749b_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1662_c7_749b_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1662_c7_749b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1662_c7_749b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_749b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_749b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_749b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_749b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1662_c7_749b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_749b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_749b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_749b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_749b_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1662_c7_749b]
signal result_u8_value_MUX_uxn_opcodes_h_l1662_c7_749b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1662_c7_749b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1662_c7_749b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1662_c7_749b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1662_c7_749b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_749b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_749b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_749b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_749b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1668_c11_d995]
signal BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d995_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d995_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d995_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1668_c7_c37f]
signal tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c37f_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c37f_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c37f_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c37f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1668_c7_c37f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c37f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c37f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c37f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c37f_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1668_c7_c37f]
signal result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c37f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c37f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c37f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c37f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1668_c7_c37f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c37f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c37f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c37f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c37f_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_e393( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_ram_write := ref_toks_4;
      base.is_stack_index_flipped := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_vram_write := ref_toks_8;
      base.is_pc_updated := ref_toks_9;
      base.is_opc_done := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1638_c6_4ea9
BIN_OP_EQ_uxn_opcodes_h_l1638_c6_4ea9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1638_c6_4ea9_left,
BIN_OP_EQ_uxn_opcodes_h_l1638_c6_4ea9_right,
BIN_OP_EQ_uxn_opcodes_h_l1638_c6_4ea9_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8c27
tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8c27 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8c27_cond,
tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8c27
tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8c27 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8c27_cond,
tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8c27
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8c27 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8c27_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8c27
result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8c27 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8c27_cond,
result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8c27
result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8c27 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8c27_cond,
result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8c27
result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8c27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8c27
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8c27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8c27_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8c27
result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8c27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8c27_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8c27
result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8c27 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8c27_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8c27
result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8c27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8c27
result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8c27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8c27_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8c27
result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8c27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8c27_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output);

-- t8_MUX_uxn_opcodes_h_l1638_c2_8c27
t8_MUX_uxn_opcodes_h_l1638_c2_8c27 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1638_c2_8c27_cond,
t8_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue,
t8_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse,
t8_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1651_c11_8975
BIN_OP_EQ_uxn_opcodes_h_l1651_c11_8975 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1651_c11_8975_left,
BIN_OP_EQ_uxn_opcodes_h_l1651_c11_8975_right,
BIN_OP_EQ_uxn_opcodes_h_l1651_c11_8975_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1651_c7_b907
tmp8_high_MUX_uxn_opcodes_h_l1651_c7_b907 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1651_c7_b907_cond,
tmp8_high_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1651_c7_b907_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1651_c7_b907
tmp8_low_MUX_uxn_opcodes_h_l1651_c7_b907 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1651_c7_b907_cond,
tmp8_low_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1651_c7_b907_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_b907
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_b907 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_b907_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_b907_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1651_c7_b907
result_u8_value_MUX_uxn_opcodes_h_l1651_c7_b907 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1651_c7_b907_cond,
result_u8_value_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1651_c7_b907_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1651_c7_b907
result_u16_value_MUX_uxn_opcodes_h_l1651_c7_b907 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1651_c7_b907_cond,
result_u16_value_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1651_c7_b907_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_b907
result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_b907 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_b907_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_b907_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_b907
result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_b907 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_b907_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_b907_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_b907
result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_b907 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_b907_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_b907_return_output);

-- t8_MUX_uxn_opcodes_h_l1651_c7_b907
t8_MUX_uxn_opcodes_h_l1651_c7_b907 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1651_c7_b907_cond,
t8_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue,
t8_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse,
t8_MUX_uxn_opcodes_h_l1651_c7_b907_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1652_c30_01e2
sp_relative_shift_uxn_opcodes_h_l1652_c30_01e2 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1652_c30_01e2_ins,
sp_relative_shift_uxn_opcodes_h_l1652_c30_01e2_x,
sp_relative_shift_uxn_opcodes_h_l1652_c30_01e2_y,
sp_relative_shift_uxn_opcodes_h_l1652_c30_01e2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e8f0
BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e8f0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e8f0_left,
BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e8f0_right,
BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e8f0_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1654_c7_cc2a
tmp8_high_MUX_uxn_opcodes_h_l1654_c7_cc2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond,
tmp8_high_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1654_c7_cc2a
tmp8_low_MUX_uxn_opcodes_h_l1654_c7_cc2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond,
tmp8_low_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_cc2a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_cc2a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1654_c7_cc2a
result_u8_value_MUX_uxn_opcodes_h_l1654_c7_cc2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1654_c7_cc2a
result_u16_value_MUX_uxn_opcodes_h_l1654_c7_cc2a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond,
result_u16_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_cc2a
result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_cc2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_cc2a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_cc2a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_cc2a
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_cc2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output);

-- t8_MUX_uxn_opcodes_h_l1654_c7_cc2a
t8_MUX_uxn_opcodes_h_l1654_c7_cc2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond,
t8_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue,
t8_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse,
t8_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_d390
BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_d390 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_d390_left,
BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_d390_right,
BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_d390_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1659_c11_74f2
BIN_OP_EQ_uxn_opcodes_h_l1659_c11_74f2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1659_c11_74f2_left,
BIN_OP_EQ_uxn_opcodes_h_l1659_c11_74f2_right,
BIN_OP_EQ_uxn_opcodes_h_l1659_c11_74f2_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1659_c7_892a
tmp8_high_MUX_uxn_opcodes_h_l1659_c7_892a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1659_c7_892a_cond,
tmp8_high_MUX_uxn_opcodes_h_l1659_c7_892a_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1659_c7_892a_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1659_c7_892a_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1659_c7_892a
tmp8_low_MUX_uxn_opcodes_h_l1659_c7_892a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1659_c7_892a_cond,
tmp8_low_MUX_uxn_opcodes_h_l1659_c7_892a_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1659_c7_892a_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1659_c7_892a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_892a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_892a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_892a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_892a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_892a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_892a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1659_c7_892a
result_u8_value_MUX_uxn_opcodes_h_l1659_c7_892a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1659_c7_892a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1659_c7_892a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1659_c7_892a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1659_c7_892a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1659_c7_892a
result_u16_value_MUX_uxn_opcodes_h_l1659_c7_892a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1659_c7_892a_cond,
result_u16_value_MUX_uxn_opcodes_h_l1659_c7_892a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1659_c7_892a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1659_c7_892a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_892a
result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_892a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_892a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_892a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_892a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_892a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_892a
result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_892a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_892a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_892a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_892a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_892a_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_a4bd
BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_a4bd : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_a4bd_left,
BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_a4bd_right,
BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_a4bd_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_ec7d
BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_ec7d : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_ec7d_left,
BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_ec7d_right,
BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_ec7d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1662_c11_0ef9
BIN_OP_EQ_uxn_opcodes_h_l1662_c11_0ef9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1662_c11_0ef9_left,
BIN_OP_EQ_uxn_opcodes_h_l1662_c11_0ef9_right,
BIN_OP_EQ_uxn_opcodes_h_l1662_c11_0ef9_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1662_c7_749b
tmp8_high_MUX_uxn_opcodes_h_l1662_c7_749b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1662_c7_749b_cond,
tmp8_high_MUX_uxn_opcodes_h_l1662_c7_749b_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1662_c7_749b_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1662_c7_749b_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1662_c7_749b
tmp8_low_MUX_uxn_opcodes_h_l1662_c7_749b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1662_c7_749b_cond,
tmp8_low_MUX_uxn_opcodes_h_l1662_c7_749b_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1662_c7_749b_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1662_c7_749b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_749b
result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_749b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_749b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_749b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_749b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_749b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_749b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_749b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_749b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_749b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_749b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_749b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1662_c7_749b
result_u8_value_MUX_uxn_opcodes_h_l1662_c7_749b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1662_c7_749b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1662_c7_749b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1662_c7_749b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1662_c7_749b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_749b
result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_749b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_749b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_749b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_749b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_749b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d995
BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d995 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d995_left,
BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d995_right,
BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d995_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c37f
tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c37f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c37f_cond,
tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c37f_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c37f_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c37f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c37f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c37f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c37f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c37f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c37f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c37f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c37f
result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c37f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c37f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c37f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c37f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c37f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c37f
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c37f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c37f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c37f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c37f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c37f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1638_c6_4ea9_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output,
 t8_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1651_c11_8975_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1651_c7_b907_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1651_c7_b907_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_b907_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1651_c7_b907_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1651_c7_b907_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_b907_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_b907_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_b907_return_output,
 t8_MUX_uxn_opcodes_h_l1651_c7_b907_return_output,
 sp_relative_shift_uxn_opcodes_h_l1652_c30_01e2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e8f0_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output,
 t8_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_d390_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1659_c11_74f2_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1659_c7_892a_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1659_c7_892a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_892a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1659_c7_892a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1659_c7_892a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_892a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_892a_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_a4bd_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_ec7d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1662_c11_0ef9_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1662_c7_749b_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1662_c7_749b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_749b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_749b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1662_c7_749b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_749b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d995_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c37f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c37f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c37f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c37f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_4ea9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_4ea9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_4ea9_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_b907_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8c27_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_b907_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8c27_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1648_c3_d44c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_b907_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8c27_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_b907_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8c27_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_b907_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8c27_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1638_c2_8c27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1638_c2_8c27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8c27_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_b907_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8c27_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1643_c3_5f3d : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_b907_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8c27_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1638_c2_8c27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1638_c2_8c27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8c27_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_b907_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8c27_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1651_c7_b907_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1638_c2_8c27_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_8975_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_8975_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_8975_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_b907_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_b907_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_b907_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_b907_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_b907_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_b907_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_b907_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_b907_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1651_c7_b907_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_01e2_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_01e2_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_01e2_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_01e2_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e8f0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e8f0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e8f0_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_892a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_892a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_892a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_892a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1657_c3_b379 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_892a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_892a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1656_c3_cad9 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1654_c7_cc2a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_892a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_d390_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1657_c27_4201_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_d390_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_d390_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_74f2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_74f2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_74f2_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_892a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_892a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_749b_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_892a_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_892a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_892a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_749b_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_892a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_892a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_892a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_749b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_892a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_892a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_892a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_749b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_892a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_892a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1660_c3_d47f : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_892a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_892a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_892a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_892a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_749b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_892a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_892a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_892a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_749b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_892a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_a4bd_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1660_c27_2885_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_a4bd_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_a4bd_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_ec7d_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_ec7d_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_ec7d_return_output : signed(18 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_0ef9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_0ef9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_0ef9_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_749b_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_749b_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_749b_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_749b_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_749b_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c37f_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_749b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_749b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_749b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_749b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_749b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1665_c3_e43a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_749b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c37f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_749b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_749b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_749b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c37f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_749b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_749b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_749b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c37f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_749b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d995_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d995_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d995_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c37f_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c37f_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c37f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c37f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1670_c3_0c66 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c37f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c37f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c37f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c37f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c37f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c37f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c37f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c37f_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1668_l1659_l1654_l1651_l1638_DUPLICATE_af38_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1638_l1659_l1651_DUPLICATE_1408_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1668_l1659_l1651_l1654_DUPLICATE_9c2a_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1659_l1651_l1662_l1654_DUPLICATE_48fa_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1668_l1662_l1659_l1654_l1651_DUPLICATE_1e4b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e393_uxn_opcodes_h_l1675_l1634_DUPLICATE_df10_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d995_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_749b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_ec7d_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1665_c3_e43a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_749b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1665_c3_e43a;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c37f_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_74f2_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1656_c3_cad9 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1656_c3_cad9;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e8f0_right := to_unsigned(2, 2);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_8975_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_01e2_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1648_c3_d44c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1648_c3_d44c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_0ef9_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_4ea9_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_01e2_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1643_c3_5f3d := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1643_c3_5f3d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1670_c3_0c66 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c37f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1670_c3_0c66;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_01e2_ins := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_d390_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_a4bd_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_4ea9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_8975_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e8f0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_74f2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_0ef9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d995_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_749b_iftrue := VAR_previous_ram_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c37f_iftrue := VAR_previous_ram_read;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_749b_iftrue := VAR_previous_ram_read;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c37f_iftrue := VAR_previous_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse := t8;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_892a_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_749b_iffalse := tmp8_high;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_892a_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_749b_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c37f_iffalse := tmp8_low;
     -- BIN_OP_EQ[uxn_opcodes_h_l1654_c11_e8f0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e8f0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e8f0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e8f0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e8f0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e8f0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e8f0_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1657_c27_4201] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1657_c27_4201_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1638_c2_8c27] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1638_c2_8c27_return_output := result.is_stack_index_flipped;

     -- sp_relative_shift[uxn_opcodes_h_l1652_c30_01e2] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1652_c30_01e2_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_01e2_ins;
     sp_relative_shift_uxn_opcodes_h_l1652_c30_01e2_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_01e2_x;
     sp_relative_shift_uxn_opcodes_h_l1652_c30_01e2_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_01e2_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_01e2_return_output := sp_relative_shift_uxn_opcodes_h_l1652_c30_01e2_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1638_l1659_l1651_DUPLICATE_1408 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1638_l1659_l1651_DUPLICATE_1408_return_output := result.u16_value;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1638_c2_8c27] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1638_c2_8c27_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1659_l1651_l1662_l1654_DUPLICATE_48fa LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1659_l1651_l1662_l1654_DUPLICATE_48fa_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1638_c6_4ea9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1638_c6_4ea9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_4ea9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1638_c6_4ea9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_4ea9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_4ea9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1638_c6_4ea9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1651_c11_8975] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1651_c11_8975_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_8975_left;
     BIN_OP_EQ_uxn_opcodes_h_l1651_c11_8975_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_8975_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_8975_return_output := BIN_OP_EQ_uxn_opcodes_h_l1651_c11_8975_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1668_l1659_l1651_l1654_DUPLICATE_9c2a LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1668_l1659_l1651_l1654_DUPLICATE_9c2a_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1668_l1662_l1659_l1654_l1651_DUPLICATE_1e4b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1668_l1662_l1659_l1654_l1651_DUPLICATE_1e4b_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1668_c11_d995] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d995_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d995_left;
     BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d995_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d995_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d995_return_output := BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d995_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1638_c2_8c27] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1638_c2_8c27_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1659_c11_74f2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1659_c11_74f2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_74f2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1659_c11_74f2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_74f2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_74f2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1659_c11_74f2_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1638_c2_8c27] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1638_c2_8c27_return_output := result.is_vram_write;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1660_c27_2885] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1660_c27_2885_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l1662_c11_0ef9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1662_c11_0ef9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_0ef9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1662_c11_0ef9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_0ef9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_0ef9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1662_c11_0ef9_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l1654_c7_cc2a] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1654_c7_cc2a_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1668_l1659_l1654_l1651_l1638_DUPLICATE_af38 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1668_l1659_l1654_l1651_l1638_DUPLICATE_af38_return_output := result.u8_value;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8c27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_4ea9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8c27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_4ea9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_4ea9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8c27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_4ea9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8c27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_4ea9_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_4ea9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8c27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_4ea9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8c27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_4ea9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8c27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_4ea9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8c27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_4ea9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1638_c2_8c27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_4ea9_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8c27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_4ea9_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8c27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_4ea9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_b907_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_8975_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_b907_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_8975_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_b907_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_8975_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_b907_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_8975_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_b907_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_8975_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_b907_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_8975_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1651_c7_b907_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_8975_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_b907_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_8975_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_b907_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_8975_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e8f0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e8f0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e8f0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e8f0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e8f0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e8f0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e8f0_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e8f0_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_e8f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_892a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_74f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_892a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_74f2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_892a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_74f2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_892a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_74f2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_892a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_74f2_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_892a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_74f2_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_892a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_74f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_749b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_0ef9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_749b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_0ef9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_749b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_0ef9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_749b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_0ef9_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_749b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_0ef9_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_749b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_0ef9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c37f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d995_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c37f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d995_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c37f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d995_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c37f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_d995_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_d390_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1657_c27_4201_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_a4bd_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1660_c27_2885_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1638_l1659_l1651_DUPLICATE_1408_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1638_l1659_l1651_DUPLICATE_1408_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_892a_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1638_l1659_l1651_DUPLICATE_1408_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1668_l1662_l1659_l1654_l1651_DUPLICATE_1e4b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1668_l1662_l1659_l1654_l1651_DUPLICATE_1e4b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_892a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1668_l1662_l1659_l1654_l1651_DUPLICATE_1e4b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_749b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1668_l1662_l1659_l1654_l1651_DUPLICATE_1e4b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c37f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1668_l1662_l1659_l1654_l1651_DUPLICATE_1e4b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1659_l1651_l1662_l1654_DUPLICATE_48fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1659_l1651_l1662_l1654_DUPLICATE_48fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_892a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1659_l1651_l1662_l1654_DUPLICATE_48fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_749b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1659_l1651_l1662_l1654_DUPLICATE_48fa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1668_l1659_l1651_l1654_DUPLICATE_9c2a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1668_l1659_l1651_l1654_DUPLICATE_9c2a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_892a_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1668_l1659_l1651_l1654_DUPLICATE_9c2a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c37f_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1668_l1659_l1651_l1654_DUPLICATE_9c2a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1668_l1659_l1654_l1651_l1638_DUPLICATE_af38_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1668_l1659_l1654_l1651_l1638_DUPLICATE_af38_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1668_l1659_l1654_l1651_l1638_DUPLICATE_af38_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_892a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1668_l1659_l1654_l1651_l1638_DUPLICATE_af38_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c37f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1668_l1659_l1654_l1651_l1638_DUPLICATE_af38_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1638_c2_8c27_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1638_c2_8c27_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1638_c2_8c27_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1638_c2_8c27_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1654_c7_cc2a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_01e2_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l1638_c2_8c27] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1660_c22_a4bd] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_a4bd_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_a4bd_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_a4bd_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_a4bd_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_a4bd_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_a4bd_return_output;

     -- t8_MUX[uxn_opcodes_h_l1654_c7_cc2a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond <= VAR_t8_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond;
     t8_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue;
     t8_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output := t8_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1668_c7_c37f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c37f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c37f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c37f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c37f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c37f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c37f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c37f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c37f_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1638_c2_8c27] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8c27_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8c27_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1654_c7_cc2a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1668_c7_c37f] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c37f_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c37f_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c37f_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c37f_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c37f_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c37f_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c37f_return_output := tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c37f_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1657_c22_d390] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_d390_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_d390_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_d390_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_d390_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_d390_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_d390_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1638_c2_8c27] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8c27_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8c27_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1662_c7_749b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_749b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_749b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_749b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_749b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_749b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_749b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_749b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_749b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1668_c7_c37f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c37f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c37f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c37f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c37f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c37f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c37f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c37f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c37f_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1638_c2_8c27] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1668_c7_c37f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c37f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c37f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c37f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c37f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c37f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c37f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c37f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c37f_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1662_c7_749b] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1662_c7_749b_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_749b_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1662_c7_749b_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_749b_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1662_c7_749b_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_749b_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_749b_return_output := tmp8_high_MUX_uxn_opcodes_h_l1662_c7_749b_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l1657_c3_b379 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_d390_return_output)),16);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_ec7d_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_a4bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_749b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c37f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_892a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_749b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_749b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c37f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_749b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c37f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_892a_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_749b_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_749b_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c37f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1657_c3_b379;
     -- t8_MUX[uxn_opcodes_h_l1651_c7_b907] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1651_c7_b907_cond <= VAR_t8_MUX_uxn_opcodes_h_l1651_c7_b907_cond;
     t8_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue;
     t8_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1651_c7_b907_return_output := t8_MUX_uxn_opcodes_h_l1651_c7_b907_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1659_c7_892a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_892a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_892a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_892a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_892a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_892a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_892a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_892a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_892a_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1660_c22_ec7d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_ec7d_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_ec7d_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_ec7d_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_ec7d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_ec7d_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_ec7d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1662_c7_749b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1662_c7_749b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_749b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1662_c7_749b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_749b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1662_c7_749b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_749b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_749b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1662_c7_749b_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1662_c7_749b] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1662_c7_749b_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_749b_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1662_c7_749b_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_749b_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1662_c7_749b_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_749b_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_749b_return_output := tmp8_low_MUX_uxn_opcodes_h_l1662_c7_749b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1662_c7_749b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_749b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_749b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_749b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_749b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_749b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_749b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_749b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_749b_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1659_c7_892a] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1659_c7_892a_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_892a_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1659_c7_892a_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_892a_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1659_c7_892a_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_892a_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_892a_return_output := tmp8_high_MUX_uxn_opcodes_h_l1659_c7_892a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1651_c7_b907] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_b907_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_b907_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_b907_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_b907_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1662_c7_749b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_749b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_749b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_749b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_749b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_749b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_749b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_749b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_749b_return_output;

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1660_c3_d47f := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_ec7d_return_output)),16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_892a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_749b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_892a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_b907_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_892a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_749b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_892a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_749b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1651_c7_b907_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_892a_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_892a_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_749b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_892a_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1660_c3_d47f;
     -- result_u16_value_MUX[uxn_opcodes_h_l1659_c7_892a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1659_c7_892a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_892a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1659_c7_892a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_892a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1659_c7_892a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_892a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_892a_return_output := result_u16_value_MUX_uxn_opcodes_h_l1659_c7_892a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1654_c7_cc2a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1659_c7_892a] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1659_c7_892a_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_892a_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1659_c7_892a_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_892a_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1659_c7_892a_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_892a_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_892a_return_output := tmp8_low_MUX_uxn_opcodes_h_l1659_c7_892a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1659_c7_892a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_892a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_892a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_892a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_892a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_892a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_892a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_892a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_892a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1659_c7_892a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_892a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_892a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_892a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_892a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_892a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_892a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_892a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_892a_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1654_c7_cc2a] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output := tmp8_high_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1659_c7_892a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1659_c7_892a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_892a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1659_c7_892a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_892a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1659_c7_892a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_892a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_892a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1659_c7_892a_return_output;

     -- t8_MUX[uxn_opcodes_h_l1638_c2_8c27] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1638_c2_8c27_cond <= VAR_t8_MUX_uxn_opcodes_h_l1638_c2_8c27_cond;
     t8_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue;
     t8_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output := t8_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1638_c2_8c27] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8c27_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8c27_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_892a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_892a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_892a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_892a_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_892a_return_output;
     -- tmp8_high_MUX[uxn_opcodes_h_l1651_c7_b907] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1651_c7_b907_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_b907_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_b907_return_output := tmp8_high_MUX_uxn_opcodes_h_l1651_c7_b907_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1654_c7_cc2a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1654_c7_cc2a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1651_c7_b907] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_b907_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_b907_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_b907_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_b907_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1654_c7_cc2a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1654_c7_cc2a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output := result_u16_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1654_c7_cc2a] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_cc2a_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_cc2a_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_cc2a_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output := tmp8_low_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_b907_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_b907_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_cc2a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1638_c2_8c27] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8c27_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8c27_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1651_c7_b907] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1651_c7_b907_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_b907_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_b907_return_output := result_u8_value_MUX_uxn_opcodes_h_l1651_c7_b907_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1651_c7_b907] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1651_c7_b907_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_b907_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_b907_return_output := tmp8_low_MUX_uxn_opcodes_h_l1651_c7_b907_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1651_c7_b907] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1651_c7_b907_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_b907_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_b907_return_output := result_u16_value_MUX_uxn_opcodes_h_l1651_c7_b907_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1638_c2_8c27] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8c27_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8c27_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output := tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1651_c7_b907] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_b907_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_b907_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_b907_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_b907_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1651_c7_b907] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_b907_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_b907_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_b907_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_b907_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_b907_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_b907_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_b907_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_b907_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_b907_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_b907_return_output;
     REG_VAR_tmp8_high := VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_b907_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1638_c2_8c27] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8c27_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8c27_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output := result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1638_c2_8c27] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8c27_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8c27_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output := result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1638_c2_8c27] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8c27_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8c27_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1638_c2_8c27] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8c27_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8c27_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output := tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1638_c2_8c27] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8c27_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8c27_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8c27_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8c27_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output;

     -- Submodule level 7
     REG_VAR_tmp8_low := VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e393_uxn_opcodes_h_l1675_l1634_DUPLICATE_df10 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e393_uxn_opcodes_h_l1675_l1634_DUPLICATE_df10_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e393(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8c27_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e393_uxn_opcodes_h_l1675_l1634_DUPLICATE_df10_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e393_uxn_opcodes_h_l1675_l1634_DUPLICATE_df10_return_output;
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
