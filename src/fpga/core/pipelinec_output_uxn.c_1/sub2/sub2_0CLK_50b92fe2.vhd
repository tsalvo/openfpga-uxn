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
-- BIN_OP_EQ[uxn_opcodes_h_l2519_c6_6626]
signal BIN_OP_EQ_uxn_opcodes_h_l2519_c6_6626_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2519_c6_6626_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2519_c6_6626_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2519_c2_7b76]
signal tmp16_MUX_uxn_opcodes_h_l2519_c2_7b76_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2519_c2_7b76]
signal t16_MUX_uxn_opcodes_h_l2519_c2_7b76_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2519_c2_7b76]
signal n16_MUX_uxn_opcodes_h_l2519_c2_7b76_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2519_c2_7b76]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_7b76_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2519_c2_7b76]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_7b76_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2519_c2_7b76]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2519_c2_7b76]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_7b76_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2519_c2_7b76]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_7b76_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2519_c2_7b76]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2519_c2_7b76]
signal result_u8_value_MUX_uxn_opcodes_h_l2519_c2_7b76_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2519_c2_7b76]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_7b76_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2519_c2_7b76]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_7b76_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2532_c11_3876]
signal BIN_OP_EQ_uxn_opcodes_h_l2532_c11_3876_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2532_c11_3876_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2532_c11_3876_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2532_c7_146c]
signal tmp16_MUX_uxn_opcodes_h_l2532_c7_146c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2532_c7_146c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2532_c7_146c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2532_c7_146c_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2532_c7_146c]
signal t16_MUX_uxn_opcodes_h_l2532_c7_146c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2532_c7_146c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2532_c7_146c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2532_c7_146c_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2532_c7_146c]
signal n16_MUX_uxn_opcodes_h_l2532_c7_146c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2532_c7_146c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2532_c7_146c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2532_c7_146c_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2532_c7_146c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_146c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_146c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_146c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_146c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2532_c7_146c]
signal result_u8_value_MUX_uxn_opcodes_h_l2532_c7_146c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2532_c7_146c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2532_c7_146c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2532_c7_146c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2532_c7_146c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_146c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_146c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_146c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_146c_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2532_c7_146c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_146c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_146c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_146c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_146c_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2532_c7_146c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_146c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_146c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_146c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_146c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2535_c11_6bfb]
signal BIN_OP_EQ_uxn_opcodes_h_l2535_c11_6bfb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2535_c11_6bfb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2535_c11_6bfb_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2535_c7_6317]
signal tmp16_MUX_uxn_opcodes_h_l2535_c7_6317_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2535_c7_6317_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2535_c7_6317_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2535_c7_6317_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2535_c7_6317]
signal t16_MUX_uxn_opcodes_h_l2535_c7_6317_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2535_c7_6317_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2535_c7_6317_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2535_c7_6317_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2535_c7_6317]
signal n16_MUX_uxn_opcodes_h_l2535_c7_6317_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2535_c7_6317_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2535_c7_6317_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2535_c7_6317_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2535_c7_6317]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6317_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6317_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6317_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6317_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2535_c7_6317]
signal result_u8_value_MUX_uxn_opcodes_h_l2535_c7_6317_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2535_c7_6317_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2535_c7_6317_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2535_c7_6317_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2535_c7_6317]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_6317_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_6317_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_6317_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_6317_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2535_c7_6317]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_6317_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_6317_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_6317_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_6317_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2535_c7_6317]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6317_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6317_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6317_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6317_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2540_c11_17b0]
signal BIN_OP_EQ_uxn_opcodes_h_l2540_c11_17b0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2540_c11_17b0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2540_c11_17b0_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2540_c7_127b]
signal tmp16_MUX_uxn_opcodes_h_l2540_c7_127b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2540_c7_127b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2540_c7_127b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2540_c7_127b_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2540_c7_127b]
signal t16_MUX_uxn_opcodes_h_l2540_c7_127b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2540_c7_127b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2540_c7_127b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2540_c7_127b_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2540_c7_127b]
signal n16_MUX_uxn_opcodes_h_l2540_c7_127b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2540_c7_127b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2540_c7_127b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2540_c7_127b_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2540_c7_127b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_127b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_127b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_127b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_127b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2540_c7_127b]
signal result_u8_value_MUX_uxn_opcodes_h_l2540_c7_127b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2540_c7_127b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2540_c7_127b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2540_c7_127b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2540_c7_127b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_127b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_127b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_127b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_127b_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2540_c7_127b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_127b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_127b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_127b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_127b_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2540_c7_127b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_127b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_127b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_127b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_127b_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2541_c3_9c88]
signal BIN_OP_OR_uxn_opcodes_h_l2541_c3_9c88_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2541_c3_9c88_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2541_c3_9c88_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2544_c11_6113]
signal BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6113_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6113_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6113_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2544_c7_f07e]
signal tmp16_MUX_uxn_opcodes_h_l2544_c7_f07e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2544_c7_f07e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2544_c7_f07e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2544_c7_f07e_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2544_c7_f07e]
signal n16_MUX_uxn_opcodes_h_l2544_c7_f07e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2544_c7_f07e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2544_c7_f07e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2544_c7_f07e_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2544_c7_f07e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f07e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f07e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f07e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f07e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2544_c7_f07e]
signal result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f07e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f07e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f07e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f07e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2544_c7_f07e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f07e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f07e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f07e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f07e_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2544_c7_f07e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f07e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f07e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f07e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f07e_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2544_c7_f07e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f07e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f07e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f07e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f07e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2548_c11_7e9f]
signal BIN_OP_EQ_uxn_opcodes_h_l2548_c11_7e9f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2548_c11_7e9f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2548_c11_7e9f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2548_c7_64ae]
signal tmp16_MUX_uxn_opcodes_h_l2548_c7_64ae_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2548_c7_64ae_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2548_c7_64ae_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2548_c7_64ae_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2548_c7_64ae]
signal n16_MUX_uxn_opcodes_h_l2548_c7_64ae_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2548_c7_64ae_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2548_c7_64ae_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2548_c7_64ae_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2548_c7_64ae]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_64ae_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_64ae_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_64ae_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_64ae_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2548_c7_64ae]
signal result_u8_value_MUX_uxn_opcodes_h_l2548_c7_64ae_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2548_c7_64ae_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2548_c7_64ae_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2548_c7_64ae_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2548_c7_64ae]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_64ae_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_64ae_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_64ae_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_64ae_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2548_c7_64ae]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_64ae_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_64ae_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_64ae_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_64ae_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2548_c7_64ae]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_64ae_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_64ae_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_64ae_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_64ae_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2549_c3_c120]
signal BIN_OP_OR_uxn_opcodes_h_l2549_c3_c120_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2549_c3_c120_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2549_c3_c120_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2550_c11_d274]
signal BIN_OP_MINUS_uxn_opcodes_h_l2550_c11_d274_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2550_c11_d274_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2550_c11_d274_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2551_c30_8896]
signal sp_relative_shift_uxn_opcodes_h_l2551_c30_8896_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2551_c30_8896_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2551_c30_8896_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2551_c30_8896_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2556_c11_7b37]
signal BIN_OP_EQ_uxn_opcodes_h_l2556_c11_7b37_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2556_c11_7b37_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2556_c11_7b37_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2556_c7_394c]
signal result_u8_value_MUX_uxn_opcodes_h_l2556_c7_394c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2556_c7_394c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2556_c7_394c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2556_c7_394c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2556_c7_394c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_394c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_394c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_394c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_394c_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2556_c7_394c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_394c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_394c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_394c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_394c_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2556_c7_394c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_394c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_394c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_394c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_394c_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2559_c31_56da]
signal CONST_SR_8_uxn_opcodes_h_l2559_c31_56da_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2559_c31_56da_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2537_l2546_DUPLICATE_c004
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2537_l2546_DUPLICATE_c004_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2537_l2546_DUPLICATE_c004_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_84a2( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_vram_write := ref_toks_6;
      base.u8_value := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_pc_updated := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2519_c6_6626
BIN_OP_EQ_uxn_opcodes_h_l2519_c6_6626 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2519_c6_6626_left,
BIN_OP_EQ_uxn_opcodes_h_l2519_c6_6626_right,
BIN_OP_EQ_uxn_opcodes_h_l2519_c6_6626_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2519_c2_7b76
tmp16_MUX_uxn_opcodes_h_l2519_c2_7b76 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2519_c2_7b76_cond,
tmp16_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue,
tmp16_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse,
tmp16_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output);

-- t16_MUX_uxn_opcodes_h_l2519_c2_7b76
t16_MUX_uxn_opcodes_h_l2519_c2_7b76 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2519_c2_7b76_cond,
t16_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue,
t16_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse,
t16_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output);

-- n16_MUX_uxn_opcodes_h_l2519_c2_7b76
n16_MUX_uxn_opcodes_h_l2519_c2_7b76 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2519_c2_7b76_cond,
n16_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue,
n16_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse,
n16_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_7b76
result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_7b76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_7b76_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_7b76
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_7b76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_7b76_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_7b76
result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_7b76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_7b76
result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_7b76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_7b76_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_7b76
result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_7b76 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_7b76_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_7b76
result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_7b76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2519_c2_7b76
result_u8_value_MUX_uxn_opcodes_h_l2519_c2_7b76 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2519_c2_7b76_cond,
result_u8_value_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_7b76
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_7b76 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_7b76_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_7b76
result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_7b76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_7b76_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2532_c11_3876
BIN_OP_EQ_uxn_opcodes_h_l2532_c11_3876 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2532_c11_3876_left,
BIN_OP_EQ_uxn_opcodes_h_l2532_c11_3876_right,
BIN_OP_EQ_uxn_opcodes_h_l2532_c11_3876_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2532_c7_146c
tmp16_MUX_uxn_opcodes_h_l2532_c7_146c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2532_c7_146c_cond,
tmp16_MUX_uxn_opcodes_h_l2532_c7_146c_iftrue,
tmp16_MUX_uxn_opcodes_h_l2532_c7_146c_iffalse,
tmp16_MUX_uxn_opcodes_h_l2532_c7_146c_return_output);

-- t16_MUX_uxn_opcodes_h_l2532_c7_146c
t16_MUX_uxn_opcodes_h_l2532_c7_146c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2532_c7_146c_cond,
t16_MUX_uxn_opcodes_h_l2532_c7_146c_iftrue,
t16_MUX_uxn_opcodes_h_l2532_c7_146c_iffalse,
t16_MUX_uxn_opcodes_h_l2532_c7_146c_return_output);

-- n16_MUX_uxn_opcodes_h_l2532_c7_146c
n16_MUX_uxn_opcodes_h_l2532_c7_146c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2532_c7_146c_cond,
n16_MUX_uxn_opcodes_h_l2532_c7_146c_iftrue,
n16_MUX_uxn_opcodes_h_l2532_c7_146c_iffalse,
n16_MUX_uxn_opcodes_h_l2532_c7_146c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_146c
result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_146c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_146c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_146c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_146c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_146c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2532_c7_146c
result_u8_value_MUX_uxn_opcodes_h_l2532_c7_146c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2532_c7_146c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2532_c7_146c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2532_c7_146c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2532_c7_146c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_146c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_146c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_146c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_146c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_146c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_146c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_146c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_146c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_146c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_146c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_146c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_146c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_146c
result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_146c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_146c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_146c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_146c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_146c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2535_c11_6bfb
BIN_OP_EQ_uxn_opcodes_h_l2535_c11_6bfb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2535_c11_6bfb_left,
BIN_OP_EQ_uxn_opcodes_h_l2535_c11_6bfb_right,
BIN_OP_EQ_uxn_opcodes_h_l2535_c11_6bfb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2535_c7_6317
tmp16_MUX_uxn_opcodes_h_l2535_c7_6317 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2535_c7_6317_cond,
tmp16_MUX_uxn_opcodes_h_l2535_c7_6317_iftrue,
tmp16_MUX_uxn_opcodes_h_l2535_c7_6317_iffalse,
tmp16_MUX_uxn_opcodes_h_l2535_c7_6317_return_output);

-- t16_MUX_uxn_opcodes_h_l2535_c7_6317
t16_MUX_uxn_opcodes_h_l2535_c7_6317 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2535_c7_6317_cond,
t16_MUX_uxn_opcodes_h_l2535_c7_6317_iftrue,
t16_MUX_uxn_opcodes_h_l2535_c7_6317_iffalse,
t16_MUX_uxn_opcodes_h_l2535_c7_6317_return_output);

-- n16_MUX_uxn_opcodes_h_l2535_c7_6317
n16_MUX_uxn_opcodes_h_l2535_c7_6317 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2535_c7_6317_cond,
n16_MUX_uxn_opcodes_h_l2535_c7_6317_iftrue,
n16_MUX_uxn_opcodes_h_l2535_c7_6317_iffalse,
n16_MUX_uxn_opcodes_h_l2535_c7_6317_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6317
result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6317 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6317_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6317_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6317_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6317_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2535_c7_6317
result_u8_value_MUX_uxn_opcodes_h_l2535_c7_6317 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2535_c7_6317_cond,
result_u8_value_MUX_uxn_opcodes_h_l2535_c7_6317_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2535_c7_6317_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2535_c7_6317_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_6317
result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_6317 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_6317_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_6317_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_6317_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_6317_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_6317
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_6317 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_6317_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_6317_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_6317_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_6317_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6317
result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6317 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6317_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6317_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6317_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6317_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2540_c11_17b0
BIN_OP_EQ_uxn_opcodes_h_l2540_c11_17b0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2540_c11_17b0_left,
BIN_OP_EQ_uxn_opcodes_h_l2540_c11_17b0_right,
BIN_OP_EQ_uxn_opcodes_h_l2540_c11_17b0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2540_c7_127b
tmp16_MUX_uxn_opcodes_h_l2540_c7_127b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2540_c7_127b_cond,
tmp16_MUX_uxn_opcodes_h_l2540_c7_127b_iftrue,
tmp16_MUX_uxn_opcodes_h_l2540_c7_127b_iffalse,
tmp16_MUX_uxn_opcodes_h_l2540_c7_127b_return_output);

-- t16_MUX_uxn_opcodes_h_l2540_c7_127b
t16_MUX_uxn_opcodes_h_l2540_c7_127b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2540_c7_127b_cond,
t16_MUX_uxn_opcodes_h_l2540_c7_127b_iftrue,
t16_MUX_uxn_opcodes_h_l2540_c7_127b_iffalse,
t16_MUX_uxn_opcodes_h_l2540_c7_127b_return_output);

-- n16_MUX_uxn_opcodes_h_l2540_c7_127b
n16_MUX_uxn_opcodes_h_l2540_c7_127b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2540_c7_127b_cond,
n16_MUX_uxn_opcodes_h_l2540_c7_127b_iftrue,
n16_MUX_uxn_opcodes_h_l2540_c7_127b_iffalse,
n16_MUX_uxn_opcodes_h_l2540_c7_127b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_127b
result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_127b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_127b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_127b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_127b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_127b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2540_c7_127b
result_u8_value_MUX_uxn_opcodes_h_l2540_c7_127b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2540_c7_127b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2540_c7_127b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2540_c7_127b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2540_c7_127b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_127b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_127b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_127b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_127b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_127b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_127b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_127b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_127b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_127b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_127b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_127b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_127b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_127b
result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_127b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_127b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_127b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_127b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_127b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2541_c3_9c88
BIN_OP_OR_uxn_opcodes_h_l2541_c3_9c88 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2541_c3_9c88_left,
BIN_OP_OR_uxn_opcodes_h_l2541_c3_9c88_right,
BIN_OP_OR_uxn_opcodes_h_l2541_c3_9c88_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6113
BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6113 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6113_left,
BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6113_right,
BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6113_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2544_c7_f07e
tmp16_MUX_uxn_opcodes_h_l2544_c7_f07e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2544_c7_f07e_cond,
tmp16_MUX_uxn_opcodes_h_l2544_c7_f07e_iftrue,
tmp16_MUX_uxn_opcodes_h_l2544_c7_f07e_iffalse,
tmp16_MUX_uxn_opcodes_h_l2544_c7_f07e_return_output);

-- n16_MUX_uxn_opcodes_h_l2544_c7_f07e
n16_MUX_uxn_opcodes_h_l2544_c7_f07e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2544_c7_f07e_cond,
n16_MUX_uxn_opcodes_h_l2544_c7_f07e_iftrue,
n16_MUX_uxn_opcodes_h_l2544_c7_f07e_iffalse,
n16_MUX_uxn_opcodes_h_l2544_c7_f07e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f07e
result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f07e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f07e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f07e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f07e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f07e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f07e
result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f07e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f07e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f07e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f07e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f07e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f07e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f07e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f07e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f07e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f07e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f07e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f07e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f07e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f07e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f07e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f07e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f07e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f07e
result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f07e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f07e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f07e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f07e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f07e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2548_c11_7e9f
BIN_OP_EQ_uxn_opcodes_h_l2548_c11_7e9f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2548_c11_7e9f_left,
BIN_OP_EQ_uxn_opcodes_h_l2548_c11_7e9f_right,
BIN_OP_EQ_uxn_opcodes_h_l2548_c11_7e9f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2548_c7_64ae
tmp16_MUX_uxn_opcodes_h_l2548_c7_64ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2548_c7_64ae_cond,
tmp16_MUX_uxn_opcodes_h_l2548_c7_64ae_iftrue,
tmp16_MUX_uxn_opcodes_h_l2548_c7_64ae_iffalse,
tmp16_MUX_uxn_opcodes_h_l2548_c7_64ae_return_output);

-- n16_MUX_uxn_opcodes_h_l2548_c7_64ae
n16_MUX_uxn_opcodes_h_l2548_c7_64ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2548_c7_64ae_cond,
n16_MUX_uxn_opcodes_h_l2548_c7_64ae_iftrue,
n16_MUX_uxn_opcodes_h_l2548_c7_64ae_iffalse,
n16_MUX_uxn_opcodes_h_l2548_c7_64ae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_64ae
result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_64ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_64ae_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_64ae_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_64ae_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_64ae_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2548_c7_64ae
result_u8_value_MUX_uxn_opcodes_h_l2548_c7_64ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2548_c7_64ae_cond,
result_u8_value_MUX_uxn_opcodes_h_l2548_c7_64ae_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2548_c7_64ae_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2548_c7_64ae_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_64ae
result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_64ae : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_64ae_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_64ae_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_64ae_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_64ae_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_64ae
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_64ae : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_64ae_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_64ae_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_64ae_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_64ae_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_64ae
result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_64ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_64ae_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_64ae_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_64ae_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_64ae_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2549_c3_c120
BIN_OP_OR_uxn_opcodes_h_l2549_c3_c120 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2549_c3_c120_left,
BIN_OP_OR_uxn_opcodes_h_l2549_c3_c120_right,
BIN_OP_OR_uxn_opcodes_h_l2549_c3_c120_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2550_c11_d274
BIN_OP_MINUS_uxn_opcodes_h_l2550_c11_d274 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2550_c11_d274_left,
BIN_OP_MINUS_uxn_opcodes_h_l2550_c11_d274_right,
BIN_OP_MINUS_uxn_opcodes_h_l2550_c11_d274_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2551_c30_8896
sp_relative_shift_uxn_opcodes_h_l2551_c30_8896 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2551_c30_8896_ins,
sp_relative_shift_uxn_opcodes_h_l2551_c30_8896_x,
sp_relative_shift_uxn_opcodes_h_l2551_c30_8896_y,
sp_relative_shift_uxn_opcodes_h_l2551_c30_8896_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2556_c11_7b37
BIN_OP_EQ_uxn_opcodes_h_l2556_c11_7b37 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2556_c11_7b37_left,
BIN_OP_EQ_uxn_opcodes_h_l2556_c11_7b37_right,
BIN_OP_EQ_uxn_opcodes_h_l2556_c11_7b37_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2556_c7_394c
result_u8_value_MUX_uxn_opcodes_h_l2556_c7_394c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2556_c7_394c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2556_c7_394c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2556_c7_394c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2556_c7_394c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_394c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_394c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_394c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_394c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_394c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_394c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_394c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_394c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_394c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_394c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_394c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_394c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_394c
result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_394c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_394c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_394c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_394c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_394c_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2559_c31_56da
CONST_SR_8_uxn_opcodes_h_l2559_c31_56da : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2559_c31_56da_x,
CONST_SR_8_uxn_opcodes_h_l2559_c31_56da_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2537_l2546_DUPLICATE_c004
CONST_SL_8_uint16_t_uxn_opcodes_h_l2537_l2546_DUPLICATE_c004 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2537_l2546_DUPLICATE_c004_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2537_l2546_DUPLICATE_c004_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2519_c6_6626_return_output,
 tmp16_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output,
 t16_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output,
 n16_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2532_c11_3876_return_output,
 tmp16_MUX_uxn_opcodes_h_l2532_c7_146c_return_output,
 t16_MUX_uxn_opcodes_h_l2532_c7_146c_return_output,
 n16_MUX_uxn_opcodes_h_l2532_c7_146c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_146c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2532_c7_146c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_146c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_146c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_146c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2535_c11_6bfb_return_output,
 tmp16_MUX_uxn_opcodes_h_l2535_c7_6317_return_output,
 t16_MUX_uxn_opcodes_h_l2535_c7_6317_return_output,
 n16_MUX_uxn_opcodes_h_l2535_c7_6317_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6317_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2535_c7_6317_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_6317_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_6317_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6317_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2540_c11_17b0_return_output,
 tmp16_MUX_uxn_opcodes_h_l2540_c7_127b_return_output,
 t16_MUX_uxn_opcodes_h_l2540_c7_127b_return_output,
 n16_MUX_uxn_opcodes_h_l2540_c7_127b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_127b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2540_c7_127b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_127b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_127b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_127b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2541_c3_9c88_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6113_return_output,
 tmp16_MUX_uxn_opcodes_h_l2544_c7_f07e_return_output,
 n16_MUX_uxn_opcodes_h_l2544_c7_f07e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f07e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f07e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f07e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f07e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f07e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2548_c11_7e9f_return_output,
 tmp16_MUX_uxn_opcodes_h_l2548_c7_64ae_return_output,
 n16_MUX_uxn_opcodes_h_l2548_c7_64ae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_64ae_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2548_c7_64ae_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_64ae_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_64ae_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_64ae_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2549_c3_c120_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2550_c11_d274_return_output,
 sp_relative_shift_uxn_opcodes_h_l2551_c30_8896_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2556_c11_7b37_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2556_c7_394c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_394c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_394c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_394c_return_output,
 CONST_SR_8_uxn_opcodes_h_l2559_c31_56da_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2537_l2546_DUPLICATE_c004_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c6_6626_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c6_6626_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c6_6626_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2532_c7_146c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2519_c2_7b76_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2532_c7_146c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2519_c2_7b76_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2532_c7_146c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2519_c2_7b76_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_146c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_7b76_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2519_c2_7b76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_7b76_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2519_c2_7b76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_146c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_7b76_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2524_c3_cfbf : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_146c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_7b76_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2519_c2_7b76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2532_c7_146c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2519_c2_7b76_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2529_c3_7d31 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_146c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_7b76_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2519_c2_7b76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_7b76_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2532_c11_3876_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2532_c11_3876_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2532_c11_3876_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2532_c7_146c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2532_c7_146c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2535_c7_6317_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2532_c7_146c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2532_c7_146c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2532_c7_146c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2535_c7_6317_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2532_c7_146c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2532_c7_146c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2532_c7_146c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2535_c7_6317_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2532_c7_146c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_146c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_146c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6317_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_146c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2532_c7_146c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2532_c7_146c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2535_c7_6317_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2532_c7_146c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_146c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_146c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_6317_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_146c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_146c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2533_c3_3a1e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_146c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_6317_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_146c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_146c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_146c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6317_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_146c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_6bfb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_6bfb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_6bfb_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2535_c7_6317_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2535_c7_6317_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2540_c7_127b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2535_c7_6317_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2535_c7_6317_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2535_c7_6317_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2540_c7_127b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2535_c7_6317_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2535_c7_6317_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2535_c7_6317_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2540_c7_127b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2535_c7_6317_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6317_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6317_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_127b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6317_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2535_c7_6317_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2535_c7_6317_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2540_c7_127b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2535_c7_6317_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_6317_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_6317_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_127b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_6317_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_6317_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2538_c3_e642 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_6317_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_127b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_6317_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6317_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6317_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_127b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6317_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_17b0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_17b0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_17b0_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2540_c7_127b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2540_c7_127b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2544_c7_f07e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2540_c7_127b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2540_c7_127b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2540_c7_127b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2540_c7_127b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2540_c7_127b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2540_c7_127b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2544_c7_f07e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2540_c7_127b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_127b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_127b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f07e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_127b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2540_c7_127b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2540_c7_127b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f07e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2540_c7_127b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_127b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_127b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f07e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_127b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_127b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2542_c3_8851 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_127b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f07e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_127b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_127b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_127b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f07e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_127b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2541_c3_9c88_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2541_c3_9c88_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2541_c3_9c88_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6113_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6113_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6113_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2544_c7_f07e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2544_c7_f07e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2548_c7_64ae_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2544_c7_f07e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2544_c7_f07e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2544_c7_f07e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2548_c7_64ae_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2544_c7_f07e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f07e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f07e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_64ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f07e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f07e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f07e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c7_64ae_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f07e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f07e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f07e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_64ae_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f07e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f07e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f07e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_64ae_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f07e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f07e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f07e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_64ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f07e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c11_7e9f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c11_7e9f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c11_7e9f_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2548_c7_64ae_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2548_c7_64ae_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2548_c7_64ae_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2548_c7_64ae_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2548_c7_64ae_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2548_c7_64ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_64ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_64ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_394c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_64ae_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c7_64ae_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c7_64ae_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2556_c7_394c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c7_64ae_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_64ae_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_64ae_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_394c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_64ae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_64ae_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2553_c3_2874 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_64ae_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_394c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_64ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_64ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_64ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_64ae_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2549_c3_c120_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2549_c3_c120_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2549_c3_c120_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2550_c11_d274_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2550_c11_d274_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2550_c11_d274_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2551_c30_8896_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2551_c30_8896_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2551_c30_8896_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2551_c30_8896_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2554_c21_e5b7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_7b37_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_7b37_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_7b37_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2556_c7_394c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2556_c7_394c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2556_c7_394c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_394c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2557_c3_c510 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_394c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_394c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_394c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2558_c3_5753 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_394c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_394c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_394c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_394c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_394c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2559_c31_56da_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2559_c31_56da_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2559_c21_7caf_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2535_l2532_l2519_l2556_l2544_l2540_DUPLICATE_b6d0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2535_l2532_l2556_l2548_l2544_l2540_DUPLICATE_0223_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2535_l2532_l2556_l2544_l2540_DUPLICATE_d1dd_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2535_l2532_l2548_l2544_l2540_DUPLICATE_22fe_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2541_l2536_l2545_l2549_DUPLICATE_fda1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2537_l2546_DUPLICATE_c004_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2537_l2546_DUPLICATE_c004_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2544_l2556_DUPLICATE_0f86_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l2563_l2515_DUPLICATE_34f4_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2551_c30_8896_y := resize(to_signed(-2, 3), 4);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2524_c3_cfbf := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2524_c3_cfbf;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_394c_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2553_c3_2874 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_64ae_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2553_c3_2874;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_17b0_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l2551_c30_8896_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2533_c3_3a1e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_146c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2533_c3_3a1e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_6bfb_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c6_6626_right := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2532_c11_3876_right := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_64ae_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2558_c3_5753 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_394c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2558_c3_5753;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2557_c3_c510 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_394c_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2557_c3_c510;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c11_7e9f_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2538_c3_e642 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_6317_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2538_c3_e642;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6113_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2529_c3_7d31 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2529_c3_7d31;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2542_c3_8851 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_127b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2542_c3_8851;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_7b37_right := to_unsigned(6, 3);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2551_c30_8896_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2549_c3_c120_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2532_c7_146c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2535_c7_6317_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2540_c7_127b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2548_c7_64ae_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c6_6626_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2532_c11_3876_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_6bfb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_17b0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6113_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c11_7e9f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_7b37_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2550_c11_d274_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2541_c3_9c88_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2532_c7_146c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2540_c7_127b_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2559_c31_56da_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2532_c7_146c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2535_c7_6317_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2540_c7_127b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2544_c7_f07e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2548_c7_64ae_iffalse := tmp16;
     -- CONST_SR_8[uxn_opcodes_h_l2559_c31_56da] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2559_c31_56da_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2559_c31_56da_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2559_c31_56da_return_output := CONST_SR_8_uxn_opcodes_h_l2559_c31_56da_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2535_l2532_l2519_l2556_l2544_l2540_DUPLICATE_b6d0 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2535_l2532_l2519_l2556_l2544_l2540_DUPLICATE_b6d0_return_output := result.u8_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2541_l2536_l2545_l2549_DUPLICATE_fda1 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2541_l2536_l2545_l2549_DUPLICATE_fda1_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2544_c11_6113] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6113_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6113_left;
     BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6113_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6113_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6113_return_output := BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6113_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2532_c11_3876] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2532_c11_3876_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2532_c11_3876_left;
     BIN_OP_EQ_uxn_opcodes_h_l2532_c11_3876_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2532_c11_3876_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2532_c11_3876_return_output := BIN_OP_EQ_uxn_opcodes_h_l2532_c11_3876_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2556_c11_7b37] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2556_c11_7b37_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_7b37_left;
     BIN_OP_EQ_uxn_opcodes_h_l2556_c11_7b37_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_7b37_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_7b37_return_output := BIN_OP_EQ_uxn_opcodes_h_l2556_c11_7b37_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2535_l2532_l2556_l2548_l2544_l2540_DUPLICATE_0223 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2535_l2532_l2556_l2548_l2544_l2540_DUPLICATE_0223_return_output := result.is_opc_done;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2519_c2_7b76] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2519_c2_7b76_return_output := result.is_ram_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2519_c2_7b76] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2519_c2_7b76_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2544_l2556_DUPLICATE_0f86 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2544_l2556_DUPLICATE_0f86_return_output := result.stack_address_sp_offset;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2519_c2_7b76] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2519_c2_7b76_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2535_l2532_l2548_l2544_l2540_DUPLICATE_22fe LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2535_l2532_l2548_l2544_l2540_DUPLICATE_22fe_return_output := result.is_stack_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2535_l2532_l2556_l2544_l2540_DUPLICATE_d1dd LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2535_l2532_l2556_l2544_l2540_DUPLICATE_d1dd_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2540_c11_17b0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2540_c11_17b0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_17b0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2540_c11_17b0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_17b0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_17b0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2540_c11_17b0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2535_c11_6bfb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2535_c11_6bfb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_6bfb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2535_c11_6bfb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_6bfb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_6bfb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2535_c11_6bfb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2548_c11_7e9f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2548_c11_7e9f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c11_7e9f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2548_c11_7e9f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c11_7e9f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c11_7e9f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2548_c11_7e9f_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2519_c2_7b76] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2519_c2_7b76_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l2519_c6_6626] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2519_c6_6626_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c6_6626_left;
     BIN_OP_EQ_uxn_opcodes_h_l2519_c6_6626_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c6_6626_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c6_6626_return_output := BIN_OP_EQ_uxn_opcodes_h_l2519_c6_6626_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2551_c30_8896] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2551_c30_8896_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2551_c30_8896_ins;
     sp_relative_shift_uxn_opcodes_h_l2551_c30_8896_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2551_c30_8896_x;
     sp_relative_shift_uxn_opcodes_h_l2551_c30_8896_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2551_c30_8896_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2551_c30_8896_return_output := sp_relative_shift_uxn_opcodes_h_l2551_c30_8896_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2519_c2_7b76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c6_6626_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_7b76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c6_6626_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_7b76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c6_6626_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c6_6626_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_7b76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c6_6626_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_7b76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c6_6626_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c6_6626_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_7b76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c6_6626_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_7b76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c6_6626_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2519_c2_7b76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c6_6626_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2519_c2_7b76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c6_6626_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2519_c2_7b76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c6_6626_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2532_c7_146c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2532_c11_3876_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_146c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2532_c11_3876_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_146c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2532_c11_3876_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_146c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2532_c11_3876_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_146c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2532_c11_3876_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2532_c7_146c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2532_c11_3876_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2532_c7_146c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2532_c11_3876_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2532_c7_146c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2532_c11_3876_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2535_c7_6317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_6bfb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_6bfb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_6bfb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_6317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_6bfb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_6317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_6bfb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2535_c7_6317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_6bfb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2535_c7_6317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_6bfb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2535_c7_6317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2535_c11_6bfb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2540_c7_127b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_17b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_127b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_17b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_127b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_17b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_127b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_17b0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_127b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_17b0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2540_c7_127b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_17b0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2540_c7_127b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_17b0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2540_c7_127b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_17b0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2544_c7_f07e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6113_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f07e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6113_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f07e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6113_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f07e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6113_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f07e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6113_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f07e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6113_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2544_c7_f07e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6113_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2548_c7_64ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c11_7e9f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_64ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c11_7e9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_64ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c11_7e9f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_64ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c11_7e9f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_64ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c11_7e9f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c7_64ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c11_7e9f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2548_c7_64ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c11_7e9f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_394c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_7b37_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_394c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_7b37_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_394c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_7b37_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2556_c7_394c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_7b37_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2541_c3_9c88_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2541_l2536_l2545_l2549_DUPLICATE_fda1_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2549_c3_c120_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2541_l2536_l2545_l2549_DUPLICATE_fda1_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2537_l2546_DUPLICATE_c004_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2541_l2536_l2545_l2549_DUPLICATE_fda1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_146c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2535_l2532_l2556_l2544_l2540_DUPLICATE_d1dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_6317_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2535_l2532_l2556_l2544_l2540_DUPLICATE_d1dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_127b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2535_l2532_l2556_l2544_l2540_DUPLICATE_d1dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f07e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2535_l2532_l2556_l2544_l2540_DUPLICATE_d1dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_394c_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2535_l2532_l2556_l2544_l2540_DUPLICATE_d1dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_146c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2535_l2532_l2556_l2548_l2544_l2540_DUPLICATE_0223_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6317_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2535_l2532_l2556_l2548_l2544_l2540_DUPLICATE_0223_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_127b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2535_l2532_l2556_l2548_l2544_l2540_DUPLICATE_0223_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f07e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2535_l2532_l2556_l2548_l2544_l2540_DUPLICATE_0223_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_64ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2535_l2532_l2556_l2548_l2544_l2540_DUPLICATE_0223_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_394c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2535_l2532_l2556_l2548_l2544_l2540_DUPLICATE_0223_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_146c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2535_l2532_l2548_l2544_l2540_DUPLICATE_22fe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6317_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2535_l2532_l2548_l2544_l2540_DUPLICATE_22fe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_127b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2535_l2532_l2548_l2544_l2540_DUPLICATE_22fe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f07e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2535_l2532_l2548_l2544_l2540_DUPLICATE_22fe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_64ae_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2535_l2532_l2548_l2544_l2540_DUPLICATE_22fe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f07e_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2544_l2556_DUPLICATE_0f86_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_394c_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2544_l2556_DUPLICATE_0f86_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2535_l2532_l2519_l2556_l2544_l2540_DUPLICATE_b6d0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2532_c7_146c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2535_l2532_l2519_l2556_l2544_l2540_DUPLICATE_b6d0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2535_c7_6317_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2535_l2532_l2519_l2556_l2544_l2540_DUPLICATE_b6d0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2540_c7_127b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2535_l2532_l2519_l2556_l2544_l2540_DUPLICATE_b6d0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f07e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2535_l2532_l2519_l2556_l2544_l2540_DUPLICATE_b6d0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2556_c7_394c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2535_l2532_l2519_l2556_l2544_l2540_DUPLICATE_b6d0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2519_c2_7b76_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2519_c2_7b76_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2519_c2_7b76_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2519_c2_7b76_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_64ae_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2551_c30_8896_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2556_c7_394c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_394c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_394c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_394c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_394c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_394c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_394c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_394c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_394c_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2519_c2_7b76] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_7b76_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_7b76_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2556_c7_394c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_394c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_394c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_394c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_394c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_394c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_394c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_394c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_394c_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2537_l2546_DUPLICATE_c004 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2537_l2546_DUPLICATE_c004_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2537_l2546_DUPLICATE_c004_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2537_l2546_DUPLICATE_c004_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2537_l2546_DUPLICATE_c004_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2548_c7_64ae] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_64ae_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_64ae_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_64ae_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_64ae_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_64ae_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_64ae_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_64ae_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_64ae_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2549_c3_c120] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2549_c3_c120_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2549_c3_c120_left;
     BIN_OP_OR_uxn_opcodes_h_l2549_c3_c120_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2549_c3_c120_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2549_c3_c120_return_output := BIN_OP_OR_uxn_opcodes_h_l2549_c3_c120_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2519_c2_7b76] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_7b76_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_7b76_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2541_c3_9c88] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2541_c3_9c88_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2541_c3_9c88_left;
     BIN_OP_OR_uxn_opcodes_h_l2541_c3_9c88_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2541_c3_9c88_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2541_c3_9c88_return_output := BIN_OP_OR_uxn_opcodes_h_l2541_c3_9c88_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2519_c2_7b76] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2559_c21_7caf] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2559_c21_7caf_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2559_c31_56da_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2556_c7_394c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_394c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_394c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_394c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_394c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_394c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_394c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_394c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_394c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2519_c2_7b76] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2540_c7_127b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2541_c3_9c88_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2550_c11_d274_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2549_c3_c120_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2548_c7_64ae_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2549_c3_c120_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2556_c7_394c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2559_c21_7caf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2544_c7_f07e_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2537_l2546_DUPLICATE_c004_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2535_c7_6317_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2537_l2546_DUPLICATE_c004_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_64ae_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_394c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f07e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c7_64ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_64ae_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_394c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_64ae_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_394c_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2544_c7_f07e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f07e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f07e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f07e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f07e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f07e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f07e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f07e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f07e_return_output;

     -- t16_MUX[uxn_opcodes_h_l2540_c7_127b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2540_c7_127b_cond <= VAR_t16_MUX_uxn_opcodes_h_l2540_c7_127b_cond;
     t16_MUX_uxn_opcodes_h_l2540_c7_127b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2540_c7_127b_iftrue;
     t16_MUX_uxn_opcodes_h_l2540_c7_127b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2540_c7_127b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2540_c7_127b_return_output := t16_MUX_uxn_opcodes_h_l2540_c7_127b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2548_c7_64ae] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_64ae_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_64ae_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_64ae_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_64ae_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_64ae_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_64ae_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_64ae_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_64ae_return_output;

     -- n16_MUX[uxn_opcodes_h_l2548_c7_64ae] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2548_c7_64ae_cond <= VAR_n16_MUX_uxn_opcodes_h_l2548_c7_64ae_cond;
     n16_MUX_uxn_opcodes_h_l2548_c7_64ae_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2548_c7_64ae_iftrue;
     n16_MUX_uxn_opcodes_h_l2548_c7_64ae_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2548_c7_64ae_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2548_c7_64ae_return_output := n16_MUX_uxn_opcodes_h_l2548_c7_64ae_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2548_c7_64ae] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_64ae_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_64ae_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_64ae_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_64ae_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_64ae_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_64ae_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_64ae_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_64ae_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l2550_c11_d274] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2550_c11_d274_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2550_c11_d274_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2550_c11_d274_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2550_c11_d274_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2550_c11_d274_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2550_c11_d274_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2548_c7_64ae] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_64ae_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_64ae_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_64ae_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_64ae_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_64ae_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_64ae_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_64ae_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_64ae_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2556_c7_394c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2556_c7_394c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2556_c7_394c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2556_c7_394c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2556_c7_394c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2556_c7_394c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2556_c7_394c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2556_c7_394c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2556_c7_394c_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l2548_c7_64ae_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2550_c11_d274_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2544_c7_f07e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2548_c7_64ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f07e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c7_64ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_127b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_f07e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f07e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c7_64ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f07e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c7_64ae_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c7_64ae_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2556_c7_394c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2535_c7_6317_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2540_c7_127b_return_output;
     -- n16_MUX[uxn_opcodes_h_l2544_c7_f07e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2544_c7_f07e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2544_c7_f07e_cond;
     n16_MUX_uxn_opcodes_h_l2544_c7_f07e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2544_c7_f07e_iftrue;
     n16_MUX_uxn_opcodes_h_l2544_c7_f07e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2544_c7_f07e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2544_c7_f07e_return_output := n16_MUX_uxn_opcodes_h_l2544_c7_f07e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2540_c7_127b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_127b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_127b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_127b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_127b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_127b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_127b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_127b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_127b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2544_c7_f07e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f07e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f07e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f07e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f07e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f07e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f07e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f07e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f07e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2548_c7_64ae] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2548_c7_64ae_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2548_c7_64ae_cond;
     tmp16_MUX_uxn_opcodes_h_l2548_c7_64ae_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2548_c7_64ae_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2548_c7_64ae_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2548_c7_64ae_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2548_c7_64ae_return_output := tmp16_MUX_uxn_opcodes_h_l2548_c7_64ae_return_output;

     -- t16_MUX[uxn_opcodes_h_l2535_c7_6317] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2535_c7_6317_cond <= VAR_t16_MUX_uxn_opcodes_h_l2535_c7_6317_cond;
     t16_MUX_uxn_opcodes_h_l2535_c7_6317_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2535_c7_6317_iftrue;
     t16_MUX_uxn_opcodes_h_l2535_c7_6317_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2535_c7_6317_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2535_c7_6317_return_output := t16_MUX_uxn_opcodes_h_l2535_c7_6317_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2544_c7_f07e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f07e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f07e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f07e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f07e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f07e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f07e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f07e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f07e_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2554_c21_e5b7] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2554_c21_e5b7_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2550_c11_d274_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2544_c7_f07e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f07e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f07e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f07e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f07e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f07e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f07e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f07e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f07e_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c7_64ae_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2554_c21_e5b7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2540_c7_127b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2544_c7_f07e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_127b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_f07e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6317_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_127b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_127b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_f07e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_127b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_f07e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2532_c7_146c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2535_c7_6317_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2544_c7_f07e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2548_c7_64ae_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2535_c7_6317] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6317_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6317_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6317_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6317_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6317_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6317_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6317_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6317_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2548_c7_64ae] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2548_c7_64ae_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c7_64ae_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2548_c7_64ae_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c7_64ae_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2548_c7_64ae_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c7_64ae_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c7_64ae_return_output := result_u8_value_MUX_uxn_opcodes_h_l2548_c7_64ae_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2540_c7_127b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_127b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_127b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_127b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_127b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_127b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_127b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_127b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_127b_return_output;

     -- n16_MUX[uxn_opcodes_h_l2540_c7_127b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2540_c7_127b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2540_c7_127b_cond;
     n16_MUX_uxn_opcodes_h_l2540_c7_127b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2540_c7_127b_iftrue;
     n16_MUX_uxn_opcodes_h_l2540_c7_127b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2540_c7_127b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2540_c7_127b_return_output := n16_MUX_uxn_opcodes_h_l2540_c7_127b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2544_c7_f07e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2544_c7_f07e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2544_c7_f07e_cond;
     tmp16_MUX_uxn_opcodes_h_l2544_c7_f07e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2544_c7_f07e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2544_c7_f07e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2544_c7_f07e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2544_c7_f07e_return_output := tmp16_MUX_uxn_opcodes_h_l2544_c7_f07e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2540_c7_127b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_127b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_127b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_127b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_127b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_127b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_127b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_127b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_127b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2540_c7_127b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_127b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_127b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_127b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_127b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_127b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_127b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_127b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_127b_return_output;

     -- t16_MUX[uxn_opcodes_h_l2532_c7_146c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2532_c7_146c_cond <= VAR_t16_MUX_uxn_opcodes_h_l2532_c7_146c_cond;
     t16_MUX_uxn_opcodes_h_l2532_c7_146c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2532_c7_146c_iftrue;
     t16_MUX_uxn_opcodes_h_l2532_c7_146c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2532_c7_146c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2532_c7_146c_return_output := t16_MUX_uxn_opcodes_h_l2532_c7_146c_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2535_c7_6317_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2540_c7_127b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6317_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_127b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_146c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2535_c7_6317_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_6317_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2540_c7_127b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_6317_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_127b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f07e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c7_64ae_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2532_c7_146c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2540_c7_127b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2544_c7_f07e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2535_c7_6317] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_6317_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_6317_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_6317_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_6317_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_6317_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_6317_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_6317_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_6317_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2532_c7_146c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_146c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_146c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_146c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_146c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_146c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_146c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_146c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_146c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2540_c7_127b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2540_c7_127b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2540_c7_127b_cond;
     tmp16_MUX_uxn_opcodes_h_l2540_c7_127b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2540_c7_127b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2540_c7_127b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2540_c7_127b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2540_c7_127b_return_output := tmp16_MUX_uxn_opcodes_h_l2540_c7_127b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2535_c7_6317] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6317_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6317_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6317_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6317_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6317_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6317_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6317_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6317_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2535_c7_6317] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_6317_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_6317_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_6317_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_6317_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_6317_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_6317_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_6317_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_6317_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2544_c7_f07e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f07e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f07e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f07e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f07e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f07e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f07e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f07e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f07e_return_output;

     -- n16_MUX[uxn_opcodes_h_l2535_c7_6317] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2535_c7_6317_cond <= VAR_n16_MUX_uxn_opcodes_h_l2535_c7_6317_cond;
     n16_MUX_uxn_opcodes_h_l2535_c7_6317_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2535_c7_6317_iftrue;
     n16_MUX_uxn_opcodes_h_l2535_c7_6317_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2535_c7_6317_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2535_c7_6317_return_output := n16_MUX_uxn_opcodes_h_l2535_c7_6317_return_output;

     -- t16_MUX[uxn_opcodes_h_l2519_c2_7b76] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2519_c2_7b76_cond <= VAR_t16_MUX_uxn_opcodes_h_l2519_c2_7b76_cond;
     t16_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue;
     t16_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output := t16_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2532_c7_146c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2535_c7_6317_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_146c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2535_c7_6317_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2532_c7_146c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_146c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2535_c7_6317_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_146c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2535_c7_6317_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2540_c7_127b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2544_c7_f07e_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2535_c7_6317_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2540_c7_127b_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2532_c7_146c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_146c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_146c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_146c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_146c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_146c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_146c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_146c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_146c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2532_c7_146c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2532_c7_146c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2532_c7_146c_cond;
     n16_MUX_uxn_opcodes_h_l2532_c7_146c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2532_c7_146c_iftrue;
     n16_MUX_uxn_opcodes_h_l2532_c7_146c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2532_c7_146c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2532_c7_146c_return_output := n16_MUX_uxn_opcodes_h_l2532_c7_146c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2532_c7_146c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_146c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_146c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_146c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_146c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_146c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_146c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_146c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_146c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2535_c7_6317] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2535_c7_6317_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2535_c7_6317_cond;
     tmp16_MUX_uxn_opcodes_h_l2535_c7_6317_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2535_c7_6317_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2535_c7_6317_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2535_c7_6317_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2535_c7_6317_return_output := tmp16_MUX_uxn_opcodes_h_l2535_c7_6317_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2519_c2_7b76] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_7b76_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_7b76_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2532_c7_146c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_146c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_146c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_146c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_146c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_146c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_146c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_146c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_146c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2540_c7_127b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2540_c7_127b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2540_c7_127b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2540_c7_127b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2540_c7_127b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2540_c7_127b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2540_c7_127b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2540_c7_127b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2540_c7_127b_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2532_c7_146c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2532_c7_146c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2532_c7_146c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2532_c7_146c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2535_c7_6317_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2540_c7_127b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2532_c7_146c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2535_c7_6317_return_output;
     -- n16_MUX[uxn_opcodes_h_l2519_c2_7b76] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2519_c2_7b76_cond <= VAR_n16_MUX_uxn_opcodes_h_l2519_c2_7b76_cond;
     n16_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue;
     n16_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output := n16_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2532_c7_146c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2532_c7_146c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2532_c7_146c_cond;
     tmp16_MUX_uxn_opcodes_h_l2532_c7_146c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2532_c7_146c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2532_c7_146c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2532_c7_146c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2532_c7_146c_return_output := tmp16_MUX_uxn_opcodes_h_l2532_c7_146c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2519_c2_7b76] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_7b76_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_7b76_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2535_c7_6317] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2535_c7_6317_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2535_c7_6317_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2535_c7_6317_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2535_c7_6317_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2535_c7_6317_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2535_c7_6317_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2535_c7_6317_return_output := result_u8_value_MUX_uxn_opcodes_h_l2535_c7_6317_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2519_c2_7b76] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_7b76_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_7b76_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2519_c2_7b76] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_7b76_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_7b76_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2532_c7_146c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2535_c7_6317_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2532_c7_146c_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2532_c7_146c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2532_c7_146c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2532_c7_146c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2532_c7_146c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2532_c7_146c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2532_c7_146c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2532_c7_146c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2532_c7_146c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2532_c7_146c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2519_c2_7b76] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2519_c2_7b76_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2519_c2_7b76_cond;
     tmp16_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output := tmp16_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2532_c7_146c_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2519_c2_7b76] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2519_c2_7b76_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2519_c2_7b76_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2519_c2_7b76_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2519_c2_7b76_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output := result_u8_value_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l2563_l2515_DUPLICATE_34f4 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l2563_l2515_DUPLICATE_34f4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_84a2(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2519_c2_7b76_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l2563_l2515_DUPLICATE_34f4_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l2563_l2515_DUPLICATE_34f4_return_output;
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
