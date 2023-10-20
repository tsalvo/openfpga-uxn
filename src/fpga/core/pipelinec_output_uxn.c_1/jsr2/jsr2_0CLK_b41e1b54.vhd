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
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 87
entity jsr2_0CLK_b41e1b54 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jsr2_0CLK_b41e1b54;
architecture arch of jsr2_0CLK_b41e1b54 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l808_c6_7525]
signal BIN_OP_EQ_uxn_opcodes_h_l808_c6_7525_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l808_c6_7525_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l808_c6_7525_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l808_c2_41f3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l808_c2_41f3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l808_c2_41f3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l808_c2_41f3]
signal result_u8_value_MUX_uxn_opcodes_h_l808_c2_41f3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l808_c2_41f3_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l808_c2_41f3]
signal result_u16_value_MUX_uxn_opcodes_h_l808_c2_41f3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l808_c2_41f3_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l808_c2_41f3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_41f3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_41f3_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l808_c2_41f3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_41f3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_41f3_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l808_c2_41f3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l808_c2_41f3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l808_c2_41f3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l808_c2_41f3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_41f3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_41f3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l808_c2_41f3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_41f3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_41f3_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l808_c2_41f3]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c2_41f3_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c2_41f3_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l808_c2_41f3]
signal t16_MUX_uxn_opcodes_h_l808_c2_41f3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l808_c2_41f3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l813_c11_683b]
signal BIN_OP_EQ_uxn_opcodes_h_l813_c11_683b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l813_c11_683b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l813_c11_683b_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l813_c7_6e45]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6e45_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6e45_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l813_c7_6e45]
signal result_u8_value_MUX_uxn_opcodes_h_l813_c7_6e45_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l813_c7_6e45_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l813_c7_6e45]
signal result_u16_value_MUX_uxn_opcodes_h_l813_c7_6e45_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l813_c7_6e45_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l813_c7_6e45]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6e45_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6e45_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l813_c7_6e45]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6e45_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6e45_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l813_c7_6e45]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6e45_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6e45_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l813_c7_6e45]
signal result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6e45_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6e45_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l813_c7_6e45]
signal result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6e45_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6e45_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l813_c7_6e45]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6e45_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6e45_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l813_c7_6e45]
signal t16_MUX_uxn_opcodes_h_l813_c7_6e45_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l813_c7_6e45_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l816_c11_609f]
signal BIN_OP_EQ_uxn_opcodes_h_l816_c11_609f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l816_c11_609f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l816_c11_609f_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l816_c7_ad28]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_ad28_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_ad28_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l816_c7_ad28]
signal result_u8_value_MUX_uxn_opcodes_h_l816_c7_ad28_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l816_c7_ad28_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l816_c7_ad28]
signal result_u16_value_MUX_uxn_opcodes_h_l816_c7_ad28_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l816_c7_ad28_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l816_c7_ad28]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_ad28_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_ad28_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l816_c7_ad28]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_ad28_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_ad28_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l816_c7_ad28]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_ad28_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_ad28_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l816_c7_ad28]
signal result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_ad28_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_ad28_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l816_c7_ad28]
signal result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_ad28_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_ad28_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l816_c7_ad28]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_ad28_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_ad28_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l816_c7_ad28]
signal t16_MUX_uxn_opcodes_h_l816_c7_ad28_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l816_c7_ad28_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l818_c3_b9a3]
signal CONST_SL_8_uxn_opcodes_h_l818_c3_b9a3_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l818_c3_b9a3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l821_c11_46a9]
signal BIN_OP_EQ_uxn_opcodes_h_l821_c11_46a9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l821_c11_46a9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l821_c11_46a9_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l821_c7_1fef]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_1fef_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_1fef_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l821_c7_1fef]
signal result_u8_value_MUX_uxn_opcodes_h_l821_c7_1fef_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l821_c7_1fef_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l821_c7_1fef]
signal result_u16_value_MUX_uxn_opcodes_h_l821_c7_1fef_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l821_c7_1fef_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l821_c7_1fef]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_1fef_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_1fef_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l821_c7_1fef]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_1fef_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_1fef_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l821_c7_1fef]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_1fef_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_1fef_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l821_c7_1fef]
signal result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_1fef_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_1fef_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l821_c7_1fef]
signal result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_1fef_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_1fef_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l821_c7_1fef]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_1fef_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_1fef_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l821_c7_1fef]
signal t16_MUX_uxn_opcodes_h_l821_c7_1fef_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l821_c7_1fef_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l824_c11_68f9]
signal BIN_OP_EQ_uxn_opcodes_h_l824_c11_68f9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l824_c11_68f9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l824_c11_68f9_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l824_c7_64e8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_64e8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_64e8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l824_c7_64e8]
signal result_u8_value_MUX_uxn_opcodes_h_l824_c7_64e8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l824_c7_64e8_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l824_c7_64e8]
signal result_u16_value_MUX_uxn_opcodes_h_l824_c7_64e8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l824_c7_64e8_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l824_c7_64e8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_64e8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_64e8_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l824_c7_64e8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_64e8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_64e8_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l824_c7_64e8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l824_c7_64e8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l824_c7_64e8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l824_c7_64e8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l824_c7_64e8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l824_c7_64e8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l824_c7_64e8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_64e8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_64e8_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l824_c7_64e8]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l824_c7_64e8_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l824_c7_64e8_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l824_c7_64e8]
signal t16_MUX_uxn_opcodes_h_l824_c7_64e8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l824_c7_64e8_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l825_c3_3b09]
signal BIN_OP_OR_uxn_opcodes_h_l825_c3_3b09_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l825_c3_3b09_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l825_c3_3b09_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l827_c30_2192]
signal sp_relative_shift_uxn_opcodes_h_l827_c30_2192_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l827_c30_2192_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l827_c30_2192_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l827_c30_2192_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l829_c11_f3d4]
signal BIN_OP_EQ_uxn_opcodes_h_l829_c11_f3d4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l829_c11_f3d4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l829_c11_f3d4_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l829_c7_91cd]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l829_c7_91cd_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l829_c7_91cd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l829_c7_91cd]
signal result_u8_value_MUX_uxn_opcodes_h_l829_c7_91cd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l829_c7_91cd_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l829_c7_91cd]
signal result_u16_value_MUX_uxn_opcodes_h_l829_c7_91cd_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l829_c7_91cd_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l829_c7_91cd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c7_91cd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c7_91cd_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l829_c7_91cd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_91cd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_91cd_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l829_c7_91cd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l829_c7_91cd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l829_c7_91cd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l829_c7_91cd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_91cd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_91cd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l829_c7_91cd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_91cd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_91cd_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l829_c7_91cd]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c7_91cd_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c7_91cd_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l836_c11_2fd8]
signal BIN_OP_EQ_uxn_opcodes_h_l836_c11_2fd8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l836_c11_2fd8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l836_c11_2fd8_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l836_c7_38e7]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l836_c7_38e7_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l836_c7_38e7_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l836_c7_38e7_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l836_c7_38e7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l836_c7_38e7]
signal result_u8_value_MUX_uxn_opcodes_h_l836_c7_38e7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l836_c7_38e7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l836_c7_38e7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l836_c7_38e7_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l836_c7_38e7]
signal result_u16_value_MUX_uxn_opcodes_h_l836_c7_38e7_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l836_c7_38e7_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l836_c7_38e7_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l836_c7_38e7_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l836_c7_38e7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c7_38e7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c7_38e7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c7_38e7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c7_38e7_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l836_c7_38e7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l836_c7_38e7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l836_c7_38e7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l836_c7_38e7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l836_c7_38e7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l836_c7_38e7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l836_c7_38e7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l836_c7_38e7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l836_c7_38e7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l836_c7_38e7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l836_c7_38e7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l836_c7_38e7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l836_c7_38e7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l836_c7_38e7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l836_c7_38e7_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l836_c7_38e7]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c7_38e7_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c7_38e7_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c7_38e7_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c7_38e7_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l839_c31_5c25]
signal CONST_SR_8_uxn_opcodes_h_l839_c31_5c25_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l839_c31_5c25_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l843_c11_8129]
signal BIN_OP_EQ_uxn_opcodes_h_l843_c11_8129_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l843_c11_8129_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l843_c11_8129_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l843_c7_de54]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l843_c7_de54_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l843_c7_de54_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l843_c7_de54_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l843_c7_de54_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l843_c7_de54]
signal result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_de54_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_de54_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_de54_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_de54_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l843_c7_de54]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l843_c7_de54_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l843_c7_de54_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l843_c7_de54_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l843_c7_de54_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l843_c7_de54]
signal result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_de54_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_de54_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_de54_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_de54_return_output : unsigned(0 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_b465( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_pc_updated := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_sp_shift := ref_toks_6;
      base.is_stack_write := ref_toks_7;
      base.is_opc_done := ref_toks_8;
      base.is_stack_index_flipped := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l808_c6_7525
BIN_OP_EQ_uxn_opcodes_h_l808_c6_7525 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l808_c6_7525_left,
BIN_OP_EQ_uxn_opcodes_h_l808_c6_7525_right,
BIN_OP_EQ_uxn_opcodes_h_l808_c6_7525_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l808_c2_41f3
result_is_pc_updated_MUX_uxn_opcodes_h_l808_c2_41f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l808_c2_41f3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l808_c2_41f3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l808_c2_41f3
result_u8_value_MUX_uxn_opcodes_h_l808_c2_41f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l808_c2_41f3_cond,
result_u8_value_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l808_c2_41f3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l808_c2_41f3
result_u16_value_MUX_uxn_opcodes_h_l808_c2_41f3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l808_c2_41f3_cond,
result_u16_value_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l808_c2_41f3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_41f3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_41f3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_41f3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_41f3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_41f3
result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_41f3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_41f3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_41f3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l808_c2_41f3
result_is_sp_shift_MUX_uxn_opcodes_h_l808_c2_41f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l808_c2_41f3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l808_c2_41f3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_41f3
result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_41f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_41f3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_41f3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_41f3
result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_41f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_41f3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_41f3_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c2_41f3
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c2_41f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c2_41f3_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c2_41f3_return_output);

-- t16_MUX_uxn_opcodes_h_l808_c2_41f3
t16_MUX_uxn_opcodes_h_l808_c2_41f3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l808_c2_41f3_cond,
t16_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue,
t16_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse,
t16_MUX_uxn_opcodes_h_l808_c2_41f3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l813_c11_683b
BIN_OP_EQ_uxn_opcodes_h_l813_c11_683b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l813_c11_683b_left,
BIN_OP_EQ_uxn_opcodes_h_l813_c11_683b_right,
BIN_OP_EQ_uxn_opcodes_h_l813_c11_683b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6e45
result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6e45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6e45_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6e45_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l813_c7_6e45
result_u8_value_MUX_uxn_opcodes_h_l813_c7_6e45 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l813_c7_6e45_cond,
result_u8_value_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l813_c7_6e45_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l813_c7_6e45
result_u16_value_MUX_uxn_opcodes_h_l813_c7_6e45 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l813_c7_6e45_cond,
result_u16_value_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l813_c7_6e45_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6e45
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6e45 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6e45_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6e45_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6e45
result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6e45 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6e45_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6e45_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6e45
result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6e45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6e45_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6e45_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6e45
result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6e45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6e45_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6e45_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6e45
result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6e45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6e45_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6e45_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6e45
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6e45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6e45_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6e45_return_output);

-- t16_MUX_uxn_opcodes_h_l813_c7_6e45
t16_MUX_uxn_opcodes_h_l813_c7_6e45 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l813_c7_6e45_cond,
t16_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue,
t16_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse,
t16_MUX_uxn_opcodes_h_l813_c7_6e45_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l816_c11_609f
BIN_OP_EQ_uxn_opcodes_h_l816_c11_609f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l816_c11_609f_left,
BIN_OP_EQ_uxn_opcodes_h_l816_c11_609f_right,
BIN_OP_EQ_uxn_opcodes_h_l816_c11_609f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_ad28
result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_ad28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_ad28_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_ad28_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l816_c7_ad28
result_u8_value_MUX_uxn_opcodes_h_l816_c7_ad28 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l816_c7_ad28_cond,
result_u8_value_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l816_c7_ad28_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l816_c7_ad28
result_u16_value_MUX_uxn_opcodes_h_l816_c7_ad28 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l816_c7_ad28_cond,
result_u16_value_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l816_c7_ad28_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_ad28
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_ad28 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_ad28_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_ad28_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_ad28
result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_ad28 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_ad28_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_ad28_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_ad28
result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_ad28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_ad28_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_ad28_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_ad28
result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_ad28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_ad28_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_ad28_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_ad28
result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_ad28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_ad28_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_ad28_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_ad28
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_ad28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_ad28_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_ad28_return_output);

-- t16_MUX_uxn_opcodes_h_l816_c7_ad28
t16_MUX_uxn_opcodes_h_l816_c7_ad28 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l816_c7_ad28_cond,
t16_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue,
t16_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse,
t16_MUX_uxn_opcodes_h_l816_c7_ad28_return_output);

-- CONST_SL_8_uxn_opcodes_h_l818_c3_b9a3
CONST_SL_8_uxn_opcodes_h_l818_c3_b9a3 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l818_c3_b9a3_x,
CONST_SL_8_uxn_opcodes_h_l818_c3_b9a3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l821_c11_46a9
BIN_OP_EQ_uxn_opcodes_h_l821_c11_46a9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l821_c11_46a9_left,
BIN_OP_EQ_uxn_opcodes_h_l821_c11_46a9_right,
BIN_OP_EQ_uxn_opcodes_h_l821_c11_46a9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_1fef
result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_1fef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_1fef_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_1fef_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l821_c7_1fef
result_u8_value_MUX_uxn_opcodes_h_l821_c7_1fef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l821_c7_1fef_cond,
result_u8_value_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l821_c7_1fef_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l821_c7_1fef
result_u16_value_MUX_uxn_opcodes_h_l821_c7_1fef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l821_c7_1fef_cond,
result_u16_value_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l821_c7_1fef_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_1fef
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_1fef : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_1fef_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_1fef_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_1fef
result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_1fef : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_1fef_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_1fef_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_1fef
result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_1fef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_1fef_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_1fef_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_1fef
result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_1fef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_1fef_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_1fef_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_1fef
result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_1fef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_1fef_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_1fef_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_1fef
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_1fef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_1fef_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_1fef_return_output);

-- t16_MUX_uxn_opcodes_h_l821_c7_1fef
t16_MUX_uxn_opcodes_h_l821_c7_1fef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l821_c7_1fef_cond,
t16_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue,
t16_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse,
t16_MUX_uxn_opcodes_h_l821_c7_1fef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l824_c11_68f9
BIN_OP_EQ_uxn_opcodes_h_l824_c11_68f9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l824_c11_68f9_left,
BIN_OP_EQ_uxn_opcodes_h_l824_c11_68f9_right,
BIN_OP_EQ_uxn_opcodes_h_l824_c11_68f9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_64e8
result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_64e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_64e8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_64e8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l824_c7_64e8
result_u8_value_MUX_uxn_opcodes_h_l824_c7_64e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l824_c7_64e8_cond,
result_u8_value_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l824_c7_64e8_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l824_c7_64e8
result_u16_value_MUX_uxn_opcodes_h_l824_c7_64e8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l824_c7_64e8_cond,
result_u16_value_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l824_c7_64e8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_64e8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_64e8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_64e8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_64e8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_64e8
result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_64e8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_64e8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_64e8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l824_c7_64e8
result_is_sp_shift_MUX_uxn_opcodes_h_l824_c7_64e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l824_c7_64e8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l824_c7_64e8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l824_c7_64e8
result_is_stack_write_MUX_uxn_opcodes_h_l824_c7_64e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l824_c7_64e8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l824_c7_64e8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_64e8
result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_64e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_64e8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_64e8_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l824_c7_64e8
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l824_c7_64e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l824_c7_64e8_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l824_c7_64e8_return_output);

-- t16_MUX_uxn_opcodes_h_l824_c7_64e8
t16_MUX_uxn_opcodes_h_l824_c7_64e8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l824_c7_64e8_cond,
t16_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue,
t16_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse,
t16_MUX_uxn_opcodes_h_l824_c7_64e8_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l825_c3_3b09
BIN_OP_OR_uxn_opcodes_h_l825_c3_3b09 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l825_c3_3b09_left,
BIN_OP_OR_uxn_opcodes_h_l825_c3_3b09_right,
BIN_OP_OR_uxn_opcodes_h_l825_c3_3b09_return_output);

-- sp_relative_shift_uxn_opcodes_h_l827_c30_2192
sp_relative_shift_uxn_opcodes_h_l827_c30_2192 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l827_c30_2192_ins,
sp_relative_shift_uxn_opcodes_h_l827_c30_2192_x,
sp_relative_shift_uxn_opcodes_h_l827_c30_2192_y,
sp_relative_shift_uxn_opcodes_h_l827_c30_2192_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l829_c11_f3d4
BIN_OP_EQ_uxn_opcodes_h_l829_c11_f3d4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l829_c11_f3d4_left,
BIN_OP_EQ_uxn_opcodes_h_l829_c11_f3d4_right,
BIN_OP_EQ_uxn_opcodes_h_l829_c11_f3d4_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l829_c7_91cd
result_is_pc_updated_MUX_uxn_opcodes_h_l829_c7_91cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l829_c7_91cd_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l829_c7_91cd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l829_c7_91cd
result_u8_value_MUX_uxn_opcodes_h_l829_c7_91cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l829_c7_91cd_cond,
result_u8_value_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l829_c7_91cd_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l829_c7_91cd
result_u16_value_MUX_uxn_opcodes_h_l829_c7_91cd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l829_c7_91cd_cond,
result_u16_value_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l829_c7_91cd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c7_91cd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c7_91cd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c7_91cd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c7_91cd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_91cd
result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_91cd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_91cd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_91cd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l829_c7_91cd
result_is_sp_shift_MUX_uxn_opcodes_h_l829_c7_91cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l829_c7_91cd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l829_c7_91cd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_91cd
result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_91cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_91cd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_91cd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_91cd
result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_91cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_91cd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_91cd_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c7_91cd
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c7_91cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c7_91cd_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c7_91cd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l836_c11_2fd8
BIN_OP_EQ_uxn_opcodes_h_l836_c11_2fd8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l836_c11_2fd8_left,
BIN_OP_EQ_uxn_opcodes_h_l836_c11_2fd8_right,
BIN_OP_EQ_uxn_opcodes_h_l836_c11_2fd8_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l836_c7_38e7
result_is_pc_updated_MUX_uxn_opcodes_h_l836_c7_38e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l836_c7_38e7_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l836_c7_38e7_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l836_c7_38e7_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l836_c7_38e7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l836_c7_38e7
result_u8_value_MUX_uxn_opcodes_h_l836_c7_38e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l836_c7_38e7_cond,
result_u8_value_MUX_uxn_opcodes_h_l836_c7_38e7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l836_c7_38e7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l836_c7_38e7_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l836_c7_38e7
result_u16_value_MUX_uxn_opcodes_h_l836_c7_38e7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l836_c7_38e7_cond,
result_u16_value_MUX_uxn_opcodes_h_l836_c7_38e7_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l836_c7_38e7_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l836_c7_38e7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c7_38e7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c7_38e7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c7_38e7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c7_38e7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c7_38e7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c7_38e7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l836_c7_38e7
result_is_sp_shift_MUX_uxn_opcodes_h_l836_c7_38e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l836_c7_38e7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l836_c7_38e7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l836_c7_38e7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l836_c7_38e7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l836_c7_38e7
result_is_stack_write_MUX_uxn_opcodes_h_l836_c7_38e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l836_c7_38e7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l836_c7_38e7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l836_c7_38e7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l836_c7_38e7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l836_c7_38e7
result_is_opc_done_MUX_uxn_opcodes_h_l836_c7_38e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l836_c7_38e7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l836_c7_38e7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l836_c7_38e7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l836_c7_38e7_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c7_38e7
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c7_38e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c7_38e7_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c7_38e7_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c7_38e7_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c7_38e7_return_output);

-- CONST_SR_8_uxn_opcodes_h_l839_c31_5c25
CONST_SR_8_uxn_opcodes_h_l839_c31_5c25 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l839_c31_5c25_x,
CONST_SR_8_uxn_opcodes_h_l839_c31_5c25_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l843_c11_8129
BIN_OP_EQ_uxn_opcodes_h_l843_c11_8129 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l843_c11_8129_left,
BIN_OP_EQ_uxn_opcodes_h_l843_c11_8129_right,
BIN_OP_EQ_uxn_opcodes_h_l843_c11_8129_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l843_c7_de54
result_is_pc_updated_MUX_uxn_opcodes_h_l843_c7_de54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l843_c7_de54_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l843_c7_de54_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l843_c7_de54_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l843_c7_de54_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_de54
result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_de54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_de54_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_de54_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_de54_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_de54_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l843_c7_de54
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l843_c7_de54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l843_c7_de54_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l843_c7_de54_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l843_c7_de54_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l843_c7_de54_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_de54
result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_de54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_de54_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_de54_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_de54_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_de54_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 -- Registers
 t16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l808_c6_7525_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l808_c2_41f3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l808_c2_41f3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l808_c2_41f3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_41f3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_41f3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l808_c2_41f3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_41f3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_41f3_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c2_41f3_return_output,
 t16_MUX_uxn_opcodes_h_l808_c2_41f3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l813_c11_683b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6e45_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l813_c7_6e45_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l813_c7_6e45_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6e45_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6e45_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6e45_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6e45_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6e45_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6e45_return_output,
 t16_MUX_uxn_opcodes_h_l813_c7_6e45_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l816_c11_609f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_ad28_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l816_c7_ad28_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l816_c7_ad28_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_ad28_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_ad28_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_ad28_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_ad28_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_ad28_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_ad28_return_output,
 t16_MUX_uxn_opcodes_h_l816_c7_ad28_return_output,
 CONST_SL_8_uxn_opcodes_h_l818_c3_b9a3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l821_c11_46a9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_1fef_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l821_c7_1fef_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l821_c7_1fef_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_1fef_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_1fef_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_1fef_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_1fef_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_1fef_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_1fef_return_output,
 t16_MUX_uxn_opcodes_h_l821_c7_1fef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l824_c11_68f9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_64e8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l824_c7_64e8_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l824_c7_64e8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_64e8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_64e8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l824_c7_64e8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l824_c7_64e8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_64e8_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l824_c7_64e8_return_output,
 t16_MUX_uxn_opcodes_h_l824_c7_64e8_return_output,
 BIN_OP_OR_uxn_opcodes_h_l825_c3_3b09_return_output,
 sp_relative_shift_uxn_opcodes_h_l827_c30_2192_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l829_c11_f3d4_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l829_c7_91cd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l829_c7_91cd_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l829_c7_91cd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c7_91cd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_91cd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l829_c7_91cd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_91cd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_91cd_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c7_91cd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l836_c11_2fd8_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l836_c7_38e7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l836_c7_38e7_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l836_c7_38e7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c7_38e7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l836_c7_38e7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l836_c7_38e7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l836_c7_38e7_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c7_38e7_return_output,
 CONST_SR_8_uxn_opcodes_h_l839_c31_5c25_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l843_c11_8129_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l843_c7_de54_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_de54_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l843_c7_de54_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_de54_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c6_7525_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c6_7525_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c6_7525_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6e45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l808_c2_41f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l808_c2_41f3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l813_c7_6e45_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l808_c2_41f3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l808_c2_41f3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l813_c7_6e45_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l808_c2_41f3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l808_c2_41f3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l810_c3_d791 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6e45_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_41f3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_41f3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6e45_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_41f3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_41f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6e45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l808_c2_41f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l808_c2_41f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6e45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_41f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_41f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6e45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_41f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_41f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6e45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c2_41f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c2_41f3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l813_c7_6e45_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l808_c2_41f3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l808_c2_41f3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_683b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_683b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_683b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_ad28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6e45_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l816_c7_ad28_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l813_c7_6e45_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l816_c7_ad28_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l813_c7_6e45_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l814_c3_842f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_ad28_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6e45_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_ad28_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6e45_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_ad28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6e45_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_ad28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6e45_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_ad28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6e45_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_ad28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6e45_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l816_c7_ad28_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l813_c7_6e45_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_609f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_609f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_609f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_1fef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_ad28_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l821_c7_1fef_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l816_c7_ad28_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l821_c7_1fef_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l816_c7_ad28_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l819_c3_eb7c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_1fef_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_ad28_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_1fef_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_ad28_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_1fef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_ad28_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_1fef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_ad28_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_1fef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_ad28_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_1fef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_ad28_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l821_c7_1fef_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l816_c7_ad28_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l818_c3_b9a3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l818_c3_b9a3_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_46a9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_46a9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_46a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_64e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_1fef_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l824_c7_64e8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l821_c7_1fef_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l824_c7_64e8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l821_c7_1fef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l822_c3_4ba6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_64e8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_1fef_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_64e8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_1fef_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l824_c7_64e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_1fef_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l824_c7_64e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_1fef_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_64e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_1fef_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l824_c7_64e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_1fef_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l824_c7_64e8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l821_c7_1fef_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l824_c11_68f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l824_c11_68f9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l824_c11_68f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l829_c7_91cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_64e8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l829_c7_91cd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l824_c7_64e8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l829_c7_91cd_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l824_c7_64e8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c7_91cd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_64e8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_91cd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_64e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l829_c7_91cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l824_c7_64e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_91cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l824_c7_64e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_91cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_64e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c7_91cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l824_c7_64e8_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l824_c7_64e8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l825_c3_3b09_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l825_c3_3b09_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l825_c3_3b09_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l827_c30_2192_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l827_c30_2192_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l827_c30_2192_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l827_c30_2192_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c11_f3d4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c11_f3d4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c11_f3d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l836_c7_38e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l829_c7_91cd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l836_c7_38e7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l829_c7_91cd_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l836_c7_38e7_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l829_c7_91cd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l833_c3_4037 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c7_38e7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c7_91cd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l831_c3_bb92 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_91cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l836_c7_38e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l829_c7_91cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l836_c7_38e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_91cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l836_c7_38e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_91cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c7_38e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c7_91cd_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l834_c21_1602_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l836_c11_2fd8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l836_c11_2fd8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l836_c11_2fd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l836_c7_38e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l836_c7_38e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l843_c7_de54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l836_c7_38e7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l836_c7_38e7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l836_c7_38e7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l836_c7_38e7_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l836_c7_38e7_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l836_c7_38e7_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l836_c7_38e7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c7_38e7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l838_c3_8db8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c7_38e7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c7_38e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l836_c7_38e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l836_c7_38e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l836_c7_38e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l836_c7_38e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l836_c7_38e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_de54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l836_c7_38e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l836_c7_38e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l836_c7_38e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_de54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l836_c7_38e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c7_38e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c7_38e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l843_c7_de54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c7_38e7_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l839_c31_5c25_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l839_c31_5c25_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l839_c21_a4a4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_8129_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_8129_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_8129_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l843_c7_de54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l843_c7_de54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l843_c7_de54_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_de54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_de54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_de54_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l843_c7_de54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l843_c7_de54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l843_c7_de54_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_de54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_de54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_de54_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l813_l843_l808_l829_l824_l821_l816_DUPLICATE_d5c7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l813_l808_l836_l824_l821_l816_DUPLICATE_b4ca_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l813_l808_l836_l829_l824_l821_l816_DUPLICATE_26f5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l813_l808_l829_l821_l816_DUPLICATE_6db3_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l813_l808_l836_l829_l821_l816_DUPLICATE_c7cb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l813_l843_l808_l836_l824_l821_l816_DUPLICATE_eaf1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l813_l843_l808_l836_l824_l821_l816_DUPLICATE_cfdd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l813_l843_l836_l829_l824_l821_l816_DUPLICATE_32a7_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l817_l825_DUPLICATE_62ae_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l836_l824_DUPLICATE_4d30_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b465_uxn_opcodes_h_l850_l804_DUPLICATE_8503_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l827_c30_2192_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_609f_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l819_c3_eb7c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l819_c3_eb7c;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l836_c7_38e7_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l843_c7_de54_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c6_7525_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l827_c30_2192_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_de54_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c11_f3d4_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_8129_right := to_unsigned(7, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_46a9_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l836_c11_2fd8_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l822_c3_4ba6 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l822_c3_4ba6;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l814_c3_842f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l814_c3_842f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l838_c3_8db8 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c7_38e7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l838_c3_8db8;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_de54_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l843_c7_de54_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l810_c3_d791 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l810_c3_d791;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_683b_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l824_c11_68f9_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l836_c7_38e7_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l833_c3_4037 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l833_c3_4037;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l831_c3_bb92 := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l831_c3_bb92;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l827_c30_2192_ins := VAR_ins;
     VAR_CONST_SR_8_uxn_opcodes_h_l839_c31_5c25_x := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c6_7525_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_683b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_609f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_46a9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l824_c11_68f9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c11_f3d4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l836_c11_2fd8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_8129_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l825_c3_3b09_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l836_c7_38e7_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l813_l843_l808_l836_l824_l821_l816_DUPLICATE_eaf1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l813_l843_l808_l836_l824_l821_l816_DUPLICATE_eaf1_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l813_c11_683b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l813_c11_683b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_683b_left;
     BIN_OP_EQ_uxn_opcodes_h_l813_c11_683b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_683b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_683b_return_output := BIN_OP_EQ_uxn_opcodes_h_l813_c11_683b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l808_c6_7525] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l808_c6_7525_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c6_7525_left;
     BIN_OP_EQ_uxn_opcodes_h_l808_c6_7525_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c6_7525_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c6_7525_return_output := BIN_OP_EQ_uxn_opcodes_h_l808_c6_7525_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l816_c11_609f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l816_c11_609f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_609f_left;
     BIN_OP_EQ_uxn_opcodes_h_l816_c11_609f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_609f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_609f_return_output := BIN_OP_EQ_uxn_opcodes_h_l816_c11_609f_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l817_l825_DUPLICATE_62ae LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l817_l825_DUPLICATE_62ae_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l813_l843_l808_l829_l824_l821_l816_DUPLICATE_d5c7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l813_l843_l808_l829_l824_l821_l816_DUPLICATE_d5c7_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l821_c11_46a9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l821_c11_46a9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_46a9_left;
     BIN_OP_EQ_uxn_opcodes_h_l821_c11_46a9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_46a9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_46a9_return_output := BIN_OP_EQ_uxn_opcodes_h_l821_c11_46a9_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l827_c30_2192] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l827_c30_2192_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l827_c30_2192_ins;
     sp_relative_shift_uxn_opcodes_h_l827_c30_2192_x <= VAR_sp_relative_shift_uxn_opcodes_h_l827_c30_2192_x;
     sp_relative_shift_uxn_opcodes_h_l827_c30_2192_y <= VAR_sp_relative_shift_uxn_opcodes_h_l827_c30_2192_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l827_c30_2192_return_output := sp_relative_shift_uxn_opcodes_h_l827_c30_2192_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l813_l843_l836_l829_l824_l821_l816_DUPLICATE_32a7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l813_l843_l836_l829_l824_l821_l816_DUPLICATE_32a7_return_output := result.is_opc_done;

     -- CONST_SR_8[uxn_opcodes_h_l839_c31_5c25] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l839_c31_5c25_x <= VAR_CONST_SR_8_uxn_opcodes_h_l839_c31_5c25_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l839_c31_5c25_return_output := CONST_SR_8_uxn_opcodes_h_l839_c31_5c25_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l813_l808_l836_l824_l821_l816_DUPLICATE_b4ca LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l813_l808_l836_l824_l821_l816_DUPLICATE_b4ca_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l813_l808_l836_l829_l821_l816_DUPLICATE_c7cb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l813_l808_l836_l829_l821_l816_DUPLICATE_c7cb_return_output := result.is_sp_shift;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l813_l808_l829_l821_l816_DUPLICATE_6db3 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l813_l808_l829_l821_l816_DUPLICATE_6db3_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l843_c11_8129] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l843_c11_8129_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_8129_left;
     BIN_OP_EQ_uxn_opcodes_h_l843_c11_8129_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_8129_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_8129_return_output := BIN_OP_EQ_uxn_opcodes_h_l843_c11_8129_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l836_l824_DUPLICATE_4d30 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l836_l824_DUPLICATE_4d30_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l836_c11_2fd8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l836_c11_2fd8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l836_c11_2fd8_left;
     BIN_OP_EQ_uxn_opcodes_h_l836_c11_2fd8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l836_c11_2fd8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l836_c11_2fd8_return_output := BIN_OP_EQ_uxn_opcodes_h_l836_c11_2fd8_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l813_l808_l836_l829_l824_l821_l816_DUPLICATE_26f5 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l813_l808_l836_l829_l824_l821_l816_DUPLICATE_26f5_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l813_l843_l808_l836_l824_l821_l816_DUPLICATE_cfdd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l813_l843_l808_l836_l824_l821_l816_DUPLICATE_cfdd_return_output := result.is_stack_index_flipped;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l834_c21_1602] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l834_c21_1602_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_pc);

     -- BIN_OP_EQ[uxn_opcodes_h_l824_c11_68f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l824_c11_68f9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l824_c11_68f9_left;
     BIN_OP_EQ_uxn_opcodes_h_l824_c11_68f9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l824_c11_68f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l824_c11_68f9_return_output := BIN_OP_EQ_uxn_opcodes_h_l824_c11_68f9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l829_c11_f3d4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l829_c11_f3d4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c11_f3d4_left;
     BIN_OP_EQ_uxn_opcodes_h_l829_c11_f3d4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c11_f3d4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c11_f3d4_return_output := BIN_OP_EQ_uxn_opcodes_h_l829_c11_f3d4_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_41f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c6_7525_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l808_c2_41f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c6_7525_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l808_c2_41f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c6_7525_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c2_41f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c6_7525_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_41f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c6_7525_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_41f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c6_7525_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_41f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c6_7525_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l808_c2_41f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c6_7525_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l808_c2_41f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c6_7525_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l808_c2_41f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c6_7525_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6e45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_683b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6e45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_683b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6e45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_683b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6e45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_683b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6e45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_683b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6e45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_683b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6e45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_683b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l813_c7_6e45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_683b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l813_c7_6e45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_683b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l813_c7_6e45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_683b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_ad28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_609f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_ad28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_609f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_ad28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_609f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_ad28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_609f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_ad28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_609f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_ad28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_609f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_ad28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_609f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l816_c7_ad28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_609f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l816_c7_ad28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_609f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l816_c7_ad28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_609f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_1fef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_46a9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_1fef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_46a9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_1fef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_46a9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_1fef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_46a9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_1fef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_46a9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_1fef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_46a9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_1fef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_46a9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l821_c7_1fef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_46a9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l821_c7_1fef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_46a9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l821_c7_1fef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_46a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_64e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l824_c11_68f9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_64e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l824_c11_68f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l824_c7_64e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l824_c11_68f9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l824_c7_64e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l824_c11_68f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l824_c7_64e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l824_c11_68f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_64e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l824_c11_68f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_64e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l824_c11_68f9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l824_c7_64e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l824_c11_68f9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l824_c7_64e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l824_c11_68f9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l824_c7_64e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l824_c11_68f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_91cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c11_f3d4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l829_c7_91cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c11_f3d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l829_c7_91cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c11_f3d4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c7_91cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c11_f3d4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_91cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c11_f3d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_91cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c11_f3d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c7_91cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c11_f3d4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l829_c7_91cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c11_f3d4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l829_c7_91cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c11_f3d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l836_c7_38e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l836_c11_2fd8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l836_c7_38e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l836_c11_2fd8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l836_c7_38e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l836_c11_2fd8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c7_38e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l836_c11_2fd8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l836_c7_38e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l836_c11_2fd8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c7_38e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l836_c11_2fd8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l836_c7_38e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l836_c11_2fd8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l836_c7_38e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l836_c11_2fd8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_de54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_8129_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l843_c7_de54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_8129_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l843_c7_de54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_8129_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_de54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l843_c11_8129_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l825_c3_3b09_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l817_l825_DUPLICATE_62ae_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l818_c3_b9a3_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l817_l825_DUPLICATE_62ae_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l834_c21_1602_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l813_l808_l829_l821_l816_DUPLICATE_6db3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l813_l808_l829_l821_l816_DUPLICATE_6db3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l813_l808_l829_l821_l816_DUPLICATE_6db3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l813_l808_l829_l821_l816_DUPLICATE_6db3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l813_l808_l829_l821_l816_DUPLICATE_6db3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l813_l808_l836_l829_l824_l821_l816_DUPLICATE_26f5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l813_l808_l836_l829_l824_l821_l816_DUPLICATE_26f5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l813_l808_l836_l829_l824_l821_l816_DUPLICATE_26f5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l813_l808_l836_l829_l824_l821_l816_DUPLICATE_26f5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l813_l808_l836_l829_l824_l821_l816_DUPLICATE_26f5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l813_l808_l836_l829_l824_l821_l816_DUPLICATE_26f5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l836_c7_38e7_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l813_l808_l836_l829_l824_l821_l816_DUPLICATE_26f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l813_l843_l836_l829_l824_l821_l816_DUPLICATE_32a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l813_l843_l836_l829_l824_l821_l816_DUPLICATE_32a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l813_l843_l836_l829_l824_l821_l816_DUPLICATE_32a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l813_l843_l836_l829_l824_l821_l816_DUPLICATE_32a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l813_l843_l836_l829_l824_l821_l816_DUPLICATE_32a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l836_c7_38e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l813_l843_l836_l829_l824_l821_l816_DUPLICATE_32a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_de54_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l813_l843_l836_l829_l824_l821_l816_DUPLICATE_32a7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l813_l843_l808_l829_l824_l821_l816_DUPLICATE_d5c7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l813_l843_l808_l829_l824_l821_l816_DUPLICATE_d5c7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l813_l843_l808_l829_l824_l821_l816_DUPLICATE_d5c7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l813_l843_l808_l829_l824_l821_l816_DUPLICATE_d5c7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l813_l843_l808_l829_l824_l821_l816_DUPLICATE_d5c7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l813_l843_l808_l829_l824_l821_l816_DUPLICATE_d5c7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l843_c7_de54_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l813_l843_l808_l829_l824_l821_l816_DUPLICATE_d5c7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l813_l808_l836_l829_l821_l816_DUPLICATE_c7cb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l813_l808_l836_l829_l821_l816_DUPLICATE_c7cb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l813_l808_l836_l829_l821_l816_DUPLICATE_c7cb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l813_l808_l836_l829_l821_l816_DUPLICATE_c7cb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l813_l808_l836_l829_l821_l816_DUPLICATE_c7cb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l836_c7_38e7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l813_l808_l836_l829_l821_l816_DUPLICATE_c7cb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l813_l843_l808_l836_l824_l821_l816_DUPLICATE_cfdd_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l813_l843_l808_l836_l824_l821_l816_DUPLICATE_cfdd_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l813_l843_l808_l836_l824_l821_l816_DUPLICATE_cfdd_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l813_l843_l808_l836_l824_l821_l816_DUPLICATE_cfdd_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l813_l843_l808_l836_l824_l821_l816_DUPLICATE_cfdd_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c7_38e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l813_l843_l808_l836_l824_l821_l816_DUPLICATE_cfdd_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l843_c7_de54_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l813_l843_l808_l836_l824_l821_l816_DUPLICATE_cfdd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l813_l843_l808_l836_l824_l821_l816_DUPLICATE_eaf1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l813_l843_l808_l836_l824_l821_l816_DUPLICATE_eaf1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l813_l843_l808_l836_l824_l821_l816_DUPLICATE_eaf1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l813_l843_l808_l836_l824_l821_l816_DUPLICATE_eaf1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l813_l843_l808_l836_l824_l821_l816_DUPLICATE_eaf1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l836_c7_38e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l813_l843_l808_l836_l824_l821_l816_DUPLICATE_eaf1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_de54_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l813_l843_l808_l836_l824_l821_l816_DUPLICATE_eaf1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l836_l824_DUPLICATE_4d30_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c7_38e7_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l836_l824_DUPLICATE_4d30_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l813_l808_l836_l824_l821_l816_DUPLICATE_b4ca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l813_l808_l836_l824_l821_l816_DUPLICATE_b4ca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l813_l808_l836_l824_l821_l816_DUPLICATE_b4ca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l813_l808_l836_l824_l821_l816_DUPLICATE_b4ca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l813_l808_l836_l824_l821_l816_DUPLICATE_b4ca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l836_c7_38e7_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l813_l808_l836_l824_l821_l816_DUPLICATE_b4ca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l827_c30_2192_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l843_c7_de54] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l843_c7_de54_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l843_c7_de54_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l843_c7_de54_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l843_c7_de54_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l843_c7_de54_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l843_c7_de54_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l843_c7_de54_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l843_c7_de54_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l829_c7_91cd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_91cd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_91cd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_91cd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_91cd_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l836_c7_38e7] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l836_c7_38e7_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l836_c7_38e7_cond;
     result_u16_value_MUX_uxn_opcodes_h_l836_c7_38e7_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l836_c7_38e7_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l836_c7_38e7_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l836_c7_38e7_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l836_c7_38e7_return_output := result_u16_value_MUX_uxn_opcodes_h_l836_c7_38e7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l836_c7_38e7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l836_c7_38e7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l836_c7_38e7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l836_c7_38e7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l836_c7_38e7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l836_c7_38e7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l836_c7_38e7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l836_c7_38e7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l836_c7_38e7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l843_c7_de54] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_de54_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_de54_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_de54_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_de54_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_de54_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_de54_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_de54_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_de54_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l836_c7_38e7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c7_38e7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c7_38e7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c7_38e7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c7_38e7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c7_38e7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c7_38e7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c7_38e7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c7_38e7_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l818_c3_b9a3] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l818_c3_b9a3_x <= VAR_CONST_SL_8_uxn_opcodes_h_l818_c3_b9a3_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l818_c3_b9a3_return_output := CONST_SL_8_uxn_opcodes_h_l818_c3_b9a3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l843_c7_de54] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_de54_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_de54_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_de54_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_de54_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_de54_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_de54_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_de54_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_de54_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l825_c3_3b09] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l825_c3_3b09_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l825_c3_3b09_left;
     BIN_OP_OR_uxn_opcodes_h_l825_c3_3b09_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l825_c3_3b09_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l825_c3_3b09_return_output := BIN_OP_OR_uxn_opcodes_h_l825_c3_3b09_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l839_c21_a4a4] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l839_c21_a4a4_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l839_c31_5c25_return_output);

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l843_c7_de54] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l843_c7_de54_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l843_c7_de54_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l843_c7_de54_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l843_c7_de54_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l843_c7_de54_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l843_c7_de54_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l843_c7_de54_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l843_c7_de54_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l825_c3_3b09_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l836_c7_38e7_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l839_c21_a4a4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l818_c3_b9a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l836_c7_38e7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l843_c7_de54_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l836_c7_38e7_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l843_c7_de54_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l836_c7_38e7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c7_38e7_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l843_c7_de54_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l836_c7_38e7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l843_c7_de54_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_91cd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c7_38e7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l836_c7_38e7_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l836_c7_38e7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l836_c7_38e7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l836_c7_38e7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l836_c7_38e7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l836_c7_38e7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l836_c7_38e7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l836_c7_38e7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l836_c7_38e7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l836_c7_38e7_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l836_c7_38e7] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l836_c7_38e7_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l836_c7_38e7_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l836_c7_38e7_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l836_c7_38e7_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l836_c7_38e7_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l836_c7_38e7_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l836_c7_38e7_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l836_c7_38e7_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l836_c7_38e7] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c7_38e7_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c7_38e7_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c7_38e7_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c7_38e7_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c7_38e7_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c7_38e7_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c7_38e7_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c7_38e7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l836_c7_38e7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l836_c7_38e7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l836_c7_38e7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l836_c7_38e7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l836_c7_38e7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l836_c7_38e7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l836_c7_38e7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l836_c7_38e7_return_output := result_u8_value_MUX_uxn_opcodes_h_l836_c7_38e7_return_output;

     -- t16_MUX[uxn_opcodes_h_l824_c7_64e8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l824_c7_64e8_cond <= VAR_t16_MUX_uxn_opcodes_h_l824_c7_64e8_cond;
     t16_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue;
     t16_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l824_c7_64e8_return_output := t16_MUX_uxn_opcodes_h_l824_c7_64e8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l829_c7_91cd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l829_c7_91cd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l829_c7_91cd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l829_c7_91cd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l829_c7_91cd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l829_c7_91cd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c7_91cd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c7_91cd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c7_91cd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c7_91cd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l824_c7_64e8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_64e8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_64e8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_64e8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_64e8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l836_c7_38e7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l836_c7_38e7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l836_c7_38e7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l836_c7_38e7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l836_c7_38e7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l836_c7_38e7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l836_c7_38e7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l836_c7_38e7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l836_c7_38e7_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l829_c7_91cd] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l829_c7_91cd_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l829_c7_91cd_cond;
     result_u16_value_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l829_c7_91cd_return_output := result_u16_value_MUX_uxn_opcodes_h_l829_c7_91cd_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l836_c7_38e7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l836_c7_38e7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l829_c7_91cd_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c7_38e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l836_c7_38e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l824_c7_64e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l829_c7_91cd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l829_c7_91cd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l836_c7_38e7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse := VAR_t16_MUX_uxn_opcodes_h_l824_c7_64e8_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l829_c7_91cd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_91cd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_91cd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_91cd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_91cd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l829_c7_91cd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l829_c7_91cd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l829_c7_91cd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l829_c7_91cd_return_output := result_u8_value_MUX_uxn_opcodes_h_l829_c7_91cd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l829_c7_91cd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_91cd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_91cd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_91cd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_91cd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l824_c7_64e8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_64e8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_64e8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_64e8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_64e8_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l824_c7_64e8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l824_c7_64e8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l824_c7_64e8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l824_c7_64e8_return_output := result_u16_value_MUX_uxn_opcodes_h_l824_c7_64e8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l824_c7_64e8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l824_c7_64e8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l824_c7_64e8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l824_c7_64e8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l824_c7_64e8_return_output;

     -- t16_MUX[uxn_opcodes_h_l821_c7_1fef] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l821_c7_1fef_cond <= VAR_t16_MUX_uxn_opcodes_h_l821_c7_1fef_cond;
     t16_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue;
     t16_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l821_c7_1fef_return_output := t16_MUX_uxn_opcodes_h_l821_c7_1fef_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l829_c7_91cd] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c7_91cd_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c7_91cd_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c7_91cd_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c7_91cd_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l829_c7_91cd] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l829_c7_91cd_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l829_c7_91cd_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l829_c7_91cd_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l829_c7_91cd_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l829_c7_91cd_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l829_c7_91cd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l821_c7_1fef] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_1fef_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_1fef_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_1fef_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_1fef_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_91cd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l829_c7_91cd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l824_c7_64e8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l829_c7_91cd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_91cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_1fef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l824_c7_64e8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l824_c7_64e8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l829_c7_91cd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse := VAR_t16_MUX_uxn_opcodes_h_l821_c7_1fef_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l821_c7_1fef] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_1fef_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_1fef_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_1fef_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_1fef_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l821_c7_1fef] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l821_c7_1fef_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l821_c7_1fef_cond;
     result_u16_value_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l821_c7_1fef_return_output := result_u16_value_MUX_uxn_opcodes_h_l821_c7_1fef_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l824_c7_64e8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l824_c7_64e8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l824_c7_64e8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l824_c7_64e8_return_output := result_u8_value_MUX_uxn_opcodes_h_l824_c7_64e8_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l824_c7_64e8] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l824_c7_64e8_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l824_c7_64e8_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l824_c7_64e8_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l824_c7_64e8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l824_c7_64e8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_64e8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_64e8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_64e8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_64e8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l824_c7_64e8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l824_c7_64e8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l824_c7_64e8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l824_c7_64e8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l824_c7_64e8_return_output;

     -- t16_MUX[uxn_opcodes_h_l816_c7_ad28] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l816_c7_ad28_cond <= VAR_t16_MUX_uxn_opcodes_h_l816_c7_ad28_cond;
     t16_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue;
     t16_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l816_c7_ad28_return_output := t16_MUX_uxn_opcodes_h_l816_c7_ad28_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l821_c7_1fef] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_1fef_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_1fef_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_1fef_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_1fef_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l824_c7_64e8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_64e8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_64e8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_64e8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_64e8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_64e8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_64e8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l816_c7_ad28] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_ad28_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_ad28_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_ad28_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_ad28_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l824_c7_64e8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l824_c7_64e8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_1fef_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l824_c7_64e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l824_c7_64e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_ad28_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_1fef_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l821_c7_1fef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l824_c7_64e8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse := VAR_t16_MUX_uxn_opcodes_h_l816_c7_ad28_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l813_c7_6e45] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6e45_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6e45_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6e45_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6e45_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l816_c7_ad28] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_ad28_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_ad28_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_ad28_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_ad28_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l821_c7_1fef] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_1fef_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_1fef_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_1fef_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_1fef_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l821_c7_1fef] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_1fef_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_1fef_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_1fef_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_1fef_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l816_c7_ad28] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_ad28_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_ad28_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_ad28_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_ad28_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l816_c7_ad28] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l816_c7_ad28_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l816_c7_ad28_cond;
     result_u16_value_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l816_c7_ad28_return_output := result_u16_value_MUX_uxn_opcodes_h_l816_c7_ad28_return_output;

     -- t16_MUX[uxn_opcodes_h_l813_c7_6e45] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l813_c7_6e45_cond <= VAR_t16_MUX_uxn_opcodes_h_l813_c7_6e45_cond;
     t16_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue;
     t16_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l813_c7_6e45_return_output := t16_MUX_uxn_opcodes_h_l813_c7_6e45_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l821_c7_1fef] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l821_c7_1fef_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l821_c7_1fef_cond;
     result_u8_value_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l821_c7_1fef_return_output := result_u8_value_MUX_uxn_opcodes_h_l821_c7_1fef_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l821_c7_1fef] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_1fef_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_1fef_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_1fef_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_1fef_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l821_c7_1fef] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_1fef_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_1fef_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_1fef_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_1fef_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_1fef_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_1fef_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_1fef_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_1fef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_ad28_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_1fef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_1fef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6e45_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_ad28_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l816_c7_ad28_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l821_c7_1fef_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l813_c7_6e45_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l816_c7_ad28] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l816_c7_ad28_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l816_c7_ad28_cond;
     result_u8_value_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l816_c7_ad28_return_output := result_u8_value_MUX_uxn_opcodes_h_l816_c7_ad28_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l816_c7_ad28] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_ad28_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_ad28_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_ad28_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_ad28_return_output;

     -- t16_MUX[uxn_opcodes_h_l808_c2_41f3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l808_c2_41f3_cond <= VAR_t16_MUX_uxn_opcodes_h_l808_c2_41f3_cond;
     t16_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue;
     t16_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l808_c2_41f3_return_output := t16_MUX_uxn_opcodes_h_l808_c2_41f3_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l816_c7_ad28] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_ad28_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_ad28_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_ad28_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_ad28_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l813_c7_6e45] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6e45_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6e45_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6e45_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6e45_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l813_c7_6e45] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6e45_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6e45_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6e45_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6e45_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l816_c7_ad28] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_ad28_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_ad28_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_ad28_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_ad28_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l808_c2_41f3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_41f3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_41f3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_41f3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_41f3_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l813_c7_6e45] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l813_c7_6e45_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l813_c7_6e45_cond;
     result_u16_value_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l813_c7_6e45_return_output := result_u16_value_MUX_uxn_opcodes_h_l813_c7_6e45_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l816_c7_ad28] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_ad28_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_ad28_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_ad28_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_ad28_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_ad28_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_ad28_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_ad28_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_ad28_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6e45_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_ad28_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_ad28_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6e45_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l813_c7_6e45_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l816_c7_ad28_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l808_c2_41f3_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l813_c7_6e45] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l813_c7_6e45_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l813_c7_6e45_cond;
     result_u8_value_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l813_c7_6e45_return_output := result_u8_value_MUX_uxn_opcodes_h_l813_c7_6e45_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l813_c7_6e45] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6e45_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6e45_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6e45_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6e45_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l813_c7_6e45] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6e45_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6e45_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6e45_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6e45_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l808_c2_41f3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l808_c2_41f3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l808_c2_41f3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l808_c2_41f3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l808_c2_41f3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l813_c7_6e45] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6e45_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6e45_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6e45_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6e45_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l808_c2_41f3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l808_c2_41f3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l808_c2_41f3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l808_c2_41f3_return_output := result_u16_value_MUX_uxn_opcodes_h_l808_c2_41f3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l808_c2_41f3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_41f3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_41f3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_41f3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_41f3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l813_c7_6e45] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6e45_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6e45_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6e45_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6e45_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6e45_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6e45_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6e45_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6e45_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6e45_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6e45_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l813_c7_6e45_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l808_c2_41f3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l808_c2_41f3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l808_c2_41f3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l808_c2_41f3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l808_c2_41f3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l808_c2_41f3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l808_c2_41f3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l808_c2_41f3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l808_c2_41f3_return_output := result_u8_value_MUX_uxn_opcodes_h_l808_c2_41f3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l808_c2_41f3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_41f3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_41f3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_41f3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_41f3_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l808_c2_41f3] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c2_41f3_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c2_41f3_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c2_41f3_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c2_41f3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l808_c2_41f3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_41f3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_41f3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_41f3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_41f3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_41f3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_41f3_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b465_uxn_opcodes_h_l850_l804_DUPLICATE_8503 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b465_uxn_opcodes_h_l850_l804_DUPLICATE_8503_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b465(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l808_c2_41f3_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l808_c2_41f3_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l808_c2_41f3_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_41f3_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_41f3_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l808_c2_41f3_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_41f3_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_41f3_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l808_c2_41f3_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b465_uxn_opcodes_h_l850_l804_DUPLICATE_8503_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b465_uxn_opcodes_h_l850_l804_DUPLICATE_8503_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
