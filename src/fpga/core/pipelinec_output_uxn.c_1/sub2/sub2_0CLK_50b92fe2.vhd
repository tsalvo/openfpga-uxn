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
-- BIN_OP_EQ[uxn_opcodes_h_l2497_c6_e763]
signal BIN_OP_EQ_uxn_opcodes_h_l2497_c6_e763_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2497_c6_e763_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2497_c6_e763_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2497_c2_9c61]
signal tmp16_MUX_uxn_opcodes_h_l2497_c2_9c61_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2497_c2_9c61]
signal n16_MUX_uxn_opcodes_h_l2497_c2_9c61_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2497_c2_9c61]
signal t16_MUX_uxn_opcodes_h_l2497_c2_9c61_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2497_c2_9c61]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2497_c2_9c61]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_9c61_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2497_c2_9c61]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_9c61_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2497_c2_9c61]
signal result_u8_value_MUX_uxn_opcodes_h_l2497_c2_9c61_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2497_c2_9c61]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_9c61_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2497_c2_9c61]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_9c61_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2497_c2_9c61]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2497_c2_9c61]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_9c61_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2497_c2_9c61]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_9c61_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2510_c11_595c]
signal BIN_OP_EQ_uxn_opcodes_h_l2510_c11_595c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2510_c11_595c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2510_c11_595c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2510_c7_cc39]
signal tmp16_MUX_uxn_opcodes_h_l2510_c7_cc39_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2510_c7_cc39_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2510_c7_cc39_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2510_c7_cc39]
signal n16_MUX_uxn_opcodes_h_l2510_c7_cc39_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2510_c7_cc39_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2510_c7_cc39_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2510_c7_cc39]
signal t16_MUX_uxn_opcodes_h_l2510_c7_cc39_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2510_c7_cc39_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2510_c7_cc39_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2510_c7_cc39]
signal result_u8_value_MUX_uxn_opcodes_h_l2510_c7_cc39_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2510_c7_cc39_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2510_c7_cc39_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2510_c7_cc39]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_cc39_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_cc39_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_cc39_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2510_c7_cc39]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_cc39_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_cc39_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_cc39_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2510_c7_cc39]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_cc39_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_cc39_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_cc39_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2510_c7_cc39]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_cc39_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_cc39_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_cc39_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2513_c11_37bc]
signal BIN_OP_EQ_uxn_opcodes_h_l2513_c11_37bc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2513_c11_37bc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2513_c11_37bc_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2513_c7_3463]
signal tmp16_MUX_uxn_opcodes_h_l2513_c7_3463_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2513_c7_3463_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2513_c7_3463_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2513_c7_3463_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2513_c7_3463]
signal n16_MUX_uxn_opcodes_h_l2513_c7_3463_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2513_c7_3463_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2513_c7_3463_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2513_c7_3463_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2513_c7_3463]
signal t16_MUX_uxn_opcodes_h_l2513_c7_3463_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2513_c7_3463_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2513_c7_3463_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2513_c7_3463_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2513_c7_3463]
signal result_u8_value_MUX_uxn_opcodes_h_l2513_c7_3463_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2513_c7_3463_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2513_c7_3463_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2513_c7_3463_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2513_c7_3463]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_3463_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_3463_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_3463_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_3463_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2513_c7_3463]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_3463_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_3463_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_3463_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_3463_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2513_c7_3463]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_3463_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_3463_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_3463_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_3463_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2513_c7_3463]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_3463_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_3463_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_3463_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_3463_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2518_c11_c167]
signal BIN_OP_EQ_uxn_opcodes_h_l2518_c11_c167_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2518_c11_c167_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2518_c11_c167_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2518_c7_e8cb]
signal tmp16_MUX_uxn_opcodes_h_l2518_c7_e8cb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2518_c7_e8cb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2518_c7_e8cb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2518_c7_e8cb]
signal n16_MUX_uxn_opcodes_h_l2518_c7_e8cb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2518_c7_e8cb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2518_c7_e8cb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2518_c7_e8cb]
signal t16_MUX_uxn_opcodes_h_l2518_c7_e8cb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2518_c7_e8cb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2518_c7_e8cb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2518_c7_e8cb]
signal result_u8_value_MUX_uxn_opcodes_h_l2518_c7_e8cb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2518_c7_e8cb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2518_c7_e8cb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2518_c7_e8cb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_e8cb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_e8cb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_e8cb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2518_c7_e8cb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_e8cb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_e8cb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_e8cb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2518_c7_e8cb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_e8cb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_e8cb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_e8cb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2518_c7_e8cb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_e8cb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_e8cb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_e8cb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2519_c3_69af]
signal BIN_OP_OR_uxn_opcodes_h_l2519_c3_69af_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2519_c3_69af_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2519_c3_69af_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2522_c11_2400]
signal BIN_OP_EQ_uxn_opcodes_h_l2522_c11_2400_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2522_c11_2400_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2522_c11_2400_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2522_c7_464c]
signal tmp16_MUX_uxn_opcodes_h_l2522_c7_464c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2522_c7_464c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2522_c7_464c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2522_c7_464c_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2522_c7_464c]
signal n16_MUX_uxn_opcodes_h_l2522_c7_464c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2522_c7_464c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2522_c7_464c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2522_c7_464c_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2522_c7_464c]
signal result_u8_value_MUX_uxn_opcodes_h_l2522_c7_464c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2522_c7_464c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2522_c7_464c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2522_c7_464c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2522_c7_464c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_464c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_464c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_464c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_464c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2522_c7_464c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_464c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_464c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_464c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_464c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2522_c7_464c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_464c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_464c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_464c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_464c_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2522_c7_464c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_464c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_464c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_464c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_464c_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2526_c11_4f05]
signal BIN_OP_EQ_uxn_opcodes_h_l2526_c11_4f05_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2526_c11_4f05_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2526_c11_4f05_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2526_c7_3415]
signal tmp16_MUX_uxn_opcodes_h_l2526_c7_3415_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2526_c7_3415_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2526_c7_3415_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2526_c7_3415_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2526_c7_3415]
signal n16_MUX_uxn_opcodes_h_l2526_c7_3415_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2526_c7_3415_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2526_c7_3415_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2526_c7_3415_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2526_c7_3415]
signal result_u8_value_MUX_uxn_opcodes_h_l2526_c7_3415_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2526_c7_3415_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2526_c7_3415_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2526_c7_3415_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2526_c7_3415]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_3415_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_3415_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_3415_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_3415_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2526_c7_3415]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_3415_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_3415_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_3415_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_3415_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2526_c7_3415]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_3415_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_3415_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_3415_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_3415_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2526_c7_3415]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_3415_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_3415_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_3415_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_3415_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2527_c3_e43e]
signal BIN_OP_OR_uxn_opcodes_h_l2527_c3_e43e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2527_c3_e43e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2527_c3_e43e_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2528_c11_2573]
signal BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_2573_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_2573_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_2573_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2529_c30_d254]
signal sp_relative_shift_uxn_opcodes_h_l2529_c30_d254_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2529_c30_d254_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2529_c30_d254_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2529_c30_d254_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2534_c11_bc60]
signal BIN_OP_EQ_uxn_opcodes_h_l2534_c11_bc60_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2534_c11_bc60_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2534_c11_bc60_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2534_c7_6cdc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_6cdc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_6cdc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_6cdc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_6cdc_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2534_c7_6cdc]
signal result_u8_value_MUX_uxn_opcodes_h_l2534_c7_6cdc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2534_c7_6cdc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2534_c7_6cdc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2534_c7_6cdc_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2534_c7_6cdc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_6cdc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_6cdc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_6cdc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_6cdc_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2534_c7_6cdc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_6cdc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_6cdc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_6cdc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_6cdc_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2537_c31_5d90]
signal CONST_SR_8_uxn_opcodes_h_l2537_c31_5d90_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2537_c31_5d90_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2515_l2524_DUPLICATE_9769
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2515_l2524_DUPLICATE_9769_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2515_l2524_DUPLICATE_9769_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_375c( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_vram_write := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;
      base.sp_relative_shift := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2497_c6_e763
BIN_OP_EQ_uxn_opcodes_h_l2497_c6_e763 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2497_c6_e763_left,
BIN_OP_EQ_uxn_opcodes_h_l2497_c6_e763_right,
BIN_OP_EQ_uxn_opcodes_h_l2497_c6_e763_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2497_c2_9c61
tmp16_MUX_uxn_opcodes_h_l2497_c2_9c61 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2497_c2_9c61_cond,
tmp16_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue,
tmp16_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse,
tmp16_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output);

-- n16_MUX_uxn_opcodes_h_l2497_c2_9c61
n16_MUX_uxn_opcodes_h_l2497_c2_9c61 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2497_c2_9c61_cond,
n16_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue,
n16_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse,
n16_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output);

-- t16_MUX_uxn_opcodes_h_l2497_c2_9c61
t16_MUX_uxn_opcodes_h_l2497_c2_9c61 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2497_c2_9c61_cond,
t16_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue,
t16_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse,
t16_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_9c61
result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_9c61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_9c61
result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_9c61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_9c61_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_9c61
result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_9c61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_9c61_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2497_c2_9c61
result_u8_value_MUX_uxn_opcodes_h_l2497_c2_9c61 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2497_c2_9c61_cond,
result_u8_value_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_9c61
result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_9c61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_9c61_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_9c61
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_9c61 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_9c61_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_9c61
result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_9c61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_9c61
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_9c61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_9c61_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_9c61
result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_9c61 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_9c61_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2510_c11_595c
BIN_OP_EQ_uxn_opcodes_h_l2510_c11_595c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2510_c11_595c_left,
BIN_OP_EQ_uxn_opcodes_h_l2510_c11_595c_right,
BIN_OP_EQ_uxn_opcodes_h_l2510_c11_595c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2510_c7_cc39
tmp16_MUX_uxn_opcodes_h_l2510_c7_cc39 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2510_c7_cc39_cond,
tmp16_MUX_uxn_opcodes_h_l2510_c7_cc39_iftrue,
tmp16_MUX_uxn_opcodes_h_l2510_c7_cc39_iffalse,
tmp16_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output);

-- n16_MUX_uxn_opcodes_h_l2510_c7_cc39
n16_MUX_uxn_opcodes_h_l2510_c7_cc39 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2510_c7_cc39_cond,
n16_MUX_uxn_opcodes_h_l2510_c7_cc39_iftrue,
n16_MUX_uxn_opcodes_h_l2510_c7_cc39_iffalse,
n16_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output);

-- t16_MUX_uxn_opcodes_h_l2510_c7_cc39
t16_MUX_uxn_opcodes_h_l2510_c7_cc39 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2510_c7_cc39_cond,
t16_MUX_uxn_opcodes_h_l2510_c7_cc39_iftrue,
t16_MUX_uxn_opcodes_h_l2510_c7_cc39_iffalse,
t16_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2510_c7_cc39
result_u8_value_MUX_uxn_opcodes_h_l2510_c7_cc39 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2510_c7_cc39_cond,
result_u8_value_MUX_uxn_opcodes_h_l2510_c7_cc39_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2510_c7_cc39_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_cc39
result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_cc39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_cc39_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_cc39_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_cc39_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_cc39
result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_cc39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_cc39_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_cc39_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_cc39_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_cc39
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_cc39 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_cc39_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_cc39_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_cc39_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_cc39
result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_cc39 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_cc39_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_cc39_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_cc39_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2513_c11_37bc
BIN_OP_EQ_uxn_opcodes_h_l2513_c11_37bc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2513_c11_37bc_left,
BIN_OP_EQ_uxn_opcodes_h_l2513_c11_37bc_right,
BIN_OP_EQ_uxn_opcodes_h_l2513_c11_37bc_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2513_c7_3463
tmp16_MUX_uxn_opcodes_h_l2513_c7_3463 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2513_c7_3463_cond,
tmp16_MUX_uxn_opcodes_h_l2513_c7_3463_iftrue,
tmp16_MUX_uxn_opcodes_h_l2513_c7_3463_iffalse,
tmp16_MUX_uxn_opcodes_h_l2513_c7_3463_return_output);

-- n16_MUX_uxn_opcodes_h_l2513_c7_3463
n16_MUX_uxn_opcodes_h_l2513_c7_3463 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2513_c7_3463_cond,
n16_MUX_uxn_opcodes_h_l2513_c7_3463_iftrue,
n16_MUX_uxn_opcodes_h_l2513_c7_3463_iffalse,
n16_MUX_uxn_opcodes_h_l2513_c7_3463_return_output);

-- t16_MUX_uxn_opcodes_h_l2513_c7_3463
t16_MUX_uxn_opcodes_h_l2513_c7_3463 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2513_c7_3463_cond,
t16_MUX_uxn_opcodes_h_l2513_c7_3463_iftrue,
t16_MUX_uxn_opcodes_h_l2513_c7_3463_iffalse,
t16_MUX_uxn_opcodes_h_l2513_c7_3463_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2513_c7_3463
result_u8_value_MUX_uxn_opcodes_h_l2513_c7_3463 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2513_c7_3463_cond,
result_u8_value_MUX_uxn_opcodes_h_l2513_c7_3463_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2513_c7_3463_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2513_c7_3463_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_3463
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_3463 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_3463_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_3463_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_3463_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_3463_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_3463
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_3463 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_3463_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_3463_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_3463_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_3463_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_3463
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_3463 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_3463_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_3463_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_3463_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_3463_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_3463
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_3463 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_3463_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_3463_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_3463_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_3463_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2518_c11_c167
BIN_OP_EQ_uxn_opcodes_h_l2518_c11_c167 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2518_c11_c167_left,
BIN_OP_EQ_uxn_opcodes_h_l2518_c11_c167_right,
BIN_OP_EQ_uxn_opcodes_h_l2518_c11_c167_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2518_c7_e8cb
tmp16_MUX_uxn_opcodes_h_l2518_c7_e8cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2518_c7_e8cb_cond,
tmp16_MUX_uxn_opcodes_h_l2518_c7_e8cb_iftrue,
tmp16_MUX_uxn_opcodes_h_l2518_c7_e8cb_iffalse,
tmp16_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output);

-- n16_MUX_uxn_opcodes_h_l2518_c7_e8cb
n16_MUX_uxn_opcodes_h_l2518_c7_e8cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2518_c7_e8cb_cond,
n16_MUX_uxn_opcodes_h_l2518_c7_e8cb_iftrue,
n16_MUX_uxn_opcodes_h_l2518_c7_e8cb_iffalse,
n16_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output);

-- t16_MUX_uxn_opcodes_h_l2518_c7_e8cb
t16_MUX_uxn_opcodes_h_l2518_c7_e8cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2518_c7_e8cb_cond,
t16_MUX_uxn_opcodes_h_l2518_c7_e8cb_iftrue,
t16_MUX_uxn_opcodes_h_l2518_c7_e8cb_iffalse,
t16_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2518_c7_e8cb
result_u8_value_MUX_uxn_opcodes_h_l2518_c7_e8cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2518_c7_e8cb_cond,
result_u8_value_MUX_uxn_opcodes_h_l2518_c7_e8cb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2518_c7_e8cb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_e8cb
result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_e8cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_e8cb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_e8cb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_e8cb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_e8cb
result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_e8cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_e8cb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_e8cb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_e8cb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_e8cb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_e8cb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_e8cb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_e8cb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_e8cb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_e8cb
result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_e8cb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_e8cb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_e8cb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_e8cb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2519_c3_69af
BIN_OP_OR_uxn_opcodes_h_l2519_c3_69af : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2519_c3_69af_left,
BIN_OP_OR_uxn_opcodes_h_l2519_c3_69af_right,
BIN_OP_OR_uxn_opcodes_h_l2519_c3_69af_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2522_c11_2400
BIN_OP_EQ_uxn_opcodes_h_l2522_c11_2400 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2522_c11_2400_left,
BIN_OP_EQ_uxn_opcodes_h_l2522_c11_2400_right,
BIN_OP_EQ_uxn_opcodes_h_l2522_c11_2400_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2522_c7_464c
tmp16_MUX_uxn_opcodes_h_l2522_c7_464c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2522_c7_464c_cond,
tmp16_MUX_uxn_opcodes_h_l2522_c7_464c_iftrue,
tmp16_MUX_uxn_opcodes_h_l2522_c7_464c_iffalse,
tmp16_MUX_uxn_opcodes_h_l2522_c7_464c_return_output);

-- n16_MUX_uxn_opcodes_h_l2522_c7_464c
n16_MUX_uxn_opcodes_h_l2522_c7_464c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2522_c7_464c_cond,
n16_MUX_uxn_opcodes_h_l2522_c7_464c_iftrue,
n16_MUX_uxn_opcodes_h_l2522_c7_464c_iffalse,
n16_MUX_uxn_opcodes_h_l2522_c7_464c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2522_c7_464c
result_u8_value_MUX_uxn_opcodes_h_l2522_c7_464c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2522_c7_464c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2522_c7_464c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2522_c7_464c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2522_c7_464c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_464c
result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_464c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_464c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_464c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_464c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_464c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_464c
result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_464c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_464c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_464c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_464c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_464c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_464c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_464c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_464c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_464c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_464c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_464c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_464c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_464c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_464c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_464c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_464c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_464c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2526_c11_4f05
BIN_OP_EQ_uxn_opcodes_h_l2526_c11_4f05 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2526_c11_4f05_left,
BIN_OP_EQ_uxn_opcodes_h_l2526_c11_4f05_right,
BIN_OP_EQ_uxn_opcodes_h_l2526_c11_4f05_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2526_c7_3415
tmp16_MUX_uxn_opcodes_h_l2526_c7_3415 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2526_c7_3415_cond,
tmp16_MUX_uxn_opcodes_h_l2526_c7_3415_iftrue,
tmp16_MUX_uxn_opcodes_h_l2526_c7_3415_iffalse,
tmp16_MUX_uxn_opcodes_h_l2526_c7_3415_return_output);

-- n16_MUX_uxn_opcodes_h_l2526_c7_3415
n16_MUX_uxn_opcodes_h_l2526_c7_3415 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2526_c7_3415_cond,
n16_MUX_uxn_opcodes_h_l2526_c7_3415_iftrue,
n16_MUX_uxn_opcodes_h_l2526_c7_3415_iffalse,
n16_MUX_uxn_opcodes_h_l2526_c7_3415_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2526_c7_3415
result_u8_value_MUX_uxn_opcodes_h_l2526_c7_3415 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2526_c7_3415_cond,
result_u8_value_MUX_uxn_opcodes_h_l2526_c7_3415_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2526_c7_3415_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2526_c7_3415_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_3415
result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_3415 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_3415_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_3415_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_3415_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_3415_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_3415
result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_3415 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_3415_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_3415_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_3415_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_3415_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_3415
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_3415 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_3415_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_3415_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_3415_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_3415_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_3415
result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_3415 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_3415_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_3415_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_3415_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_3415_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2527_c3_e43e
BIN_OP_OR_uxn_opcodes_h_l2527_c3_e43e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2527_c3_e43e_left,
BIN_OP_OR_uxn_opcodes_h_l2527_c3_e43e_right,
BIN_OP_OR_uxn_opcodes_h_l2527_c3_e43e_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_2573
BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_2573 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_2573_left,
BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_2573_right,
BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_2573_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2529_c30_d254
sp_relative_shift_uxn_opcodes_h_l2529_c30_d254 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2529_c30_d254_ins,
sp_relative_shift_uxn_opcodes_h_l2529_c30_d254_x,
sp_relative_shift_uxn_opcodes_h_l2529_c30_d254_y,
sp_relative_shift_uxn_opcodes_h_l2529_c30_d254_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2534_c11_bc60
BIN_OP_EQ_uxn_opcodes_h_l2534_c11_bc60 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2534_c11_bc60_left,
BIN_OP_EQ_uxn_opcodes_h_l2534_c11_bc60_right,
BIN_OP_EQ_uxn_opcodes_h_l2534_c11_bc60_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_6cdc
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_6cdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_6cdc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_6cdc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_6cdc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_6cdc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2534_c7_6cdc
result_u8_value_MUX_uxn_opcodes_h_l2534_c7_6cdc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2534_c7_6cdc_cond,
result_u8_value_MUX_uxn_opcodes_h_l2534_c7_6cdc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2534_c7_6cdc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2534_c7_6cdc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_6cdc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_6cdc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_6cdc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_6cdc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_6cdc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_6cdc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_6cdc
result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_6cdc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_6cdc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_6cdc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_6cdc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_6cdc_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2537_c31_5d90
CONST_SR_8_uxn_opcodes_h_l2537_c31_5d90 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2537_c31_5d90_x,
CONST_SR_8_uxn_opcodes_h_l2537_c31_5d90_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2515_l2524_DUPLICATE_9769
CONST_SL_8_uint16_t_uxn_opcodes_h_l2515_l2524_DUPLICATE_9769 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2515_l2524_DUPLICATE_9769_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2515_l2524_DUPLICATE_9769_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2497_c6_e763_return_output,
 tmp16_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output,
 n16_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output,
 t16_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2510_c11_595c_return_output,
 tmp16_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output,
 n16_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output,
 t16_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2513_c11_37bc_return_output,
 tmp16_MUX_uxn_opcodes_h_l2513_c7_3463_return_output,
 n16_MUX_uxn_opcodes_h_l2513_c7_3463_return_output,
 t16_MUX_uxn_opcodes_h_l2513_c7_3463_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2513_c7_3463_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_3463_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_3463_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_3463_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_3463_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2518_c11_c167_return_output,
 tmp16_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output,
 n16_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output,
 t16_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2519_c3_69af_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2522_c11_2400_return_output,
 tmp16_MUX_uxn_opcodes_h_l2522_c7_464c_return_output,
 n16_MUX_uxn_opcodes_h_l2522_c7_464c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2522_c7_464c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_464c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_464c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_464c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_464c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2526_c11_4f05_return_output,
 tmp16_MUX_uxn_opcodes_h_l2526_c7_3415_return_output,
 n16_MUX_uxn_opcodes_h_l2526_c7_3415_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2526_c7_3415_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_3415_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_3415_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_3415_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_3415_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2527_c3_e43e_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_2573_return_output,
 sp_relative_shift_uxn_opcodes_h_l2529_c30_d254_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2534_c11_bc60_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_6cdc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2534_c7_6cdc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_6cdc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_6cdc_return_output,
 CONST_SR_8_uxn_opcodes_h_l2537_c31_5d90_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2515_l2524_DUPLICATE_9769_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_e763_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_e763_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_e763_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2497_c2_9c61_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2497_c2_9c61_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2497_c2_9c61_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2497_c2_9c61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2497_c2_9c61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_9c61_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_9c61_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_9c61_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_9c61_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2507_c3_5f01 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_9c61_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2497_c2_9c61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2497_c2_9c61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_9c61_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2502_c3_fdca : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_9c61_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_595c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_595c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_595c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2510_c7_cc39_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2510_c7_cc39_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2513_c7_3463_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2510_c7_cc39_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2510_c7_cc39_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2510_c7_cc39_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2513_c7_3463_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2510_c7_cc39_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2510_c7_cc39_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2510_c7_cc39_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2513_c7_3463_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2510_c7_cc39_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_cc39_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_cc39_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_3463_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_cc39_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_cc39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_cc39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_3463_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_cc39_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_cc39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_cc39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_3463_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_cc39_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_cc39_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2511_c3_a636 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_cc39_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_3463_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_cc39_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_cc39_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_cc39_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_3463_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_cc39_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_37bc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_37bc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_37bc_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2513_c7_3463_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2513_c7_3463_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2513_c7_3463_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2513_c7_3463_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2513_c7_3463_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2513_c7_3463_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2513_c7_3463_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2513_c7_3463_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2513_c7_3463_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_3463_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_3463_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_3463_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_3463_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_3463_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_3463_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_3463_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_3463_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_3463_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_3463_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2516_c3_d692 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_3463_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_3463_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_3463_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_3463_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_3463_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_c167_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_c167_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_c167_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2518_c7_e8cb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2518_c7_e8cb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2522_c7_464c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2518_c7_e8cb_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2518_c7_e8cb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2518_c7_e8cb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2522_c7_464c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2518_c7_e8cb_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2518_c7_e8cb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2518_c7_e8cb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2518_c7_e8cb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_e8cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_e8cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2522_c7_464c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_e8cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_e8cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_e8cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_464c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_e8cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_e8cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_e8cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_464c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_e8cb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_e8cb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2520_c3_ac2f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_e8cb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_464c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_e8cb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_e8cb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_e8cb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_464c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_e8cb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2519_c3_69af_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2519_c3_69af_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2519_c3_69af_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_2400_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_2400_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_2400_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2522_c7_464c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2522_c7_464c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_3415_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2522_c7_464c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2522_c7_464c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2522_c7_464c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2526_c7_3415_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2522_c7_464c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2522_c7_464c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2522_c7_464c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_3415_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2522_c7_464c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_464c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_464c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_3415_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_464c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_464c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_464c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_3415_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_464c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_464c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_464c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_3415_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_464c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_464c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_464c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_3415_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_464c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_4f05_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_4f05_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_4f05_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_3415_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_3415_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_3415_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2526_c7_3415_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2526_c7_3415_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2526_c7_3415_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_3415_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_3415_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_6cdc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_3415_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_3415_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_3415_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_6cdc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_3415_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_3415_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_3415_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_3415_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_3415_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2531_c3_9ab0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_3415_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_6cdc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_3415_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_3415_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_3415_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_6cdc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_3415_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2527_c3_e43e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2527_c3_e43e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2527_c3_e43e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_2573_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_2573_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_2573_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2529_c30_d254_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2529_c30_d254_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2529_c30_d254_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2529_c30_d254_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2532_c21_ecd4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_bc60_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_bc60_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_bc60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_6cdc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_6cdc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_6cdc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_6cdc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_6cdc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_6cdc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_6cdc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2536_c3_04ca : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_6cdc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_6cdc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_6cdc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2535_c3_900d : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_6cdc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_6cdc_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2537_c31_5d90_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2537_c31_5d90_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2537_c21_6b15_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2522_l2518_l2513_l2510_l2497_l2534_DUPLICATE_8bf3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2526_l2522_l2518_l2513_l2510_l2534_DUPLICATE_5925_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2526_l2522_l2518_l2513_l2510_DUPLICATE_9ae2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2522_l2518_l2513_l2510_l2534_DUPLICATE_76c3_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2514_l2519_l2523_l2527_DUPLICATE_d1f7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2515_l2524_DUPLICATE_9769_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2515_l2524_DUPLICATE_9769_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2522_l2534_DUPLICATE_7d67_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l2493_l2541_DUPLICATE_c6f4_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_595c_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_37bc_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2536_c3_04ca := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_6cdc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2536_c3_04ca;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2535_c3_900d := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_6cdc_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2535_c3_900d;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2520_c3_ac2f := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_e8cb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2520_c3_ac2f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_2400_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_c167_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_3415_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2516_c3_d692 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_3463_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2516_c3_d692;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_bc60_right := to_unsigned(6, 3);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2502_c3_fdca := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2502_c3_fdca;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_6cdc_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_4f05_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_e763_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2531_c3_9ab0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_3415_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2531_c3_9ab0;
     VAR_sp_relative_shift_uxn_opcodes_h_l2529_c30_d254_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2511_c3_a636 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_cc39_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2511_c3_a636;
     VAR_sp_relative_shift_uxn_opcodes_h_l2529_c30_d254_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2507_c3_5f01 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2507_c3_5f01;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2529_c30_d254_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2527_c3_e43e_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2510_c7_cc39_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2513_c7_3463_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2518_c7_e8cb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2526_c7_3415_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_e763_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_595c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_37bc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_c167_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_2400_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_4f05_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_bc60_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_2573_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2519_c3_69af_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2510_c7_cc39_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2518_c7_e8cb_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2537_c31_5d90_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2510_c7_cc39_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2513_c7_3463_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2518_c7_e8cb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2522_c7_464c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_3415_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2526_c11_4f05] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2526_c11_4f05_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_4f05_left;
     BIN_OP_EQ_uxn_opcodes_h_l2526_c11_4f05_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_4f05_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_4f05_return_output := BIN_OP_EQ_uxn_opcodes_h_l2526_c11_4f05_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2510_c11_595c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2510_c11_595c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_595c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2510_c11_595c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_595c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_595c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2510_c11_595c_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2497_c2_9c61] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2497_c2_9c61_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2526_l2522_l2518_l2513_l2510_DUPLICATE_9ae2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2526_l2522_l2518_l2513_l2510_DUPLICATE_9ae2_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2514_l2519_l2523_l2527_DUPLICATE_d1f7 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2514_l2519_l2523_l2527_DUPLICATE_d1f7_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2522_c11_2400] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2522_c11_2400_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_2400_left;
     BIN_OP_EQ_uxn_opcodes_h_l2522_c11_2400_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_2400_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_2400_return_output := BIN_OP_EQ_uxn_opcodes_h_l2522_c11_2400_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2497_c2_9c61] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2497_c2_9c61_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2522_l2518_l2513_l2510_l2497_l2534_DUPLICATE_8bf3 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2522_l2518_l2513_l2510_l2497_l2534_DUPLICATE_8bf3_return_output := result.u8_value;

     -- CONST_SR_8[uxn_opcodes_h_l2537_c31_5d90] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2537_c31_5d90_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2537_c31_5d90_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2537_c31_5d90_return_output := CONST_SR_8_uxn_opcodes_h_l2537_c31_5d90_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2522_l2534_DUPLICATE_7d67 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2522_l2534_DUPLICATE_7d67_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2534_c11_bc60] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2534_c11_bc60_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_bc60_left;
     BIN_OP_EQ_uxn_opcodes_h_l2534_c11_bc60_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_bc60_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_bc60_return_output := BIN_OP_EQ_uxn_opcodes_h_l2534_c11_bc60_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2513_c11_37bc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2513_c11_37bc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_37bc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2513_c11_37bc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_37bc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_37bc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2513_c11_37bc_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2526_l2522_l2518_l2513_l2510_l2534_DUPLICATE_5925 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2526_l2522_l2518_l2513_l2510_l2534_DUPLICATE_5925_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2497_c6_e763] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2497_c6_e763_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_e763_left;
     BIN_OP_EQ_uxn_opcodes_h_l2497_c6_e763_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_e763_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_e763_return_output := BIN_OP_EQ_uxn_opcodes_h_l2497_c6_e763_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2518_c11_c167] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2518_c11_c167_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_c167_left;
     BIN_OP_EQ_uxn_opcodes_h_l2518_c11_c167_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_c167_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_c167_return_output := BIN_OP_EQ_uxn_opcodes_h_l2518_c11_c167_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2522_l2518_l2513_l2510_l2534_DUPLICATE_76c3 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2522_l2518_l2513_l2510_l2534_DUPLICATE_76c3_return_output := result.sp_relative_shift;

     -- sp_relative_shift[uxn_opcodes_h_l2529_c30_d254] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2529_c30_d254_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2529_c30_d254_ins;
     sp_relative_shift_uxn_opcodes_h_l2529_c30_d254_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2529_c30_d254_x;
     sp_relative_shift_uxn_opcodes_h_l2529_c30_d254_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2529_c30_d254_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2529_c30_d254_return_output := sp_relative_shift_uxn_opcodes_h_l2529_c30_d254_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2497_c2_9c61] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2497_c2_9c61_return_output := result.is_ram_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2497_c2_9c61] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2497_c2_9c61_return_output := result.is_pc_updated;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2497_c2_9c61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_e763_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_9c61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_e763_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_9c61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_e763_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_e763_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_9c61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_e763_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_9c61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_e763_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_e763_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_9c61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_e763_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_9c61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_e763_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_9c61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_e763_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2497_c2_9c61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_e763_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2497_c2_9c61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_e763_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2510_c7_cc39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_595c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_cc39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_595c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_cc39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_595c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_cc39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_595c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_cc39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_595c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_cc39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_595c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2510_c7_cc39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_595c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2510_c7_cc39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_595c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2513_c7_3463_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_37bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_3463_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_37bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_3463_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_37bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_3463_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_37bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_3463_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_37bc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_3463_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_37bc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2513_c7_3463_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_37bc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2513_c7_3463_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_37bc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2518_c7_e8cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_c167_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_e8cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_c167_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_e8cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_c167_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_e8cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_c167_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_e8cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_c167_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_e8cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_c167_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2518_c7_e8cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_c167_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2518_c7_e8cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_c167_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2522_c7_464c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_2400_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_464c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_2400_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_464c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_2400_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_464c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_2400_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_464c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_2400_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2522_c7_464c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_2400_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2522_c7_464c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_2400_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2526_c7_3415_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_4f05_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_3415_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_4f05_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_3415_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_4f05_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_3415_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_4f05_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_3415_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_4f05_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_3415_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_4f05_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_3415_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_4f05_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_6cdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_bc60_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_6cdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_bc60_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_6cdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_bc60_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_6cdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_bc60_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2519_c3_69af_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2514_l2519_l2523_l2527_DUPLICATE_d1f7_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2527_c3_e43e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2514_l2519_l2523_l2527_DUPLICATE_d1f7_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2515_l2524_DUPLICATE_9769_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2514_l2519_l2523_l2527_DUPLICATE_d1f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_cc39_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2522_l2518_l2513_l2510_l2534_DUPLICATE_76c3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_3463_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2522_l2518_l2513_l2510_l2534_DUPLICATE_76c3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_e8cb_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2522_l2518_l2513_l2510_l2534_DUPLICATE_76c3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_464c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2522_l2518_l2513_l2510_l2534_DUPLICATE_76c3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_6cdc_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2522_l2518_l2513_l2510_l2534_DUPLICATE_76c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_cc39_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2526_l2522_l2518_l2513_l2510_l2534_DUPLICATE_5925_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_3463_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2526_l2522_l2518_l2513_l2510_l2534_DUPLICATE_5925_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_e8cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2526_l2522_l2518_l2513_l2510_l2534_DUPLICATE_5925_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_464c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2526_l2522_l2518_l2513_l2510_l2534_DUPLICATE_5925_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_3415_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2526_l2522_l2518_l2513_l2510_l2534_DUPLICATE_5925_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_6cdc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2526_l2522_l2518_l2513_l2510_l2534_DUPLICATE_5925_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_cc39_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2526_l2522_l2518_l2513_l2510_DUPLICATE_9ae2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_3463_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2526_l2522_l2518_l2513_l2510_DUPLICATE_9ae2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_e8cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2526_l2522_l2518_l2513_l2510_DUPLICATE_9ae2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_464c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2526_l2522_l2518_l2513_l2510_DUPLICATE_9ae2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_3415_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2526_l2522_l2518_l2513_l2510_DUPLICATE_9ae2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_464c_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2522_l2534_DUPLICATE_7d67_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_6cdc_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2522_l2534_DUPLICATE_7d67_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2522_l2518_l2513_l2510_l2497_l2534_DUPLICATE_8bf3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_cc39_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2522_l2518_l2513_l2510_l2497_l2534_DUPLICATE_8bf3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_3463_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2522_l2518_l2513_l2510_l2497_l2534_DUPLICATE_8bf3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_e8cb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2522_l2518_l2513_l2510_l2497_l2534_DUPLICATE_8bf3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2522_c7_464c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2522_l2518_l2513_l2510_l2497_l2534_DUPLICATE_8bf3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_6cdc_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2522_l2518_l2513_l2510_l2497_l2534_DUPLICATE_8bf3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2497_c2_9c61_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2497_c2_9c61_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2497_c2_9c61_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2497_c2_9c61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_3415_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2529_c30_d254_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2519_c3_69af] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2519_c3_69af_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2519_c3_69af_left;
     BIN_OP_OR_uxn_opcodes_h_l2519_c3_69af_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2519_c3_69af_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2519_c3_69af_return_output := BIN_OP_OR_uxn_opcodes_h_l2519_c3_69af_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2515_l2524_DUPLICATE_9769 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2515_l2524_DUPLICATE_9769_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2515_l2524_DUPLICATE_9769_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2515_l2524_DUPLICATE_9769_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2515_l2524_DUPLICATE_9769_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2537_c21_6b15] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2537_c21_6b15_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2537_c31_5d90_return_output);

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2497_c2_9c61] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_9c61_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_9c61_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2534_c7_6cdc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_6cdc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_6cdc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_6cdc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_6cdc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_6cdc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_6cdc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_6cdc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_6cdc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2534_c7_6cdc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_6cdc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_6cdc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_6cdc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_6cdc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_6cdc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_6cdc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_6cdc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_6cdc_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2497_c2_9c61] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_9c61_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_9c61_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2497_c2_9c61] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2534_c7_6cdc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_6cdc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_6cdc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_6cdc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_6cdc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_6cdc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_6cdc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_6cdc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_6cdc_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2497_c2_9c61] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2526_c7_3415] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_3415_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_3415_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_3415_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_3415_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_3415_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_3415_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_3415_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_3415_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2527_c3_e43e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2527_c3_e43e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2527_c3_e43e_left;
     BIN_OP_OR_uxn_opcodes_h_l2527_c3_e43e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2527_c3_e43e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2527_c3_e43e_return_output := BIN_OP_OR_uxn_opcodes_h_l2527_c3_e43e_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2518_c7_e8cb_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2519_c3_69af_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_2573_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2527_c3_e43e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2526_c7_3415_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2527_c3_e43e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_6cdc_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2537_c21_6b15_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2522_c7_464c_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2515_l2524_DUPLICATE_9769_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2513_c7_3463_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2515_l2524_DUPLICATE_9769_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_3415_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_6cdc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_464c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_3415_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_3415_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_6cdc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_3415_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_6cdc_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2522_c7_464c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_464c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_464c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_464c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_464c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_464c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_464c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_464c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_464c_return_output;

     -- t16_MUX[uxn_opcodes_h_l2518_c7_e8cb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2518_c7_e8cb_cond <= VAR_t16_MUX_uxn_opcodes_h_l2518_c7_e8cb_cond;
     t16_MUX_uxn_opcodes_h_l2518_c7_e8cb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2518_c7_e8cb_iftrue;
     t16_MUX_uxn_opcodes_h_l2518_c7_e8cb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2518_c7_e8cb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output := t16_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2526_c7_3415] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_3415_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_3415_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_3415_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_3415_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_3415_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_3415_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_3415_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_3415_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2526_c7_3415] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_3415_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_3415_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_3415_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_3415_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_3415_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_3415_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_3415_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_3415_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2534_c7_6cdc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2534_c7_6cdc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_6cdc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2534_c7_6cdc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_6cdc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2534_c7_6cdc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_6cdc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_6cdc_return_output := result_u8_value_MUX_uxn_opcodes_h_l2534_c7_6cdc_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l2528_c11_2573] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_2573_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_2573_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_2573_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_2573_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_2573_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_2573_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2526_c7_3415] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_3415_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_3415_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_3415_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_3415_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_3415_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_3415_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_3415_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_3415_return_output;

     -- n16_MUX[uxn_opcodes_h_l2526_c7_3415] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2526_c7_3415_cond <= VAR_n16_MUX_uxn_opcodes_h_l2526_c7_3415_cond;
     n16_MUX_uxn_opcodes_h_l2526_c7_3415_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2526_c7_3415_iftrue;
     n16_MUX_uxn_opcodes_h_l2526_c7_3415_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2526_c7_3415_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2526_c7_3415_return_output := n16_MUX_uxn_opcodes_h_l2526_c7_3415_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_3415_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_2573_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2522_c7_464c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2526_c7_3415_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_464c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_3415_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_e8cb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_464c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_464c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_3415_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_464c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_3415_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_3415_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_6cdc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2513_c7_3463_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output;
     -- n16_MUX[uxn_opcodes_h_l2522_c7_464c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2522_c7_464c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2522_c7_464c_cond;
     n16_MUX_uxn_opcodes_h_l2522_c7_464c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2522_c7_464c_iftrue;
     n16_MUX_uxn_opcodes_h_l2522_c7_464c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2522_c7_464c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2522_c7_464c_return_output := n16_MUX_uxn_opcodes_h_l2522_c7_464c_return_output;

     -- t16_MUX[uxn_opcodes_h_l2513_c7_3463] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2513_c7_3463_cond <= VAR_t16_MUX_uxn_opcodes_h_l2513_c7_3463_cond;
     t16_MUX_uxn_opcodes_h_l2513_c7_3463_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2513_c7_3463_iftrue;
     t16_MUX_uxn_opcodes_h_l2513_c7_3463_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2513_c7_3463_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2513_c7_3463_return_output := t16_MUX_uxn_opcodes_h_l2513_c7_3463_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2522_c7_464c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_464c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_464c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_464c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_464c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_464c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_464c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_464c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_464c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2526_c7_3415] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2526_c7_3415_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_3415_cond;
     tmp16_MUX_uxn_opcodes_h_l2526_c7_3415_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_3415_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2526_c7_3415_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_3415_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_3415_return_output := tmp16_MUX_uxn_opcodes_h_l2526_c7_3415_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2522_c7_464c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_464c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_464c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_464c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_464c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_464c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_464c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_464c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_464c_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2532_c21_ecd4] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2532_c21_ecd4_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_2573_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2518_c7_e8cb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_e8cb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_e8cb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_e8cb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_e8cb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_e8cb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_e8cb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2522_c7_464c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_464c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_464c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_464c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_464c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_464c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_464c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_464c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_464c_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_3415_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2532_c21_ecd4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2518_c7_e8cb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2522_c7_464c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_e8cb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_464c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_3463_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_e8cb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_464c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_e8cb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_464c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2510_c7_cc39_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2513_c7_3463_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2522_c7_464c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_3415_return_output;
     -- n16_MUX[uxn_opcodes_h_l2518_c7_e8cb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2518_c7_e8cb_cond <= VAR_n16_MUX_uxn_opcodes_h_l2518_c7_e8cb_cond;
     n16_MUX_uxn_opcodes_h_l2518_c7_e8cb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2518_c7_e8cb_iftrue;
     n16_MUX_uxn_opcodes_h_l2518_c7_e8cb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2518_c7_e8cb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output := n16_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output;

     -- t16_MUX[uxn_opcodes_h_l2510_c7_cc39] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2510_c7_cc39_cond <= VAR_t16_MUX_uxn_opcodes_h_l2510_c7_cc39_cond;
     t16_MUX_uxn_opcodes_h_l2510_c7_cc39_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2510_c7_cc39_iftrue;
     t16_MUX_uxn_opcodes_h_l2510_c7_cc39_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2510_c7_cc39_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output := t16_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2518_c7_e8cb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_e8cb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_e8cb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_e8cb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_e8cb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_e8cb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_e8cb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2522_c7_464c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2522_c7_464c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2522_c7_464c_cond;
     tmp16_MUX_uxn_opcodes_h_l2522_c7_464c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2522_c7_464c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2522_c7_464c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2522_c7_464c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2522_c7_464c_return_output := tmp16_MUX_uxn_opcodes_h_l2522_c7_464c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2526_c7_3415] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2526_c7_3415_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_3415_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2526_c7_3415_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_3415_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2526_c7_3415_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_3415_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_3415_return_output := result_u8_value_MUX_uxn_opcodes_h_l2526_c7_3415_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2518_c7_e8cb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_e8cb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_e8cb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_e8cb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_e8cb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_e8cb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_e8cb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2518_c7_e8cb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_e8cb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_e8cb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_e8cb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_e8cb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_e8cb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_e8cb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2513_c7_3463] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_3463_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_3463_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_3463_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_3463_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_3463_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_3463_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_3463_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_3463_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2513_c7_3463_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_3463_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_cc39_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_3463_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_3463_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_3463_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2522_c7_464c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_3415_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2518_c7_e8cb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2522_c7_464c_return_output;
     -- t16_MUX[uxn_opcodes_h_l2497_c2_9c61] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2497_c2_9c61_cond <= VAR_t16_MUX_uxn_opcodes_h_l2497_c2_9c61_cond;
     t16_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue;
     t16_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output := t16_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2513_c7_3463] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_3463_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_3463_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_3463_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_3463_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_3463_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_3463_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_3463_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_3463_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2510_c7_cc39] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_cc39_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_cc39_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_cc39_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_cc39_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_cc39_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_cc39_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2522_c7_464c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2522_c7_464c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2522_c7_464c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2522_c7_464c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2522_c7_464c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2522_c7_464c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2522_c7_464c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2522_c7_464c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2522_c7_464c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2513_c7_3463] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_3463_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_3463_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_3463_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_3463_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_3463_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_3463_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_3463_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_3463_return_output;

     -- n16_MUX[uxn_opcodes_h_l2513_c7_3463] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2513_c7_3463_cond <= VAR_n16_MUX_uxn_opcodes_h_l2513_c7_3463_cond;
     n16_MUX_uxn_opcodes_h_l2513_c7_3463_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2513_c7_3463_iftrue;
     n16_MUX_uxn_opcodes_h_l2513_c7_3463_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2513_c7_3463_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2513_c7_3463_return_output := n16_MUX_uxn_opcodes_h_l2513_c7_3463_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2513_c7_3463] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_3463_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_3463_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_3463_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_3463_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_3463_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_3463_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_3463_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_3463_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2518_c7_e8cb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2518_c7_e8cb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2518_c7_e8cb_cond;
     tmp16_MUX_uxn_opcodes_h_l2518_c7_e8cb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2518_c7_e8cb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2518_c7_e8cb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2518_c7_e8cb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output := tmp16_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2510_c7_cc39_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2513_c7_3463_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_cc39_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_3463_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_cc39_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_3463_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_cc39_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_3463_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_e8cb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2522_c7_464c_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2513_c7_3463_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2510_c7_cc39] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_cc39_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_cc39_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_cc39_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_cc39_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_cc39_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_cc39_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2518_c7_e8cb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2518_c7_e8cb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_e8cb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2518_c7_e8cb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_e8cb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2518_c7_e8cb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_e8cb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output := result_u8_value_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2497_c2_9c61] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_9c61_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_9c61_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2510_c7_cc39] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_cc39_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_cc39_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_cc39_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_cc39_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_cc39_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_cc39_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2513_c7_3463] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2513_c7_3463_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2513_c7_3463_cond;
     tmp16_MUX_uxn_opcodes_h_l2513_c7_3463_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2513_c7_3463_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2513_c7_3463_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2513_c7_3463_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2513_c7_3463_return_output := tmp16_MUX_uxn_opcodes_h_l2513_c7_3463_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2510_c7_cc39] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_cc39_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_cc39_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_cc39_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_cc39_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_cc39_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_cc39_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output;

     -- n16_MUX[uxn_opcodes_h_l2510_c7_cc39] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2510_c7_cc39_cond <= VAR_n16_MUX_uxn_opcodes_h_l2510_c7_cc39_cond;
     n16_MUX_uxn_opcodes_h_l2510_c7_cc39_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2510_c7_cc39_iftrue;
     n16_MUX_uxn_opcodes_h_l2510_c7_cc39_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2510_c7_cc39_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output := n16_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_3463_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_e8cb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2510_c7_cc39_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2513_c7_3463_return_output;
     -- n16_MUX[uxn_opcodes_h_l2497_c2_9c61] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2497_c2_9c61_cond <= VAR_n16_MUX_uxn_opcodes_h_l2497_c2_9c61_cond;
     n16_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue;
     n16_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output := n16_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2513_c7_3463] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2513_c7_3463_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_3463_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2513_c7_3463_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_3463_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2513_c7_3463_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_3463_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_3463_return_output := result_u8_value_MUX_uxn_opcodes_h_l2513_c7_3463_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2497_c2_9c61] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_9c61_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_9c61_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2497_c2_9c61] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_9c61_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_9c61_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2497_c2_9c61] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_9c61_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_9c61_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2510_c7_cc39] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2510_c7_cc39_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2510_c7_cc39_cond;
     tmp16_MUX_uxn_opcodes_h_l2510_c7_cc39_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2510_c7_cc39_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2510_c7_cc39_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2510_c7_cc39_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output := tmp16_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_cc39_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_3463_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2497_c2_9c61] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2497_c2_9c61_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2497_c2_9c61_cond;
     tmp16_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output := tmp16_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2510_c7_cc39] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2510_c7_cc39_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_cc39_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2510_c7_cc39_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_cc39_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2510_c7_cc39_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_cc39_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output := result_u8_value_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_cc39_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2497_c2_9c61] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2497_c2_9c61_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_9c61_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_9c61_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_9c61_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output := result_u8_value_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l2493_l2541_DUPLICATE_c6f4 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l2493_l2541_DUPLICATE_c6f4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_375c(
     result,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_9c61_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l2493_l2541_DUPLICATE_c6f4_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l2493_l2541_DUPLICATE_c6f4_return_output;
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
