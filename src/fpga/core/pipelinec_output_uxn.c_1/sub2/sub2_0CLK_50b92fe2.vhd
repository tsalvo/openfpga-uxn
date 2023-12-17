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
-- Submodules: 71
entity sub2_0CLK_50b92fe2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sub2_0CLK_50b92fe2;
architecture arch of sub2_0CLK_50b92fe2 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2519_c6_7aff]
signal BIN_OP_EQ_uxn_opcodes_h_l2519_c6_7aff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2519_c6_7aff_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2519_c6_7aff_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2519_c2_1599]
signal tmp16_MUX_uxn_opcodes_h_l2519_c2_1599_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2519_c2_1599_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2519_c2_1599]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_1599_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_1599_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2519_c2_1599]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_1599_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_1599_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2519_c2_1599]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_1599_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_1599_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2519_c2_1599]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_1599_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_1599_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2519_c2_1599]
signal result_u8_value_MUX_uxn_opcodes_h_l2519_c2_1599_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2519_c2_1599_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2519_c2_1599]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_1599_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_1599_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2519_c2_1599]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_1599_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_1599_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2519_c2_1599]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_1599_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_1599_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2519_c2_1599]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_1599_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_1599_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2519_c2_1599]
signal t16_MUX_uxn_opcodes_h_l2519_c2_1599_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2519_c2_1599_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2519_c2_1599]
signal n16_MUX_uxn_opcodes_h_l2519_c2_1599_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2519_c2_1599_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2532_c11_dfed]
signal BIN_OP_EQ_uxn_opcodes_h_l2532_c11_dfed_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2532_c11_dfed_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2532_c11_dfed_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2532_c7_c55c]
signal tmp16_MUX_uxn_opcodes_h_l2532_c7_c55c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2532_c7_c55c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2532_c7_c55c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2532_c7_c55c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_c55c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_c55c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_c55c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2532_c7_c55c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_c55c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_c55c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_c55c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2532_c7_c55c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_c55c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_c55c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_c55c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2532_c7_c55c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_c55c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_c55c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_c55c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2532_c7_c55c]
signal result_u8_value_MUX_uxn_opcodes_h_l2532_c7_c55c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2532_c7_c55c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2532_c7_c55c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2532_c7_c55c]
signal t16_MUX_uxn_opcodes_h_l2532_c7_c55c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2532_c7_c55c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2532_c7_c55c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2532_c7_c55c]
signal n16_MUX_uxn_opcodes_h_l2532_c7_c55c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2532_c7_c55c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2532_c7_c55c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2535_c11_8b21]
signal BIN_OP_EQ_uxn_opcodes_h_l2535_c11_8b21_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2535_c11_8b21_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2535_c11_8b21_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2535_c7_45cc]
signal tmp16_MUX_uxn_opcodes_h_l2535_c7_45cc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2535_c7_45cc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2535_c7_45cc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2535_c7_45cc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_45cc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_45cc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_45cc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2535_c7_45cc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_45cc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_45cc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_45cc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2535_c7_45cc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_45cc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_45cc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_45cc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2535_c7_45cc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_45cc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_45cc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_45cc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2535_c7_45cc]
signal result_u8_value_MUX_uxn_opcodes_h_l2535_c7_45cc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2535_c7_45cc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2535_c7_45cc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2535_c7_45cc]
signal t16_MUX_uxn_opcodes_h_l2535_c7_45cc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2535_c7_45cc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2535_c7_45cc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2535_c7_45cc]
signal n16_MUX_uxn_opcodes_h_l2535_c7_45cc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2535_c7_45cc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2535_c7_45cc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2540_c11_afa8]
signal BIN_OP_EQ_uxn_opcodes_h_l2540_c11_afa8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2540_c11_afa8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2540_c11_afa8_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2540_c7_0575]
signal tmp16_MUX_uxn_opcodes_h_l2540_c7_0575_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2540_c7_0575_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2540_c7_0575_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2540_c7_0575_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2540_c7_0575]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_0575_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_0575_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_0575_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_0575_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2540_c7_0575]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_0575_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_0575_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_0575_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_0575_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2540_c7_0575]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_0575_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_0575_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_0575_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_0575_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2540_c7_0575]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_0575_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_0575_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_0575_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_0575_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2540_c7_0575]
signal result_u8_value_MUX_uxn_opcodes_h_l2540_c7_0575_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2540_c7_0575_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2540_c7_0575_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2540_c7_0575_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2540_c7_0575]
signal t16_MUX_uxn_opcodes_h_l2540_c7_0575_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2540_c7_0575_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2540_c7_0575_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2540_c7_0575_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2540_c7_0575]
signal n16_MUX_uxn_opcodes_h_l2540_c7_0575_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2540_c7_0575_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2540_c7_0575_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2540_c7_0575_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2541_c3_504f]
signal BIN_OP_OR_uxn_opcodes_h_l2541_c3_504f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2541_c3_504f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2541_c3_504f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2544_c11_cb96]
signal BIN_OP_EQ_uxn_opcodes_h_l2544_c11_cb96_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2544_c11_cb96_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2544_c11_cb96_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2544_c7_f9aa]
signal tmp16_MUX_uxn_opcodes_h_l2544_c7_f9aa_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2544_c7_f9aa_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2544_c7_f9aa_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2544_c7_f9aa_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2544_c7_f9aa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f9aa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f9aa_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f9aa_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f9aa_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2544_c7_f9aa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f9aa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f9aa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f9aa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f9aa_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2544_c7_f9aa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f9aa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f9aa_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f9aa_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f9aa_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2544_c7_f9aa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f9aa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f9aa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f9aa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f9aa_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2544_c7_f9aa]
signal result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f9aa_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f9aa_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f9aa_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f9aa_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2544_c7_f9aa]
signal n16_MUX_uxn_opcodes_h_l2544_c7_f9aa_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2544_c7_f9aa_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2544_c7_f9aa_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2544_c7_f9aa_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2548_c11_5fc8]
signal BIN_OP_EQ_uxn_opcodes_h_l2548_c11_5fc8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2548_c11_5fc8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2548_c11_5fc8_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2548_c7_8ce9]
signal tmp16_MUX_uxn_opcodes_h_l2548_c7_8ce9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2548_c7_8ce9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2548_c7_8ce9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2548_c7_8ce9_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2548_c7_8ce9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_8ce9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_8ce9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_8ce9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_8ce9_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2548_c7_8ce9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_8ce9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_8ce9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_8ce9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_8ce9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2548_c7_8ce9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_8ce9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_8ce9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_8ce9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_8ce9_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2548_c7_8ce9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_8ce9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_8ce9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_8ce9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_8ce9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2548_c7_8ce9]
signal result_u8_value_MUX_uxn_opcodes_h_l2548_c7_8ce9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2548_c7_8ce9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2548_c7_8ce9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2548_c7_8ce9_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2548_c7_8ce9]
signal n16_MUX_uxn_opcodes_h_l2548_c7_8ce9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2548_c7_8ce9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2548_c7_8ce9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2548_c7_8ce9_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2549_c3_615b]
signal BIN_OP_OR_uxn_opcodes_h_l2549_c3_615b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2549_c3_615b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2549_c3_615b_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2550_c11_c781]
signal BIN_OP_MINUS_uxn_opcodes_h_l2550_c11_c781_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2550_c11_c781_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2550_c11_c781_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2551_c30_0396]
signal sp_relative_shift_uxn_opcodes_h_l2551_c30_0396_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2551_c30_0396_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2551_c30_0396_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2551_c30_0396_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2556_c11_8ee6]
signal BIN_OP_EQ_uxn_opcodes_h_l2556_c11_8ee6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2556_c11_8ee6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2556_c11_8ee6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2556_c7_8e2d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8e2d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8e2d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8e2d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8e2d_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2556_c7_8e2d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8e2d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8e2d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8e2d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8e2d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2556_c7_8e2d]
signal result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8e2d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8e2d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8e2d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8e2d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2556_c7_8e2d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8e2d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8e2d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8e2d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8e2d_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2559_c31_cc6b]
signal CONST_SR_8_uxn_opcodes_h_l2559_c31_cc6b_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2559_c31_cc6b_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2546_l2537_DUPLICATE_382a
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2546_l2537_DUPLICATE_382a_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2546_l2537_DUPLICATE_382a_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_e848( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
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
      base.is_pc_updated := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2519_c6_7aff
BIN_OP_EQ_uxn_opcodes_h_l2519_c6_7aff : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2519_c6_7aff_left,
BIN_OP_EQ_uxn_opcodes_h_l2519_c6_7aff_right,
BIN_OP_EQ_uxn_opcodes_h_l2519_c6_7aff_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2519_c2_1599
tmp16_MUX_uxn_opcodes_h_l2519_c2_1599 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2519_c2_1599_cond,
tmp16_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue,
tmp16_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse,
tmp16_MUX_uxn_opcodes_h_l2519_c2_1599_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_1599
result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_1599 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_1599_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_1599_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_1599
result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_1599 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_1599_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_1599_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_1599
result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_1599 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_1599_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_1599_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_1599
result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_1599 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_1599_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_1599_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2519_c2_1599
result_u8_value_MUX_uxn_opcodes_h_l2519_c2_1599 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2519_c2_1599_cond,
result_u8_value_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2519_c2_1599_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_1599
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_1599 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_1599_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_1599_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_1599
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_1599 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_1599_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_1599_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_1599
result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_1599 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_1599_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_1599_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_1599
result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_1599 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_1599_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_1599_return_output);

-- t16_MUX_uxn_opcodes_h_l2519_c2_1599
t16_MUX_uxn_opcodes_h_l2519_c2_1599 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2519_c2_1599_cond,
t16_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue,
t16_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse,
t16_MUX_uxn_opcodes_h_l2519_c2_1599_return_output);

-- n16_MUX_uxn_opcodes_h_l2519_c2_1599
n16_MUX_uxn_opcodes_h_l2519_c2_1599 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2519_c2_1599_cond,
n16_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue,
n16_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse,
n16_MUX_uxn_opcodes_h_l2519_c2_1599_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2532_c11_dfed
BIN_OP_EQ_uxn_opcodes_h_l2532_c11_dfed : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2532_c11_dfed_left,
BIN_OP_EQ_uxn_opcodes_h_l2532_c11_dfed_right,
BIN_OP_EQ_uxn_opcodes_h_l2532_c11_dfed_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2532_c7_c55c
tmp16_MUX_uxn_opcodes_h_l2532_c7_c55c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2532_c7_c55c_cond,
tmp16_MUX_uxn_opcodes_h_l2532_c7_c55c_iftrue,
tmp16_MUX_uxn_opcodes_h_l2532_c7_c55c_iffalse,
tmp16_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_c55c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_c55c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_c55c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_c55c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_c55c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_c55c
result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_c55c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_c55c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_c55c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_c55c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_c55c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_c55c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_c55c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_c55c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_c55c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_c55c
result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_c55c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_c55c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_c55c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_c55c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2532_c7_c55c
result_u8_value_MUX_uxn_opcodes_h_l2532_c7_c55c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2532_c7_c55c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2532_c7_c55c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2532_c7_c55c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output);

-- t16_MUX_uxn_opcodes_h_l2532_c7_c55c
t16_MUX_uxn_opcodes_h_l2532_c7_c55c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2532_c7_c55c_cond,
t16_MUX_uxn_opcodes_h_l2532_c7_c55c_iftrue,
t16_MUX_uxn_opcodes_h_l2532_c7_c55c_iffalse,
t16_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output);

-- n16_MUX_uxn_opcodes_h_l2532_c7_c55c
n16_MUX_uxn_opcodes_h_l2532_c7_c55c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2532_c7_c55c_cond,
n16_MUX_uxn_opcodes_h_l2532_c7_c55c_iftrue,
n16_MUX_uxn_opcodes_h_l2532_c7_c55c_iffalse,
n16_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2535_c11_8b21
BIN_OP_EQ_uxn_opcodes_h_l2535_c11_8b21 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2535_c11_8b21_left,
BIN_OP_EQ_uxn_opcodes_h_l2535_c11_8b21_right,
BIN_OP_EQ_uxn_opcodes_h_l2535_c11_8b21_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2535_c7_45cc
tmp16_MUX_uxn_opcodes_h_l2535_c7_45cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2535_c7_45cc_cond,
tmp16_MUX_uxn_opcodes_h_l2535_c7_45cc_iftrue,
tmp16_MUX_uxn_opcodes_h_l2535_c7_45cc_iffalse,
tmp16_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_45cc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_45cc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_45cc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_45cc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_45cc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_45cc
result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_45cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_45cc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_45cc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_45cc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_45cc
result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_45cc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_45cc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_45cc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_45cc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_45cc
result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_45cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_45cc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_45cc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_45cc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2535_c7_45cc
result_u8_value_MUX_uxn_opcodes_h_l2535_c7_45cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2535_c7_45cc_cond,
result_u8_value_MUX_uxn_opcodes_h_l2535_c7_45cc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2535_c7_45cc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output);

-- t16_MUX_uxn_opcodes_h_l2535_c7_45cc
t16_MUX_uxn_opcodes_h_l2535_c7_45cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2535_c7_45cc_cond,
t16_MUX_uxn_opcodes_h_l2535_c7_45cc_iftrue,
t16_MUX_uxn_opcodes_h_l2535_c7_45cc_iffalse,
t16_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output);

-- n16_MUX_uxn_opcodes_h_l2535_c7_45cc
n16_MUX_uxn_opcodes_h_l2535_c7_45cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2535_c7_45cc_cond,
n16_MUX_uxn_opcodes_h_l2535_c7_45cc_iftrue,
n16_MUX_uxn_opcodes_h_l2535_c7_45cc_iffalse,
n16_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2540_c11_afa8
BIN_OP_EQ_uxn_opcodes_h_l2540_c11_afa8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2540_c11_afa8_left,
BIN_OP_EQ_uxn_opcodes_h_l2540_c11_afa8_right,
BIN_OP_EQ_uxn_opcodes_h_l2540_c11_afa8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2540_c7_0575
tmp16_MUX_uxn_opcodes_h_l2540_c7_0575 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2540_c7_0575_cond,
tmp16_MUX_uxn_opcodes_h_l2540_c7_0575_iftrue,
tmp16_MUX_uxn_opcodes_h_l2540_c7_0575_iffalse,
tmp16_MUX_uxn_opcodes_h_l2540_c7_0575_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_0575
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_0575 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_0575_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_0575_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_0575_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_0575_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_0575
result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_0575 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_0575_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_0575_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_0575_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_0575_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_0575
result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_0575 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_0575_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_0575_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_0575_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_0575_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_0575
result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_0575 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_0575_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_0575_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_0575_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_0575_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2540_c7_0575
result_u8_value_MUX_uxn_opcodes_h_l2540_c7_0575 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2540_c7_0575_cond,
result_u8_value_MUX_uxn_opcodes_h_l2540_c7_0575_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2540_c7_0575_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2540_c7_0575_return_output);

-- t16_MUX_uxn_opcodes_h_l2540_c7_0575
t16_MUX_uxn_opcodes_h_l2540_c7_0575 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2540_c7_0575_cond,
t16_MUX_uxn_opcodes_h_l2540_c7_0575_iftrue,
t16_MUX_uxn_opcodes_h_l2540_c7_0575_iffalse,
t16_MUX_uxn_opcodes_h_l2540_c7_0575_return_output);

-- n16_MUX_uxn_opcodes_h_l2540_c7_0575
n16_MUX_uxn_opcodes_h_l2540_c7_0575 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2540_c7_0575_cond,
n16_MUX_uxn_opcodes_h_l2540_c7_0575_iftrue,
n16_MUX_uxn_opcodes_h_l2540_c7_0575_iffalse,
n16_MUX_uxn_opcodes_h_l2540_c7_0575_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2541_c3_504f
BIN_OP_OR_uxn_opcodes_h_l2541_c3_504f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2541_c3_504f_left,
BIN_OP_OR_uxn_opcodes_h_l2541_c3_504f_right,
BIN_OP_OR_uxn_opcodes_h_l2541_c3_504f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2544_c11_cb96
BIN_OP_EQ_uxn_opcodes_h_l2544_c11_cb96 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2544_c11_cb96_left,
BIN_OP_EQ_uxn_opcodes_h_l2544_c11_cb96_right,
BIN_OP_EQ_uxn_opcodes_h_l2544_c11_cb96_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2544_c7_f9aa
tmp16_MUX_uxn_opcodes_h_l2544_c7_f9aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2544_c7_f9aa_cond,
tmp16_MUX_uxn_opcodes_h_l2544_c7_f9aa_iftrue,
tmp16_MUX_uxn_opcodes_h_l2544_c7_f9aa_iffalse,
tmp16_MUX_uxn_opcodes_h_l2544_c7_f9aa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f9aa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f9aa : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f9aa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f9aa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f9aa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f9aa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f9aa
result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f9aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f9aa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f9aa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f9aa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f9aa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f9aa
result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f9aa : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f9aa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f9aa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f9aa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f9aa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f9aa
result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f9aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f9aa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f9aa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f9aa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f9aa_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f9aa
result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f9aa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f9aa_cond,
result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f9aa_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f9aa_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f9aa_return_output);

-- n16_MUX_uxn_opcodes_h_l2544_c7_f9aa
n16_MUX_uxn_opcodes_h_l2544_c7_f9aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2544_c7_f9aa_cond,
n16_MUX_uxn_opcodes_h_l2544_c7_f9aa_iftrue,
n16_MUX_uxn_opcodes_h_l2544_c7_f9aa_iffalse,
n16_MUX_uxn_opcodes_h_l2544_c7_f9aa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2548_c11_5fc8
BIN_OP_EQ_uxn_opcodes_h_l2548_c11_5fc8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2548_c11_5fc8_left,
BIN_OP_EQ_uxn_opcodes_h_l2548_c11_5fc8_right,
BIN_OP_EQ_uxn_opcodes_h_l2548_c11_5fc8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2548_c7_8ce9
tmp16_MUX_uxn_opcodes_h_l2548_c7_8ce9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2548_c7_8ce9_cond,
tmp16_MUX_uxn_opcodes_h_l2548_c7_8ce9_iftrue,
tmp16_MUX_uxn_opcodes_h_l2548_c7_8ce9_iffalse,
tmp16_MUX_uxn_opcodes_h_l2548_c7_8ce9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_8ce9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_8ce9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_8ce9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_8ce9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_8ce9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_8ce9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_8ce9
result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_8ce9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_8ce9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_8ce9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_8ce9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_8ce9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_8ce9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_8ce9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_8ce9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_8ce9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_8ce9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_8ce9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_8ce9
result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_8ce9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_8ce9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_8ce9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_8ce9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_8ce9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2548_c7_8ce9
result_u8_value_MUX_uxn_opcodes_h_l2548_c7_8ce9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2548_c7_8ce9_cond,
result_u8_value_MUX_uxn_opcodes_h_l2548_c7_8ce9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2548_c7_8ce9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2548_c7_8ce9_return_output);

-- n16_MUX_uxn_opcodes_h_l2548_c7_8ce9
n16_MUX_uxn_opcodes_h_l2548_c7_8ce9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2548_c7_8ce9_cond,
n16_MUX_uxn_opcodes_h_l2548_c7_8ce9_iftrue,
n16_MUX_uxn_opcodes_h_l2548_c7_8ce9_iffalse,
n16_MUX_uxn_opcodes_h_l2548_c7_8ce9_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2549_c3_615b
BIN_OP_OR_uxn_opcodes_h_l2549_c3_615b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2549_c3_615b_left,
BIN_OP_OR_uxn_opcodes_h_l2549_c3_615b_right,
BIN_OP_OR_uxn_opcodes_h_l2549_c3_615b_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2550_c11_c781
BIN_OP_MINUS_uxn_opcodes_h_l2550_c11_c781 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2550_c11_c781_left,
BIN_OP_MINUS_uxn_opcodes_h_l2550_c11_c781_right,
BIN_OP_MINUS_uxn_opcodes_h_l2550_c11_c781_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2551_c30_0396
sp_relative_shift_uxn_opcodes_h_l2551_c30_0396 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2551_c30_0396_ins,
sp_relative_shift_uxn_opcodes_h_l2551_c30_0396_x,
sp_relative_shift_uxn_opcodes_h_l2551_c30_0396_y,
sp_relative_shift_uxn_opcodes_h_l2551_c30_0396_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2556_c11_8ee6
BIN_OP_EQ_uxn_opcodes_h_l2556_c11_8ee6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2556_c11_8ee6_left,
BIN_OP_EQ_uxn_opcodes_h_l2556_c11_8ee6_right,
BIN_OP_EQ_uxn_opcodes_h_l2556_c11_8ee6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8e2d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8e2d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8e2d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8e2d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8e2d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8e2d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8e2d
result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8e2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8e2d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8e2d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8e2d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8e2d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8e2d
result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8e2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8e2d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8e2d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8e2d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8e2d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8e2d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8e2d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8e2d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8e2d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8e2d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8e2d_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2559_c31_cc6b
CONST_SR_8_uxn_opcodes_h_l2559_c31_cc6b : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2559_c31_cc6b_x,
CONST_SR_8_uxn_opcodes_h_l2559_c31_cc6b_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2546_l2537_DUPLICATE_382a
CONST_SL_8_uint16_t_uxn_opcodes_h_l2546_l2537_DUPLICATE_382a : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2546_l2537_DUPLICATE_382a_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2546_l2537_DUPLICATE_382a_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2519_c6_7aff_return_output,
 tmp16_MUX_uxn_opcodes_h_l2519_c2_1599_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_1599_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_1599_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_1599_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_1599_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2519_c2_1599_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_1599_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_1599_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_1599_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_1599_return_output,
 t16_MUX_uxn_opcodes_h_l2519_c2_1599_return_output,
 n16_MUX_uxn_opcodes_h_l2519_c2_1599_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2532_c11_dfed_return_output,
 tmp16_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output,
 t16_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output,
 n16_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2535_c11_8b21_return_output,
 tmp16_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output,
 t16_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output,
 n16_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2540_c11_afa8_return_output,
 tmp16_MUX_uxn_opcodes_h_l2540_c7_0575_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_0575_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_0575_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_0575_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_0575_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2540_c7_0575_return_output,
 t16_MUX_uxn_opcodes_h_l2540_c7_0575_return_output,
 n16_MUX_uxn_opcodes_h_l2540_c7_0575_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2541_c3_504f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2544_c11_cb96_return_output,
 tmp16_MUX_uxn_opcodes_h_l2544_c7_f9aa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f9aa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f9aa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f9aa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f9aa_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f9aa_return_output,
 n16_MUX_uxn_opcodes_h_l2544_c7_f9aa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2548_c11_5fc8_return_output,
 tmp16_MUX_uxn_opcodes_h_l2548_c7_8ce9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_8ce9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_8ce9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_8ce9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_8ce9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2548_c7_8ce9_return_output,
 n16_MUX_uxn_opcodes_h_l2548_c7_8ce9_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2549_c3_615b_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2550_c11_c781_return_output,
 sp_relative_shift_uxn_opcodes_h_l2551_c30_0396_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2556_c11_8ee6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8e2d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8e2d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8e2d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8e2d_return_output,
 CONST_SR_8_uxn_opcodes_h_l2559_c31_cc6b_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2546_l2537_DUPLICATE_382a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c6_7aff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c6_7aff_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c6_7aff_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2519_c2_1599_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2519_c2_1599_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_1599_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_1599_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2519_c2_1599_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_1599_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_1599_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2524_c3_1f03 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_1599_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_1599_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2519_c2_1599_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_1599_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_1599_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2519_c2_1599_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2519_c2_1599_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2519_c2_1599_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_1599_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_1599_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2529_c3_0233 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_1599_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_1599_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2519_c2_1599_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_1599_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_1599_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_1599_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_1599_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2519_c2_1599_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2519_c2_1599_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2519_c2_1599_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2519_c2_1599_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2532_c11_dfed_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2532_c11_dfed_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2532_c11_dfed_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2532_c7_c55c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2532_c7_c55c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2532_c7_c55c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_c55c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2533_c3_ba20 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_c55c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_c55c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_c55c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_c55c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_c55c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_c55c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_c55c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_c55c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_c55c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_c55c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_c55c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2532_c7_c55c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2532_c7_c55c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2532_c7_c55c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2532_c7_c55c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2532_c7_c55c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2532_c7_c55c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2532_c7_c55c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2532_c7_c55c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2532_c7_c55c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_8b21_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_8b21_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_8b21_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2535_c7_45cc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2535_c7_45cc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2540_c7_0575_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2535_c7_45cc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_45cc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2538_c3_33cf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_45cc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_0575_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_45cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_45cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_45cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_0575_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_45cc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_45cc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_45cc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_0575_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_45cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_45cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_45cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_0575_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_45cc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2535_c7_45cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2535_c7_45cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2540_c7_0575_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2535_c7_45cc_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2535_c7_45cc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2535_c7_45cc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2540_c7_0575_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2535_c7_45cc_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2535_c7_45cc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2535_c7_45cc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2540_c7_0575_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2535_c7_45cc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_afa8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_afa8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_afa8_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2540_c7_0575_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2540_c7_0575_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2544_c7_f9aa_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2540_c7_0575_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_0575_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2542_c3_1da9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_0575_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f9aa_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_0575_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_0575_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_0575_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f9aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_0575_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_0575_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_0575_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f9aa_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_0575_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_0575_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_0575_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f9aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_0575_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2540_c7_0575_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2540_c7_0575_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f9aa_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2540_c7_0575_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2540_c7_0575_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2540_c7_0575_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2540_c7_0575_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2540_c7_0575_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2540_c7_0575_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2544_c7_f9aa_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2540_c7_0575_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2541_c3_504f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2541_c3_504f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2541_c3_504f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_cb96_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_cb96_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_cb96_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2544_c7_f9aa_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2544_c7_f9aa_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2548_c7_8ce9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2544_c7_f9aa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f9aa_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f9aa_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_8ce9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f9aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f9aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f9aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_8ce9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f9aa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f9aa_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f9aa_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_8ce9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f9aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f9aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f9aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_8ce9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f9aa_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f9aa_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f9aa_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c7_8ce9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f9aa_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2544_c7_f9aa_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2544_c7_f9aa_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2548_c7_8ce9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2544_c7_f9aa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c11_5fc8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c11_5fc8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c11_5fc8_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2548_c7_8ce9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2548_c7_8ce9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2548_c7_8ce9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_8ce9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2553_c3_22d8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_8ce9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8e2d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_8ce9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_8ce9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_8ce9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_8ce9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_8ce9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_8ce9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8e2d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_8ce9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_8ce9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_8ce9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8e2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_8ce9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c7_8ce9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c7_8ce9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8e2d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c7_8ce9_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2548_c7_8ce9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2548_c7_8ce9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2548_c7_8ce9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2549_c3_615b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2549_c3_615b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2549_c3_615b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2550_c11_c781_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2550_c11_c781_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2550_c11_c781_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2551_c30_0396_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2551_c30_0396_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2551_c30_0396_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2551_c30_0396_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2554_c21_fa9b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_8ee6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_8ee6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_8ee6_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8e2d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2558_c3_3a82 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8e2d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8e2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8e2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8e2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8e2d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8e2d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8e2d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8e2d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8e2d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2557_c3_d225 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8e2d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8e2d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2559_c31_cc6b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2559_c31_cc6b_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2559_c21_9492_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2540_l2535_l2532_l2519_l2556_l2544_DUPLICATE_5320_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2540_l2535_l2532_l2548_l2544_DUPLICATE_36bf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2540_l2535_l2532_l2556_l2544_DUPLICATE_931e_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2540_l2535_l2532_l2556_l2548_l2544_DUPLICATE_2776_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2536_l2541_l2549_l2545_DUPLICATE_ac55_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2546_l2537_DUPLICATE_382a_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2546_l2537_DUPLICATE_382a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2556_l2544_DUPLICATE_c915_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l2515_l2563_DUPLICATE_172d_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2529_c3_0233 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2529_c3_0233;
     VAR_sp_relative_shift_uxn_opcodes_h_l2551_c30_0396_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_sp_relative_shift_uxn_opcodes_h_l2551_c30_0396_y := resize(to_signed(-2, 3), 4);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2557_c3_d225 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8e2d_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2557_c3_d225;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2542_c3_1da9 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_0575_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2542_c3_1da9;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_8ce9_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2524_c3_1f03 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2524_c3_1f03;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_8ee6_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2558_c3_3a82 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8e2d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2558_c3_3a82;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2532_c11_dfed_right := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_cb96_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_8b21_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_afa8_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2553_c3_22d8 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_8ce9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2553_c3_22d8;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2538_c3_33cf := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_45cc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2538_c3_33cf;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8e2d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c6_7aff_right := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2533_c3_ba20 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_c55c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2533_c3_ba20;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c11_5fc8_right := to_unsigned(5, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2551_c30_0396_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2549_c3_615b_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2532_c7_c55c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2535_c7_45cc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2540_c7_0575_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2548_c7_8ce9_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c6_7aff_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2532_c11_dfed_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_8b21_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_afa8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_cb96_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c11_5fc8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_8ee6_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2550_c11_c781_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2541_c3_504f_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2532_c7_c55c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2540_c7_0575_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2559_c31_cc6b_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2532_c7_c55c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2535_c7_45cc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2540_c7_0575_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2544_c7_f9aa_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2548_c7_8ce9_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2540_l2535_l2532_l2548_l2544_DUPLICATE_36bf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2540_l2535_l2532_l2548_l2544_DUPLICATE_36bf_return_output := result.is_stack_write;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2519_c2_1599] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2519_c2_1599_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2556_l2544_DUPLICATE_c915 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2556_l2544_DUPLICATE_c915_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l2551_c30_0396] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2551_c30_0396_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2551_c30_0396_ins;
     sp_relative_shift_uxn_opcodes_h_l2551_c30_0396_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2551_c30_0396_x;
     sp_relative_shift_uxn_opcodes_h_l2551_c30_0396_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2551_c30_0396_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2551_c30_0396_return_output := sp_relative_shift_uxn_opcodes_h_l2551_c30_0396_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2559_c31_cc6b] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2559_c31_cc6b_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2559_c31_cc6b_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2559_c31_cc6b_return_output := CONST_SR_8_uxn_opcodes_h_l2559_c31_cc6b_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2519_c2_1599] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2519_c2_1599_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l2535_c11_8b21] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2535_c11_8b21_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_8b21_left;
     BIN_OP_EQ_uxn_opcodes_h_l2535_c11_8b21_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_8b21_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_8b21_return_output := BIN_OP_EQ_uxn_opcodes_h_l2535_c11_8b21_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2540_c11_afa8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2540_c11_afa8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_afa8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2540_c11_afa8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_afa8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_afa8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2540_c11_afa8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2556_c11_8ee6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2556_c11_8ee6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_8ee6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2556_c11_8ee6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_8ee6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_8ee6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2556_c11_8ee6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2519_c6_7aff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2519_c6_7aff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c6_7aff_left;
     BIN_OP_EQ_uxn_opcodes_h_l2519_c6_7aff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c6_7aff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c6_7aff_return_output := BIN_OP_EQ_uxn_opcodes_h_l2519_c6_7aff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2548_c11_5fc8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2548_c11_5fc8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c11_5fc8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2548_c11_5fc8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c11_5fc8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c11_5fc8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2548_c11_5fc8_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2519_c2_1599] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2519_c2_1599_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2532_c11_dfed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2532_c11_dfed_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2532_c11_dfed_left;
     BIN_OP_EQ_uxn_opcodes_h_l2532_c11_dfed_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2532_c11_dfed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2532_c11_dfed_return_output := BIN_OP_EQ_uxn_opcodes_h_l2532_c11_dfed_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2540_l2535_l2532_l2556_l2544_DUPLICATE_931e LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2540_l2535_l2532_l2556_l2544_DUPLICATE_931e_return_output := result.sp_relative_shift;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2519_c2_1599] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2519_c2_1599_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2540_l2535_l2532_l2556_l2548_l2544_DUPLICATE_2776 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2540_l2535_l2532_l2556_l2548_l2544_DUPLICATE_2776_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2536_l2541_l2549_l2545_DUPLICATE_ac55 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2536_l2541_l2549_l2545_DUPLICATE_ac55_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2544_c11_cb96] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2544_c11_cb96_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_cb96_left;
     BIN_OP_EQ_uxn_opcodes_h_l2544_c11_cb96_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_cb96_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_cb96_return_output := BIN_OP_EQ_uxn_opcodes_h_l2544_c11_cb96_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2540_l2535_l2532_l2519_l2556_l2544_DUPLICATE_5320 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2540_l2535_l2532_l2519_l2556_l2544_DUPLICATE_5320_return_output := result.u8_value;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2519_c2_1599_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c6_7aff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_1599_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c6_7aff_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_1599_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c6_7aff_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_1599_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c6_7aff_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_1599_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c6_7aff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_1599_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c6_7aff_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_1599_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c6_7aff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_1599_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c6_7aff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_1599_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c6_7aff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2519_c2_1599_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c6_7aff_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2519_c2_1599_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c6_7aff_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2519_c2_1599_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c6_7aff_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2532_c7_c55c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2532_c11_dfed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_c55c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2532_c11_dfed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_c55c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2532_c11_dfed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_c55c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2532_c11_dfed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_c55c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2532_c11_dfed_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2532_c7_c55c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2532_c11_dfed_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2532_c7_c55c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2532_c11_dfed_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2532_c7_c55c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2532_c11_dfed_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2535_c7_45cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_8b21_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_45cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_8b21_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_45cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_8b21_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_45cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_8b21_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_45cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_8b21_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2535_c7_45cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_8b21_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2535_c7_45cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_8b21_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2535_c7_45cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_8b21_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2540_c7_0575_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_afa8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_0575_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_afa8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_0575_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_afa8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_0575_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_afa8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_0575_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_afa8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2540_c7_0575_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_afa8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2540_c7_0575_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_afa8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2540_c7_0575_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_afa8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2544_c7_f9aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_cb96_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f9aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_cb96_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f9aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_cb96_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f9aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_cb96_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f9aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_cb96_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f9aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_cb96_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2544_c7_f9aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_cb96_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2548_c7_8ce9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c11_5fc8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_8ce9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c11_5fc8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_8ce9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c11_5fc8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_8ce9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c11_5fc8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_8ce9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c11_5fc8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c7_8ce9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c11_5fc8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2548_c7_8ce9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c11_5fc8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8e2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_8ee6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8e2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_8ee6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8e2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_8ee6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8e2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_8ee6_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2541_c3_504f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2536_l2541_l2549_l2545_DUPLICATE_ac55_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2549_c3_615b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2536_l2541_l2549_l2545_DUPLICATE_ac55_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2546_l2537_DUPLICATE_382a_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2536_l2541_l2549_l2545_DUPLICATE_ac55_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_c55c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2540_l2535_l2532_l2556_l2544_DUPLICATE_931e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_45cc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2540_l2535_l2532_l2556_l2544_DUPLICATE_931e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_0575_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2540_l2535_l2532_l2556_l2544_DUPLICATE_931e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f9aa_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2540_l2535_l2532_l2556_l2544_DUPLICATE_931e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8e2d_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2540_l2535_l2532_l2556_l2544_DUPLICATE_931e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_c55c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2540_l2535_l2532_l2556_l2548_l2544_DUPLICATE_2776_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_45cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2540_l2535_l2532_l2556_l2548_l2544_DUPLICATE_2776_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_0575_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2540_l2535_l2532_l2556_l2548_l2544_DUPLICATE_2776_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f9aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2540_l2535_l2532_l2556_l2548_l2544_DUPLICATE_2776_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_8ce9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2540_l2535_l2532_l2556_l2548_l2544_DUPLICATE_2776_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8e2d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2540_l2535_l2532_l2556_l2548_l2544_DUPLICATE_2776_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_c55c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2540_l2535_l2532_l2548_l2544_DUPLICATE_36bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_45cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2540_l2535_l2532_l2548_l2544_DUPLICATE_36bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_0575_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2540_l2535_l2532_l2548_l2544_DUPLICATE_36bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f9aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2540_l2535_l2532_l2548_l2544_DUPLICATE_36bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_8ce9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2540_l2535_l2532_l2548_l2544_DUPLICATE_36bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f9aa_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2556_l2544_DUPLICATE_c915_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8e2d_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2556_l2544_DUPLICATE_c915_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2540_l2535_l2532_l2519_l2556_l2544_DUPLICATE_5320_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2532_c7_c55c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2540_l2535_l2532_l2519_l2556_l2544_DUPLICATE_5320_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2535_c7_45cc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2540_l2535_l2532_l2519_l2556_l2544_DUPLICATE_5320_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2540_c7_0575_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2540_l2535_l2532_l2519_l2556_l2544_DUPLICATE_5320_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f9aa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2540_l2535_l2532_l2519_l2556_l2544_DUPLICATE_5320_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8e2d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2540_l2535_l2532_l2519_l2556_l2544_DUPLICATE_5320_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2519_c2_1599_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2519_c2_1599_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2519_c2_1599_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2519_c2_1599_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_8ce9_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2551_c30_0396_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l2519_c2_1599] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_1599_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_1599_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_1599_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_1599_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2548_c7_8ce9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_8ce9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_8ce9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_8ce9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_8ce9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_8ce9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_8ce9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_8ce9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_8ce9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2556_c7_8e2d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8e2d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8e2d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8e2d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8e2d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8e2d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8e2d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8e2d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8e2d_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2559_c21_9492] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2559_c21_9492_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2559_c31_cc6b_return_output);

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2519_c2_1599] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_1599_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_1599_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_1599_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_1599_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2541_c3_504f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2541_c3_504f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2541_c3_504f_left;
     BIN_OP_OR_uxn_opcodes_h_l2541_c3_504f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2541_c3_504f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2541_c3_504f_return_output := BIN_OP_OR_uxn_opcodes_h_l2541_c3_504f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2556_c7_8e2d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8e2d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8e2d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8e2d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8e2d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8e2d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8e2d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8e2d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8e2d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2519_c2_1599] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_1599_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_1599_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_1599_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_1599_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2556_c7_8e2d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8e2d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8e2d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8e2d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8e2d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8e2d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8e2d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8e2d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8e2d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2549_c3_615b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2549_c3_615b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2549_c3_615b_left;
     BIN_OP_OR_uxn_opcodes_h_l2549_c3_615b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2549_c3_615b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2549_c3_615b_return_output := BIN_OP_OR_uxn_opcodes_h_l2549_c3_615b_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2546_l2537_DUPLICATE_382a LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2546_l2537_DUPLICATE_382a_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2546_l2537_DUPLICATE_382a_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2546_l2537_DUPLICATE_382a_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2546_l2537_DUPLICATE_382a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2519_c2_1599] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_1599_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_1599_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_1599_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_1599_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2540_c7_0575_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2541_c3_504f_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2550_c11_c781_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2549_c3_615b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2548_c7_8ce9_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2549_c3_615b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8e2d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2559_c21_9492_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2544_c7_f9aa_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2546_l2537_DUPLICATE_382a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2535_c7_45cc_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2546_l2537_DUPLICATE_382a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_8ce9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8e2d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f9aa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_8ce9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_8ce9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8e2d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_8ce9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8e2d_return_output;
     -- n16_MUX[uxn_opcodes_h_l2548_c7_8ce9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2548_c7_8ce9_cond <= VAR_n16_MUX_uxn_opcodes_h_l2548_c7_8ce9_cond;
     n16_MUX_uxn_opcodes_h_l2548_c7_8ce9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2548_c7_8ce9_iftrue;
     n16_MUX_uxn_opcodes_h_l2548_c7_8ce9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2548_c7_8ce9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2548_c7_8ce9_return_output := n16_MUX_uxn_opcodes_h_l2548_c7_8ce9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2556_c7_8e2d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8e2d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8e2d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8e2d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8e2d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8e2d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8e2d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8e2d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8e2d_return_output;

     -- t16_MUX[uxn_opcodes_h_l2540_c7_0575] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2540_c7_0575_cond <= VAR_t16_MUX_uxn_opcodes_h_l2540_c7_0575_cond;
     t16_MUX_uxn_opcodes_h_l2540_c7_0575_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2540_c7_0575_iftrue;
     t16_MUX_uxn_opcodes_h_l2540_c7_0575_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2540_c7_0575_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2540_c7_0575_return_output := t16_MUX_uxn_opcodes_h_l2540_c7_0575_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2548_c7_8ce9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_8ce9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_8ce9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_8ce9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_8ce9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_8ce9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_8ce9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_8ce9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_8ce9_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l2550_c11_c781] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2550_c11_c781_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2550_c11_c781_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2550_c11_c781_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2550_c11_c781_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2550_c11_c781_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2550_c11_c781_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2548_c7_8ce9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_8ce9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_8ce9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_8ce9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_8ce9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_8ce9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_8ce9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_8ce9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_8ce9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2548_c7_8ce9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_8ce9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_8ce9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_8ce9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_8ce9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_8ce9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_8ce9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_8ce9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_8ce9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2544_c7_f9aa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f9aa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f9aa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f9aa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f9aa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f9aa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f9aa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f9aa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f9aa_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l2548_c7_8ce9_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2550_c11_c781_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2544_c7_f9aa_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2548_c7_8ce9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f9aa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_8ce9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_0575_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f9aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f9aa_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_8ce9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f9aa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_8ce9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c7_8ce9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8e2d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2535_c7_45cc_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2540_c7_0575_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2544_c7_f9aa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f9aa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f9aa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f9aa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f9aa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f9aa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f9aa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f9aa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f9aa_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2554_c21_fa9b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2554_c21_fa9b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2550_c11_c781_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2544_c7_f9aa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f9aa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f9aa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f9aa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f9aa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f9aa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f9aa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f9aa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f9aa_return_output;

     -- n16_MUX[uxn_opcodes_h_l2544_c7_f9aa] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2544_c7_f9aa_cond <= VAR_n16_MUX_uxn_opcodes_h_l2544_c7_f9aa_cond;
     n16_MUX_uxn_opcodes_h_l2544_c7_f9aa_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2544_c7_f9aa_iftrue;
     n16_MUX_uxn_opcodes_h_l2544_c7_f9aa_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2544_c7_f9aa_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2544_c7_f9aa_return_output := n16_MUX_uxn_opcodes_h_l2544_c7_f9aa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2544_c7_f9aa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f9aa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f9aa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f9aa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f9aa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f9aa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f9aa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f9aa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f9aa_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2548_c7_8ce9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2548_c7_8ce9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2548_c7_8ce9_cond;
     tmp16_MUX_uxn_opcodes_h_l2548_c7_8ce9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2548_c7_8ce9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2548_c7_8ce9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2548_c7_8ce9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2548_c7_8ce9_return_output := tmp16_MUX_uxn_opcodes_h_l2548_c7_8ce9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2540_c7_0575] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_0575_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_0575_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_0575_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_0575_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_0575_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_0575_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_0575_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_0575_return_output;

     -- t16_MUX[uxn_opcodes_h_l2535_c7_45cc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2535_c7_45cc_cond <= VAR_t16_MUX_uxn_opcodes_h_l2535_c7_45cc_cond;
     t16_MUX_uxn_opcodes_h_l2535_c7_45cc_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2535_c7_45cc_iftrue;
     t16_MUX_uxn_opcodes_h_l2535_c7_45cc_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2535_c7_45cc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output := t16_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c7_8ce9_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2554_c21_fa9b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2540_c7_0575_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2544_c7_f9aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_0575_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f9aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_45cc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_0575_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_0575_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f9aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_0575_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f9aa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2532_c7_c55c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2544_c7_f9aa_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2548_c7_8ce9_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2540_c7_0575] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_0575_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_0575_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_0575_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_0575_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_0575_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_0575_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_0575_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_0575_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2548_c7_8ce9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2548_c7_8ce9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c7_8ce9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2548_c7_8ce9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c7_8ce9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2548_c7_8ce9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c7_8ce9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c7_8ce9_return_output := result_u8_value_MUX_uxn_opcodes_h_l2548_c7_8ce9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2540_c7_0575] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_0575_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_0575_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_0575_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_0575_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_0575_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_0575_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_0575_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_0575_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2535_c7_45cc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_45cc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_45cc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_45cc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_45cc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_45cc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_45cc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output;

     -- t16_MUX[uxn_opcodes_h_l2532_c7_c55c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2532_c7_c55c_cond <= VAR_t16_MUX_uxn_opcodes_h_l2532_c7_c55c_cond;
     t16_MUX_uxn_opcodes_h_l2532_c7_c55c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2532_c7_c55c_iftrue;
     t16_MUX_uxn_opcodes_h_l2532_c7_c55c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2532_c7_c55c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output := t16_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2540_c7_0575] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_0575_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_0575_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_0575_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_0575_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_0575_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_0575_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_0575_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_0575_return_output;

     -- n16_MUX[uxn_opcodes_h_l2540_c7_0575] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2540_c7_0575_cond <= VAR_n16_MUX_uxn_opcodes_h_l2540_c7_0575_cond;
     n16_MUX_uxn_opcodes_h_l2540_c7_0575_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2540_c7_0575_iftrue;
     n16_MUX_uxn_opcodes_h_l2540_c7_0575_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2540_c7_0575_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2540_c7_0575_return_output := n16_MUX_uxn_opcodes_h_l2540_c7_0575_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2544_c7_f9aa] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2544_c7_f9aa_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2544_c7_f9aa_cond;
     tmp16_MUX_uxn_opcodes_h_l2544_c7_f9aa_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2544_c7_f9aa_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2544_c7_f9aa_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2544_c7_f9aa_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2544_c7_f9aa_return_output := tmp16_MUX_uxn_opcodes_h_l2544_c7_f9aa_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2535_c7_45cc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2540_c7_0575_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_45cc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_0575_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_c55c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_45cc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_0575_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_45cc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_0575_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f9aa_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c7_8ce9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2540_c7_0575_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2544_c7_f9aa_return_output;
     -- n16_MUX[uxn_opcodes_h_l2535_c7_45cc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2535_c7_45cc_cond <= VAR_n16_MUX_uxn_opcodes_h_l2535_c7_45cc_cond;
     n16_MUX_uxn_opcodes_h_l2535_c7_45cc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2535_c7_45cc_iftrue;
     n16_MUX_uxn_opcodes_h_l2535_c7_45cc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2535_c7_45cc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output := n16_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2535_c7_45cc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_45cc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_45cc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_45cc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_45cc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_45cc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_45cc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2535_c7_45cc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_45cc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_45cc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_45cc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_45cc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_45cc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_45cc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2535_c7_45cc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_45cc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_45cc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_45cc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_45cc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_45cc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_45cc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2540_c7_0575] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2540_c7_0575_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2540_c7_0575_cond;
     tmp16_MUX_uxn_opcodes_h_l2540_c7_0575_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2540_c7_0575_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2540_c7_0575_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2540_c7_0575_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2540_c7_0575_return_output := tmp16_MUX_uxn_opcodes_h_l2540_c7_0575_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2532_c7_c55c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_c55c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_c55c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_c55c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_c55c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_c55c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_c55c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2544_c7_f9aa] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f9aa_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f9aa_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f9aa_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f9aa_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f9aa_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f9aa_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f9aa_return_output := result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f9aa_return_output;

     -- t16_MUX[uxn_opcodes_h_l2519_c2_1599] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2519_c2_1599_cond <= VAR_t16_MUX_uxn_opcodes_h_l2519_c2_1599_cond;
     t16_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue;
     t16_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2519_c2_1599_return_output := t16_MUX_uxn_opcodes_h_l2519_c2_1599_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2532_c7_c55c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_c55c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_c55c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_c55c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2540_c7_0575_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f9aa_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2519_c2_1599_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2535_c7_45cc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2540_c7_0575_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2532_c7_c55c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_c55c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_c55c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_c55c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_c55c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_c55c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_c55c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2535_c7_45cc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2535_c7_45cc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2535_c7_45cc_cond;
     tmp16_MUX_uxn_opcodes_h_l2535_c7_45cc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2535_c7_45cc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2535_c7_45cc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2535_c7_45cc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output := tmp16_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2540_c7_0575] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2540_c7_0575_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2540_c7_0575_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2540_c7_0575_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2540_c7_0575_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2540_c7_0575_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2540_c7_0575_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2540_c7_0575_return_output := result_u8_value_MUX_uxn_opcodes_h_l2540_c7_0575_return_output;

     -- n16_MUX[uxn_opcodes_h_l2532_c7_c55c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2532_c7_c55c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2532_c7_c55c_cond;
     n16_MUX_uxn_opcodes_h_l2532_c7_c55c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2532_c7_c55c_iftrue;
     n16_MUX_uxn_opcodes_h_l2532_c7_c55c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2532_c7_c55c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output := n16_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2519_c2_1599] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_1599_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_1599_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_1599_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_1599_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2532_c7_c55c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_c55c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_c55c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_c55c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_c55c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_c55c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_c55c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2532_c7_c55c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_c55c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_c55c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_c55c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_c55c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_c55c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_c55c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2535_c7_45cc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2540_c7_0575_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2532_c7_c55c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2519_c2_1599] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_1599_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_1599_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_1599_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_1599_return_output;

     -- n16_MUX[uxn_opcodes_h_l2519_c2_1599] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2519_c2_1599_cond <= VAR_n16_MUX_uxn_opcodes_h_l2519_c2_1599_cond;
     n16_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue;
     n16_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2519_c2_1599_return_output := n16_MUX_uxn_opcodes_h_l2519_c2_1599_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2519_c2_1599] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_1599_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_1599_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_1599_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_1599_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2535_c7_45cc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2535_c7_45cc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2535_c7_45cc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2535_c7_45cc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2535_c7_45cc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2535_c7_45cc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2535_c7_45cc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output := result_u8_value_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2532_c7_c55c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2532_c7_c55c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2532_c7_c55c_cond;
     tmp16_MUX_uxn_opcodes_h_l2532_c7_c55c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2532_c7_c55c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2532_c7_c55c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2532_c7_c55c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output := tmp16_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2519_c2_1599] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_1599_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_1599_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_1599_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_1599_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2519_c2_1599_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2532_c7_c55c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2535_c7_45cc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2532_c7_c55c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2532_c7_c55c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2532_c7_c55c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2532_c7_c55c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2532_c7_c55c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2532_c7_c55c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2532_c7_c55c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2519_c2_1599] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2519_c2_1599_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2519_c2_1599_cond;
     tmp16_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2519_c2_1599_return_output := tmp16_MUX_uxn_opcodes_h_l2519_c2_1599_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2532_c7_c55c_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2519_c2_1599_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2519_c2_1599] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2519_c2_1599_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2519_c2_1599_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2519_c2_1599_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2519_c2_1599_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2519_c2_1599_return_output := result_u8_value_MUX_uxn_opcodes_h_l2519_c2_1599_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l2515_l2563_DUPLICATE_172d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l2515_l2563_DUPLICATE_172d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e848(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_1599_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_1599_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_1599_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_1599_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2519_c2_1599_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_1599_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_1599_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_1599_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_1599_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l2515_l2563_DUPLICATE_172d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l2515_l2563_DUPLICATE_172d_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
